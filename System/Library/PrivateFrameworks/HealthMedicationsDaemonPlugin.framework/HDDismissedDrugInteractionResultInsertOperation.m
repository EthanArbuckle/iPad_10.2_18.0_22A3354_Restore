@implementation HDDismissedDrugInteractionResultInsertOperation

- (HDDismissedDrugInteractionResultInsertOperation)initWithDismissedDrugInteractionResults:(id)a3
{
  id v5;
  HDDismissedDrugInteractionResultInsertOperation *v6;
  HDDismissedDrugInteractionResultInsertOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDismissedDrugInteractionResultInsertOperation;
  v6 = -[HDDismissedDrugInteractionResultInsertOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dismissedResults, a3);

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[NSArray count](self->_dismissedResults, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_dismissedResults;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (!+[HDDismissedDrugInteractionResultEntity _insertDismissedDrugInteractionResult:transaction:error:]((uint64_t)HDDismissedDrugInteractionResultEntity, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i), v7, (uint64_t)a5))
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dismissedResults, CFSTR("dismissed_results"));
}

- (HDDismissedDrugInteractionResultInsertOperation)initWithCoder:(id)a3
{
  id v4;
  HDDismissedDrugInteractionResultInsertOperation *v5;
  void *v6;
  uint64_t v7;
  NSArray *dismissedResults;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDismissedDrugInteractionResultInsertOperation;
  v5 = -[HDDismissedDrugInteractionResultInsertOperation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("dismissed_results"));
    v7 = objc_claimAutoreleasedReturnValue();
    dismissedResults = v5->_dismissedResults;
    v5->_dismissedResults = (NSArray *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedResults, 0);
}

@end
