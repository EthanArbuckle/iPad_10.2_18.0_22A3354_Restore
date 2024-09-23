@implementation MFMessageCriterionConverter

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MFMessageCriterionConverter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1)
    dispatch_once(&log_onceToken_19, block);
  return (OS_os_log *)(id)log_log_19;
}

void __34__MFMessageCriterionConverter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;

}

- (id)_simplifiedCompoundPredicateOfType:(unint64_t)a3 forSubqueries:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v16;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
    goto LABEL_10;
  v8 = *(_QWORD *)v18;
  while (2)
  {
    v9 = 0;
    v10 = v5;
    do
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = v10;
LABEL_14:

        goto LABEL_15;
      }
      v12 = v11;
      if (objc_msgSend(v12, "compoundPredicateType") != a3)
      {

        goto LABEL_14;
      }
      objc_msgSend(v12, "subpredicates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v13);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      ++v9;
      v10 = v5;
    }
    while (v7 != v9);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
      continue;
    break;
  }
LABEL_10:

  if (!v5)
LABEL_15:
    v5 = v6;
  if (objc_msgSend(v5, "count"))
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", a3, v5);
  else
    v14 = 0;

  return v14;
}

- (unint64_t)_proposedPredicateOperatorType:(unint64_t)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;

  v6 = a4;
  -[MFMessageCriterionConverter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MFMessageCriterionConverter delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v9, "messageCriterionConverter:willUsePredicateOperatorType:forKey:", self, a3, v6);

  }
  return a3;
}

- (id)_predicateForKey:(id)a3 value:(id)a4 qualifier:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a5 >= 9)
  {
    +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MFMessageCriterionConverter _predicateForKey:value:qualifier:].cold.1(a5, v13, v14, v15, v16, v17, v18, v19);

    v12 = 99;
  }
  else
  {
    v12 = qword_1A5999980[a5];
  }
  v20 = -[MFMessageCriterionConverter _proposedPredicateOperatorType:forKey:](self, "_proposedPredicateOperatorType:forKey:", v12, v8);
  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v10, v11, 0, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_orPredicateForAttributes:(id)a3 matchingValue:(id)a4 qualifier:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  int64_t v16;

  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__MFMessageCriterionConverter__orPredicateForAttributes_matchingValue_qualifier___block_invoke;
  v14[3] = &unk_1E4E8DF40;
  v14[4] = self;
  v9 = v8;
  v15 = v9;
  v16 = a5;
  objc_msgSend(a3, "ef_map:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[MFMessageCriterionConverter _simplifiedCompoundPredicateOfType:forSubqueries:](self, "_simplifiedCompoundPredicateOfType:forSubqueries:", 2, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_7:

  return v12;
}

