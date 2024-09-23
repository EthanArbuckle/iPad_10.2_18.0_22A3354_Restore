@implementation EDMessageQueryTransformer

- (id)transformComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForNotifyMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("conversationNotificationLevel.isNotify"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, 0, 4, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMuteMessages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqual:", v11);

    v13 = v4;
    if (!v12)
      goto LABEL_6;
    v14 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("conversationNotificationLevel.isMute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, 0, 4, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;

LABEL_6:
  objc_msgSend(v4, "leftExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "expressionType");

  if (v16 == 3)
  {
    objc_msgSend(v4, "leftExpression");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DFC0]))
    {
      -[EDMessageQueryTransformer messagePersistence](self, "messagePersistence");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMessageListItemPredicates predicateForMessagesWithObjectIDsPredicate:objectIDConverter:](EDMessageListItemPredicates, "predicateForMessagesWithObjectIDsPredicate:objectIDConverter:", v4, v19);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DDE8]))
      {
        objc_msgSend(v4, "rightExpression");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constantValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0;
        v44 = &v43;
        v45 = 0x3032000000;
        v46 = __Block_byref_object_copy__19;
        v47 = __Block_byref_object_dispose__19;
        v48 = 0;
        -[EDMessageQueryTransformer accountsProvider](self, "accountsProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mailAccounts");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __58__EDMessageQueryTransformer_transformComparisonPredicate___block_invoke;
        v40[3] = &unk_1E949E9B8;
        v25 = v39;
        v41 = v25;
        v42 = &v43;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v40);

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend((id)v44[5], "accountURL"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              (v27 = v26) != 0))
        {
          objc_msgSend(v26, "absoluteString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByAppendingString:", CFSTR("{"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB3518];
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DDF8]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB35D0];
          v49[0] = v28;
          v49[1] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "expressionForConstantValue:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v30, v33, 2, 100, 0);
          v34 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v34;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
          v27 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }

        _Block_object_dispose(&v43, 8);
        goto LABEL_18;
      }
      if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DE00]))
      {
        -[EDMessageQueryTransformer mailboxPersistence](self, "mailboxPersistence");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDMessageListItemPredicates predicateForMailboxTypePredicate:mailboxPersistence:](EDMessageListItemPredicates, "predicateForMailboxTypePredicate:mailboxPersistence:", v4, v19);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DDF8]))
        {
          if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DE30]))
          {
            +[EDMessageListItemPredicates expandedPredicateForReadLaterIsActivePredicate:](EDMessageListItemPredicates, "expandedPredicateForReadLaterIsActivePredicate:", v4);
            v36 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DD90]))
          {
            +[EDMessageListItemPredicates expandedPredicateForFollowUpIsActivePredicate:](EDMessageListItemPredicates, "expandedPredicateForFollowUpIsActivePredicate:", v4);
            v36 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DD30]))
              goto LABEL_18;
            +[EDMessageListItemPredicates expandedPredicateForCategoryTypePredicate:](EDMessageListItemPredicates, "expandedPredicateForCategoryTypePredicate:", v4);
            v36 = objc_claimAutoreleasedReturnValue();
          }
          v37 = (void *)v36;

          v13 = v37;
          goto LABEL_18;
        }
        -[EDMessageQueryTransformer mailboxPersistence](self, "mailboxPersistence");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDMessageListItemPredicates predicateForMailboxURLPredicate:mailboxPersistence:](EDMessageListItemPredicates, "predicateForMailboxURLPredicate:mailboxPersistence:", v4, v19);
        v20 = objc_claimAutoreleasedReturnValue();
      }
    }
    v21 = (void *)v20;

    v13 = v21;
LABEL_18:

  }
  return v13;
}

id __52__EDMessageQueryTransformer_transformSubpredicates___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "transformPredicate:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "ef_matchesEverything") & 1) == 0 && (objc_msgSend(v4, "ef_matchesNothing") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EDMessageQueryTransformer transformCompoundPredicate:](self, "transformCompoundPredicate:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EDMessageQueryTransformer transformComparisonPredicate:](self, "transformComparisonPredicate:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  v5 = v4;
LABEL_4:
  v6 = v5;

  return v6;
}

