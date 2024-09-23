@implementation LPActionDisablingCALayerDelegate

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  return (id)shared_delegate;
}

void __42__LPActionDisablingCALayerDelegate_shared__block_invoke()
{
  LPActionDisablingCALayerDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(LPActionDisablingCALayerDelegate);
  v1 = (void *)shared_delegate;
  shared_delegate = (uint64_t)v0;

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
