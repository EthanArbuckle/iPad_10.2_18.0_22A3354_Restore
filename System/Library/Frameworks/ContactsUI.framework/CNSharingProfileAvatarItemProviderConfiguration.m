@implementation CNSharingProfileAvatarItemProviderConfiguration

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (void)setMonogramColor:(id)a3
{
  objc_storeStrong((id *)&self->_monogramColor, a3);
}

- (CNPhotoPickerColorVariant)animojiColor
{
  return self->_animojiColor;
}

- (void)setAnimojiColor:(id)a3
{
  objc_storeStrong((id *)&self->_animojiColor, a3);
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_memojiMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_animojiColor, 0);
  objc_storeStrong((id *)&self->_monogramColor, 0);
}

@end
