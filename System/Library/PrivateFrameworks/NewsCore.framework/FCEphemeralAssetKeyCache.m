@implementation FCEphemeralAssetKeyCache

- (FCEphemeralAssetKeyCache)init
{
  FCEphemeralAssetKeyCache *v2;
  FCThreadSafeMutableDictionary *v3;
  FCThreadSafeMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCEphemeralAssetKeyCache;
  v2 = -[FCEphemeralAssetKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (id)wrappingKeyForWrappingKeyID:(id)a3
{
  if (self)
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  return (id)-[FCEphemeralAssetKeyCache objectForKey:](self, "objectForKey:", a3);
}

- (id)interestTokenForWrappingKeyIDs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", &__block_literal_global_107);
}

- (void)setWrappingKey:(id)a3 forWrappingKeyID:(id)a4
{
  if (self)
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  -[FCEphemeralAssetKeyCache setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (void)removeAllWrappingKeys
{
  if (self)
    self = (FCEphemeralAssetKeyCache *)self->_dictionary;
  -[FCEphemeralAssetKeyCache removeAllObjects](self, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
