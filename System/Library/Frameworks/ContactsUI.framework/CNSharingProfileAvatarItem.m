@implementation CNSharingProfileAvatarItem

- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 type:(int64_t)a4
{
  return -[CNSharingProfileAvatarItem initWithImageProvider:originalImageProvider:type:](self, "initWithImageProvider:originalImageProvider:type:", a3, a3, a4);
}

- (CNSharingProfileAvatarItem)initWithImageProvider:(id)a3 originalImageProvider:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  CNSharingProfileAvatarItem *v10;
  uint64_t v11;
  id imageProvider;
  uint64_t v13;
  id originalImageProvider;
  CNSharingProfileAvatarItem *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNSharingProfileAvatarItem;
  v10 = -[CNSharingProfileAvatarItem init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    imageProvider = v10->_imageProvider;
    v10->_imageProvider = (id)v11;

    v13 = objc_msgSend(v9, "copy");
    originalImageProvider = v10->_originalImageProvider;
    v10->_originalImageProvider = (id)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (id)originalImageProvider
{
  return self->_originalImageProvider;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (void)setVariantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)wasSetFromFullPhotoPicker
{
  return self->_wasSetFromFullPhotoPicker;
}

- (void)setWasSetFromFullPhotoPicker:(BOOL)a3
{
  self->_wasSetFromFullPhotoPicker = a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
  self->_memojiMetadata = (NSData *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong(&self->_originalImageProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
}

@end
