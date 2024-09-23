@implementation DDUIPairCompleteMessage

- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3
{
  DDUIPairCompleteMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDUIPairCompleteMessage;
  result = -[DDUIPairCompleteMessage init](&v5, sel_init);
  if (result)
    result->_notificationResult = a3;
  return result;
}

- (DDUIPairCompleteMessage)initWithNotificationResult:(unint64_t)a3 listenerUUID:(id)a4
{
  id v7;
  DDUIPairCompleteMessage *v8;
  DDUIPairCompleteMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDUIPairCompleteMessage;
  v8 = -[DDUIPairCompleteMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_notificationResult = a3;
    objc_storeStrong((id *)&v8->_listenerUUID, a4);
  }

  return v9;
}

- (DDUIPairCompleteMessage)initWithCancellationReason:(id)a3
{
  id v5;
  DDUIPairCompleteMessage *v6;
  DDUIPairCompleteMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDUIPairCompleteMessage;
  v6 = -[DDUIPairCompleteMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cancellationReason, a3);
    v7->_isCancellation = 1;
  }

  return v7;
}

- (DDUIPairCompleteMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  DDUIPairCompleteMessage *v9;
  void *v10;
  uint64_t v11;
  DDUIPairCompleteMessage *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageResponseIsCancelKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DDUIMessageResponseCancelReasonKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[DDUIPairCompleteMessage initWithCancellationReason:](self, "initWithCancellationReason:", v8);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DDUIMessageResponseListenerUUIDKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DDUIMessageResponseResultKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      if (v8)
        v12 = -[DDUIPairCompleteMessage initWithNotificationResult:listenerUUID:](self, "initWithNotificationResult:listenerUUID:", v11, v8);
      else
        v12 = -[DDUIPairCompleteMessage initWithNotificationResult:](self, "initWithNotificationResult:", v11);
      self = v12;

    }
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("DDUIMessageResponseIsCancelKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DDUIPairCompleteMessage isCancellation](self, "isCancellation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("DDUIMessageResponseResultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DDUIPairCompleteMessage notificationResult](self, "notificationResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[DDUIPairCompleteMessage cancellationReason](self, "cancellationReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DDUIPairCompleteMessage cancellationReason](self, "cancellationReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("DDUIMessageResponseCancelReasonKey"));

  }
  -[DDUIPairCompleteMessage listenerUUID](self, "listenerUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DDUIPairCompleteMessage listenerUUID](self, "listenerUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("DDUIMessageResponseListenerUUIDKey"));

  }
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_isCancellation)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  DDUINotificationResultString(self->_notificationResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; isCancellation = %@; notificationResult = \"%@\"; cancellationReason = %@; listenerUUID = %@>"),
    v4,
    self,
    v5,
    v6,
    self->_cancellationReason,
    self->_listenerUUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)notificationResult
{
  return self->_notificationResult;
}

- (NSUUID)listenerUUID
{
  return self->_listenerUUID;
}

- (NSDictionary)cancellationReason
{
  return self->_cancellationReason;
}

- (BOOL)isCancellation
{
  return self->_isCancellation;
}

- (void)setIsCancellation:(BOOL)a3
{
  self->_isCancellation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_storeStrong((id *)&self->_listenerUUID, 0);
}

@end
