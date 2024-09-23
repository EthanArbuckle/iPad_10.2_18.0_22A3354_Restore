@implementation AVTStickerRecentsPlaceholderItem

- (id)cellIdentifier
{
  return +[AVTStickerRecentsStickerCollectionViewCell identifier](AVTStickerRecentsStickerCollectionViewCell, "identifier");
}

- (void)discardContent
{
  void (**discardableContentHandler)(id, AVTStickerRecentsPlaceholderItem *);

  discardableContentHandler = (void (**)(id, AVTStickerRecentsPlaceholderItem *))self->discardableContentHandler;
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

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->discardableContentHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_provider, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
