@implementation MPSetPlaybackSessionCommandEvent

- (MPSetPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPSetPlaybackSessionCommandEvent *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *type;
  uint64_t v17;
  NSData *playbackSessionData;
  objc_super v20;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MPSetPlaybackSessionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v20, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CC50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MRPlaybackSessionCreateFromExternalRepresentation();
    if (v11)
    {
      v12 = (const void *)v11;
      v13 = MRPlaybackSessionCopyIdentifier();
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v13;

      v15 = MRPlaybackSessionCopyType();
      type = v9->_type;
      v9->_type = (NSString *)v15;

      v17 = MRPlaybackSessionCopyPlaybackSessionData();
      playbackSessionData = v9->_playbackSessionData;
      v9->_playbackSessionData = (NSData *)v17;

      CFRelease(v12);
    }

  }
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
