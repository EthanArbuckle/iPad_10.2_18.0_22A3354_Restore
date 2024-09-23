@implementation _SFSearchRequest

- (int64_t)searchTypes
{
  return self->_searchTypes;
}

- (void)setSearchTypes:(int64_t)a3
{
  self->_searchTypes = a3;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (void)setQueryParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
}

@end
