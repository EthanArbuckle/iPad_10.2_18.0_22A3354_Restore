@implementation EMMessageListItemPredicates

+ (id)predicateForMessagesWithMailboxScope:(id)a3
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageListItemPredicates.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailboxScope"));

  }
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    +[EMMailboxScope noMailboxesScope](EMMailboxScope, "noMailboxesScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if (v10)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "mailboxObjectIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "mailboxTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = objc_claimAutoreleasedReturnValue();

    if (v13 | v15)
    {
      if (v13)
      {
        if (objc_msgSend(v5, "excludeMailboxes"))
          +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxesWithObjectIDs:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxesWithObjectIDs:", v13);
        else
          +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:](EMMessageListItemPredicates, "predicateForMessagesInMailboxesWithObjectIDs:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v15)
        {
          v11 = v16;
          v17 = v11;
LABEL_25:

          goto LABEL_26;
        }
        goto LABEL_16;
      }
      v17 = 0;
      v18 = 0;
      if (v15)
      {
LABEL_16:
        if (objc_msgSend(v5, "excludeTypes"))
          +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxesWithTypes:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxesWithTypes:", v15);
        else
          +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithTypes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxesWithTypes:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v18;
        if (!v13)
          goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageListItemPredicates.m"), 170, CFSTR("Mailbox scope must have either mailbox object IDs or mailbox types"));

      v17 = 0;
      v18 = 0;
    }
    v19 = objc_msgSend(v5, "excludeMailboxes");
    v20 = (void *)MEMORY[0x1E0CB3528];
    if (v19)
    {
      v28[0] = v17;
      v28[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27[0] = v17;
      v27[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "orPredicateWithSubpredicates:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;

    v11 = v23;
    goto LABEL_25;
  }
  v8 = 1;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v11;
}

+ (id)_predicateForKeyPath:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v7, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForExcludingMessagesInMailboxesWithTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("mailboxes.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 1, 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForNotifyMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("conversationNotificationLevel"), &unk_1E711F458);
}

+ (id)predicateForMuteMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("conversationNotificationLevel"), &unk_1E711F470);
}

id __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "accountIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mailboxScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4
{
  mailboxScopeForPredicate(a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sortDescriptorForKeyPath:(id)a3 ascending:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E0D1F078], "sortDescriptorWithKey:ascending:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __76__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "predicateForMessagesInMailboxWithObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __63__EMMessageListItemPredicates_predicateForMessagesInMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "predicateForMessagesInMailbox:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMessagesInMailbox:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "makePredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForMessagesInMailboxWithObjectID:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)predicateForMessagesInMailboxWithObjectID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageListItemPredicates.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mailboxObjectID isKindOfClass:[EMMailboxObjectID class]]"));

  }
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForMessagesInMailboxWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_predicateForMessagesInMailboxWithURL:(id)a3
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
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("mailboxObjectIDs.url.absoluteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 2, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateFromPredicate:(id)a3 ignoringKeyPaths:(id)a4
{
  predicateFromPredicateIgnoringKeyPaths(a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartMailbox");
}

uint64_t __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartMailbox");
}

+ (id)predicateForUnreadMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("flags.read"), MEMORY[0x1E0C9AAA0]);
}

id __72__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_predicateForMessagesInMailboxWithType:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_predicateForMessagesInMailboxWithType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("mailboxes.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 2, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForUnflaggedMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("flags.flagged"), MEMORY[0x1E0C9AAA0]);
}

