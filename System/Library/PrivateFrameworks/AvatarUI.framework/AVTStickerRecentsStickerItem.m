@implementation AVTStickerRecentsStickerItem

- (AVTStickerRecentsStickerItem)initWithAvatarIdentifier:(id)a3 stickerName:(id)a4 localizedName:(id)a5 stickerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVTStickerRecentsStickerItem *v14;
  uint64_t v15;
  NSString *avatarIdentifier;
  uint64_t v17;
  NSString *stickerName;
  uint64_t v19;
  NSString *localizedDescription;
  uint64_t v21;
  id provider;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerRecentsStickerItem;
  v14 = -[AVTStickerRecentsStickerItem init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    avatarIdentifier = v14->_avatarIdentifier;
    v14->_avatarIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    stickerName = v14->_stickerName;
    v14->_stickerName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    localizedDescription = v14->_localizedDescription;
    v14->_localizedDescription = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    provider = v14->_provider;
    v14->_provider = (id)v21;

  }
  return v14;
}

- (id)cellIdentifier
{
  return +[AVTStickerRecentsStickerCollectionViewCell identifier](AVTStickerRecentsStickerCollectionViewCell, "identifier");
}

- (void)discardContent
{
  void (**discardableContentHandler)(id, AVTStickerRecentsStickerItem *);

  -[AVTStickerRecentsStickerItem setImage:](self, "setImage:", 0);
  discardableContentHandler = (void (**)(id, AVTStickerRecentsStickerItem *))self->discardableContentHandler;
  if (discardableContentHandler)
    discardableContentHandler[2](discardableContentHandler, self);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (id)provider
{
  return self->_provider;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)isPrereleaseSticker
{
  return self->_prereleaseSticker;
}

- (void)setPrereleaseSticker:(BOOL)a3
{
  self->_prereleaseSticker = a3;
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)avatarIdentifier
{
  return self->_avatarIdentifier;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_avatarIdentifier, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_provider, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
