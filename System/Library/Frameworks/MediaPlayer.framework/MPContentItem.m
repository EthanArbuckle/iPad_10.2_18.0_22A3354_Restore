@implementation MPContentItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;
  unint64_t v6;
  int v7;
  MPContentItem *v8;
  _QWORD v9[4];
  NSString *v10;

  v4 = title;
  -[MPContentItem title](self, "title");
  v5 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = -[NSString isEqual:](v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!((unint64_t)v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetTitle();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__MPContentItem_setTitle___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (NSString)title
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetTitle();
}

- (NSString)identifier
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetIdentifier();
}

- (void)_mediaRemoteContentItem
{
  return self->_mediaRemoteContentItem;
}

+ (void)performSuppressingChangeNotifications:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MPContentItemNotificationsSuppressedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7[2]();
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MPContentItemNotificationsSuppressedKey"));
    v7[2]();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("_MPContentItemNotificationsSuppressedKey"));
  }

}

- (void)_postItemChangedNotificationWithDeltaBlock:(id)a3
{
  void (**v4)(id, const void *);
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint8_t v15[16];

  v4 = (void (**)(id, const void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_MPContentItemNotificationsSuppressedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    MRContentItemGetIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v4)
      {
        v10 = (const void *)MRContentItemCreate();
        v4[2](v4, v10);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem"));
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_MPContentItemNotificationsImmediateKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v13)
          -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MPContentItemDidChangeUserInfoKeyImmediately"));
        CFRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v11);

    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "Cannot post _MPContentItemDidChangeNotification, item is missing required identifier.", v15, 2u);
      }
    }

  }
}

- (void)setPlayable:(BOOL)playable
{
  MPContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPContentItem isPlayable](self, "isPlayable") != playable)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetPlayable();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__MPContentItem_setPlayable___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = playable;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)isPlayable
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsPlayable();
}

uint64_t __26__MPContentItem_setTitle___block_invoke()
{
  return MRContentItemSetTitle();
}

uint64_t __37__MPContentItem_setStreamingContent___block_invoke()
{
  return MRContentItemSetIsStreamingContent();
}

uint64_t __29__MPContentItem_setPlayable___block_invoke()
{
  return MRContentItemSetPlayable();
}

- (void)setExplicitContent:(BOOL)explicitContent
{
  MPContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPContentItem isExplicitContent](self, "isExplicitContent") != explicitContent)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetExplicitItem();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__MPContentItem_setExplicitContent___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = explicitContent;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)isExplicitContent
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsExplicitItem();
}

- (void)setStreamingContent:(BOOL)streamingContent
{
  MPContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPContentItem isStreamingContent](self, "isStreamingContent") != streamingContent)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetIsStreamingContent();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__MPContentItem_setStreamingContent___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = streamingContent;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)isStreamingContent
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsStreamingContent();
}

- (void)setContainer:(BOOL)container
{
  MPContentItem *v5;
  _QWORD v6[4];
  BOOL v7;

  if (-[MPContentItem isContainer](self, "isContainer") != container)
  {
    v5 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v5, "_mediaRemoteContentItem");
    MRContentItemSetIsContainer();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__MPContentItem_setContainer___block_invoke;
    v6[3] = &__block_descriptor_33_e9_v16__0_v8l;
    v7 = container;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v5, "_postItemChangedNotificationWithDeltaBlock:", v6);
  }
}

- (BOOL)isContainer
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return MRContentItemGetIsContainer();
}

- (void)dealloc
{
  void *mediaRemoteContentItem;
  objc_super v4;

  mediaRemoteContentItem = self->_mediaRemoteContentItem;
  if (mediaRemoteContentItem)
    CFRelease(mediaRemoteContentItem);
  v4.receiver = self;
  v4.super_class = (Class)MPContentItem;
  -[MPContentItem dealloc](&v4, sel_dealloc);
}

- (void)postChangeNotificationImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  MRContentItemGetIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_mediaRemoteContentItem, CFSTR("_MPContentItemDidChangeUserInfoKeyDeltaItem"));
    if (v3)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MPContentItemDidChangeUserInfoKeyImmediately"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_MPContentItemDidChangeNotification"), self, v6);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Cannot post _MPContentItemDidChangeNotification, item is missing required identifier.", v9, 2u);
    }

  }
}

- (id)_initWithMediaRemoteContentItem:(void *)a3
{
  const void *v3;
  void *v5;
  MPContentItem *v6;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPContentItem initWithIdentifier:](self, "initWithIdentifier:", v5);

    if (v6)
      v6->_mediaRemoteContentItem = (void *)CFRetain(v3);
    self = v6;
    v3 = self;
  }

  return (id)v3;
}

- (MPContentItem)initWithIdentifier:(NSString *)identifier
{
  NSString *v5;
  MPContentItem *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  void *v11;
  objc_super v12;

  v5 = identifier;
  v12.receiver = self;
  v12.super_class = (Class)MPContentItem;
  v6 = -[MPContentItem init](&v12, sel_init);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPContentItem.m"), 75, CFSTR("Can't create an MPContentItem object with a nil identifier."));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = v5;
    v5 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NSString stringValue](v7, "stringValue");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v5 != v9)
      v6->_mediaRemoteContentItem = (void *)MRContentItemCreate();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MPContentItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MPContentItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MPContentItem createExternalRepresentation](self, "createExternalRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPContentItem createExternalRepresentation](v4, "createExternalRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToData:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (MPContentItem)init
{
  void *v3;
  void *v4;
  MPContentItem *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPContentItem initWithIdentifier:](self, "initWithIdentifier:", v4);

  return v5;
}

