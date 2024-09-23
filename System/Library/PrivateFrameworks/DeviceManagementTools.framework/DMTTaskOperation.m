@implementation DMTTaskOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[DMTTaskOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", &sel_run, 0, 0);
}

- (void)run
{
  id v3;

  if (-[DMTTaskOperation isExecuting](self, "isExecuting"))
  {
    if (-[DMTTaskOperation isCanceled](self, "isCanceled"))
    {
      CATErrorWithCodeAndUserInfo();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[DMTTaskOperation endOperationWithError:](self, "endOperationWithError:");
    }
    else
    {
      -[CATTaskOperation request](self, "request");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[DMTTaskOperation runWithRequest:](self, "runWithRequest:");
    }

  }
}

@end
