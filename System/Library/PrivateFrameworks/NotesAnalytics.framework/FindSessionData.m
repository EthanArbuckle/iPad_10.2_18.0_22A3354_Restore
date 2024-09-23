@implementation FindSessionData

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
