@implementation NUManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  id v4;

  objc_msgSend(a3, "publicContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254E6DAD0, &__block_literal_global_2);

}

NUArticleContentSizeManager *__36__NUManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NUArticleContentSizeManager *v4;
  void *v5;
  NUArticleContentSizeManager *v6;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [NUArticleContentSizeManager alloc];
  objc_msgSend(v3, "tagSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUArticleContentSizeManager initWithTagSettings:](v4, "initWithTagSettings:", v5);

  return v6;
}

@end
