@implementation VSErrorRecoveryAttempterDelegate

+ (id)sharedDelegate
{
  if (sharedDelegate___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedDelegate___vs_lazy_init_predicate, &__block_literal_global_41);
  return (id)sharedDelegate___vs_lazy_init_variable;
}

void __50__VSErrorRecoveryAttempterDelegate_sharedDelegate__block_invoke()
{
  VSErrorRecoveryAttempterDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(VSErrorRecoveryAttempterDelegate);
  v1 = (void *)sharedDelegate___vs_lazy_init_variable;
  sharedDelegate___vs_lazy_init_variable = (uint64_t)v0;

}

- (void)didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  void *v4;

  if (a4)
  {
    v4 = a4;
    (*((void (**)(void *, BOOL))a4 + 2))(a4, a3);
    a4 = v4;
  }

}

@end
