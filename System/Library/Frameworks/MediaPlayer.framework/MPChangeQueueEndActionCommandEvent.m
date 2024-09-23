@implementation MPChangeQueueEndActionCommandEvent

- (MPChangeQueueEndActionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPChangeQueueEndActionCommandEvent *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPChangeQueueEndActionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v13, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C808]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_preservesQueueEndAction = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCA8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_queueEndAction = objc_msgSend(v11, "integerValue");

  }
  return v9;
}

- (int64_t)queueEndAction
{
  return self->_queueEndAction;
}

- (BOOL)preservesQueueEndAction
{
  return self->_preservesQueueEndAction;
}

@end
