@implementation MPLeaveSharedPlaybackSessionCommandEvent

- (MPLeaveSharedPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPLeaveSharedPlaybackSessionCommandEvent *v9;
  uint64_t v10;
  NSString *sessionIdentifier;
  objc_super v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPLeaveSharedPlaybackSessionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v13, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCD8]);
    v10 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSString *)v10;

  }
  return v9;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
