@implementation HDDismissedPregnancyLactationInteractionInsertOperation

- (HDDismissedPregnancyLactationInteractionInsertOperation)initWithDismissedPregnancyLactationInteractions:(id)a3
{
  id v5;
  HDDismissedPregnancyLactationInteractionInsertOperation *v6;
  HDDismissedPregnancyLactationInteractionInsertOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDismissedPregnancyLactationInteractionInsertOperation;
  v6 = -[HDDismissedPregnancyLactationInteractionInsertOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dismissedInteractions, a3);

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
  if (-[NSArray count](self->_dismissedInteractions, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_dismissedInteractions;
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
          if (!+[HDDismissedPregnancyLactationInteractionEntity _insertDismissedPregnancyLactationInteraction:transaction:error:]((uint64_t)HDDismissedPregnancyLactationInteractionEntity, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i), v7, (uint64_t)a5))
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
  objc_msgSend(a3, "encodeObject:forKey:", self->_dismissedInteractions, CFSTR("dismissed_pregnancy_lactation_interactions"));
}

- (HDDismissedPregnancyLactationInteractionInsertOperation)initWithCoder:(id)a3
{
  id v4;
  HDDismissedPregnancyLactationInteractionInsertOperation *v5;
  uint64_t v6;
  NSArray *dismissedInteractions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDismissedPregnancyLactationInteractionInsertOperation;
  v5 = -[HDDismissedPregnancyLactationInteractionInsertOperation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("dismissed_pregnancy_lactation_interactions"));
    v6 = objc_claimAutoreleasedReturnValue();
    dismissedInteractions = v5->_dismissedInteractions;
    v5->_dismissedInteractions = (NSArray *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedInteractions, 0);
}

@end
