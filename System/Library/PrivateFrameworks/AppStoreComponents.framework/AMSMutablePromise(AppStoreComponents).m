@implementation AMSMutablePromise(AppStoreComponents)

- (id)asc_copy
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
  objc_msgSend(v2, "completionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addFinishBlock:", v3);

  return v2;
}

@end
