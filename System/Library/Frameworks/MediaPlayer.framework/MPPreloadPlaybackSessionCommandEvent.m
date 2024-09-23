@implementation MPPreloadPlaybackSessionCommandEvent

- (MPPreloadPlaybackSessionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPPreloadPlaybackSessionCommandEvent *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *type;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSURL *playbackSessionDataFilePath;
  uint64_t v20;
  NSString *revision;
  NSDictionary *metadata;
  void *v23;
  void *v24;
  MPPreloadPlaybackSessionCommandEvent *v25;
  objc_super v27;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MPPreloadPlaybackSessionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v27, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC60]);
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC80]);
    v12 = objc_claimAutoreleasedReturnValue();
    type = v9->_type;
    v9->_type = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");
    v16 = v15 == 512;
    if (v15 == 1024)
      v16 = 2;
    v9->_priority = v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC58]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "length"))
    {

      v25 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    playbackSessionDataFilePath = v9->_playbackSessionDataFilePath;
    v9->_playbackSessionDataFilePath = (NSURL *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC78]);
    v20 = objc_claimAutoreleasedReturnValue();
    revision = v9->_revision;
    v9->_revision = (NSString *)v20;

    metadata = v9->_metadata;
    v9->_metadata = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC68]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, 0, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
        objc_storeStrong((id *)&v9->_metadata, v24);

    }
  }
  v25 = v9;
LABEL_12:

  return v25;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)revision
{
  return self->_revision;
}

- (NSURL)playbackSessionDataFilePath
{
  return self->_playbackSessionDataFilePath;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_playbackSessionDataFilePath, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
