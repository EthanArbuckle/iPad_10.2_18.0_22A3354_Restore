@implementation AVTSplashScreenConfiguration

- (AVPlayerItem)primaryPlayerItem
{
  return self->_primaryPlayerItem;
}

- (void)setPrimaryPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPlayerItem, a3);
}

- (AVPlayerItem)secondaryPlayerItem
{
  return self->_secondaryPlayerItem;
}

- (void)setSecondaryPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryPlayerItem, a3);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (NSString)subTitleString
{
  return self->_subTitleString;
}

- (void)setSubTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleString, a3);
}

- (NSString)buttonString
{
  return self->_buttonString;
}

- (void)setButtonString:(id)a3
{
  objc_storeStrong((id *)&self->_buttonString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonString, 0);
  objc_storeStrong((id *)&self->_subTitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_secondaryPlayerItem, 0);
  objc_storeStrong((id *)&self->_primaryPlayerItem, 0);
}

@end
