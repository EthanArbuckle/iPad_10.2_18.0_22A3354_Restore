@implementation SUUITrendingSearchPage

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)searches
{
  return self->_searches;
}

- (void)setSearches:(id)a3
{
  objc_storeStrong((id *)&self->_searches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searches, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
