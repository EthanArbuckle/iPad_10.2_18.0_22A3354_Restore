@implementation MUISearchSuggestionResult

- (MUISearchSuggestionResult)initWithSearchableItem:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  MUISearchSuggestionResult *v8;
  uint64_t v9;
  CSSearchableItem *searchableItem;
  uint64_t v11;
  EMMessageObjectID *objectID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUISearchSuggestionResult;
  v8 = -[MUISearchSuggestionResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    searchableItem = v8->_searchableItem;
    v8->_searchableItem = (CSSearchableItem *)v9;

    v11 = objc_msgSend(v7, "copy");
    objectID = v8->_objectID;
    v8->_objectID = (EMMessageObjectID *)v11;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> searchableItem=%@ objectID=%@"), objc_opt_class(), self, self->_searchableItem, self->_objectID);
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (EMMessageObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end
