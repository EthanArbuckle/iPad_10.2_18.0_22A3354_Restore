@implementation CNURLSessionFactory

+ (CNURLSessionFactory)defaultFactory
{
  if (defaultFactory_cn_once_token_0 != -1)
    dispatch_once(&defaultFactory_cn_once_token_0, &__block_literal_global_84);
  return (CNURLSessionFactory *)(id)defaultFactory_cn_once_object_0;
}

void __37__CNURLSessionFactory_defaultFactory__block_invoke()
{
  CNURLSessionFactory *v0;
  void *v1;

  v0 = objc_alloc_init(CNURLSessionFactory);
  v1 = (void *)defaultFactory_cn_once_object_0;
  defaultFactory_cn_once_object_0 = (uint64_t)v0;

}

- (id)defaultSessionConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
}

- (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", a3, a4, a5);
}

@end
