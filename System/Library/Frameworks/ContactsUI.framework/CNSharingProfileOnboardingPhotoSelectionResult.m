@implementation CNSharingProfileOnboardingPhotoSelectionResult

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
}

- (UIImage)compositedImage
{
  return self->_compositedImage;
}

- (void)setCompositedImage:(id)a3
{
  objc_storeStrong((id *)&self->_compositedImage, a3);
}

- (NSString)variantName
{
  return self->_variantName;
}

- (void)setVariantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(int64_t)a3
{
  self->_avatarType = a3;
}

- (BOOL)wasSelectedInFullPhotoPicker
{
  return self->_wasSelectedInFullPhotoPicker;
}

- (void)setWasSelectedInFullPhotoPicker:(BOOL)a3
{
  self->_wasSelectedInFullPhotoPicker = a3;
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
  objc_storeStrong((id *)&self->_variantName, 0);
  objc_storeStrong((id *)&self->_compositedImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
}

@end
