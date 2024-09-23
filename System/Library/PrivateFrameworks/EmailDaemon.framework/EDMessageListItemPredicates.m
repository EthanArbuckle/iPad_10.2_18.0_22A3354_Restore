@implementation EDMessageListItemPredicates

+ (id)expandedPredicateForReadLaterIsActivePredicate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  objc_msgSend(a3, "rightExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDMessageListItemPredicates.m"), 136, CFSTR("Comparing readLaterIsActive to something other than a BOOLean (%@)"), v6);

  }
  v7 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DE28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionForConstantValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v11, 0, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForMessagesWithPersistentIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("rowid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessagesFromVIPs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v18;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = v4;
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v6, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("senderAddress.emailAddressValue.displayName"), v8, v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        objc_msgSend(v6, "emailAddresses");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("senderAddress.emailAddressValue.simpleAddress"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v4);
  }

  if (objc_msgSend(obj, "count"))
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForMessagesWithRecipientExpression:(id)a3 operatorType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("recipients"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v7, v5, 0, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForMailboxTypePredicate:(id)a3 mailboxPersistence:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  SEL v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DFB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v11, 0, objc_msgSend(v7, "predicateOperatorType"), objc_msgSend(v7, "options"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allMailboxes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDMessageListItemPredicates.m"), 91, CFSTR("Expected predicate should be a NSCompoundPredicate"));

    }
    v16 = v15;
    objc_msgSend(v16, "subpredicates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83__EDMessageListItemPredicates_predicateForMailboxTypePredicate_mailboxPersistence___block_invoke;
    v22[3] = &unk_1E949DC70;
    v24 = a2;
    v25 = a1;
    v23 = v8;
    objc_msgSend(v17, "ef_map:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v16, "compoundPredicateType"), v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

id __83__EDMessageListItemPredicates_predicateForMailboxTypePredicate_mailboxPersistence___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("EDMessageListItemPredicates.m"), 94, CFSTR("Expected subpredicate should be a NSComparisonPredicate"));

  }
  objc_msgSend(*(id *)(a1 + 48), "_predicateForAnyMailboxWithPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "predicateForMailboxURLPredicate:mailboxPersistence:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForMailboxURLPredicate:(id)a3 mailboxPersistence:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constantValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v6, "mailboxURLIsGmailLabel:", v10) & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("labels"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightExpression");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, v13, 0, 10, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v5;
  }

  return v14;
}

+ (id)predicateForMessagesWithObjectIDsPredicate:(id)a3 objectIDConverter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(a3, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessageListItemPredicates _objectIDsFromRightExpression:](EDMessageListItemPredicates, "_objectIDsFromRightExpression:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "databaseIDsDictionaryForMessageObjectIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("rowid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v11, v12, 0, 10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)expandedPredicateForFollowUpIsActivePredicate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constantValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDMessageListItemPredicates.m"), 148, CFSTR("Comparing followUpIsActive to something other than a BOOLean (%@)"), v7);

  }
  v9 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DD98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue"))
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v9, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v11, 0, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DD88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue"))
    v17 = 2;
  else
    v17 = 1;
  objc_msgSend(v14, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v15, v16, 0, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3528];
  if (v7)
  {
    v26[0] = v13;
    v26[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25[0] = v13;
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "orPredicateWithSubpredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

  return v22;
}

+ (id)expandedPredicateForCategoryTypePredicate:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  objc_msgSend(v51, "rightExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constantValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = objc_msgSend(v51, "predicateOperatorType");
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDMessageListItemPredicates.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(operatorType == NSEqualToPredicateOperatorType) || (operatorType == NSNotEqualToPredicateOperatorType)"));

  }
  v9 = v8 == 4 && !v7 || v8 == 5 && v7 != 0;
  v11 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.userCategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, v13, 0, v8, 0);
  v49 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.userCategory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v15, v16, 0, 4, 0);
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.senderCategory"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v19, v20, 0, v8, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v9;

  v21 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.senderCategory"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v22, v23, 0, 4, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.modelCategory"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightExpression");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v26, v27, 0, v8, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v14)
  {
    v29 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.modelCategory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v49;
    objc_msgSend(v29, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v30, v31, 0, 4, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3528];
    v55[0] = v28;
    v55[1] = v33;
    v35 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orPredicateWithSubpredicates:", v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v37;
  }
  else
  {
    v35 = (void *)v17;
    v32 = (void *)v49;
  }
  v38 = (void *)MEMORY[0x1E0CB3528];
  v54[0] = v35;
  v54[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "andPredicateWithSubpredicates:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0CB3528];
  v53[0] = v35;
  v53[1] = v24;
  v53[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "andPredicateWithSubpredicates:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0CB3528];
  v52[0] = v32;
  v52[1] = v40;
  v52[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "orPredicateWithSubpredicates:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

+ (id)predicateForNilModelVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.modelVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForCategorizationVersionLessThanVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.modelVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForUnauthenticatedMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("validation.state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E94E47D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_objectIDsFromRightExpression:(id)a3
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (objc_msgSend(v5, "expressionType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDMessageListItemPredicates.m"), 245, CFSTR("objectID should be a constant value right expression"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "constantValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_map:", &__block_literal_global_39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v5, "constantValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0D1E258];
    objc_msgSend(v5, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectIDFromSerializedRepresentation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

id __61__EDMessageListItemPredicates__objectIDsFromRightExpression___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0D1E258], "objectIDFromSerializedRepresentation:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForAnyMailboxWithPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(v3, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, objc_msgSend(v3, "predicateOperatorType"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessageIDHeaderHashPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("messageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(v3, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v6, 0, objc_msgSend(v3, "predicateOperatorType"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessagesWithListIDHash:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("listIDHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "int64Value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
