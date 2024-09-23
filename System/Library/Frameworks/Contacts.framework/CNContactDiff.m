@implementation CNContactDiff

- (BOOL)applyToABPerson:(void *)a3 isUnified:(BOOL)a4 logger:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  CNiOSABDependentPropertiesUpdateContext *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v7 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = objc_alloc_init(CNiOSABDependentPropertiesUpdateContext);
  -[CNiOSABDependentPropertiesUpdateContext setIsUnifiedContact:](v11, "setIsUnifiedContact:", v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CNContactDiff updates](self, "updates", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "applyToABPerson:withPropertiesContext:logger:error:", a3, v11, v10, a6))
        {

          v17 = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }

  v17 = -[CNiOSABDependentPropertiesUpdateContext flushPendingImageChangesToPerson:logger:error:](v11, "flushPendingImageChangesToPerson:logger:error:", a3, v10, a6);
LABEL_11:

  return v17;
}

+ (id)diffContact:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CNContactDiffOptions *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CNContactDiffOptions);
  objc_msgSend(a1, "diffContact:to:options:error:", v9, v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  CNContactDiff *v11;
  id v13;

  v13 = 0;
  +[CNCalculatesContactDiff diffContact:to:options:error:](CNCalculatesContactDiff, "diffContact:to:options:error:", a3, a4, a5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10)
  {
    v11 = -[CNContactDiff initWithUpdates:]([CNContactDiff alloc], "initWithUpdates:", v7);
  }
  else
  {
    v11 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v8);
  }

  return v11;
}

- (CNContactDiff)initWithUpdates:(id)a3
{
  id v4;
  CNContactDiff *v5;
  uint64_t v6;
  NSArray *updates;
  CNContactDiff *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactDiff;
  v5 = -[CNContactDiff init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)contactByApplyingUpdatesToContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D13AC0], "multiDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactDiff applyToMutableContact:withIdentifierMap:](self, "applyToMutableContact:withIdentifierMap:", v4, v5);

  objc_msgSend(v4, "freeze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_updates;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "applyToMutableContact:withIdentifierMap:", v6, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)applyToMutableContacts:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[CNContactDiff applyToMutableContact:withIdentifierMap:](self, "applyToMutableContact:withIdentifierMap:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactUpdates"), self->_updates);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)updates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
