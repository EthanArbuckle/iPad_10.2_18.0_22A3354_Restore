@implementation _HMDNEHelperClientCacheEntry

- (_HMDNEHelperClientCacheEntry)initWithSigningId:(id)a3 identifiers:(id)a4
{
  id v7;
  id v8;
  _HMDNEHelperClientCacheEntry *v9;
  _HMDNEHelperClientCacheEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMDNEHelperClientCacheEntry;
  v9 = -[_HMDNEHelperClientCacheEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingId, a3);
    objc_storeStrong((id *)&v10->_identifiers, a4);
  }

  return v10;
}

- (NSString)signingId
{
  return self->_signingId;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_signingId, 0);
}

@end
