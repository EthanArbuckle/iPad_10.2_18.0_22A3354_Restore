@implementation SelectedCheckboxFromIcon__generated__Input

- (SelectedCheckboxFromIcon__generated__Input)initWithImage:(__CVBuffer *)a3
{
  if (self)
    self->_image = a3;
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6289650);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("image")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_image);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

@end
