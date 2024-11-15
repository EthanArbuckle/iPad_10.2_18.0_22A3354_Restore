@implementation CKUIImagePickerController

- (BOOL)shouldAutorotate
{
  return 0;
}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 1;
  return 1;
}

- (BOOL)preserveModalPresentationStyle
{
  BOOL result;

  result = -[CKUIImagePickerController sourceType](self, "sourceType") == 1;
  self->_preserveModalPresentationStyle = result;
  return result;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

@end
