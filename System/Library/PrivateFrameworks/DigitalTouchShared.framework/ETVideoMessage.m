@implementation ETVideoMessage

- (ETVideoMessage)init
{
  ETVideoMessage *v2;
  uint64_t v3;
  NSMutableArray *playingMessages;
  ETVideoMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ETVideoMessage;
  v2 = -[ETMessage init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    playingMessages = v2->_playingMessages;
    v2->_playingMessages = (NSMutableArray *)v3;

    v2->_mediaType = 1;
    v5 = v2;
  }

  return v2;
}

+ (unsigned)messageType
{
  return 8;
}

- (ETVideoMessage)initWithArchiveData:(id)a3
{
  id v4;
  ETVideoMessage *v5;
  ETPVideo *v6;
  void *v7;
  uint64_t v8;
  ETSketchMessage *introMessage;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  ETVideoMessage *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  objc_super v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ETVideoMessage;
  v5 = -[ETMessage initWithArchiveData:](&v34, sel_initWithArchiveData_, v4);
  if (v5)
  {
    v6 = -[ETPVideo initWithData:]([ETPVideo alloc], "initWithData:", v4);
    -[ETPVideo introMessageData](v6, "introMessageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ETMessage unarchive:](ETMessage, "unarchive:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    introMessage = v5->_introMessage;
    v5->_introMessage = (ETSketchMessage *)v8;

    -[ETSketchMessage setParentMessage:](v5->_introMessage, "setParentMessage:", v5);
    -[ETMessage setDelayWisp:](v5->_introMessage, "setDelayWisp:", 1);
    -[ETSketchMessage setHideComet:](v5->_introMessage, "setHideComet:", 1);
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1620];
    -[ETPVideo playingMessagesData](v6, "playingMessagesData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v14, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v27, v15, &v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v33;

    if (v28 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_impl(&dword_22C68B000, v17, OS_LOG_TYPE_INFO, "Error unarchiving ETVideoMessage: %@", buf, 0xCu);
      }

    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v18);
          +[ETMessage unarchive:](ETMessage, "unarchive:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "setParentMessage:", v5);
            -[NSMutableArray addObject:](v5->_playingMessages, "addObject:", v23);
          }

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v19);
    }

    if (-[ETPVideo hasMediaType](v6, "hasMediaType"))
      v24 = -[ETVideoMessage _mediaTypeFromETPVideoType:](v5, "_mediaTypeFromETPVideoType:", -[ETPVideo mediaType](v6, "mediaType"));
    else
      v24 = 1;
    v5->_mediaType = v24;
    v25 = v5;

  }
  return v5;
}

- (unint64_t)_mediaTypeFromETPVideoType:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return 1;
}

- (int)_etpMediaTypeFromETMediaType:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return 1;
}

