@implementation VSIdentityProviderStorefrontMetadata

- (NSString)storefrontTwoCharCode
{
  return self->_storefrontTwoCharCode;
}

- (void)setStorefrontTwoCharCode:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontTwoCharCode, a3);
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (void)setIsFeatured:(BOOL)a3
{
  self->_isFeatured = a3;
}

- (NSNumber)sortOrdinal
{
  return self->_sortOrdinal;
}

- (void)setSortOrdinal:(id)a3
{
  objc_storeStrong((id *)&self->_sortOrdinal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortOrdinal, 0);
  objc_storeStrong((id *)&self->_storefrontTwoCharCode, 0);
}

@end
