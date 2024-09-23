@implementation MPInsertIntoPlaybackQueueCommandEvent

- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPInsertIntoPlaybackQueueCommandEvent *v9;
  void *v10;
  int v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  NSString *insertAfterContentItemID;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  MPRemotePlaybackQueue *playbackQueue;
  objc_super v22;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MPInsertIntoPlaybackQueueCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v22, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CC38]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v12 = (v11 - 1);
    if (v12 < 3)
      v13 = v12 + 1;
    else
      v13 = 0;
    v9->_insertionPosition = v13;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC00]);
    v14 = objc_claimAutoreleasedReturnValue();
    insertAfterContentItemID = v9->_insertAfterContentItemID;
    v9->_insertAfterContentItemID = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC30]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = objc_msgSend(v16, "integerValue");
    else
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    v9->_destinationOffset = v18;
    CFDictionaryGetValue((CFDictionaryRef)v8, (const void *)*MEMORY[0x1E0D4CD20]);
    +[MPRemotePlaybackQueue queueWithMediaRemotePlaybackQueue:options:](MPRemotePlaybackQueue, "queueWithMediaRemotePlaybackQueue:options:", MRSystemAppPlaybackQueueCreateFromExternalRepresentation(), v8);
    v19 = objc_claimAutoreleasedReturnValue();
    playbackQueue = v9->_playbackQueue;
    v9->_playbackQueue = (MPRemotePlaybackQueue *)v19;

  }
  return v9;
}

- (MPInsertIntoPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  MPInsertIntoPlaybackQueueCommandEvent *v11;
  MPInsertIntoPlaybackQueueCommandEvent *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSString *insertAfterContentItemID;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MPInsertIntoPlaybackQueueCommandEvent;
  v11 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v22, sel_initWithCommand_mediaRemoteType_options_, a3, 125, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackQueue, a4);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MPRemoteCommandQueueInsertionPosition"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "integerValue");
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D4CC38]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      v18 = (v17 - 1);
      if (v18 < 3)
        v15 = v18 + 1;
      else
        v15 = 0;
    }
    v12->_insertionPosition = v15;
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC00]);
    v19 = objc_claimAutoreleasedReturnValue();
    insertAfterContentItemID = v12->_insertAfterContentItemID;
    v12->_insertAfterContentItemID = (NSString *)v19;

  }
  return v12;
}

- (NSArray)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (int64_t)insertionPosition
{
  return self->_insertionPosition;
}

- (MPRemotePlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (NSString)insertAfterContentItemID
{
  return self->_insertAfterContentItemID;
}

- (int64_t)destinationOffset
{
  return self->_destinationOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertAfterContentItemID, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);
}

@end
