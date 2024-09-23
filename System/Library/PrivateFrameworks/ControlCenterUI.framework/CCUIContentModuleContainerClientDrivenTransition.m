@implementation CCUIContentModuleContainerClientDrivenTransition

- (id)customAnimator
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[CCUIContentModuleContainerTransition viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIContentModuleContainerViewController.m"), 1377, CFSTR("How did we get here if the client doesn't implement the required method?"));

  }
  objc_msgSend(v5, "customAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
