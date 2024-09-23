@implementation ICSortableSearchableItem

- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 highlightInfo:(id)a4 rankingScore:(double)a5 attachmentUniqueIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICSortableSearchableItem *v14;
  ICSortableSearchableItem *v15;
  void *v16;
  uint64_t v17;
  NSDate *modificationDate;
  void *v19;
  uint64_t v20;
  NSDate *creationDate;
  void *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ICSortableSearchableItem;
  v14 = -[ICSortableSearchableItem init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchableItem, a3);
    v15->_rankingScore = a5;
    objc_storeStrong((id *)&v15->_attachmentUniqueIdentifiers, a6);
    objc_storeStrong((id *)&v15->_highlightInfo, a4);
    v15->_isPrefixMatch = objc_msgSend(MEMORY[0x1E0C99D80], "highlightInfoContainsPrefixMatch:", v12);
    v15->_relevanceBitField = +[ICRankingQueriesDefinition relevanceBitFieldForSearchableItem:](ICRankingQueriesDefinition, "relevanceBitFieldForSearchableItem:", v11);
    v15->_modificationDateBucket = +[ICRankingQueriesDefinition modificationDateBucketForSearchableItem:](ICRankingQueriesDefinition, "modificationDateBucketForSearchableItem:", v11);
    objc_msgSend(v11, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentModificationDate");
    v17 = objc_claimAutoreleasedReturnValue();
    modificationDate = v15->_modificationDate;
    v15->_modificationDate = (NSDate *)v17;

    objc_msgSend(v11, "attributeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentCreationDate");
    v20 = objc_claimAutoreleasedReturnValue();
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v20;

    objc_msgSend(v11, "attributeSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_searchResultType = objc_msgSend(v22, "ic_searchResultType");

  }
  return v15;
}

- (ICSortableSearchableItem)initWithSearchableItem:(id)a3 searchString:(id)a4 rankingQueriesDefinition:(id)a5 rankingScore:(double)a6 attachmentUniqueIdentifiers:(id)a7 language:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ICSortableSearchableItem *v19;
  ICSortableSearchableItem *v20;
  void *v21;
  uint64_t v22;
  NSDate *modificationDate;
  void *v24;
  uint64_t v25;
  NSDate *creationDate;
  void *v27;
  id v29;
  objc_super v30;

  v15 = a3;
  v29 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ICSortableSearchableItem;
  v19 = -[ICSortableSearchableItem init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_searchableItem, a3);
    objc_storeStrong((id *)&v20->_searchString, a4);
    objc_storeStrong((id *)&v20->_rankingQueriesDefinition, a5);
    v20->_rankingScore = a6;
    objc_storeStrong((id *)&v20->_attachmentUniqueIdentifiers, a7);
    objc_storeStrong((id *)&v20->_language, a8);
    v20->_needsLazyInitialization = 1;
    v20->_relevanceBitField = +[ICRankingQueriesDefinition relevanceBitFieldForSearchableItem:](ICRankingQueriesDefinition, "relevanceBitFieldForSearchableItem:", v15);
    v20->_modificationDateBucket = +[ICRankingQueriesDefinition modificationDateBucketForSearchableItem:](ICRankingQueriesDefinition, "modificationDateBucketForSearchableItem:", v15);
    objc_msgSend(v15, "attributeSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentModificationDate");
    v22 = objc_claimAutoreleasedReturnValue();
    modificationDate = v20->_modificationDate;
    v20->_modificationDate = (NSDate *)v22;

    objc_msgSend(v15, "attributeSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentCreationDate");
    v25 = objc_claimAutoreleasedReturnValue();
    creationDate = v20->_creationDate;
    v20->_creationDate = (NSDate *)v25;

    objc_msgSend(v15, "attributeSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_searchResultType = objc_msgSend(v27, "ic_searchResultType");

  }
  return v20;
}

- (void)lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *highlightInfo;
  NSDictionary *v11;

  if (self->_needsLazyInitialization)
  {
    -[ICSortableSearchableItem rankingQueriesDefinition](self, "rankingQueriesDefinition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSortableSearchableItem searchableItem](self, "searchableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highlightInfoForSearchableItem:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (!v5 || !-[NSDictionary count](v5, "count"))
    {
      v6 = (void *)MEMORY[0x1E0C99D80];
      -[ICSortableSearchableItem searchString](self, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSortableSearchableItem language](self, "language");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "highlightInfoForSearchStringWithPrefixMatchInAllFields:language:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (NSDictionary *)v9;
    }
    highlightInfo = self->_highlightInfo;
    self->_highlightInfo = v5;
    v11 = v5;

    LOBYTE(highlightInfo) = objc_msgSend(MEMORY[0x1E0C99D80], "highlightInfoContainsPrefixMatch:", v11);
    self->_isPrefixMatch = (char)highlightInfo;
    self->_needsLazyInitialization = 0;
  }
}

- (NSDictionary)highlightInfo
{
  -[ICSortableSearchableItem lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary](self, "lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary");
  return self->_highlightInfo;
}

- (BOOL)isPrefixMatch
{
  -[ICSortableSearchableItem lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary](self, "lazilyInitializeHighlightInfoAndIsPrefixMatchIfNecessary");
  return self->_isPrefixMatch;
}

