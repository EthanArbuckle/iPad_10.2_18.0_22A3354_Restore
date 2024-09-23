@implementation EspressoMetalSingleton

- (int)is_memory_tight
{
  return self->_is_memory_tight;
}

- (void)setIs_memory_tight:(int)a3
{
  self->_is_memory_tight = a3;
}

+ (id)shared
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_7850);
  return (id)singleton;
}

void __32__EspressoMetalSingleton_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)singleton;
  singleton = v0;

}

@end
