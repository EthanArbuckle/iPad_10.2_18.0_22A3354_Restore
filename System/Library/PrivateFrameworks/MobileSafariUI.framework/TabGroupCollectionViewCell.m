@implementation TabGroupCollectionViewCell

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
}

@end
