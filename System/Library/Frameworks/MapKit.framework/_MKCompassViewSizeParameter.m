@implementation _MKCompassViewSizeParameter

- (double)diameter
{
  return self->_diameter;
}

- (NSString)imageNamePart
{
  return self->_imageNamePart;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setImageNamePart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_imageNamePart, 0);
}

@end