- (id)archiveData
{
  ETPVideo *v3;
  ETSketchMessage *introMessage;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ETPVideo);
  introMessage = self->_introMessage;
  if (introMessage)
  {
    -[ETMessage archive](introMessage, "archive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETPVideo setIntroMessageData:](v3, "setIntroMessageData:", v5);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_playingMessages;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "archive", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPVideo setPlayingMessagesData:](v3, "setPlayingMessagesData:", v13);

  -[ETPVideo setMediaType:](v3, "setMediaType:", -[ETVideoMessage _etpMediaTypeFromETMediaType:](self, "_etpMediaTypeFromETMediaType:", self->_mediaType));
  -[ETPVideo data](v3, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)messageTypeAsString
{
  return CFSTR("Video");
}

- (void)setPlayingMessages:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *playingMessages;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  playingMessages = self->_playingMessages;
  self->_playingMessages = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setSupportsPlaybackTimeOffset:", 1, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setIntroMessage:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_introMessage, a3);
  v4 = a3;
  objc_msgSend(v4, "setSupportsPlaybackTimeOffset:", 1);

}

- (BOOL)shouldLoopDuringPlayback
{
  return self->_mediaType == 1;
}

- (NSArray)playingMessages
{
  return (NSArray *)self->_playingMessages;
}

- (BOOL)canCompressTime
{
  return self->_mediaType == 2;
}

- (double)compressTimeSinceStartOfMessage:(double)a3
{
  double v3;

  v3 = a3 - self->_compressedTimeLastEventTime;
  if (!self->_pauseTimeCompression && v3 > 0.5)
    self->_compressedTimeTotal = v3 + -0.5 + self->_compressedTimeTotal;
  self->_compressedTimeLastEventTime = a3;
  return a3 - self->_compressedTimeTotal;
}

- (UIImage)stillImage
{
  UIImage *stillImage;
  unint64_t mediaType;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  id v10;
  NSURL *mediaURL;
  void *v12;
  void *v13;
  uint64_t v14;
  CGImage *v15;
  id v16;
  UIImage *v17;
  UIImage *v18;
  __int128 v20;
  id v21;
  CMTime rhs;
  CMTime lhs;
  CMTime v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  stillImage = self->_stillImage;
  if (!stillImage)
  {
    mediaType = self->_mediaType;
    if (mediaType == 1)
    {
      v10 = objc_alloc(MEMORY[0x24BDB26C8]);
      mediaURL = self->_mediaURL;
      v27 = *MEMORY[0x24BDB21C0];
      v28[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithURL:options:", mediaURL, v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B0]), "initWithAsset:", v7);
      objc_msgSend(v13, "setAppliesPreferredTrackTransform:", 1);
      v25 = *MEMORY[0x24BDC0D88];
      v20 = v25;
      v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v14 = v26;
      objc_msgSend(v13, "setRequestedTimeToleranceAfter:", &v25);
      v25 = v20;
      v26 = v14;
      objc_msgSend(v13, "setRequestedTimeToleranceBefore:", &v25);
      if (v7)
        objc_msgSend(v7, "duration");
      else
        memset(&lhs, 0, sizeof(lhs));
      CMTimeMake(&rhs, 1, 30);
      CMTimeSubtract(&v24, &lhs, &rhs);
      v21 = 0;
      v15 = (CGImage *)objc_msgSend(v13, "copyCGImageAtTime:actualTime:error:", &v24, 0, &v21);
      v16 = v21;
      if (!v16)
      {
        v17 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v15);
        v18 = self->_stillImage;
        self->_stillImage = v17;

      }
      CGImageRelease(v15);

    }
    else
    {
      if (mediaType != 2)
      {
LABEL_12:
        stillImage = self->_stillImage;
        return stillImage;
      }
      v5 = (void *)MEMORY[0x24BDBCE50];
      -[NSURL path](self->_mediaURL, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataWithContentsOfFile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v7);
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v9 = self->_stillImage;
      self->_stillImage = v8;

    }
    goto LABEL_12;
  }
  return stillImage;
}

- (BOOL)isAnimated
{
  return self->_mediaType != 2 || -[NSMutableArray count](self->_playingMessages, "count") != 0;
}

- (double)messageDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  Float64 Seconds;
  CMTime time;

  if (self->_mediaType != 1)
  {
    -[NSMutableArray lastObject](self->_playingMessages, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDelay");
    v6 = v5;
    objc_msgSend(v4, "messageDuration");
    Seconds = v6 + v7;
LABEL_8:
    self->_messageDuration = Seconds;

    return self->_messageDuration;
  }
  if (self->_messageDuration == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", self->_mediaURL, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    goto LABEL_8;
  }
  return self->_messageDuration;
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
  objc_storeStrong((id *)&self->_mediaURL, a3);
}

- (void)setStillImage:(id)a3
{
  objc_storeStrong((id *)&self->_stillImage, a3);
}

- (ETSketchMessage)introMessage
{
  return self->_introMessage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (BOOL)pauseTimeCompression
{
  return self->_pauseTimeCompression;
}

- (void)setPauseTimeCompression:(BOOL)a3
{
  self->_pauseTimeCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introMessage, 0);
  objc_storeStrong((id *)&self->_stillImage, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_playingMessages, 0);
}

@end
