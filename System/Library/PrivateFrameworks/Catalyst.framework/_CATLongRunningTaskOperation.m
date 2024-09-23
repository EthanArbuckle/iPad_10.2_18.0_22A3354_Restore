@implementation _CATLongRunningTaskOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CATLongRunningTaskOperation;
  -[_CATLongRunningTaskOperation cancel](&v4, sel_cancel);
  CATErrorWithCodeAndUserInfo(404, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperation endOperationWithError:](self, "endOperationWithError:", v3);

}

@end
