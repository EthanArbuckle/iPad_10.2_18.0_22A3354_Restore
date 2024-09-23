@implementation MPPostEventNoticeCommandEvent

- (MPPostEventNoticeCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPPostEventNoticeCommandEvent *v9;
  uint64_t v10;
  NSString *eventIdentifier;
  uint64_t v12;
  NSString *eventType;
  objc_super v15;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPPostEventNoticeCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v15, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBE8]);
    v10 = objc_claimAutoreleasedReturnValue();
    eventIdentifier = v9->_eventIdentifier;
    v9->_eventIdentifier = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBF0]);
    v12 = objc_claimAutoreleasedReturnValue();
    eventType = v9->_eventType;
    v9->_eventType = (NSString *)v12;

  }
  return v9;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
