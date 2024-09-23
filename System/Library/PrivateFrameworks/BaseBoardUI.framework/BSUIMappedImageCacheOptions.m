@implementation BSUIMappedImageCacheOptions

- (BSPathProviding)containerPathProvider
{
  return self->_containerPathProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPathProvider, 0);
}

+ (id)optionsWithContainerPathProvider:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "optionsWithContainerPathProvider:", self->_containerPathProvider);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
