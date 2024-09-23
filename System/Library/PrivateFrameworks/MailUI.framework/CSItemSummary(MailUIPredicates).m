@implementation CSItemSummary(MailUIPredicates)

- (id)mui_messageListSearchPredicate
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CA5E80]);

  if (v3)
  {
    objc_msgSend(a1, "_personPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CA5E88]);

    if (v6)
    {
      objc_msgSend(a1, "_datePredicate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CA5E90]);

      if (v8)
      {
        objc_msgSend(a1, "_messagePredicate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CA5E78]);

        if (v10)
        {
          objc_msgSend(a1, "_attachmentPredicate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[CSItemSummary(MailUIPredicates) mui_messageListSearchPredicate].cold.1(a1, v11);

          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (id)_messagePredicate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = objc_msgSend(a1, "textScope");
    if (v3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightBodySearchPredicateForValue:", v2);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 != 1)
      {
        v7 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSubjectSearchPredicateForValue:operator:", v2, 99);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        objc_msgSend(MEMORY[0x1E0D1E250], "spotlightBodySearchPredicateForValue:", v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "orPredicateWithSubpredicates:", v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSubjectSearchPredicateForValue:operator:", v2, 99);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CSItemSummary(MailUIPredicates) _messagePredicate].cold.1();

    v6 = 0;
  }
LABEL_11:

  return v6;
}

- (id)_personPredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count")
    || (objc_msgSend(a1, "name"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        !v5))
  {
    v3 = 4;
  }
  else
  {
    objc_msgSend(a1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = 99;
    v2 = (void *)v7;
  }
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CSItemSummary(MailUIPredicates) _personPredicate].cold.1();
    goto LABEL_19;
  }
  switch(objc_msgSend(a1, "contactScope"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CSItemSummary(MailUIPredicates) _personPredicate].cold.2(a1, v8);

      goto LABEL_10;
    case 1:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke;
      v15[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
      v15[4] = v3;
      v10 = v15;
      goto LABEL_16;
    case 2:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_2;
      v14[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
      v14[4] = v3;
      v10 = v14;
      goto LABEL_16;
    case 3:
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_3;
      v13[3] = &__block_descriptor_40_e31___NSPredicate_16__0__NSString_8l;
      v13[4] = v3;
      v10 = v13;
LABEL_16:
      objc_msgSend(v2, "ef_map:", v10);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_10:
      v9 = 0;
      break;
  }
  if (!-[NSObject count](v9, "count"))
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v11;
}

- (id)_senderContainsPredicate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  objc_msgSend(a1, "senderContainsSearchString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CA6BB0], "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CSItemSummary(MailUIPredicates) _senderContainsPredicate].cold.1();

    a1 = 0;
    goto LABEL_14;
  }
  v3 = objc_msgSend(a1, "senderContainsScope");
  switch(v3)
  {
    case 2:
      v7 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSenderSearchPredicateForValue:operator:", v2, 99);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightRecipientSearchPredicateForValue:operator:", v2, 99);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "orPredicateWithSubpredicates:", v10);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightRecipientSearchPredicateForValue:operator:", v2, 99);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0:
      objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSenderSearchPredicateForValue:operator:", v2, 99);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      a1 = (void *)v4;
      break;
  }
LABEL_14:

  return a1;
}

- (id)_datePredicate
{
  void *v2;
  _QWORD *v3;
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
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dateFrom");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (_QWORD *)MEMORY[0x1E0D1DD60];
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DD60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(a1, "dateFrom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expressionForConstantValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v8, 0, 2, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "dateTo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3518];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(a1, "dateTo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expressionForConstantValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v11, v14, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 && v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3528];
      v20[0] = v2;
      v20[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v15 = v18;
      goto LABEL_11;
    }
  }
  else
  {
    v15 = 0;
  }
  if (v2)
  {
    v18 = v2;
    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

- (id)_readStatusPredicate
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "statusValue");
  if (v1 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForUnreadMessages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForReadMessages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_flagStatusPredicate
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "statusValue");
  if (v1 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForUnflaggedMessages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForFlaggedMessages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_attachmentPredicate
{
  return objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithAttachments");
}

- (void)mui_messageListSearchPredicate
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D5522000, a2, v4, "Unknown CSItemSummaryType: %@", v5);

}

- (void)_messagePredicate
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D5522000, v0, v1, "_CSSuggestionTokenKindMessage token:%@ does not have valid textQuery.", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_personPredicate
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "contactScope"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D5522000, a2, v4, "_CSSuggestionTokenKindPerson token:%@ has unsupported scope:%@.", v5);

  OUTLINED_FUNCTION_3();
}

- (void)_senderContainsPredicate
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_0(&dword_1D5522000, v1, (uint64_t)v1, "_CSSuggestionTokenKindSenderContains token:%@ does not have valid senderContainsSearchString:%@.", v2);
  OUTLINED_FUNCTION_4();
}

@end
