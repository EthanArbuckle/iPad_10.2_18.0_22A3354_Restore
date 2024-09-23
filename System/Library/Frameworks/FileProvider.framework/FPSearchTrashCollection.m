@implementation FPSearchTrashCollection

- (FPSearchTrashCollection)init
{
  void *v3;
  FPSearchCollection *v4;
  FPSearchCollection *searchCollection;
  void *v6;
  FPTrashUnionCollection *v7;
  FPTrashUnionCollection *trashCollection;
  objc_super v10;

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (FPSearchCollection *)objc_msgSend(v3, "newSearchCollection");
  searchCollection = self->_searchCollection;
  self->_searchCollection = v4;

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (FPTrashUnionCollection *)objc_msgSend(v6, "newTrashCollection");
  trashCollection = self->_trashCollection;
  self->_trashCollection = v7;

  v10.receiver = self;
  v10.super_class = (Class)FPSearchTrashCollection;
  return -[FPUnionCollection initWithCollections:](&v10, sel_initWithCollections_, MEMORY[0x1E0C9AA60]);
}

- (NSFileProviderSearchQuery)searchQuery
{
  return -[FPSearchCollection searchQuery](self->_searchCollection, "searchQuery");
}

- (void)setSearchQuery:(id)a3
{
  id v4;
  unint64_t v5;
  id *p_searchCollection;
  void *v7;
  _BOOL4 v8;
  unint64_t selectedMembership;
  void *v10;
  NSPredicate *v11;
  NSPredicate *searchQueryPredicate;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "trashedItemsMembership");
  p_searchCollection = (id *)&self->_searchCollection;
  -[FPSearchCollection searchQuery](self->_searchCollection, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = self->_selectedMembership != v5;
  else
    v8 = 1;

  objc_msgSend(*p_searchCollection, "setSearchQuery:", v4);
  self->_selectedMembership = v5;
  v13 = (id)objc_opt_new();
  selectedMembership = self->_selectedMembership;
  if (selectedMembership == 2)
  {
LABEL_8:
    p_searchCollection = (id *)&self->_trashCollection;
    goto LABEL_9;
  }
  if (selectedMembership != 1)
  {
    if (selectedMembership)
      goto LABEL_10;
    objc_msgSend(v13, "addObject:", *p_searchCollection);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v13, "addObject:", *p_searchCollection);
LABEL_10:
  if (v8)
    -[FPUnionCollection setCollections:](self, "setCollections:", v13);
  -[FPSearchTrashCollection searchQuery](self, "searchQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicate");
  v11 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  searchQueryPredicate = self->_searchQueryPredicate;
  self->_searchQueryPredicate = v11;

}

- (id)scopedSearchQuery
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSearchTrashCollection.m"), 93, CFSTR("UNREACHABLE: This should never be requested."));

  return 0;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  NSPredicate *searchQueryPredicate;

  searchQueryPredicate = self->_searchQueryPredicate;
  return !searchQueryPredicate || -[NSPredicate evaluateWithObject:](searchQueryPredicate, "evaluateWithObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryPredicate, 0);
  objc_storeStrong((id *)&self->_trashCollection, 0);
  objc_storeStrong((id *)&self->_searchCollection, 0);
}

@end
