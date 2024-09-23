@implementation HDNotificationInstructionSyncSendEvent

- (HDNotificationInstructionSyncSendEvent)initWithNotificationInstructionMessage:(id)a3 sendError:(id)a4
{
  id v6;
  id v7;
  HDNotificationInstructionSyncSendEvent *v8;
  uint64_t v9;
  HDNotificationInstructionMessage *message;
  uint64_t v11;
  NSError *sendError;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDNotificationInstructionSyncSendEvent;
  v8 = -[HDNotificationInstructionSyncSendEvent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    message = v8->_message;
    v8->_message = (HDNotificationInstructionMessage *)v9;

    v11 = objc_msgSend(v7, "copy");
    sendError = v8->_sendError;
    v8->_sendError = (NSError *)v11;

  }
  return v8;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.healthapp.notificationsync");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("categoryIdentifier");
  -[HDNotificationInstructionMessage categoryIdentifier](self->_message, "categoryIdentifier", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSError *sendError;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16 = CFSTR("clientIdentifier");
  -[HDNotificationInstructionMessage clientIdentifier](self->_message, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  sendError = self->_sendError;
  if (sendError)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[NSError domain](sendError, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSError code](self->_sendError, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("error"));

  }
  v14 = (void *)objc_msgSend(v8, "copy");

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendError, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
