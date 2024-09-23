@implementation LPiTunesMediaSoftwareUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaSoftwareMetadata *v3;
  _BOOL8 v4;

  v3 = objc_alloc_init(LPiTunesMediaSoftwareMetadata);
  -[LPiTunesMediaSoftwareMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaSoftwareMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaSoftwareMetadata setName:](v3, "setName:", self->_name);
  -[LPiTunesMediaSoftwareMetadata setSubtitle:](v3, "setSubtitle:", self->_subtitle);
  -[LPiTunesMediaSoftwareMetadata setGenre:](v3, "setGenre:", self->_genre);
  -[LPiTunesMediaSoftwareMetadata setPlatform:](v3, "setPlatform:", self->_platform);
  if (-[NSNumber BOOLValue](self->_hasMessagesExtension, "BOOLValue"))
    v4 = -[NSNumber BOOLValue](self->_isHiddenFromSpringboard, "BOOLValue");
  else
    v4 = 0;
  -[LPiTunesMediaSoftwareMetadata setIsMessagesOnlyApp:](v3, "setIsMessagesOnlyApp:", v4);
  if (self->_screenshots)
    -[LPiTunesMediaSoftwareMetadata setScreenshots:](v3, "setScreenshots:", MEMORY[0x1E0C9AA60]);
  return v3;
}

- (id)assetsToFetch
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self->_icon, 0);
  v4 = v3;
  if (self->_messagesAppIcon)
    objc_msgSend(v3, "addObject:");
  if (-[NSArray count](self->_screenshots, "count"))
  {
    -[NSArray firstObject](self->_screenshots, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (self->_previewVideo)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)isHiddenFromSpringboard
{
  return self->_isHiddenFromSpringboard;
}

- (void)setIsHiddenFromSpringboard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (LPiTunesMediaAsset)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (LPiTunesMediaAsset)messagesAppIcon
{
  return self->_messagesAppIcon;
}

- (void)setMessagesAppIcon:(id)a3
{
  objc_storeStrong((id *)&self->_messagesAppIcon, a3);
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
  objc_storeStrong((id *)&self->_screenshots, a3);
}

- (LPiTunesMediaAsset)previewVideo
{
  return self->_previewVideo;
}

- (void)setPreviewVideo:(id)a3
{
  objc_storeStrong((id *)&self->_previewVideo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_messagesAppIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_hasMessagesExtension, 0);
  objc_storeStrong((id *)&self->_isHiddenFromSpringboard, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