- (id)transformCompoundPredicate:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v4 = a3;
  v11 = 0;
  v12 = 0;
  v5 = -[EDMessageQueryTransformer _predicateIsToOrCC:addressExpression:operatorType:](self, "_predicateIsToOrCC:addressExpression:operatorType:", v4, &v11, &v12);
  v6 = v11;
  if (v5)
  {
    +[EDMessageListItemPredicates predicateForMessagesWithRecipientExpression:operatorType:](EDMessageListItemPredicates, "predicateForMessagesWithRecipientExpression:operatorType:", v6, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EDMessageQueryTransformer transformSubpredicates:](self, "transformSubpredicates:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v4, "compoundPredicateType"), v8);
    objc_msgSend(v9, "ef_simplifiedPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)transformSubpredicates:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "subpredicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__EDMessageQueryTransformer_transformSubpredicates___block_invoke;
  v7[3] = &unk_1E949DF58;
  v7[4] = self;
  objc_msgSend(v4, "ef_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EDMessageQueryTransformer)initWithAccountsProvider:(id)a3 mailboxPersistence:(id)a4 messagePersistence:(id)a5 vipManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDMessageQueryTransformer *v15;
  EDMessageQueryTransformer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDMessageQueryTransformer;
  v15 = -[EDMessageQueryTransformer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountsProvider, a3);
    objc_storeStrong((id *)&v16->_mailboxPersistence, a4);
    objc_storeWeak((id *)&v16->_messagePersistence, v13);
    objc_storeStrong((id *)&v16->_vipManager, a6);
  }

  return v16;
}

void __58__EDMessageQueryTransformer_transformComparisonPredicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_predicateIsToOrCC:(id)a3 addressExpression:(id *)a4 operatorType:(unint64_t *)a5
{
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id *v23;
  unint64_t *v24;
  int v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (objc_msgSend(v26, "compoundPredicateType") != 2)
  {
    v21 = 0;
    goto LABEL_32;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v26, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v8)
  {

    v10 = 0;
    goto LABEL_30;
  }
  v23 = a4;
  v24 = a5;
  v25 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v29;
  obj = v7;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_29;
      v15 = v14;
      objc_msgSend(v15, "leftExpression");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "keyPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "isEqualToString:", CFSTR("toList.emailAddressValue.simpleAddress")))
      {
        objc_msgSend(v15, "rightExpression");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v10)
        {
          v10 = v18;
          v11 = objc_msgSend(v15, "predicateOperatorType");
          v25 = 1;
LABEL_20:
          v19 = v10;
          goto LABEL_21;
        }
        if (!objc_msgSend(v10, "isEqual:", v18) || v11 != objc_msgSend(v15, "predicateOperatorType"))
          goto LABEL_27;
        v25 = 1;
      }
      else
      {
        if (!objc_msgSend(v17, "isEqualToString:", CFSTR("ccList.emailAddressValue.simpleAddress")))
          goto LABEL_28;
        objc_msgSend(v15, "rightExpression");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v20;
        if (!v10)
        {
          v10 = v20;
          v11 = objc_msgSend(v15, "predicateOperatorType");
          v9 = 1;
          goto LABEL_20;
        }
        if (!objc_msgSend(v10, "isEqual:", v20) || v11 != objc_msgSend(v15, "predicateOperatorType"))
        {
LABEL_27:

LABEL_28:
LABEL_29:

          goto LABEL_30;
        }
        v9 = 1;
      }
LABEL_21:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
      continue;
    break;
  }

  if ((v25 & v9 & 1) != 0)
  {
    v10 = objc_retainAutorelease(v10);
    *v23 = v10;
    *v24 = v11;
    v21 = 1;
    goto LABEL_31;
  }
LABEL_30:
  v21 = 0;
LABEL_31:

LABEL_32:
  return v21;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return (EDMessagePersistence *)objc_loadWeakRetained((id *)&self->_messagePersistence);
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end
