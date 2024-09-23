@implementation NUANFLinkedContentProviderFactory

- (id)createLinkedContentProviderForArticle:(id)a3
{
  return -[NUANFLinkedContentProvider initWithContentContext:]([NUANFLinkedContentProvider alloc], "initWithContentContext:", self->_contentContext);
}

- (NUANFLinkedContentProviderFactory)initWithContentContext:(id)a3
{
  id v5;
  NUANFLinkedContentProviderFactory *v6;
  NUANFLinkedContentProviderFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFLinkedContentProviderFactory;
  v6 = -[NUANFLinkedContentProviderFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentContext, a3);

  return v7;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
