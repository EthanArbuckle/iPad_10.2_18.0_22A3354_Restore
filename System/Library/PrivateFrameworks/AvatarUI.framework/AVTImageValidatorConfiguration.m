@implementation AVTImageValidatorConfiguration

- (BOOL)shouldCheckForTransparentImages
{
  return self->_shouldCheckForTransparentImages;
}

- (void)setShouldCheckForTransparentImages:(BOOL)a3
{
  self->_shouldCheckForTransparentImages = a3;
}

- (BOOL)shouldCheckForDuplicateImages
{
  return self->_shouldCheckForDuplicateImages;
}

- (void)setShouldCheckForDuplicateImages:(BOOL)a3
{
  self->_shouldCheckForDuplicateImages = a3;
}

@end
