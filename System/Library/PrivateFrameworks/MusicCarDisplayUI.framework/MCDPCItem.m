@implementation MCDPCItem

- (id)_initWithModel:(id)a3 MRContentItem:(void *)a4
{
  id v5;
  MCDPCItem *v6;
  MCDPCItem *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subtitle;
  uint64_t v14;
  NSData *artworkData;
  float v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCDPCItem;
  v6 = -[MCDPCItem init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_model, v5);
    MRContentItemGetIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    MRContentItemGetTitle();
    v10 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v10;

    MRContentItemGetSubtitle();
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v12;

    MRContentItemGetArtworkData();
    v14 = objc_claimAutoreleasedReturnValue();
    artworkData = v7->_artworkData;
    v7->_artworkData = (NSData *)v14;

    MRContentItemGetPlaybackProgress();
    v7->_playbackProgress = v16;
    v7->_isContainer = MRContentItemGetIsContainer();
    v7->_isPlayable = MRContentItemGetIsPlayable();
    v7->_isCloudItem = MRContentItemGetIsStreamingContent();
    v7->_isExplicitItem = MRContentItemGetIsExplicitItem();
  }

  return v7;
}

- (id)description
{
  MCDPCItem *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *title;
  NSString *identifier;
  _BOOL4 v8;
  _BOOL4 v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = v2->_identifier;
  title = v2->_title;
  v8 = -[MCDPCItem isContainer](v2, "isContainer");
  v9 = -[MCDPCItem isPlayable](v2, "isPlayable");
  v10 = &stru_24FD78C58;
  v11 = CFSTR("c");
  if (!v8)
    v11 = &stru_24FD78C58;
  if (v9)
    v10 = CFSTR("p");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - (%@) (%@) [%@%@]>"), v5, v2, title, identifier, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isCloudItem
{
  return self->_isCloudItem;
}

- (BOOL)currentlyPlaying
{
  return self->_currentlyPlaying;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
}

- (BOOL)isExplicitItem
{
  return self->_isExplicitItem;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
}

- (MCDPCModel)model
{
  return (MCDPCModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
