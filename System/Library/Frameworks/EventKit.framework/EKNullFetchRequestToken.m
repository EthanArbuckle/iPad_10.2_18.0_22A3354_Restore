@implementation EKNullFetchRequestToken

+ (id)sharedToken
{
  if (sharedToken_onceToken != -1)
    dispatch_once(&sharedToken_onceToken, &__block_literal_global_26);
  return (id)sharedToken_sharedToken;
}

void __38__EKNullFetchRequestToken_sharedToken__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedToken_sharedToken;
  sharedToken_sharedToken = v0;

}

@end
