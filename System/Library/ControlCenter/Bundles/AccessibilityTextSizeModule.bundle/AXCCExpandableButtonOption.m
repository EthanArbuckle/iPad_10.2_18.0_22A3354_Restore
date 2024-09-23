@implementation AXCCExpandableButtonOption

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSString *packageName;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v8;
  packageName = self->_packageName;
  if (self->_supportsAnimation)
    objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p identifer=%@ packageName=%@ title=%@ animated=%@>"), v10, v4, self, v8, packageName, self->_title, CFSTR("Yes"));
  else
    objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p identifer=%@ packageName=%@ title=%@ animated=%@>"), v10, v4, self, v8, packageName, self->_title, CFSTR("No"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)packageName
{
  return self->_packageName;
}

- (void)setPackageName:(id)a3
{
  objc_storeStrong((id *)&self->_packageName, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, a3);
}

- (BOOL)supportsAnimation
{
  return self->_supportsAnimation;
}

- (void)setSupportsAnimation:(BOOL)a3
{
  self->_supportsAnimation = a3;
}

- (int)correspondingState
{
  return self->_correspondingState;
}

- (void)setCorrespondingState:(int)a3
{
  self->_correspondingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
