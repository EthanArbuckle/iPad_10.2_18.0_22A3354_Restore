@implementation CKCNContactPickerViewController

- (BOOL)shouldAutorotate
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSuppressRotationInNewCompose") ^ 1;

  return v3;
}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 0;
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 0;
  return 0;
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