id __81__MFMessageCriterionConverter__orPredicateForAttributes_matchingValue_qualifier___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_predicateForKey:value:qualifier:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultKeysForCriterionType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_defaultKeysForCriterionType__onceToken != -1)
    dispatch_once(&_defaultKeysForCriterionType__onceToken, &__block_literal_global_48);
  v4 = (void *)_defaultKeysForCriterionType__converterKeyDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __60__MFMessageCriterionConverter__defaultKeysForCriterionType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  _QWORD v54[26];
  _QWORD v55[28];

  v55[26] = *MEMORY[0x1E0C80C00];
  v53 = CFSTR("Compound");
  v54[0] = &unk_1E4F6A168;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v27;
  v54[1] = &unk_1E4F6A180;
  v52 = CFSTR("AnyRecipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v26;
  v54[2] = &unk_1E4F6A198;
  v51 = *MEMORY[0x1E0D1DE80];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v25;
  v54[3] = &unk_1E4F6A1B0;
  v50 = *MEMORY[0x1E0D1DD38];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v24;
  v54[4] = &unk_1E4F6A1C8;
  v49 = CFSTR("BccRecipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v23;
  v54[5] = &unk_1E4F6A1E0;
  v48 = CFSTR("senderAddress.emailAddressValue.simpleAddress");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v22;
  v54[6] = &unk_1E4F6A1F8;
  v47 = CFSTR("Spotlight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v21;
  v54[7] = &unk_1E4F6A210;
  v46 = CFSTR("body");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v20;
  v54[8] = &unk_1E4F6A228;
  v45 = CFSTR("Mailbox");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v19;
  v54[9] = &unk_1E4F6A240;
  v44 = CFSTR("DateReceived");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v18;
  v54[10] = &unk_1E4F6A258;
  v43 = CFSTR("DateSent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v17;
  v54[11] = &unk_1E4F6A270;
  v42 = CFSTR("DisplayDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v16;
  v54[12] = &unk_1E4F6A288;
  v41 = CFSTR("subject.subjectWithoutPrefix");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v15;
  v54[13] = &unk_1E4F6A2A0;
  v40 = CFSTR("VIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v14;
  v54[14] = &unk_1E4F6A2B8;
  v39 = CFSTR("IsRead");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v13;
  v54[15] = &unk_1E4F6A2D0;
  v38 = CFSTR("HasAttachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v12;
  v54[16] = &unk_1E4F6A2E8;
  v37 = CFSTR("Flagged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v0;
  v54[17] = &unk_1E4F6A300;
  v36 = CFSTR("FlagColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v1;
  v54[18] = &unk_1E4F6A318;
  v35 = CFSTR("readLaterDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v2;
  v54[19] = &unk_1E4F6A330;
  v34 = *MEMORY[0x1E0D1DE30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v3;
  v54[20] = &unk_1E4F6A348;
  v33 = CFSTR("sendLaterDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v4;
  v54[21] = &unk_1E4F6A360;
  v32 = CFSTR("followUpStartDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v5;
  v54[22] = &unk_1E4F6A378;
  v31 = *MEMORY[0x1E0D1DD90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v6;
  v54[23] = &unk_1E4F6A390;
  v30 = CFSTR("followUpEndDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v7;
  v54[24] = &unk_1E4F6A3A8;
  v29 = CFSTR("senderBucket");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55[24] = v8;
  v54[25] = &unk_1E4F6A3C0;
  v28 = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[25] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 26);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_defaultKeysForCriterionType__converterKeyDictionary;
  _defaultKeysForCriterionType__converterKeyDictionary = v10;

}

- (id)_predicateKeysForCriterion:(int64_t)a3
{
  void *v5;
  void *v6;

  -[MFMessageCriterionConverter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "messageCriterionConverter:predicateKeysForCriterionType:", self, a3);
  else
    -[MFMessageCriterionConverter _defaultKeysForCriterionType:](self, "_defaultKeysForCriterionType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_searchPredicateForCriterion:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];

  v5 = a3;
  v6 = objc_msgSend(v5, "qualifier");
  objc_msgSend(v5, "expression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = objc_msgSend(v8, "criterionType");
  v10 = 0;
  switch(v9)
  {
    case 23:
      v10 = 11;
      break;
    case 24:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
    case 34:
    case 36:
    case 37:
    case 38:
    case 39:
    case 42:
    case 43:
    case 45:
    case 50:
      break;
    case 25:
      v10 = 1;
      break;
    case 27:
      objc_msgSend(v8, "expression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MessageSenderIsVIP")) & 1) != 0)
      {
        v10 = 16;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MessageIsRead")) & 1) != 0)
      {
        v10 = 17;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MFMessageHasAttachments")) & 1) != 0)
      {
        v10 = 18;
      }
      else
      {
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MessageIsFlagged")) == 0;
        v13 = 19;
LABEL_35:
        if (v12)
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = v13;
      }
LABEL_38:

      break;
    case 28:
      v10 = 20;
      break;
    case 33:
      v10 = 9;
      break;
    case 35:
      v10 = 8;
      break;
    case 40:
      v10 = 3;
      break;
    case 41:
      v10 = 4;
      break;
    case 44:
      v10 = 36;
      break;
    case 46:
      v10 = 29;
      break;
    case 47:
      v10 = 32;
      break;
    case 48:
      v10 = 33;
      break;
    case 49:
      v10 = 31;
      break;
    case 51:
      v10 = 25;
      break;
    default:
      switch(v9)
      {
        case 1:
          objc_msgSend(v8, "criterionIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend((id)*MEMORY[0x1E0D1E5F8], "isEqual:", v11) & 1) != 0)
          {
            v10 = 15;
            goto LABEL_38;
          }
          if ((objc_msgSend((id)*MEMORY[0x1E0D1E600], "isEqual:", v11) & 1) != 0)
          {
            v10 = 3;
            goto LABEL_38;
          }
          if ((objc_msgSend((id)*MEMORY[0x1E0D1E520], "isEqual:", v11) & 1) != 0)
          {
            v10 = 4;
            goto LABEL_38;
          }
          v12 = objc_msgSend((id)*MEMORY[0x1E0D1E518], "isEqual:", v11) == 0;
          v13 = 5;
          goto LABEL_35;
        case 2:
          v10 = 10;
          break;
        case 9:
          v10 = 2;
          break;
        case 10:
          v10 = 13;
          break;
        case 11:
          v10 = 12;
          break;
        case 12:
          v10 = 14;
          break;
        default:
          goto LABEL_39;
      }
      break;
  }
LABEL_39:

  -[MFMessageCriterionConverter _predicateKeysForCriterion:](self, "_predicateKeysForCriterion:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 3;
  switch(v10)
  {
    case 0:
      +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MFMessageCriterionConverter _searchPredicateForCriterion:].cold.3();
      goto LABEL_56;
    case 1:
      objc_msgSend(v8, "criteria");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke;
      v36[3] = &unk_1E4E8DF68;
      v36[4] = self;
      objc_msgSend(v24, "ef_compactMap:", v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "allCriteriaMustBeSatisfied"))
        v25 = 1;
      else
        v25 = 2;
      -[MFMessageCriterionConverter _simplifiedCompoundPredicateOfType:forSubqueries:](self, "_simplifiedCompoundPredicateOfType:forSubqueries:", v25, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 15:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
      -[MFMessageCriterionConverter _orPredicateForAttributes:matchingValue:qualifier:](self, "_orPredicateForAttributes:matchingValue:qualifier:", v14, v7, v6);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    case 12:
    case 13:
    case 14:
    case 31:
      objc_msgSend(v8, "dateFromExpression");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageCriterionConverter _orPredicateForAttributes:matchingValue:qualifier:](self, "_orPredicateForAttributes:matchingValue:qualifier:", v14, v17, v6);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v19 = (void *)v18;

      if (!v19)
        goto LABEL_49;
      goto LABEL_47;
    case 16:
      goto LABEL_45;
    case 17:
      if (v6 == 3)
      {
        v26 = MEMORY[0x1E0C9AAB0];
      }
      else
      {
        if (v6 != 7)
        {
          +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[MFMessageCriterionConverter _searchPredicateForCriterion:].cold.2(v6, v29, v30, v31, v32, v33, v34, v35);

          v19 = 0;
          goto LABEL_49;
        }
        v26 = MEMORY[0x1E0C9AAA0];
      }
      v6 = 3;
      -[MFMessageCriterionConverter _orPredicateForAttributes:matchingValue:qualifier:](self, "_orPredicateForAttributes:matchingValue:qualifier:", v14, v26, 3);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_46:
      v19 = (void *)v16;
      if (v16)
      {
LABEL_47:
        if (v6 == 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v20;
        }
      }
LABEL_49:
      if (v19)
      {
        +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[MFMessageCriterionConverter _searchPredicateForCriterion:].cold.1();

      }
LABEL_58:

      return v19;
    case 18:
    case 19:
    case 20:
    case 22:
      v15 = v6;
LABEL_45:
      -[MFMessageCriterionConverter _orPredicateForAttributes:matchingValue:qualifier:](self, "_orPredicateForAttributes:matchingValue:qualifier:", v14, MEMORY[0x1E0C9AAB0], v15);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    case 21:
    case 23:
    case 24:
    case 26:
    case 27:
    case 28:
      goto LABEL_54;
    case 25:
      if (v6 == 8)
      {
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(", "));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "ef_map:", &__block_literal_global_87);
        v28 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
        v27 = v7;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[MFMessageCriterionConverter _orPredicateForAttributes:matchingValue:qualifier:](self, "_orPredicateForAttributes:matchingValue:qualifier:", v14, v7, v6);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    case 36:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageCriterionConverter.m"), 514, CFSTR("Criterion code is no longer supported"));
      goto LABEL_56;
    default:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_54:
        +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[MFMessageCriterionConverter _searchPredicateForCriterion:].cold.4();
LABEL_56:

      }
      v19 = 0;
      goto LABEL_58;
  }
}

id __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_searchPredicateForCriterion:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __60__MFMessageCriterionConverter__searchPredicateForCriterion___block_invoke_85(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)predicateFromMessageCriterion:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "criterionForSQL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageCriterionConverter _searchPredicateForCriterion:](self, "_searchPredicateForCriterion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_defaultCriterionTypeForKey:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  if (_defaultCriterionTypeForKey__onceToken != -1)
    dispatch_once(&_defaultCriterionTypeForKey__onceToken, &__block_literal_global_93_0);
  objc_msgSend((id)_defaultCriterionTypeForKey__converterKeyDictionary, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

void __59__MFMessageCriterionConverter__defaultCriterionTypeForKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[25];
  _QWORD v4[26];

  v4[25] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Compound");
  v3[1] = CFSTR("AnyRecipient");
  v4[0] = &unk_1E4F6A168;
  v4[1] = &unk_1E4F6A180;
  v0 = *MEMORY[0x1E0D1DD38];
  v3[2] = *MEMORY[0x1E0D1DE80];
  v3[3] = v0;
  v4[2] = &unk_1E4F6A198;
  v4[3] = &unk_1E4F6A1B0;
  v3[4] = CFSTR("BccRecipient");
  v3[5] = CFSTR("senderAddress.emailAddressValue.simpleAddress");
  v4[4] = &unk_1E4F6A1C8;
  v4[5] = &unk_1E4F6A1E0;
  v3[6] = CFSTR("Spotlight");
  v3[7] = CFSTR("body");
  v4[6] = &unk_1E4F6A1F8;
  v4[7] = &unk_1E4F6A210;
  v3[8] = CFSTR("Mailbox");
  v3[9] = CFSTR("DateReceived");
  v4[8] = &unk_1E4F6A228;
  v4[9] = &unk_1E4F6A240;
  v3[10] = CFSTR("DateSent");
  v3[11] = CFSTR("DisplayDate");
  v4[10] = &unk_1E4F6A258;
  v4[11] = &unk_1E4F6A270;
  v3[12] = CFSTR("subject.subjectWithoutPrefix");
  v3[13] = CFSTR("VIP");
  v4[12] = &unk_1E4F6A288;
  v4[13] = &unk_1E4F6A2A0;
  v3[14] = CFSTR("IsRead");
  v3[15] = CFSTR("HasAttachments");
  v4[14] = &unk_1E4F6A2B8;
  v4[15] = &unk_1E4F6A2D0;
  v3[16] = CFSTR("Flagged");
  v3[17] = CFSTR("FlagColor");
  v4[16] = &unk_1E4F6A2E8;
  v4[17] = &unk_1E4F6A300;
  v3[18] = CFSTR("readLaterDate");
  v3[19] = CFSTR("sendLaterDate");
  v4[18] = &unk_1E4F6A318;
  v4[19] = &unk_1E4F6A348;
  v3[20] = CFSTR("followUpStartDate");
  v3[21] = CFSTR("followUpEndDate");
  v4[20] = &unk_1E4F6A360;
  v4[21] = &unk_1E4F6A390;
  v3[22] = CFSTR("unsubscribeType");
  v3[23] = CFSTR("senderBucket");
  v4[22] = &unk_1E4F6A3D8;
  v4[23] = &unk_1E4F6A3A8;
  v3[24] = CFSTR("category");
  v4[24] = &unk_1E4F6A3C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_defaultCriterionTypeForKey__converterKeyDictionary;
  _defaultCriterionTypeForKey__converterKeyDictionary = v1;

}

- (int64_t)_criterionTypeForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[MFMessageCriterionConverter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v6 = objc_msgSend(v5, "messageCriterionConverter:criterionTypeForKey:", self, v4)) == 0)
  {
    v6 = -[MFMessageCriterionConverter _defaultCriterionTypeForKey:](self, "_defaultCriterionTypeForKey:", v4);
  }

  return v6;
}

- (int64_t)_criterionTypeFromExpression:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (!objc_msgSend(v4, "expressionType"))
  {
    objc_msgSend(v4, "constantValue");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "expressionType") == 3)
  {
    objc_msgSend(v4, "keyPath");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = -[MFMessageCriterionConverter _criterionTypeForKey:](self, "_criterionTypeForKey:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)_messageCriterionForComparisonPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  __CFString **v21;
  __CFString *v22;
  NSObject *p_super;
  uint64_t v24;
  MFMessageCriterion *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  MFMessageCriterion *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v52;
  _BYTE v53[16];
  _BYTE v54[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "predicateOperatorType");
  switch(v5)
  {
    case 0:
      v7 = 5;
      v8 = 5;
      break;
    case 1:
    case 3:
    case 6:
    case 7:
    case 11:
      goto LABEL_2;
    case 2:
      v7 = 6;
      v8 = 6;
      break;
    case 4:
      v8 = 3;
      v7 = 7;
      break;
    case 5:
      v8 = 7;
      v7 = 3;
      break;
    case 8:
      v7 = 1;
      v8 = 1;
      break;
    case 9:
      v7 = 2;
      v8 = 2;
      break;
    case 10:
      v7 = 8;
      v8 = 8;
      break;
    default:
      if (v5 == 100)
      {
LABEL_2:
        +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.6();

      }
      v7 = 0;
      v8 = 0;
      break;
  }
  objc_msgSend(v4, "leftExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MFMessageCriterionConverter _criterionTypeFromExpression:](self, "_criterionTypeFromExpression:", v9);

  objc_msgSend(v4, "rightExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "expressionType"))
  {
    objc_msgSend(v11, "constantValue");
    v14 = objc_claimAutoreleasedReturnValue();
    -[MFMessageCriterionConverter delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[MFMessageCriterionConverter delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageCriterionConverter:expressionForConstantValue:withCriterionType:", self, v14, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v14;
        v12 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v52 = v14;
          v12 = 0;
          v13 = 0;
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      MFCriterionExpressionForDate(v14);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v18;
LABEL_17:
    v13 = 0;
LABEL_18:
    v52 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v11, "expressionType") != 3)
  {
    +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.5((uint64_t)v54, objc_msgSend(v11, "expressionType"), v14);
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "keyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v52 = 0;
LABEL_20:
  v19 = 0;
  v20 = 9;
  switch(v10)
  {
    case 0:
      MFLogGeneral();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "ef_publicDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.3(v30, (uint64_t)v53, p_super);
      }
      goto LABEL_114;
    case 1:
      +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.1(p_super, v31, v32, v33, v34, v35, v36, v37);
      goto LABEL_114;
    case 2:
      goto LABEL_102;
    case 3:
      v19 = 0;
      v20 = 40;
      goto LABEL_102;
    case 4:
      v19 = 0;
      v20 = 41;
      goto LABEL_102;
    case 5:
      v38 = (id *)MEMORY[0x1E0D1E518];
      goto LABEL_87;
    case 6:
      +[MFMessageCriterion toMeCriterion](MFMessageCriterion, "toMeCriterion");
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 7:
      +[MFMessageCriterion ccMeCriterion](MFMessageCriterion, "ccMeCriterion");
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 8:
      v19 = 0;
      v20 = 35;
      goto LABEL_102;
    case 9:
      v19 = 0;
      v20 = 33;
      goto LABEL_102;
    case 10:
      v19 = 0;
      v20 = 2;
      goto LABEL_102;
    case 11:
      v19 = 0;
      v20 = 23;
      goto LABEL_102;
    case 12:
      v19 = 0;
      v20 = 11;
      goto LABEL_102;
    case 13:
      v19 = 0;
      v20 = 10;
      goto LABEL_102;
    case 14:
      v19 = 0;
      v20 = 12;
      goto LABEL_102;
    case 15:
      v38 = (id *)MEMORY[0x1E0D1E5F8];
      goto LABEL_87;
    case 16:
      v24 = -[NSObject BOOLValue](v13, "BOOLValue");
      if (v8 == 3)
        goto LABEL_110;
      if (v8 != 7)
      {
        +[MFMessageCriterionConverter log](MFMessageCriterionConverter, "log", v24);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.2(p_super, v44, v45, v46, v47, v48, v49, v50);
        goto LABEL_114;
      }
      v24 = v24 ^ 1;
LABEL_110:
      +[MFMessageCriterion senderIsVIPCriterion:](MFMessageCriterion, "senderIsVIPCriterion:", v24);
      p_super = objc_claimAutoreleasedReturnValue();
LABEL_111:
      v19 = 0;
      goto LABEL_116;
    case 17:
    case 19:
      v21 = MFMessageIsFlagged;
      if (v10 == 17)
        v21 = MessageIsRead;
      v22 = *v21;

      if (v13)
      {
        v19 = 0;
        if (!-[NSObject integerValue](v13, "integerValue"))
          v8 = v7;
      }
      else
      {
        v19 = 0;
      }
      v20 = 27;
      goto LABEL_101;
    case 18:
      +[MFMessageCriterion hasAttachmentsCriterion](MFMessageCriterion, "hasAttachmentsCriterion");
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 20:
      +[MFMessageCriterion criterionForFlagColor:](MFMessageCriterion, "criterionForFlagColor:", -[NSObject integerValue](v13, "integerValue"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 21:
      if (!v13)
        goto LABEL_107;
      +[MFMessageCriterion criterionForConversationID:](MFMessageCriterion, "criterionForConversationID:", -[NSObject longLongValue](v13, "longLongValue"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 22:
      if (!v13)
        goto LABEL_107;
      +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", -[NSObject BOOLValue](v13, "BOOLValue"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 23:
      v19 = 0;
      if (objc_msgSend(v4, "predicateOperatorType") == 10)
        v8 = 3;
      v20 = 24;
      if (!v12 && v13)
      {
        -[NSObject stringValue](v13, "stringValue");
        v20 = 24;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
      }
      goto LABEL_102;
    case 24:
      if (-[NSObject integerValue](v13, "integerValue") == 2)
      {
        +[MFMessageCriterion threadNotifyMessageCriterion](MFMessageCriterion, "threadNotifyMessageCriterion");
        v29 = objc_claimAutoreleasedReturnValue();
LABEL_106:
        p_super = v29;
        v19 = 0;
        goto LABEL_116;
      }
      if (-[NSObject integerValue](v13, "integerValue") == 1)
      {
        +[MFMessageCriterion threadMuteMessageCriterion](MFMessageCriterion, "threadMuteMessageCriterion");
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_106;
      }
LABEL_107:
      v19 = 0;
      p_super = 0;
LABEL_116:

      return p_super;
    case 25:
      if (v52)
      {
        -[NSObject ef_mapSelector:](v52, "ef_mapSelector:", sel_stringValue);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR(", "));
        v40 = objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v20 = 51;
LABEL_95:
        v12 = (void *)v40;
      }
      else if (v13)
      {
        -[NSObject stringValue](v13, "stringValue");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v20 = 51;
LABEL_101:
        v12 = v22;
      }
      else
      {
        v19 = 0;
        v20 = 51;
      }
LABEL_102:
      v43 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", v20, v8, v12);
      p_super = &v43->super;
      if (v19)
        -[MFMessageCriterion setCriterionIdentifier:](v43, "setCriterionIdentifier:", v19);
      goto LABEL_116;
    case 26:
      v38 = (id *)MEMORY[0x1E0D1E5B0];
LABEL_87:
      v19 = *v38;
      v20 = 1;
      goto LABEL_102;
    case 27:
      p_super = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", -[NSObject longLongValue](v13, "longLongValue"));
      v25 = [MFMessageCriterion alloc];
      -[NSObject stringValue](p_super, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MFMessageCriterion initWithType:qualifier:expression:](v25, "initWithType:qualifier:expression:", 38, v8, v26);

      goto LABEL_115;
    case 28:
      -[MFMessageCriterionConverter delegate](self, "delegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "mailAccountForIdentifier:", v12);
      p_super = objc_claimAutoreleasedReturnValue();

      +[MFMessageCriterion criterionForAccount:](MFMessageCriterion, "criterionForAccount:", p_super);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_89;
    case 29:
      v19 = 0;
      v20 = 46;
      goto LABEL_102;
    case 30:
      if (-[NSObject BOOLValue](v13, "BOOLValue"))
        v8 = 5;
      else
        v8 = 6;

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      MFCriterionExpressionForDate(v42);
      v40 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v19 = 0;
      v20 = 46;
      goto LABEL_95;
    case 31:
      v19 = 0;
      v20 = 49;
      goto LABEL_102;
    case 32:
      v19 = 0;
      v20 = 47;
      goto LABEL_102;
    case 33:
      v19 = 0;
      v20 = 48;
      goto LABEL_102;
    case 34:
      +[MFMessageCriterion followUpMessageCriterion](MFMessageCriterion, "followUpMessageCriterion");
      p_super = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject BOOLValue](v13, "BOOLValue") & 1) != 0)
        goto LABEL_111;
      +[MFMessageCriterion notCriterionWithCriterion:](MFMessageCriterion, "notCriterionWithCriterion:", p_super);
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_89:
      v27 = v28;
      goto LABEL_115;
    case 35:
      +[MFMessageCriterion messageCriterionForUnsubscribeTypeNotMatching:](MFMessageCriterion, "messageCriterionForUnsubscribeTypeNotMatching:", -[NSObject integerValue](v13, "integerValue"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    case 36:
      +[MFMessageCriterion criterionForCategoryType:](MFMessageCriterion, "criterionForCategoryType:", -[NSObject unsignedLongValue](v13, "unsignedLongValue"));
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    default:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        MFLogGeneral();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
          -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:].cold.4();
LABEL_114:
        v27 = 0;
LABEL_115:

        v19 = 0;
        p_super = v27;
      }
      else
      {
        p_super = 0;
      }
      goto LABEL_116;
  }
}

- (id)_messageCriterionForCompoundPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[5];

  v4 = a3;
  objc_msgSend(v4, "subpredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__MFMessageCriterionConverter__messageCriterionForCompoundPredicate___block_invoke;
  v22[3] = &unk_1E4E8DFD0;
  v22[4] = self;
  objc_msgSend(v5, "ef_compactMap:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "compoundPredicateType");
  if (v7)
  {
    if (v7 == 1)
    {
      +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      +[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v8;
      goto LABEL_16;
    }
LABEL_14:
    v9 = 0;
    goto LABEL_16;
  }
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFMessageCriterionConverter _messageCriterionForCompoundPredicate:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_14;
  }
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "qualifier")
    || (objc_msgSend(v9, "criteria"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11 > 1))
  {
    +[MFMessageCriterion notCriterionWithCriterion:](MFMessageCriterion, "notCriterionWithCriterion:", v9);
    v20 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v20;
  }
  else
  {
    objc_msgSend(v9, "setQualifier:", 4);
  }
LABEL_16:

  return v9;
}

id __69__MFMessageCriterionConverter__messageCriterionForCompoundPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "messageCriterionFromPredicate:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messageCriterionFromPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;

  v4 = a3;
  if (objc_msgSend(v4, "ef_matchesEverything"))
  {
    +[MFMessageCriterion matchEverythingCriterion](MFMessageCriterion, "matchEverythingCriterion");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v5;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "ef_matchesNothing"))
  {
    +[MFMessageCriterion matchNothingCriterion](MFMessageCriterion, "matchNothingCriterion");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMessageCriterionConverter _messageCriterionForCompoundPredicate:](self, "_messageCriterionForCompoundPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMessageCriterionConverter _messageCriterionForComparisonPredicate:](self, "_messageCriterionForComparisonPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MFMessageCriterionConverter messageCriterionFromPredicate:].cold.1();

  v6 = 0;
LABEL_10:

  return v6;
}

- (id)messageCriterionFromPredicateFormatString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MFMessageCriterionConverter messageCriterionFromPredicate:](self, "messageCriterionFromPredicate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MFMessageCriterionConverterDelegate)delegate
{
  return (MFMessageCriterionConverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_predicateForKey:(uint64_t)a3 value:(uint64_t)a4 qualifier:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "Received unhandled MessageRuleQualifier value:%d - assuming contains", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_searchPredicateForCriterion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1A4F90000, v1, OS_LOG_TYPE_DEBUG, "Returning criterion:%@ result:%@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_searchPredicateForCriterion:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "Received unexpected qualifier %d for MessageIsRead criterion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_searchPredicateForCriterion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "Received unknown criterion type for criterion: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_searchPredicateForCriterion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "Attempted to handle unsupported criterion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageCriterionForComparisonPredicate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "Compound Criterion should not appear here - should be an NSCompoundPredicate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_messageCriterionForComparisonPredicate:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "VIP criterion should be 'equal to' or 'not equal to'", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_messageCriterionForComparisonPredicate:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Received unknown criterion type for predicate: %@", (uint8_t *)a2);

}

- (void)_messageCriterionForComparisonPredicate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "Attempted to handle unsupported predicate %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageCriterionForComparisonPredicate:(NSObject *)a3 .cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Unsupported expressionType:%lu", (uint8_t *)a1);
}

- (void)_messageCriterionForComparisonPredicate:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "Received unhandled NSPredicateOperatorType value:%lu - assuming contains", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_messageCriterionForCompoundPredicate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "#MailServices Cannot currently handle a NOT predicate with more than one sub", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)messageCriterionFromPredicate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "Got unexpected Predicate: %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
