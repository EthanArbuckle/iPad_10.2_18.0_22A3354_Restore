@implementation ABVCardValueSetter

- (BOOL)propertyIsValidForPerson:(unsigned int)a3
{
  return 1;
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  return 0;
}

- (void)valueForProperty:(unsigned int)a3
{
  return 0;
}

- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7
{
  return 0;
}

- (BOOL)setImageData:(id)a3
{
  return -[ABVCardValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:](self, "setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:", a3, 0, 0, 0, 0);
}

- (id)imageData
{
  return 0;
}

- (id)fullName
{
  return 0;
}

@end
