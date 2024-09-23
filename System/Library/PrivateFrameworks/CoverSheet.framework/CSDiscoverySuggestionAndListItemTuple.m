@implementation CSDiscoverySuggestionAndListItemTuple

- (ATXUserEducationSuggestion)discoverySuggestion
{
  return self->_discoverySuggestion;
}

- (void)setDiscoverySuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_discoverySuggestion, a3);
}

- (CSListItem)listItem
{
  return self->_listItem;
}

- (void)setListItem:(id)a3
{
  objc_storeStrong((id *)&self->_listItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_storeStrong((id *)&self->_discoverySuggestion, 0);
}

@end