- (unint64_t)hash
{
  unint64_t result;
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  result = self->_hash;
  if (!result)
  {
    -[ICSortableSearchableItem attachmentUniqueIdentifiers](self, "attachmentUniqueIdentifiers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v7 = ICHashWithObject(*(void **)(*((_QWORD *)&v36 + 1) + 8 * i)) - v7 + 32 * v7;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v10);
    }

    -[ICSortableSearchableItem searchableItem](self, "searchableItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v35, "hash");
    -[ICSortableSearchableItem highlightInfo](self, "highlightInfo");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hash");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = ICHashWithObject(v22);
          v16 = ICHashWithObject(v23) + v16 - v24 + 32 * v24;

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v19);
    }

    -[ICSortableSearchableItem relevanceBitField](self, "relevanceBitField");
    -[ICSortableSearchableItem isPrefixMatch](self, "isPrefixMatch");
    -[ICSortableSearchableItem modificationDateBucket](self, "modificationDateBucket");
    -[ICSortableSearchableItem modificationDate](self, "modificationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hash");
    -[ICSortableSearchableItem creationDate](self, "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hash");
    -[ICSortableSearchableItem searchResultType](self, "searchResultType");
    self->_hash = ICHashWithHashKeys(v7, v27, v28, v29, v30, v31, v32, v33, v34);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  unint64_t v32;
  char v33;
  BOOL v34;
  unint64_t v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)ICSortableSearchableItem;
  v4 = a3;
  v5 = -[ICSortableSearchableItem isEqual:](&v37, sel_isEqual_, v4);
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_37;
  -[ICSortableSearchableItem searchableItem](self, "searchableItem", v37.receiver, v37.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchableItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
    goto LABEL_37;
  -[ICSortableSearchableItem highlightInfo](self, "highlightInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highlightInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

  if (!v13)
    goto LABEL_37;
  -[ICSortableSearchableItem attachmentUniqueIdentifiers](self, "attachmentUniqueIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentUniqueIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToArray:", v15))
  {

  }
  else
  {
    -[ICSortableSearchableItem attachmentUniqueIdentifiers](self, "attachmentUniqueIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentUniqueIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17)
      goto LABEL_37;
  }
  v18 = -[ICSortableSearchableItem relevanceBitField](self, "relevanceBitField");
  if (v18 != objc_msgSend(v6, "relevanceBitField"))
    goto LABEL_37;
  v19 = -[ICSortableSearchableItem isPrefixMatch](self, "isPrefixMatch");
  if (v19 != objc_msgSend(v6, "isPrefixMatch"))
    goto LABEL_37;
  v20 = -[ICSortableSearchableItem modificationDateBucket](self, "modificationDateBucket");
  if (v20 != objc_msgSend(v6, "modificationDateBucket"))
    goto LABEL_37;
  -[ICSortableSearchableItem modificationDate](self, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modificationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v21)
    v24 = 0;
  else
    v24 = v21;
  v25 = v24;
  if (v23 == v22)
    v26 = 0;
  else
    v26 = v22;
  v27 = v26;
  if (v25 | v27)
  {
    v28 = (void *)v27;
    if (!v25 || !v27)
    {
LABEL_36:

      goto LABEL_37;
    }
    v29 = objc_msgSend((id)v25, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_37;
  }
  else
  {

  }
  -[ICSortableSearchableItem creationDate](self, "creationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == v21)
    v30 = 0;
  else
    v30 = v21;
  v25 = v30;
  if (v23 == v22)
    v31 = 0;
  else
    v31 = v22;
  v32 = v31;
  if (!(v25 | v32))
  {

LABEL_40:
    v36 = -[ICSortableSearchableItem searchResultType](self, "searchResultType");
    v34 = v36 == objc_msgSend(v6, "searchResultType");
    goto LABEL_38;
  }
  v28 = (void *)v32;
  if (!v25 || !v32)
    goto LABEL_36;
  v33 = objc_msgSend((id)v25, "isEqual:", v32);

  if ((v33 & 1) != 0)
    goto LABEL_40;
LABEL_37:
  v34 = 0;
LABEL_38:

  return v34;
}

+ (id)sortDescriptorsForRankingStrategy:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3 == 2)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("searchResultType"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isPrefixMatch"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDateBucket"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("relevanceBitField"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithObjects:", v4, v5, v6, v7, v8, v12, v13, 0);

  }
  else
  {
    if (a3 == 1)
    {
      v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("searchResultType"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isPrefixMatch"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("relevanceBitField"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3928];
      v10 = CFSTR("creationDate");
    }
    else
    {
      if (a3)
      {
        v14 = 0;
        return v14;
      }
      v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("searchResultType"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isPrefixMatch"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3928];
      v10 = CFSTR("relevanceBitField");
    }
    objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v12, 0);
  }

  return v14;
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (NSArray)attachmentUniqueIdentifiers
{
  return self->_attachmentUniqueIdentifiers;
}

- (unint64_t)relevanceBitField
{
  return self->_relevanceBitField;
}

- (unint64_t)modificationDateBucket
{
  return self->_modificationDateBucket;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unint64_t)searchResultType
{
  return self->_searchResultType;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (ICRankingQueriesDefinition)rankingQueriesDefinition
{
  return self->_rankingQueriesDefinition;
}

- (void)setRankingQueriesDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)needsLazyInitialization
{
  return self->_needsLazyInitialization;
}

- (void)setNeedsLazyInitialization:(BOOL)a3
{
  self->_needsLazyInitialization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_attachmentUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_highlightInfo, 0);
}

@end