+ (id)predicateForIsVIP:(BOOL)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("isVIP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)transformPredicateWithMailboxes:(id)a3 mailboxTypeResolver:(id)a4 shouldIncludeFollowUps:(BOOL)a5 shouldIncludeReadLater:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    +[EMMessageListItemPredicates predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:mailboxTypeResolver:](EMMessageListItemPredicates, "predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:mailboxTypeResolver:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ef_addOptionalObject:", v12);

  }
  if (v6)
  {
    +[EMMessageListItemPredicates predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:](EMMessageListItemPredicates, "predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ef_addOptionalObject:", v13);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __129__EMMessageListItemPredicates_transformPredicateWithMailboxes_mailboxTypeResolver_shouldIncludeFollowUps_shouldIncludeReadLater___block_invoke;
  v17[3] = &unk_1E70F45D8;
  v18 = v11;
  v14 = v11;
  v15 = (void *)MEMORY[0x1BCCC8C10](v17);

  return v15;
}

+ (id)predicateForUnfiredReadLaterMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForReadLaterMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(a1, "_predicateForReadLaterMessagesFired:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_simplifiedPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3
{
  objc_msgSend(a1, "predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:additionalAccountObjectIDs:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes:(id)a3 additionalAccountObjectIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "ef_any:", &__block_literal_global_89))
  {
    objc_msgSend(a1, "predicateForFiredReadLaterMessages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_91);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_3;
      v18[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
      v18[4] = a1;
      objc_msgSend(v12, "ef_compactMap:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_orCompoundPredicateWithSubpredicates:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "predicateForFiredReadLaterMessages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ef_andCompoundPredicateForOptionalPredicate:second:", v14, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)_predicateForReadLaterMessagesFired:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("readLater.isActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForFiredReadLaterMessages
{
  return (id)objc_msgSend(a1, "_predicateForReadLaterMessagesFired:", 1);
}

+ (id)predicateForReadLaterMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("readLater.date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __129__EMMessageListItemPredicates_transformPredicateWithMailboxes_mailboxTypeResolver_shouldIncludeFollowUps_shouldIncludeReadLater___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v3, 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "ef_orCompoundPredicateWithSubpredicates:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)threadScopeForPredicate:(id)a3 withMailboxTypeResolver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  EMThreadScope *v23;
  void *v24;
  EMThreadScope *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ef_simplifiedPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if ((objc_msgSend(v8, "ef_matchesEverything") & 1) != 0 || (objc_msgSend(v8, "ef_matchesNothing") & 1) != 0)
  {
LABEL_30:
    v12 = 0;
    v22 = v8;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    mailboxScopeForThreadWithPredicate(v8, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v21
      && __79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke((uint64_t)v21, v21))
    {

      v22 = 0;
      goto LABEL_31;
    }

    goto LABEL_30;
  }
  v9 = v8;
  if (objc_msgSend(v9, "compoundPredicateType") != 1)
  {
    v12 = 0;
    v22 = v9;
    goto LABEL_42;
  }
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v9, "subpredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v11)
  {
LABEL_39:
    v12 = 0;
    v22 = v9;
    goto LABEL_40;
  }
  v12 = 0;
  v13 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v29 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      mailboxScopeForThreadWithPredicate(v15, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        v18 = v12 == 0;
      else
        v18 = 1;
      if (!v18)
      {
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if (v16)
      {
        if (!__79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke((uint64_t)v16, v16))goto LABEL_37;
        v19 = v17;

        v12 = v19;
      }
      else
      {
        if ((hasMailboxPredicates(v15, v6) & 1) != 0)
        {
          v17 = v12;
          goto LABEL_38;
        }
        objc_msgSend(v27, "addObject:", v15);
      }

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
      continue;
    break;
  }

  if (v12)
  {
    v20 = objc_msgSend(v27, "count");
    if (v20)
    {
      if (v20 == 1)
        objc_msgSend(v27, "firstObject");
      else
        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v10 = v9;
LABEL_40:

  }
  else
  {
    v22 = v9;
  }

LABEL_42:
LABEL_31:
  v23 = [EMThreadScope alloc];
  v24 = v12;
  if (!v12)
  {
    +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = -[EMThreadScope initWithMailboxScope:filterPredicate:](v23, "initWithMailboxScope:filterPredicate:", v24, v22);
  if (!v12)

  return v25;
}

+ (id)predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes:(id)a3 mailboxTypeResolver:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "ef_any:", &__block_literal_global_84))
  {
    objc_msgSend(a1, "predicateForMessagesWithActiveFollowUpInSent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_86);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v8, "mailboxObjectIDsForMailboxType:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_87;
      v22[3] = &unk_1E70F4640;
      v23 = v10;
      -[NSObject ef_filter:](v12, "ef_filter:", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:](EMMessageListItemPredicates, "predicateForMessagesInMailboxesWithObjectIDs:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3528];
        v24[0] = v14;
        objc_msgSend(a1, "predicateForMessagesWithActiveFollowUp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "andPredicateWithSubpredicates:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ef_simplifiedPredicate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[EMMessageListItemPredicates log](EMMessageListItemPredicates, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v20;
          _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - empty mailboxesToSearch", buf, 0xCu);

        }
        v9 = 0;
      }

    }
    else
    {
      +[EMMessageListItemPredicates log](EMMessageListItemPredicates, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - empty accountIdentifiers", buf, 0xCu);

      }
      v9 = 0;
    }

  }
  return v9;
}

+ (id)predicateForMessagesInMailboxesWithObjectIDs:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithObjectIDs___block_invoke;
  v6[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
  v6[4] = a1;
  objc_msgSend(a3, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForMessagesInMailboxesWithTypes:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__EMMessageListItemPredicates_predicateForMessagesInMailboxesWithTypes___block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
  v6[4] = a1;
  objc_msgSend(a3, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForMessagesInMailboxes:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__EMMessageListItemPredicates_predicateForMessagesInMailboxes___block_invoke;
  v6[3] = &__block_descriptor_40_e19__16__0__EMMailbox_8l;
  v6[4] = a1;
  objc_msgSend(a3, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForMessagesWithActiveFollowUp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("followUp.isActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "representedObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __121__EMMessageListItemPredicates_predicateForMessagesForFiredReadLaterDateInAccountsOfMailboxes_additionalAccountObjectIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "predicateForAccountWithObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)dateSortOrderFromSortDescriptors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("date");
    v10[1] = CFSTR("displayDate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
    {
      if (objc_msgSend(v4, "ascending"))
        v8 = -1;
      else
        v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)predicateForSendLaterMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("sendLaterDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EMMessageListItemPredicates_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1)
    dispatch_once(&log_onceToken_25, block);
  return (OS_os_log *)(id)log_log_25;
}

void __34__EMMessageListItemPredicates_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_25;
  log_log_25 = (uint64_t)v1;

}

+ (id)predicateForMessagesInConversation:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForMessagesInMailboxWithType:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForMessagesInMailboxWithType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForMessagesInMailboxWithType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notPredicateWithSubpredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForExcludingMessagesInMailbox:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForMessagesInMailbox:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxObjectID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForMessagesInMailboxWithObjectID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForExcludingMessagesInMailboxes:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxes___block_invoke;
  v6[3] = &__block_descriptor_40_e19__16__0__EMMailbox_8l;
  v6[4] = a1;
  objc_msgSend(a3, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "predicateForExcludingMessagesInMailbox:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForExcludingMessagesInMailboxesWithObjectIDs:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxesWithObjectIDs___block_invoke;
  v6[3] = &__block_descriptor_40_e33___NSPredicate_16__0__EMObjectID_8l;
  v6[4] = a1;
  objc_msgSend(a3, "ef_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __85__EMMessageListItemPredicates_predicateForExcludingMessagesInMailboxesWithObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "predicateForExcludingMessagesInMailboxObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMessagesWithThreadScope:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageListItemPredicates.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("threadScope"));

  }
  objc_msgSend(v5, "mailboxScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    if (v7)
    {
      v15 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchEverythingPredicate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  +[EMMailboxScope noMailboxesScope](EMMailboxScope, "noMailboxesScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = v15;
    goto LABEL_12;
  }
  objc_msgSend(a1, "predicateForMessagesWithMailboxScope:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v7)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v10;
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
LABEL_12:

  return v11;
}

+ (id)predicateForMessagesWithSender:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("senderList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v3, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v9, 2, 4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForMessagesForBusinessID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("businessID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForMessagesForBusinessID:(int64_t)a3 forAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[EMMessageListItemPredicates predicateForAccount:](EMMessageListItemPredicates, "predicateForAccount:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageListItemPredicates predicateForMessagesForBusinessID:](EMMessageListItemPredicates, "predicateForMessagesForBusinessID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v6;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForMessagesWithSenders:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __63__EMMessageListItemPredicates_predicateForMessagesWithSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EMMessageListItemPredicates predicateForMessagesWithSender:](EMMessageListItemPredicates, "predicateForMessagesWithSender:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMessagesWithoutSender:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("senderList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v3, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v9, 2, 5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForMessagesWithoutSenders:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_68_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__EMMessageListItemPredicates_predicateForMessagesWithoutSenders___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EMMessageListItemPredicates predicateForMessagesWithoutSender:](EMMessageListItemPredicates, "predicateForMessagesWithoutSender:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForMessagesTo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("toList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  v7 = v3;
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v6, "expressionForConstantValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v13, 2, 4, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForMessagesWithToAddresses:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("toList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 2, 10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __67__EMMessageListItemPredicates_predicateForMessagesWithToAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)predicateForMessagesCced:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("ccList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  v7 = v3;
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v6, "expressionForConstantValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v13, 2, 4, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)predicateForMessagesWithCcAddresses:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("ccList.emailAddressValue.simpleAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 2, 10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __67__EMMessageListItemPredicates_predicateForMessagesWithCcAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)predicateForMessagesWithRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "predicateForMessagesTo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForMessagesCced:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForMessagesWithRecipients:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "ef_map:", &__block_literal_global_72);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("toList.emailAddressValue.simpleAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v6, v7, 2, 10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("ccList.emailAddressValue.simpleAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v11, 2, 10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v8;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __66__EMMessageListItemPredicates_predicateForMessagesWithRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)predicateForFlaggedMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("flags.flagged"), MEMORY[0x1E0C9AAB0]);
}

+ (id)predicateForFlagColor:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("flags.flagColor"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForFlaggedMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForReadMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("flags.read"), MEMORY[0x1E0C9AAB0]);
}

+ (id)predicateForMessagesWithAttachments
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("hasAttachments"), MEMORY[0x1E0C9AAB0]);
}

+ (id)predicateForTodayMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("displayDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v8, 0, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForMessagesWithCategoryType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_predicateForModelHighImpactMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("category.isHighImpact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E711F488);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPrimaryMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:](EMMessageListItemPredicates, "predicateForMessagesWithCategoryType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageListItemPredicates _predicateForModelHighImpactMessages](EMMessageListItemPredicates, "_predicateForModelHighImpactMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForNonPrimaryMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:](EMMessageListItemPredicates, "predicateForMessagesWithCategoryType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:](EMMessageListItemPredicates, "predicateForMessagesWithCategoryType:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[EMMessageListItemPredicates predicateForMessagesWithCategoryType:](EMMessageListItemPredicates, "predicateForMessagesWithCategoryType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForUrgentMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("generatedSummary.urgent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForReadLaterSmartMailbox
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessages](EMMessageListItemPredicates, "predicateForUnfiredReadLaterMessages");
  else
    +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessagesInInbox](EMMessageListItemPredicates, "predicateForUnfiredReadLaterMessagesInInbox");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForUnfiredReadLaterMessagesInInbox
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForUnfiredReadLaterMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(a1, "predicateForMessagesInMailboxWithType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_simplifiedPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_predicateForFollowUpMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("followUp.startDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __111__EMMessageListItemPredicates_predicateForMessagesWithActiveFollowUpInAccountsOfMailboxes_mailboxTypeResolver___block_invoke_87(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)predicateForMessagesWithActiveFollowUpInSent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicateForMessagesInMailboxWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForMessagesWithActiveFollowUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessagesWithUnfiredFollowUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("displayDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("followUp.startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v4, v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_predicateForFollowUpMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForMessagesInMailboxWithType:", 4, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_predicateForActiveFollowUpMessagesIncludeExpired:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("displayDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("followUp.startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v6, v7, 0, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForMessagesInMailboxWithType:", 4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    v20[0] = v8;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("displayDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("followUp.endDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v15, v16, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3528];
    v21[0] = v8;
    v21[1] = v12;
    v21[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)predicateForUnsubscribableMessages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("unsubscribeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E711F4A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v3, v4, 0, 5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForIncludesMeMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForToMeMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(a1, "predicateForCCMeMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForToMeMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("isToMe"), MEMORY[0x1E0C9AAB0]);
}

+ (id)predicateForCCMeMessages
{
  return (id)objc_msgSend(a1, "_predicateForKeyPath:value:", CFSTR("isCCMe"), MEMORY[0x1E0C9AAB0]);
}

+ (id)predicateForRecentMessages
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "ef_lastWeekMidnight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForMessagesNewerThanDisplayDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForMessagesNewerThanDisplayDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("displayDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForMessagesNewerThanDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForExcludingMessagesInMailboxWithURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "_predicateForMessagesInMailboxWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notPredicateWithSubpredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAccountIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("mailboxes.accountIdentifier.representedObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 2, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForAccountWithObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAccountWithObjectID:(id)a3
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
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("mailboxes.accountIdentifier.representedObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v3, "representedObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expressionForConstantValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 2, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForSendLaterMessagesWithStartDate:(id)a3 endDate:(id)a4
{
  objc_msgSend(a1, "_dateRangePredicateForListItemKeyPath:startDate:endDate:", CFSTR("sendLaterDate"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForReadLaterMessagesWithStartDate:(id)a3 endDate:(id)a4
{
  objc_msgSend(a1, "_dateRangePredicateForListItemKeyPath:startDate:endDate:", CFSTR("readLater.date"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_dateRangePredicateForListItemKeyPath:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, -1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, v13, 0, 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v16, v17, 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3528];
    v23[0] = v14;
    v23[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v14;
  }

  return v21;
}

+ (id)predicateFromPredicate:(id)a3 ignoringPredicates:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  predicateFromPredicateIgnoringPredicates(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sortDescriptorForDateAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D1F078], "sortDescriptorWithKey:ascending:", CFSTR("date"), a3);
}

+ (BOOL)isPredicateForMessagesInMailboxObjectID:(id)a3 mailboxObjectID:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  EMMailboxObjectID *v13;
  EMMailboxObjectID *v14;
  BOOL v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v5, "leftExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "expressionType") != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v5, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("mailboxObjectIDs.url.absoluteString"))
    || objc_msgSend(v5, "comparisonPredicateModifier") != 2)
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v5, "predicateOperatorType");

  if (v9 == 4)
  {
    objc_msgSend(v5, "rightExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);
    v13 = -[EMMailboxObjectID initWithURL:]([EMMailboxObjectID alloc], "initWithURL:", v12);
    v14 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);

    v15 = 1;
    goto LABEL_13;
  }
LABEL_11:
  v15 = 0;
  if (a4)
    *a4 = 0;
LABEL_13:

  return v15;
}

+ (BOOL)_isPredicateForMessagesInMailboxObjectIDs:(id)a3 mailboxObjectIDs:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "compoundPredicateType") == 2)
  {
    objc_msgSend(v6, "subpredicates");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 0;
          v13 = objc_msgSend(a1, "isPredicateForMessagesInMailboxObjectID:mailboxObjectID:", v12, &v21);
          v14 = v21;
          v15 = v14;
          if (!v13)
          {
            if (a4)
              *a4 = 0;

            LOBYTE(v16) = 0;
            goto LABEL_25;
          }
          if (!v8)
            v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
          objc_msgSend(v8, "addObject:", v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
    LOBYTE(v16) = 1;
LABEL_25:

  }
  else
  {
    v20 = 0;
    v16 = objc_msgSend(a1, "isPredicateForMessagesInMailboxObjectID:mailboxObjectID:", v6, &v20);
    v8 = v20;
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
      v18 = v17;
      if (a4)
        *a4 = objc_retainAutorelease(v17);

    }
    else if (a4)
    {
      *a4 = 0;
    }
  }

  return v16;
}

+ (BOOL)isPredicateForMessagesInMailboxWithType:(id)a3 mailboxType:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v5, "leftExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "expressionType") != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v5, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("mailboxes.type"))
    || objc_msgSend(v5, "comparisonPredicateModifier") != 2)
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v5, "predicateOperatorType");

  if (v9 == 4)
  {
    objc_msgSend(v5, "rightExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_msgSend(v11, "integerValue");

    v12 = 1;
    goto LABEL_13;
  }
LABEL_11:
  v12 = 0;
  if (a4)
    *a4 = -500;
LABEL_13:

  return v12;
}

+ (BOOL)isPredicateForMessagesWithActiveFollowUp:(id)a3 mailboxTypeResolver:(id)a4 inSent:(BOOL *)a5 sentMailboxObjectIDs:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  int v19;
  void *v20;
  void *v22;
  char v23;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(a1, "_isPredicateForMessagesWithActiveFollowUp:", v10))
  {
    if (a5)
      *a5 = 0;
    if (a6)
      *a6 = 0;
    v12 = 1;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "compoundPredicateType") == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v11;
    objc_msgSend(v10, "subpredicates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = 0;
      v23 = 0;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v28 = -500;
          if ((objc_msgSend(a1, "_isPredicateForMessagesWithActiveFollowUp:", v18) & 1) != 0)
          {
            v23 = 1;
          }
          else if (objc_msgSend(a1, "isPredicateForMessagesInMailboxWithType:mailboxType:", v18, &v28))
          {
            if (v28 != 4)
              goto LABEL_35;
          }
          else
          {
            if (v15
              || (v27 = 0,
                  v19 = objc_msgSend(a1, "_isPredicateForMessagesInMailboxObjectIDs:mailboxObjectIDs:", v18, &v27),
                  v15 = v27,
                  !v19))
            {
LABEL_35:
              if (a5)
                *a5 = 0;
              v20 = obj;
              if (a6)
                *a6 = 0;
LABEL_49:

              goto LABEL_50;
            }
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __120__EMMessageListItemPredicates_isPredicateForMessagesWithActiveFollowUp_mailboxTypeResolver_inSent_sentMailboxObjectIDs___block_invoke;
            v25[3] = &unk_1E70F46F8;
            v26 = v22;
            if (objc_msgSend(v15, "ef_any:", v25))
            {
              if (a5)
                *a5 = 0;
              if (a6)
                *a6 = 0;

              v20 = obj;
              goto LABEL_49;
            }

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
          continue;
        break;
      }

      if ((v23 & 1) != 0)
      {
        if (a5)
          *a5 = 1;
        if (a6)
        {
          v15 = objc_retainAutorelease(v15);
          *a6 = v15;
        }
        v12 = 1;
LABEL_51:

        v11 = v22;
        goto LABEL_52;
      }
    }
    else
    {

      v15 = 0;
    }
    if (a5)
      *a5 = 0;
    if (a6)
    {
      v12 = 0;
      *a6 = 0;
    }
    else
    {
LABEL_50:
      v12 = 0;
    }
    goto LABEL_51;
  }
  if (a5)
    *a5 = 0;
  v12 = 0;
  if (a6)
    *a6 = 0;
LABEL_52:

  return v12;
}

BOOL __120__EMMessageListItemPredicates_isPredicateForMessagesWithActiveFollowUp_mailboxTypeResolver_inSent_sentMailboxObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(*(id *)(a1 + 32), "mailboxTypeForMailboxObjectID:", v3) != 4;

  return v4;
}

+ (BOOL)_isPredicateForMessagesWithActiveFollowUp:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "predicateForMessagesWithActiveFollowUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (BOOL)isPredicateForMessagesWithFiredReadLaterDate:(id)a3 accountObjectIDs:(id *)a4
{
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  char v18;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  +[EMMessageListItemPredicates predicateForFiredReadLaterMessages](EMMessageListItemPredicates, "predicateForFiredReadLaterMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "isEqual:", v5);

  if (v6)
  {
    if (a4)
      *a4 = 0;
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "subpredicates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(a1, "predicateForFiredReadLaterMessages");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if ((v17 & 1) != 0)
          {
            v11 = 1;
          }
          else if (v12
                 || (v22 = 0,
                     v18 = objc_msgSend(a1, "_isPredicateForMessagesInAccountObjectIDs:accountObjectIDs:", v15, &v22),
                     v12 = v22,
                     (v18 & 1) == 0))
          {
            if (a4)
              *a4 = 0;

            goto LABEL_26;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }

      if ((v11 & 1) != 0)
      {
        if (a4)
        {
          v12 = objc_retainAutorelease(v12);
          *a4 = v12;
        }
        v7 = 1;
        goto LABEL_30;
      }
    }
    else
    {

      v12 = 0;
    }
    if (a4)
    {
      v7 = 0;
      *a4 = 0;
    }
    else
    {
LABEL_26:
      v7 = 0;
    }
LABEL_30:

  }
  return v7;
}

+ (BOOL)isPredicateForMessagesInAccountObjectID:(id)a3 accountObjectID:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  EMObjectID *v12;
  EMObjectID *v13;
  BOOL v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v5, "leftExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "expressionType") != 3)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v5, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("mailboxes.accountIdentifier.representedObjectID"))
    || objc_msgSend(v5, "comparisonPredicateModifier") != 2)
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v5, "predicateOperatorType");

  if (v9 == 4)
  {
    objc_msgSend(v5, "rightExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[EMObjectID initWithRepresentedObjectID:]([EMObjectID alloc], "initWithRepresentedObjectID:", v11);
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

    v14 = 1;
    goto LABEL_13;
  }
LABEL_11:
  v14 = 0;
  if (a4)
    *a4 = 0;
LABEL_13:

  return v14;
}

+ (BOOL)_isPredicateForMessagesInAccountObjectIDs:(id)a3 accountObjectIDs:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "compoundPredicateType") == 2)
  {
    objc_msgSend(v6, "subpredicates");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v21 = 0;
          v13 = objc_msgSend(a1, "isPredicateForMessagesInAccountObjectID:accountObjectID:", v12, &v21);
          v14 = v21;
          v15 = v14;
          if (!v13)
          {
            if (a4)
              *a4 = 0;

            LOBYTE(v16) = 0;
            goto LABEL_25;
          }
          if (!v8)
            v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
          objc_msgSend(v8, "addObject:", v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
    LOBYTE(v16) = 1;
LABEL_25:

  }
  else
  {
    v20 = 0;
    v16 = objc_msgSend(a1, "isPredicateForMessagesInAccountObjectID:accountObjectID:", v6, &v20);
    v8 = v20;
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, 0);
      v18 = v17;
      if (a4)
        *a4 = objc_retainAutorelease(v17);

    }
    else if (a4)
    {
      *a4 = 0;
    }
  }

  return v16;
}

