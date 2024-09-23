@implementation EKUITestCase

- (id)controller
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKUITestCase.m"), 18, CFSTR("Override in Subclass"));

  return 0;
}

@end
