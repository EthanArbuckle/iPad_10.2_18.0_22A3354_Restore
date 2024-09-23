@implementation MPPrepareForSetPlaybackQueueCommandEvent

- (MPPrepareForSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPPrepareForSetPlaybackQueueCommandEvent *v9;
  void *v10;
  uint64_t v11;
  NSString *proactiveReason;
  objc_super v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPPrepareForSetPlaybackQueueCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v14, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CC90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isProactive = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC98]);
    v11 = objc_claimAutoreleasedReturnValue();
    proactiveReason = v9->_proactiveReason;
    v9->_proactiveReason = (NSString *)v11;

  }
  return v9;
}

- (BOOL)isProactive
{
  return self->_isProactive;
}

- (NSString)proactiveReason
{
  return self->_proactiveReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveReason, 0);
}

@end
