@implementation MPSetPlaybackQueueCommandEvent

- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  const __CFDictionary *v8;
  MPSetPlaybackQueueCommandEvent *v9;
  MPRemotePlaybackQueue *v10;
  MPRemotePlaybackQueue *playbackQueue;
  MPRemotePlaybackQueue *v12;
  void *v13;
  uint64_t v14;
  NSString *sessionIdentifierOverride;
  MPSetPlaybackQueueCommandEvent *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFDictionary *v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFDictionary *)a5;
  v20.receiver = self;
  v20.super_class = (Class)MPSetPlaybackQueueCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v20, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (!v9)
    goto LABEL_4;
  if (CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0D4CD20]))
  {
    +[MPRemotePlaybackQueue queueWithMediaRemotePlaybackQueue:options:](MPRemotePlaybackQueue, "queueWithMediaRemotePlaybackQueue:options:", MRSystemAppPlaybackQueueCreateFromExternalRepresentation(), v8);
    v10 = (MPRemotePlaybackQueue *)objc_claimAutoreleasedReturnValue();
    playbackQueue = v9->_playbackQueue;
    v9->_playbackQueue = v10;
    v12 = v10;

    -[MPRemoteCommandEvent mediaRemoteOptions](v9, "mediaRemoteOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBD8]);
    v14 = objc_claimAutoreleasedReturnValue();
    sessionIdentifierOverride = v9->_sessionIdentifierOverride;
    v9->_sessionIdentifierOverride = (NSString *)v14;

LABEL_4:
    v16 = v9;
    goto LABEL_8;
  }
  v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "MPSetPlaybackQueueCommandEvent: Failed to extract playback queue data from media remote command=%@ options=%@", buf, 0x16u);

  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MPSetPlaybackQueueCommandEvent *v10;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "mediaRemoteOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)MPSetPlaybackQueueCommandEvent;
  v10 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v12, sel_initWithCommand_mediaRemoteType_options_, v8, 122, v9);

  if (v10)
    objc_storeStrong((id *)&v10->_playbackQueue, a4);

  return v10;
}

- (id)copyWithDialogOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[MPSetPlaybackQueueCommandEvent playbackQueue](self, "playbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRemoteOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D4CBB0]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("kMRMediaRemoteOptionDialogOptions"));
  v10 = objc_alloc((Class)objc_opt_class());
  -[MPRemoteCommandEvent command](self, "command");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCommand:mediaRemoteType:options:", v11, -[MPRemoteCommandEvent mediaRemoteCommandType](self, "mediaRemoteCommandType"), v7);

  return v12;
}

- (MPRemotePlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (NSString)sessionIdentifierOverride
{
  return self->_sessionIdentifierOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
}

@end
