@implementation __HMMainThreadDelegateCaller

- (void)invokeBlock:(id)a3
{
  void (**v3)(void);
  void (**block)(void);

  v3 = (void (**)(void))a3;
  if (v3)
  {
    block = v3;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      block[2]();
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);
    v3 = block;
  }

}

@end
