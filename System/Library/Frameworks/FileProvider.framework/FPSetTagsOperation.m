@implementation FPSetTagsOperation

- (FPSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4
{
  id v7;
  id v8;
  FPSetTagsOperation *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPSetTagsOperation;
  v9 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v14, sel_initWithItemsOfDifferentProviders_action_, v7, 0);
  if (v9)
  {
    v10 = objc_msgSend(v7, "count");
    if (v10 != objc_msgSend(v8, "count"))
    {
      v11 = objc_msgSend(v7, "count");
      if (v11 != objc_msgSend(v8, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("FPActionOperation.m"), 1163, CFSTR("Number of items (%lu) doesn't match number of tag lists (%lu)"), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"));

      }
    }
    objc_storeStrong((id *)&v9->_tagsLists, a4);
    -[FPActionOperation setSetupRemoteOperationService:](v9, "setSetupRemoteOperationService:", 1);
  }

  return v9;
}

- (id)replicateForItems:(id)a3
{
  id v4;
  FPSetTagsOperation *v5;
  void *v6;
  void *v7;
  FPSetTagsOperation *v8;

  v4 = a3;
  v5 = [FPSetTagsOperation alloc];
  -[FPTransformOperation items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_pickItemsFromArray:correspondingToIndexesOfItemsInArray:", self->_tagsLists, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPSetTagsOperation initWithItems:tagsLists:](v5, "initWithItems:tagsLists:", v4, v7);

  return v8;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *tagsLists;
  id v6;
  void *v7;

  tagsLists = self->_tagsLists;
  v6 = a3;
  -[NSArray objectAtIndex:](tagsLists, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTags:", v7);

  return 16;
}

- (id)fp_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPTransformOperation items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(self->_tagsLists);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("tag items %@ with tags %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagsLists, 0);
}

@end
