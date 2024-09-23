@implementation ICSearchableItemResult

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItem, a3);
}

- (NSArray)additionalSearchableItems
{
  return self->_additionalSearchableItems;
}

- (void)setAdditionalSearchableItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSearchableItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSearchableItems, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end