uint64_t __79__EMMessageListItemPredicates_threadScopeForPredicate_withMailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v2 = a2;
  objc_msgSend(v2, "mailboxTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(v2, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != 1 || v6)
  {
    if (v4)
      v8 = 0;
    else
      v8 = v6 == 1;
    v7 = v8;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)mailboxURLsForPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = v4;
    objc_msgSend(v11, "leftExpression");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "expressionType") == 3)
    {
      objc_msgSend(v11, "leftExpression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("mailboxObjectIDs.url.absoluteString"));

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v11, "rightExpression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constantValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

    }
    goto LABEL_14;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "subpredicates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "mailboxURLsForPredicate:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

LABEL_15:
  return v5;
}

+ (id)predicateStrippingSpotlightOnlyTerms:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(a1, "_predicateStrippingSpotlightOnlyTerms:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[EMMessageListItemPredicates log](EMMessageListItemPredicates, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Spotlight predicate generated a nil predicate. Using TRUEPREDICATE instead. This may result in unfiltered results.", v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_predicateStrippingSpotlightOnlyTerms:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "leftExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "expressionType") == 3)
      {
        objc_msgSend(v7, "leftExpression");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keyPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("body")))
        {
LABEL_9:

LABEL_10:
          v10 = 0;
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v7, "leftExpression");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Spotlight")) & 1) != 0)
        {

          goto LABEL_9;
        }
        objc_msgSend(v7, "leftExpression");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "keyPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("SpotlightQuery"));

        if ((v20 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
    }
    else
    {
      +[EMMessageListItemPredicates log](EMMessageListItemPredicates, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = (id)objc_opt_class();
        objc_msgSend(v7, "ef_publicDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = v21;
        v26 = 2048;
        v27 = a1;
        v28 = 2114;
        v29 = v22;
        _os_log_error_impl(&dword_1B99BB000, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Spotlight predicate does not respond to leftExpression: %{public}@", buf, 0x20u);

      }
    }
    v10 = v7;
    goto LABEL_18;
  }
  objc_msgSend(v6, "subpredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__EMMessageListItemPredicates__predicateStrippingSpotlightOnlyTerms___block_invoke;
  v23[3] = &__block_descriptor_40_e34___NSPredicate_16__0__NSPredicate_8l;
  v23[4] = a1;
  objc_msgSend(v8, "ef_compactMap:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v7, "compoundPredicateType"), v9);
  else
    v10 = 0;

LABEL_19:
  return v10;
}

id __69__EMMessageListItemPredicates__predicateStrippingSpotlightOnlyTerms___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_predicateStrippingSpotlightOnlyTerms:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)predicate:(id)a3 appliesToFlagChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "_keyPathsForFlagChange:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateFromPredicate:ignoringKeyPaths:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v6) ^ 1;
  return (char)v7;
}

+ (id)_keyPathsForFlagChange:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "readChanged"))
    objc_msgSend(v4, "addObject:", CFSTR("flags.read"));
  if (objc_msgSend(v3, "flaggedChanged"))
    objc_msgSend(v4, "addObject:", CFSTR("flags.flagged"));

  return v4;
}

+ (BOOL)isValidPredicate:(id)a3 forClass:(Class)a4
{
  id v7;
  EMThread *v8;
  EMThreadObjectID *v9;
  uint64_t v10;
  EMMessage *v11;
  void *v12;
  BOOL v13;
  void *v14;

  v7 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isEqual:", a4))
  {
    v8 = [EMThread alloc];
    v9 = objc_alloc_init(EMThreadObjectID);
    v10 = -[EMQueryingCollection initWithObjectID:query:](v8, "initWithObjectID:query:", v9, 0);
  }
  else
  {
    if (!objc_msgSend((id)objc_opt_class(), "isEqual:", a4))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMMessageListItemPredicates.m"), 1730, CFSTR("Unknown targetClass:%@"), a4);

      v12 = 0;
      v13 = 0;
      goto LABEL_7;
    }
    v11 = [EMMessage alloc];
    v9 = objc_alloc_init(EMMessageObjectID);
    v10 = -[EMMessage initWithObjectID:builder:](v11, "initWithObjectID:builder:", v9, &__block_literal_global_125);
  }
  v12 = (void *)v10;

  objc_msgSend(v7, "evaluateWithObject:", v12);
  v13 = 1;
LABEL_7:

  return v13;
}

@end
