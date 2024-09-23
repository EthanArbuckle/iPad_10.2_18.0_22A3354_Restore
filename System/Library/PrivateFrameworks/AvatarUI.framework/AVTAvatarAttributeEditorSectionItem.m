@implementation AVTAvatarAttributeEditorSectionItem

- (AVTAvatarAttributeEditorSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 thumbnailProvider:(id)a5 stickerResourceProvider:(id)a6 presetResourcesProvider:(id)a7 avatarUpdater:(id)a8 heightRatio:(double)a9 selected:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  AVTAvatarAttributeEditorSectionItem *v23;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *localizedName;
  uint64_t v28;
  id thumbnailProvider;
  uint64_t v30;
  id stickerResourceProvider;
  uint64_t v32;
  id presetResourcesProvider;
  uint64_t v34;
  id avatarUpdater;
  objc_super v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)AVTAvatarAttributeEditorSectionItem;
  v23 = -[AVTAvatarAttributeEditorSectionItem init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    localizedName = v23->_localizedName;
    v23->_localizedName = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    thumbnailProvider = v23->_thumbnailProvider;
    v23->_thumbnailProvider = (id)v28;

    v30 = objc_msgSend(v20, "copy");
    stickerResourceProvider = v23->_stickerResourceProvider;
    v23->_stickerResourceProvider = (id)v30;

    v32 = objc_msgSend(v21, "copy");
    presetResourcesProvider = v23->_presetResourcesProvider;
    v23->_presetResourcesProvider = (id)v32;

    v34 = objc_msgSend(v22, "copy");
    avatarUpdater = v23->_avatarUpdater;
    v23->_avatarUpdater = (id)v34;

    v23->_heightRatio = a9;
    v23->_selected = a10;
  }

  return v23;
}

- (NSString)prefetchingIdentifier
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorSectionItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorSectionItem;
  -[AVTAvatarAttributeEditorSectionItem description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorSectionItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSectionItem localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@ name: %@"), v5, v6);

  if (-[AVTAvatarAttributeEditorSectionItem isSelected](self, "isSelected"))
    objc_msgSend(v4, "appendString:", CFSTR(" SELECTED"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v7;
}

- (void)discardContent
{
  void *v3;
  void (**v4)(id, AVTAvatarAttributeEditorSectionItem *);

  -[AVTAvatarAttributeEditorSectionItem setCachedThumbnail:](self, "setCachedThumbnail:", 0);
  -[AVTAvatarAttributeEditorSectionItem discardableContentHandler](self, "discardableContentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorSectionItem discardableContentHandler](self, "discardableContentHandler");
    v4 = (void (**)(id, AVTAvatarAttributeEditorSectionItem *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)thumbnailProvider
{
  return self->_thumbnailProvider;
}

- (id)presetResourcesProvider
{
  return self->_presetResourcesProvider;
}

- (id)stickerResourceProvider
{
  return self->_stickerResourceProvider;
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)cachedThumbnail
{
  return self->_cachedThumbnail;
}

- (void)setCachedThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_cachedThumbnail, a3);
}

- (double)heightRatio
{
  return self->_heightRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedThumbnail, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong(&self->_stickerResourceProvider, 0);
  objc_storeStrong(&self->_presetResourcesProvider, 0);
  objc_storeStrong(&self->_thumbnailProvider, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
