@implementation InstallableFontCell

- (UILabel)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_storeStrong((id *)&self->_fontName, a3);
}

- (UILabel)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (UIImageView)providerIcon
{
  return self->_providerIcon;
}

- (void)setProviderIcon:(id)a3
{
  objc_storeStrong((id *)&self->_providerIcon, a3);
}

- (NSMutableDictionary)font
{
  return self->font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->font, a3);
}

- (UILabel)providerCount
{
  return self->_providerCount;
}

- (void)setProviderCount:(id)a3
{
  objc_storeStrong((id *)&self->_providerCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCount, 0);
  objc_storeStrong((id *)&self->font, 0);
  objc_storeStrong((id *)&self->_providerIcon, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end