- (MPContentItem)initWithExternalRepresentation:(id)a3
{
  return (MPContentItem *)-[MPContentItem _initWithMediaRemoteContentItem:](self, "_initWithMediaRemoteContentItem:", MRContentItemCreateFromExternalRepresentation());
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPContentItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPContentItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id=%@ title=\"%@\">"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createExternalRepresentation
{
  return (id)MRContentItemCreateExternalRepresentation();
}

- (NSString)subtitle
{
  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  return (NSString *)MRContentItemGetSubtitle();
}

- (void)setSubtitle:(NSString *)subtitle
{
  NSString *v4;
  NSString *v5;
  unint64_t v6;
  int v7;
  MPContentItem *v8;
  _QWORD v9[4];
  NSString *v10;

  v4 = subtitle;
  -[MPContentItem subtitle](self, "subtitle");
  v5 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v5;
  if (v5 == v4)
  {

  }
  else
  {
    v7 = -[NSString isEqual:](v5, "isEqual:", v4);

    if (!v7)
      goto LABEL_6;
  }
  if (!((unint64_t)v4 | v6))
  {
LABEL_6:
    v8 = objc_retainAutorelease(self);
    -[MPContentItem _mediaRemoteContentItem](v8, "_mediaRemoteContentItem");
    MRContentItemSetSubtitle();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __29__MPContentItem_setSubtitle___block_invoke;
    v9[3] = &unk_1E315EE38;
    v10 = v4;
    -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v8, "_postItemChangedNotificationWithDeltaBlock:", v9);

  }
}

- (float)playbackProgress
{
  float result;

  -[MPContentItem _mediaRemoteContentItem](objc_retainAutorelease(self), "_mediaRemoteContentItem");
  MRContentItemGetPlaybackProgress();
  return result;
}

- (void)setPlaybackProgress:(float)playbackProgress
{
  float v5;
  float v6;
  float v7;
  float v8;
  MPContentItem *v9;
  _QWORD v10[4];
  float v11;

  -[MPContentItem playbackProgress](self, "playbackProgress");
  v6 = -v5;
  if (v5 >= 0.0)
    v6 = v5;
  if (v6 > 0.00000011921)
    goto LABEL_7;
  v7 = -playbackProgress;
  if (playbackProgress >= 0.0)
    v7 = playbackProgress;
  if (v7 > 0.00000011921)
  {
LABEL_7:
    v8 = v5 - playbackProgress;
    if (v8 < 0.0)
      v8 = -v8;
    if (v8 > 0.00000011921)
    {
      v9 = objc_retainAutorelease(self);
      -[MPContentItem _mediaRemoteContentItem](v9, "_mediaRemoteContentItem");
      MRContentItemSetPlaybackProgress();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__MPContentItem_setPlaybackProgress___block_invoke;
      v10[3] = &__block_descriptor_36_e9_v16__0_v8l;
      v11 = playbackProgress;
      -[MPContentItem _postItemChangedNotificationWithDeltaBlock:](v9, "_postItemChangedNotificationWithDeltaBlock:", v10);
    }
  }
}

- (void)setArtwork:(MPMediaItemArtwork *)artwork
{
  MPMediaItemArtwork *v5;

  v5 = artwork;
  if (self->_artwork != v5)
  {
    objc_storeStrong((id *)&self->_artwork, artwork);
    MRContentItemSetHasArtworkData();
    if (self->_artwork)
    {
      if (objc_msgSend((id)objc_opt_class(), "shouldPushArtworkData"))
        -[MPContentItem _loadArtwork:completion:](self, "_loadArtwork:completion:", self->_artwork, 0);
    }
  }

}

- (void)_loadArtwork:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  MPMediaItemArtwork *artwork;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  +[MPPlayableContentManager sharedContentManager](MPPlayableContentManager, "sharedContentManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  artwork = self->_artwork;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__MPContentItem__loadArtwork_completion___block_invoke;
  v9[3] = &unk_1E315EEC8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "_enqueueArtworkUpdate:size:withCompletion:", artwork, v9, -1.0, -1.0);

}

- (MPMediaItemArtwork)artwork
{
  return self->_artwork;
}

void __41__MPContentItem__loadArtwork_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;

  v7 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MPContentItem__loadArtwork_completion___block_invoke_2;
  block[3] = &unk_1E315EEA0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12 = v7;
  v13 = v8;
  v15 = a3;
  v16 = a4;
  v14 = v9;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __41__MPContentItem__loadArtwork_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "length");
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Received artwork with length %llu for content item %@.", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "_mediaRemoteContentItem");
  MRContentItemSetArtworkData();
  MRContentItemSetArtworkDataSize();
  objc_msgSend(*(id *)(a1 + 40), "_postItemChangedNotificationWithDeltaBlock:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __36__MPContentItem_setExplicitContent___block_invoke()
{
  return MRContentItemSetExplicitItem();
}

uint64_t __30__MPContentItem_setContainer___block_invoke()
{
  return MRContentItemSetIsContainer();
}

uint64_t __37__MPContentItem_setPlaybackProgress___block_invoke()
{
  return MRContentItemSetPlaybackProgress();
}

uint64_t __29__MPContentItem_setSubtitle___block_invoke()
{
  return MRContentItemSetSubtitle();
}

+ (BOOL)isSuppressingChangeNotifications
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_MPContentItemNotificationsSuppressedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (void)performChangeImmediately:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MPContentItemNotificationsImmediateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7[2]();
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_MPContentItemNotificationsImmediateKey"));
    v7[2]();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("_MPContentItemNotificationsImmediateKey"));
  }

}

+ (BOOL)shouldPushArtworkData
{
  return 1;
}

@end
