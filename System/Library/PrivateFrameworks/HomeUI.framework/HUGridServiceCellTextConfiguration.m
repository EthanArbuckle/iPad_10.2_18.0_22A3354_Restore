@implementation HUGridServiceCellTextConfiguration

- (UIColor)nameTextColor
{
  UIColor *nameTextColor;

  nameTextColor = self->_nameTextColor;
  if (nameTextColor)
    return nameTextColor;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (HFServiceNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (HFStringGenerator)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (void)setNameTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_nameTextColor, a3);
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (void)setDescriptionTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextColor, a3);
}

- (UIVisualEffect)descriptionTextEffect
{
  return self->_descriptionTextEffect;
}

- (void)setDescriptionTextEffect:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionTextEffect, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_nameTextColor, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end
