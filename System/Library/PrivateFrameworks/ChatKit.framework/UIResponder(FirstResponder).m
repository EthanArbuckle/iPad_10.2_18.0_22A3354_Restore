@implementation UIResponder(FirstResponder)

+ (id)currentFirstResponder
{
  void *v0;

  objc_storeWeak(&currentFirstResponder, 0);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sendAction:to:from:forEvent:", sel_findFirstResponder_, 0, 0, 0);

  return objc_loadWeakRetained(&currentFirstResponder);
}

- (id)findFirstResponder:()FirstResponder
{
  return objc_storeWeak(&currentFirstResponder, obj);
}

@end
