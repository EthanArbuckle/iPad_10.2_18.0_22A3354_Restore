@implementation SUUILoadItemsResponse

- (NSDictionary)loadedItems
{
  return self->_loadedItems;
}

- (void)setLoadedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)invalidItemIdentifiers
{
  return self->_invalidItemIdentifiers;
}

- (void)setInvalidItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedItems, 0);
}

@end
