@implementation FHInferenceController

- (FHInferenceController)initWithACDawTicket:(id)a3
{
  id v5;
  FHInferenceController *v6;
  NSNumberFormatter *v7;
  NSNumberFormatter *numberFormatter;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  FHDatabaseEntity *transactionAndFeauturesEntities;
  uint64_t v16;
  FHDatabaseEntity *transactionsEntities;
  id v18;
  uint64_t v19;
  FHDatabaseEntity *accountEntities;
  NSArray *selectFieldsForTransactionsAndFeatures;
  NSDateFormatter *v22;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v24;
  void *v25;
  NSDateFormatter *v26;
  NSDateFormatter *monthOnlyDateFormatter;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FHInferenceController;
  v6 = -[FHInferenceController init](&v29, sel_init);
  if (v6)
  {
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v6->_numberFormatter;
    v6->_numberFormatter = v7;

    -[NSNumberFormatter setPositiveFormat:](v6->_numberFormatter, "setPositiveFormat:", CFSTR("0.##"));
    v9 = objc_alloc(MEMORY[0x24BE315E8]);
    v10 = *MEMORY[0x24BE31590];
    v12 = *MEMORY[0x24BE31588];
    v30[0] = *MEMORY[0x24BE315A0];
    v11 = v30[0];
    v30[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "initWithLeftJoinKey:entities:", v10, v13);
    transactionAndFeauturesEntities = v6->_transactionAndFeauturesEntities;
    v6->_transactionAndFeauturesEntities = (FHDatabaseEntity *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE315E8]), "initWithEntity:", v11);
    transactionsEntities = v6->_transactionsEntities;
    v6->_transactionsEntities = (FHDatabaseEntity *)v16;

    v18 = objc_alloc(MEMORY[0x24BE315E8]);
    v19 = objc_msgSend(v18, "initWithEntity:", *MEMORY[0x24BE31410]);
    accountEntities = v6->_accountEntities;
    v6->_accountEntities = (FHDatabaseEntity *)v19;

    selectFieldsForTransactionsAndFeatures = v6->_selectFieldsForTransactionsAndFeatures;
    v6->_selectFieldsForTransactionsAndFeatures = (NSArray *)&unk_250C77D50;

    objc_storeStrong((id *)&v6->_acDawTicket, a3);
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v22;

    -[NSDateFormatter setDateFormat:](v6->_dateFormatter, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    v24 = v6->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v24, "setTimeZone:", v25);

    v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    monthOnlyDateFormatter = v6->_monthOnlyDateFormatter;
    v6->_monthOnlyDateFormatter = v26;

    -[NSDateFormatter setDateFormat:](v6->_monthOnlyDateFormatter, "setDateFormat:", CFSTR("MMMM yyyy"));
  }

  return v6;
}

- (void)streamingBillPaymentInferenceSuggestionWithQuery:(id)a3 accountSummary:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7
{
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = a7;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n\n\nAppleCard account: <%@>"), a3, a4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v21[0] = CFSTR("role");
    v21[1] = CFSTR("content");
    v22[0] = CFSTR("ROLE_USER");
    v22[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  v17 = v16;
  v20 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = a6;
  -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](self, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v18, a5, v13, v19);

}

- (void)streamingInsightsInferenceResponseWithQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  double v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v30;
  id v31;
  _QWORD *v32;
  int64_t v33;
  float v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[4];
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[12];

  v42[10] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = dispatch_group_create();
  -[FHInferenceController _getAccountsByAccountType:](self, "_getAccountsByAccountType:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("Your task is the following:");
  v42[2] = CFSTR("- Extract the intent of the question, and assign a category. The intent rules are as follows:");
  v42[3] = CFSTR("  - If the question contains AppleCard reference, general spending habits, purchases, spending or general finances or about products/restaurants/services/merchants, then the category is AppleCard");
  v42[4] = CFSTR("  - If the question is about cash or money sent, received or requested, the category is AppleCash");
  v14 = objc_msgSend(v13, "count");
  v15 = CFSTR("  - If the question is about Discover card, the category is BankConnect");
  if (!v14)
    v15 = &stru_250C751F8;
  v42[5] = v15;
  v16 = objc_msgSend(v13, "count");
  v17 = CFSTR("  - If the question is about Debit card, the category is BankConnect");
  if (!v16)
    v17 = &stru_250C751F8;
  v42[6] = v17;
  v42[7] = CFSTR("  - If the question cannot be assigned to either card or cash category, then the category is Unknown");
  v42[8] = CFSTR("- Make sure response is limited to one sentence.");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = CFSTR("role");
  v40[1] = CFSTR("content");
  v41[0] = CFSTR("ROLE_USER");
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  dispatch_group_enter(v12);
  v39 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke;
  v35[3] = &unk_250C746C8;
  v37 = v38;
  v24 = v12;
  v36 = v24;
  *(float *)&v25 = a5;
  -[FHInferenceController queryWithAlternatingRoles:modelId:temperature:completion:](self, "queryWithAlternatingRoles:modelId:temperature:completion:", v22, a4, v35, v25);

  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke_114;
  block[3] = &unk_250C746F0;
  block[4] = self;
  v30 = v10;
  v32 = v38;
  v33 = a4;
  v34 = a5;
  v31 = v11;
  v26 = v11;
  v27 = v10;
  dispatch_group_notify(v24, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v38, 8);
}

void __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  FinHealthLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_23B4E6000, v4, OS_LOG_TYPE_DEBUG, "response: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3)
  {
    if ((objc_msgSend(v3, "containsString:", CFSTR("AppleCard")) & 1) != 0)
    {
      v5 = 1;
LABEL_10:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
      goto LABEL_11;
    }
    if ((objc_msgSend(v3, "containsString:", CFSTR("AppleCash")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if (objc_msgSend(v3, "containsString:", CFSTR("BankConnect")))
    {
      v5 = 3;
      goto LABEL_10;
    }
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke_114(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  switch(v2)
  {
    case 3:
      return objc_msgSend(*(id *)(a1 + 32), "_streamBankConnectTransactionsWithSingleQuery:modelId:temperature:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(float *)(a1 + 72));
    case 2:
      v5 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 64);
      LODWORD(a2) = *(_DWORD *)(a1 + 72);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 0;
      return objc_msgSend(v5, "_streamCashTransactionsWithSingleQuery:modelId:temperature:delegate:error:", v4, v6, v7, &v8, a2);
    case 1:
      return objc_msgSend(*(id *)(a1 + 32), "_streamCardTransactionsWithSingleQuery:modelId:temperature:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(float *)(a1 + 72));
    default:
      LODWORD(a2) = *(_DWORD *)(a1 + 72);
      return objc_msgSend(*(id *)(a1 + 32), "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), a2);
  }
}

- (void)_streamCashTransactionsWithSingleQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  -[FHInferenceController _formattedAppleCashTransactionsWithStartDate:endDate:](self, "_formattedAppleCashTransactionsWithStartDate:endDate:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v29[1] = CFSTR("- Analyze the statement.");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Answer the question: \"%@\"."), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v15;
    v29[3] = CFSTR("Make sure the answer is 1 paragraph without formatting, unless the user asks for formatting.");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    FinHealthLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_23B4E6000, v18, OS_LOG_TYPE_DEBUG, "userMessageContents: %@", buf, 0xCu);

    }
    v25[0] = CFSTR("role");
    v25[1] = CFSTR("content");
    v26[0] = CFSTR("ROLE_USER");
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = a5;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](self, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v22, a4, v13, v23);

  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE31478], 10015, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (void)streamingHighlightsInferenceResponseWithFollowupQuery:(id)a3 previousResponse:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a7;
  -[FHInferenceController _monthlyHighlightsWithModelId:](self, "_monthlyHighlightsWithModelId:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v17 = 250;
    if (a5 == 2)
      v17 = 150;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    FinHealthLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_23B4E6000, v19, OS_LOG_TYPE_DEBUG, "highlightsContent: %@", buf, 0xCu);
    }

    if (v12 | v13)
    {
      v32[0] = CFSTR("role");
      v32[1] = CFSTR("content");
      v33[0] = CFSTR("ROLE_USER");
      v33[1] = v18;
      v26 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = CFSTR("role");
      v30[1] = CFSTR("content");
      v31[0] = CFSTR("ROLE_ASSISTANT");
      v31[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = CFSTR("role");
      v28[1] = CFSTR("content");
      v29[0] = CFSTR("ROLE_USER");
      v29[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v20;
      v27[1] = v21;
      v27[2] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v24 = a6;
      -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](self, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v23, a5, v14, v24);

      v18 = v26;
    }
    else
    {
      v35[0] = CFSTR("role");
      v35[1] = CFSTR("content");
      v36[0] = CFSTR("ROLE_USER");
      v36[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v25 = a6;
      -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](self, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v21, a5, v14, v25);
    }

  }
  else
  {
    *(float *)&v16 = a6;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](self, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", 0, a5, v14, v16);
  }

}

- (void)streamingMerchantProductsAndServicesWithModelId:(int64_t)a3 temperature:(float)a4 delegate:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  double v22;
  NSObject *v23;
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
  double v34;
  void *v35;
  FHInferenceController *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[7];
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v38 = a5;
  v36 = self;
  -[FHInferenceController _monthlyStatementsWithAccountType:sourceIdentifier:](self, "_monthlyStatementsWithAccountType:sourceIdentifier:", 2, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    v39 = v8;
    do
    {
      v42 = v10;
      objc_msgSend(v8, "objectAtIndex:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKey:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v16, "objectAtIndex:", 4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("n/a")))
            {
              v18 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v16, "objectAtIndex:", 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringWithFormat:", CFSTR("- %@"), v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "addObject:", v20);
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        }
        while (v13);
      }

      v8 = v39;
      v21 = objc_msgSend(v39, "count");
      if (v42 > 4)
        break;
      v10 = v42 + 1;
    }
    while (v42 + 1 < v21);
  }
  if (objc_msgSend(v9, "count"))
  {
    FinHealthLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v25;
      _os_log_impl(&dword_23B4E6000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v50[1] = CFSTR("Your task is the following:");
    v50[2] = CFSTR("- Find at least 3 products sold or services offered.");
    v50[3] = CFSTR("- Exclude harmful products or services such as alcohol, tobacco and firearms.");
    v50[4] = CFSTR("- The score range is [0.0 - 0.99999].");
    v50[5] = CFSTR("- The output must be human readable and must follow the format: ||merchant name:product1;score1|product2;score2||\n###. Therefore your response must not contain any kind of code in any programming language.");
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = CFSTR("role");
    v48[1] = CFSTR("content");
    v49[0] = CFSTR("ROLE_USER");
    objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v34 = a4;
    v35 = v38;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v36, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v33, a3, v38, v34);

  }
  else
  {
    *(float *)&v22 = a4;
    v35 = v38;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v36, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", 0, a3, v38, v22);
  }

}

uint64_t __94__FHInferenceController_streamingMerchantProductsAndServicesWithModelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (void)streamingQueryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  FHInferenceFMAPIClient *v13;
  double v14;
  int v15;
  int64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a3;
  FinHealthLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218240;
    v16 = a4;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_23B4E6000, v12, OS_LOG_TYPE_DEBUG, "modelId: %lu, temperature: %f", (uint8_t *)&v15, 0x16u);
  }

  v13 = -[FHInferenceFMAPIClient initWithDelegate:acDawTicket:]([FHInferenceFMAPIClient alloc], "initWithDelegate:acDawTicket:", v10, self->_acDawTicket);
  *(float *)&v14 = a5;
  -[FHInferenceFMAPIClient sendPromptWithAlternatingRoles:modelId:temperature:](v13, "sendPromptWithAlternatingRoles:modelId:temperature:", v11, a4, v14);

}

- (void)queryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  const __CFString *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  FinHealthLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a5;
    _os_log_impl(&dword_23B4E6000, v12, OS_LOG_TYPE_DEBUG, "modelId: %lu, temperature: %f", buf, 0x16u);
  }

  v13 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionWithConfiguration:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)a4 > 2)
    v16 = (id *)MEMORY[0x24BE314F8];
  else
    v16 = (id *)qword_250C748E0[a4];
  v17 = *v16;
  v18 = v17;
  if (v10 && v17 && objc_msgSend(v10, "count"))
  {
    v35 = CFSTR("temperature");
    *(float *)&v19 = a5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("acack=%@"), self->_acDawTicket);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x24BDD16B0]);
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Accept"));
    objc_msgSend(v23, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", v22, CFSTR("Cookie"));
    v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("model"));
    objc_msgSend(v24, "setObject:forKey:", v10, CFSTR("messages"));
    objc_msgSend(v24, "setObject:forKey:", v21, CFSTR("options"));
    objc_msgSend(v24, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("enable_logging"));
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BE314E8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setURL:", v25);

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v24, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHTTPBody:", v26);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    v34 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __82__FHInferenceController_queryWithAlternatingRoles_modelId_temperature_completion___block_invoke;
    v28[3] = &unk_250C74738;
    v30 = buf;
    v29 = v11;
    objc_msgSend(v15, "dataTaskWithRequest:completionHandler:", v23, v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resume");

    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __82__FHInferenceController_queryWithAlternatingRoles_modelId_temperature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = objc_msgSend(a3, "statusCode");
  if (v9 == 200)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    objc_msgSend(v10, "objectForKey:", CFSTR("messages"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      -[NSObject firstObject](v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("content"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

      }
    }
  }
  else
  {
    v19 = v9;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 1);
    FinHealthLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v23 = v19;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_23B4E6000, v13, OS_LOG_TYPE_DEBUG, "Failed with code: %lu, errorContent: %@, error: %@", buf, 0x20u);

    }
    v11 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_streamCardTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  id v62;
  unint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  id obj;
  id obja;
  id v75;
  FHInferenceController *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[11];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = self;
  -[FHInferenceController _monthlyStatementsWithAccountType:sourceIdentifier:](self, "_monthlyStatementsWithAccountType:sourceIdentifier:", 2, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_181);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v63 = a4;
  v15 = 150;
  if (a4 == 2)
    v15 = 70;
  v70 = v15;
  v65 = v14;
  v62 = v10;
  if (objc_msgSend(v14, "count"))
  {
    v16 = 0;
    v17 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x24BDAC760];
      v83[1] = 3221225472;
      v83[2] = __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
      v83[3] = &unk_250C74780;
      v83[4] = v76;
      objc_msgSend(v19, "sortedArrayUsingComparator:", v83);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      obj = v20;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      if (v21)
      {
        v22 = v21;
        v67 = v19;
        v68 = v18;
        v69 = v17;
        v77 = *(_QWORD *)v80;
        while (2)
        {
          v23 = 0;
          v71 = v16;
          if (v70 >= v16)
            v24 = v70 - v16;
          else
            v24 = 0;
          do
          {
            if (*(_QWORD *)v80 != v77)
              objc_enumerationMutation(obj);
            if (v24 == v23)
            {
              v16 = v71 + v23;
              goto LABEL_21;
            }
            v25 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v23);
            objc_msgSend(v25, "objectAtIndex:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndex:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndex:", 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndex:", 3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@,%@,%@"), v26, v27, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObject:", v30);

            -[NSDateFormatter dateFromString:](v76->_dateFormatter, "dateFromString:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "compare:", v31) == 1)
            {
              v32 = v31;
              v33 = v11;
              v11 = v32;

            }
            if (objc_msgSend(v12, "compare:", v31) == -1)
            {
              v34 = v31;
              v35 = v12;
              v36 = v11;
              v37 = v34;

              v38 = v37;
              v11 = v36;
              v12 = v38;
            }

            ++v23;
          }
          while (v22 != v23);
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
          v16 = v71 + v23;
          if (v22)
            continue;
          break;
        }
LABEL_21:
        v14 = v65;
        v18 = v68;
        v17 = v69;
        v19 = v67;
      }

      v39 = objc_msgSend(v14, "count");
      if (v17 > 0xE)
        break;
      if (++v17 >= v39)
        break;
    }
    while (v16 < v70);
  }
  if (v63 == 2)
    v40 = 150;
  else
    v40 = 250;
  v41 = (void *)MEMORY[0x24BDD17C8];
  -[NSDateFormatter stringFromDate:](v76->_dateFormatter, "stringFromDate:", v11);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v76->_dateFormatter, "stringFromDate:", v12);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v72;
  v87[1] = CFSTR("Your task is the following:");
  v87[2] = CFSTR("- Analyze the transactions.");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Answer the following question asked by the user: \"%@\"."), v64);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v42;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Limit your answer to %lu words."), v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v43;
  v44 = (void *)MEMORY[0x24BDD17C8];
  -[NSDateFormatter stringFromDate:](v76->_dateFormatter, "stringFromDate:", v11);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](v76->_dateFormatter, "stringFromDate:", v12);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("Ensure the user knows that the dates covered are between %@ and %@ due to the current model limitations."), v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v47;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Do not add comments, and only allow bulleted list formatting"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v48;
  v87[7] = CFSTR("- Minimize mathematical operations such as sums or totals, and inform the user that the model has limited support for mathematical operations since it's still in the beta phase.");
  objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v11;
  if (!objc_msgSend(v11, "compare:", v51))
  {
    v54 = v12;

    v57 = v62;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v12;
  v55 = objc_msgSend(v12, "compare:", v53);

  v57 = v62;
  if (!v55)
  {
LABEL_32:
    *(float *)&v56 = a5;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v76, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", 0, v63, v57, v56);
    goto LABEL_33;
  }
  v85[0] = CFSTR("role");
  v85[1] = CFSTR("content");
  v86[0] = CFSTR("ROLE_USER");
  objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v61 = a5;
  -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v76, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v60, v63, v62, v61);

LABEL_33:
}

uint64_t __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

BOOL __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  objc_msgSend(a2, "objectAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v6, "objectAtIndex:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateFromString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "compare:", v11) == -1;
  return v12;
}

- (void)_summarizationAndStreamWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  void *v8;
  float v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
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
  id v29;
  void *v30;
  id v31;
  id v32;
  double v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v39;
  void *v40;
  NSObject *group;
  void *v43;
  void *v44;
  unint64_t i;
  _QWORD block[4];
  id v47;
  FHInferenceController *v48;
  id v49;
  _QWORD *v50;
  _QWORD *v51;
  unint64_t v52;
  double v53;
  _QWORD v54[4];
  id v55;
  FHInferenceController *v56;
  id v57;
  id v58;
  NSObject *v59;
  _QWORD *v60;
  _QWORD *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  id v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[7];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v36 = a6;
  group = dispatch_group_create();
  v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__1;
  v68[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__1;
  v66[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  -[FHInferenceController _monthlyStatementsWithAccountType:sourceIdentifier:](self, "_monthlyStatementsWithAccountType:sourceIdentifier:", 2, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_204);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; ++i)
  {
    v10 = objc_msgSend(v43, "count");
    if (i > 0xF || i >= v10)
      break;
    objc_msgSend(v43, "objectAtIndex:");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v11;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("merchant name,amount,transaction date,merchant category"));
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v13, "appendString:", CFSTR("\n"));
          objc_msgSend(v18, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appendFormat:", CFSTR("%@,%@,%@,%@"), v19, v20, v21, v22);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v15);
    }

    v23 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v44, "doubleValue");
    objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = CFSTR("Your task is the following:");
    v73[1] = CFSTR("- Analyze the transactions");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Answer the following question asked by the user: \"%@\"), v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v25;
    v73[3] = CFSTR("Do not add comments.");
    v26 = (void *)objc_msgSend(v13, "copy");
    v73[5] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v71[0] = CFSTR("role");
      v71[1] = CFSTR("content");
      v72[0] = CFSTR("ROLE_USER");
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    }
    dispatch_group_enter(group);
    v70 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
    v54[3] = &unk_250C747C8;
    v31 = v29;
    v55 = v31;
    v56 = self;
    v32 = v24;
    v57 = v32;
    v58 = v37;
    v60 = v68;
    v61 = v66;
    v59 = group;
    v9 = a5;
    *(float *)&v33 = v9;
    -[FHInferenceController queryWithAlternatingRoles:modelId:temperature:completion:](self, "queryWithAlternatingRoles:modelId:temperature:completion:", v30, a4, v54, v33);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_212;
  block[3] = &unk_250C747F0;
  v47 = v37;
  v48 = self;
  v50 = v68;
  v51 = v66;
  v52 = a4;
  v53 = a5;
  v49 = v36;
  v34 = v36;
  v35 = v37;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

}

uint64_t __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    FinHealthLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_23B4E6000, v4, OS_LOG_TYPE_DEBUG, "userMessage: %@, response: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "stringFromDate:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v3, v6);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "compare:", *(_QWORD *)(a1 + 48)) == 1)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "compare:", *(_QWORD *)(a1 + 48)) == -1)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_212(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  double v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = a1;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(*(id *)(v3 + 32), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "appendFormat:", CFSTR("\n\n######## %@###########\n\n: %@\\n\\n\\n"), v8, v12);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v5);
  }

  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + 64), "stringFromDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 40) + 64), "stringFromDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v17;
  v36[1] = CFSTR("If the results span more than one month, display the results in chronological order.");
  v36[2] = CFSTR("Do not display irrelevant responses or responses that have no significant results.");
  v36[3] = CFSTR("If some responses are similar or look like duplicated, combine them into one.");
  v18 = (void *)MEMORY[0x24BDD17C8];
  v19 = v2;
  v20 = (void *)objc_msgSend(v2, "copy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = CFSTR("role");
  v34[1] = CFSTR("content");
  v35[0] = CFSTR("ROLE_USER");
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = *(void **)(v14 + 40);
  v33 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(double *)(v14 + 80);
  *(float *)&v27 = v27;
  objc_msgSend(v25, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v26, *(_QWORD *)(v14 + 72), *(_QWORD *)(v14 + 48), v27);

}

- (id)_monthlyHighlightsWithModelId:(unint64_t)a3
{
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  char *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  FHInferenceController *v39;
  void *v40;
  void *v41;
  id obj;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
    v4 = 18;
  else
    v4 = 30;
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  +[FHInsightsFetcher sharedInstance](FHInsightsFetcher, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FHDateStartOfMonth();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = objc_claimAutoreleasedReturnValue();
  v40 = v5;
  objc_msgSend(v5, "appendString:", CFSTR("current period,previous period,amount spent,delta,merchant category\n"));
  v9 = 0;
  v10 = 0;
  v38 = v4;
  v39 = self;
  do
  {
    v37 = v10;
    v58[0] = CFSTR("FHInsightTypeCategorySpend");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)v8;
    objc_msgSend(v36, "retrieveSpendInsightsWithStartDate:endDate:insightTypeItems:trendWindow:", v7, v8, v11, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v12;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v50)
    {
      v49 = *(_QWORD *)v52;
      v41 = v7;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v52 != v49)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v14, "direction"))
          {
            if ((unint64_t)v9 >= v4)
              goto LABEL_20;
            objc_msgSend(v14, "type");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v7);
            v16 = objc_claimAutoreleasedReturnValue();
            -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v48);
            v17 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("FHInsightTypeCategorySpend")))
            {
              v45 = v15;
              v47 = v9;
              v18 = v14;
              objc_msgSend(v18, "merchantCategory");
              FHMerchantCategoryToString();
              v19 = objc_claimAutoreleasedReturnValue();
              FHDateStartOfLastMonth();
              v20 = objc_claimAutoreleasedReturnValue();
              -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)v20;
              FHDateEndOfMonth();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v18, "spendAmount");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "spendingInsightAmount");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)v19;
              v35 = v19;
              v34 = v17;
              v26 = (void *)v17;
              v27 = (void *)v16;
              objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ - %@,%@ - %@,%@,%@,%@\n"), v16, v34, v21, v22, v24, v25, v35);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              FinHealthLogObject();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v28;
                _os_log_impl(&dword_23B4E6000, v29, OS_LOG_TYPE_DEBUG, "monthlyHighlight: %@", buf, 0xCu);
              }
              v30 = v47 + 1;

              objc_msgSend(v40, "appendString:", v28);
              v4 = v38;
              self = v39;
              v7 = v41;
              v15 = v45;
            }
            else
            {
              v30 = v9;
              v26 = (void *)v17;
              v27 = (void *)v16;
            }

            v9 = v30;
          }
        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v50);
    }
LABEL_20:

    FHDateStartOfLastMonth();
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    FHDateEndOfMonth();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37 > 0xE)
      break;
    v10 = v37 + 1;
    v7 = v31;
    v8 = (uint64_t)v32;
  }
  while ((unint64_t)v9 < v4);
  if (v9)
    v9 = (char *)objc_msgSend(v40, "copy");

  return v9;
}

- (id)_yearlyHighlights
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  id obj;
  char *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  +[FHInsightsFetcher sharedInstance](FHInsightsFetcher, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FHStartOfYear();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", CFSTR("current period,previous period,amount spent,delta,merchant category\n"));
  v6 = 0;
  v7 = 0;
  v31 = v2;
  do
  {
    v30 = v7;
    v47[0] = CFSTR("FHInsightTypeCategorySpend");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "retrieveSpendInsightsWithStartDate:endDate:insightTypeItems:trendWindow:", v4, v5, v8, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v5;
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      v32 = *(_QWORD *)v41;
      v33 = v4;
      do
      {
        v13 = 0;
        v37 = v11;
        do
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
          if (objc_msgSend(v14, "direction"))
          {
            objc_msgSend(v14, "type");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("FHInsightTypeCategorySpend")))
            {
              v39 = v6;
              v16 = v14;
              objc_msgSend(v16, "merchantCategory");
              FHMerchantCategoryToString();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              FHStartOfLastYear();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v16, "spendAmount");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "spendingInsightAmount");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ - %@,%@ - %@,%@,%@,%@\n"), v36, v35, v19, v36, v21, v22, v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              FinHealthLogObject();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v23;
                _os_log_impl(&dword_23B4E6000, v24, OS_LOG_TYPE_DEBUG, "yearlyHighlight: %@", buf, 0xCu);
              }
              v6 = v39 + 1;

              v2 = v31;
              objc_msgSend(v31, "appendString:", v23);

              v12 = v32;
              v4 = v33;
              v11 = v37;
            }

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v11);
    }

    FHDateFromNumberOfDays();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    FHStartOfLastYear();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v30 + 1;
    v4 = v26;
    v5 = (uint64_t)v25;
  }
  while (v30 != 2);
  if (v6)
    v6 = (char *)objc_msgSend(v2, "copy");

  return v6;
}

- (id)_monthlyStatementsWithAccountType:(int64_t)a3 sourceIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  FHDatabaseEntity *transactionAndFeauturesEntities;
  uint64_t v14;
  NSArray *selectFieldsForTransactionsAndFeatures;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(id *, void *, uint64_t, char);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[4];
  id v29;
  int64_t v30;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = (void *)MEMORY[0x24BE315E0];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke;
  v28[3] = &unk_250C74818;
  v30 = a3;
  v10 = v6;
  v29 = v10;
  objc_msgSend(v9, "initWithBuilder:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_initWeak(&location, self);
  transactionAndFeauturesEntities = self->_transactionAndFeauturesEntities;
  v14 = *MEMORY[0x24BE31500];
  selectFieldsForTransactionsAndFeatures = self->_selectFieldsForTransactionsAndFeatures;
  v20 = v8;
  v21 = 3221225472;
  v22 = __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke_2;
  v23 = &unk_250C74840;
  objc_copyWeak(&v26, &location);
  v16 = v7;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:selectFields:usingBlock:](transactionAndFeauturesEntities, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", v11, v14, selectFieldsForTransactionsAndFeatures, &v20);
  v18 = (void *)objc_msgSend(v17, "copy", v20, v21, v22, v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

void __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *MEMORY[0x24BE31420];
  objc_msgSend(v4, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31420], CFSTR("transactions.t_type"), 0);
  objc_msgSend(v4, "addIntegerClause:fieldName:expression:", v3, CFSTR("transactions.t_status"), 1);
  objc_msgSend(v4, "addIntegerClause:fieldName:expression:", v3, CFSTR("transactions.a_type"), *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40) == 4)
    objc_msgSend(v4, "addStringClause:fieldName:expression:", v3, CFSTR("transactions.t_source_identifier"), *(_QWORD *)(a1 + 32));

}

void __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke_2(id *a1, void *a2, uint64_t a3, char a4)
{
  id v6;
  id *WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[6];
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v8 = a1[4];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 365);
  objc_msgSend(a1[4], "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && (a4 & 1) == 0)
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "components:fromDate:", 12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[7], "stringFromDate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "compare:", v11) == 1)
    {
      objc_msgSend(v6, "objectAtIndex:", 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectAtIndex:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v22 = (void *)MEMORY[0x24BDD1518];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v21 / 100.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "decimalNumberWithString:", v23);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 == 11796.0)
      {
        FinHealthLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v6;
          _os_log_impl(&dword_23B4E6000, v24, OS_LOG_TYPE_DEBUG, "Transaction entry : %@", buf, 0xCu);
        }

      }
      objc_msgSend(v6, "objectAtIndex:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unsignedIntegerValue");

      FHMerchantCategoryToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lowercaseString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectAtIndex:", 7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringValue");
      v28 = objc_claimAutoreleasedReturnValue();

      v56 = v11;
      v53 = (void *)v28;
      v50 = v16;
      if (v28)
      {
        objc_msgSend(MEMORY[0x24BE31678], "reconstructCompoundFeatures:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE31568]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v49 = v29;
          v51 = v17;
          objc_msgSend(v30, "valueForKey:", CFSTR("featureLabel"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (SELF CONTAINS[cd] %@)"), v57);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "filteredArrayUsingPredicate:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "allObjects");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v36, "count") < 2)
          {
            if (objc_msgSend(v36, "count") == 1)
            {
              objc_msgSend(v36, "firstObject");
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v40 = CFSTR("n/a");
            }
          }
          else
          {
            v48 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v36, "firstObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "lastObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("%@;%@"), v37, v38);
            v39 = objc_claimAutoreleasedReturnValue();

            v40 = (__CFString *)v39;
          }
          v29 = v49;

          v17 = v51;
        }
        else
        {
          v40 = CFSTR("n/a");
        }

      }
      else
      {
        v40 = CFSTR("n/a");
      }
      v52 = v40;
      v59[0] = v58;
      objc_msgSend(v54, "stringValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v41;
      v59[2] = v17;
      v59[3] = v57;
      -[__CFString lowercaseString](v40, "lowercaseString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v59[4] = v42;
      v59[5] = v55;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 6);
      v43 = v17;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_alloc(MEMORY[0x24BDD1518]);
      objc_msgSend(a1[4], "dateFromComponents:", v50);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSinceReferenceDate");
      v47 = (void *)objc_msgSend(v45, "initWithDouble:");

      objc_msgSend(a1[5], "safelyAddObjectToArrayCollection:forKey:", v44, v47);
      v17 = v43;
      v16 = v50;

      v11 = v56;
    }

  }
}

- (id)_formattedAppleCashTransactionsWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  FHDatabaseEntity *transactionsEntities;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE315E0];
  v10 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke;
  v36[3] = &unk_250C74628;
  v11 = v6;
  v37 = v11;
  v12 = v7;
  v38 = v12;
  objc_msgSend(v9, "initWithBuilder:", v36);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_initWeak(&location, self);
  transactionsEntities = self->_transactionsEntities;
  v16 = *MEMORY[0x24BE31500];
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_2;
  v31[3] = &unk_250C74840;
  objc_copyWeak(&v34, &location);
  v17 = v8;
  v32 = v17;
  v18 = v14;
  v33 = v18;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:selectFields:usingBlock:](transactionsEntities, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", v13, v16, &unk_250C77D68, v31);
  v28 = (void *)v13;
  v29 = v12;
  v30 = v11;
  objc_msgSend(v18, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_277);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("date(mm/dd/yyyy),amount,sent/received/requested,phone number\n"));
  for (i = 0; i < objc_msgSend(v20, "count"); ++i)
  {
    objc_msgSend(v20, "objectAtIndex:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "appendString:", v25);
    objc_msgSend(v21, "appendString:", CFSTR("\n"));

  }
  v26 = (void *)objc_msgSend(v21, "copy");

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v26;
}

void __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x24BE31428], CFSTR("transactions.t_date"));
    v3 = *MEMORY[0x24BE31430];
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x24BE31430], CFSTR("transactions.t_date"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addDateClause:fieldName:expression:", v3, CFSTR("transactions.t_date"), v4);

    }
  }
  objc_msgSend(v5, "addIntegerClause:fieldName:expression:", *MEMORY[0x24BE31420], CFSTR("transactions.t_type"), 3);

}

void __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_2(id *a1, void *a2, uint64_t a3, char a4)
{
  id *WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v7 = a1[4];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 28, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - 365);
  objc_msgSend(a1[4], "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained && (a4 & 1) == 0)
  {
    objc_msgSend(v33, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v33, "objectAtIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v33, "objectAtIndex:", 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndex:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    if ((unint64_t)(v18 - 1) > 2)
      v19 = 0;
    else
      v19 = off_250C748C8[v18 - 1];
    v20 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), v13 / 100.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "decimalNumberWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "components:fromDate:", 12, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[7], "stringFromDate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "compare:", v10) == 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@%@,%@,%@"), v25, CFSTR("$"), v22, v19, v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x24BDD1518]);
      objc_msgSend(a1[4], "dateFromComponents:", v24);
      v27 = v10;
      v28 = v22;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceReferenceDate");
      v30 = (void *)objc_msgSend(v26, "initWithDouble:");

      v22 = v28;
      v10 = v27;
      objc_msgSend(a1[5], "safelyAddObjectToArrayCollection:forKey:", v31, v30);

    }
  }

}

uint64_t __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)_getAccountsByAccountType:(int64_t)a3
{
  id v5;
  FHDatabaseEntity *accountEntities;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  int64_t v16;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  accountEntities = self->_accountEntities;
  v7 = *MEMORY[0x24BE31500];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __51__FHInferenceController__getAccountsByAccountType___block_invoke;
  v14 = &unk_250C74888;
  v15 = v5;
  v16 = a3;
  v8 = v5;
  -[FHDatabaseEntity queryDataWithBlock:logicalOperator:selectFields:usingBlock:](accountEntities, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:", 0, v7, &unk_250C77D80, &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __51__FHInferenceController__getAccountsByAccountType___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BE315C8];
  v4 = a2;
  v8 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountID:", v5);

  objc_msgSend(v8, "setAccountType:", (int)objc_msgSend(v4, "intAtIndex:", 1));
  objc_msgSend(v4, "objectAtIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountDescription:", v6);

  objc_msgSend(v4, "objectAtIndex:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setInstitutionName:", v7);
  if (objc_msgSend(v8, "accountType") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (void)_streamBankConnectTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
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
  id v37;
  id v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  id v63;
  unint64_t v64;
  id v65;
  id obj;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  FHInferenceController *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[9];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v63 = a6;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v64 = a4;
  v12 = 150;
  if (a4 == 2)
    v12 = 70;
  v77 = v12;
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v81 = self;
  -[FHInferenceController _getAccountsByAccountType:](self, "_getAccountsByAccountType:", 4);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  v85 = (void *)v10;
  if (v69)
  {
    v13 = 0;
    v67 = *(_QWORD *)v92;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v92 != v67)
          objc_enumerationMutation(obj);
        v70 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v14);
        objc_msgSend(v70, "accountID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHInferenceController _monthlyStatementsWithAccountType:sourceIdentifier:](v81, "_monthlyStatementsWithAccountType:sourceIdentifier:", 4, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = v16;
        objc_msgSend(v16, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_291);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = v18;
        if (objc_msgSend(v18, "count"))
          v19 = v13 >= v77;
        else
          v19 = 1;
        v71 = v14;
        if (!v19)
        {
          v20 = 0;
          do
          {
            v75 = v20;
            objc_msgSend(v76, "objectAtIndex:");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "objectForKey:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v90[0] = MEMORY[0x24BDAC760];
            v90[1] = 3221225472;
            v90[2] = __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
            v90[3] = &unk_250C74780;
            v90[4] = v81;
            v73 = v21;
            objc_msgSend(v21, "sortedArrayUsingComparator:", v90);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v89 = 0u;
            v79 = v22;
            v83 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
            if (v83)
            {
              v82 = *(_QWORD *)v87;
              while (2)
              {
                v23 = v13;
                v24 = 0;
                v78 = v23;
                v25 = v77 - v23;
                if (v77 < v23)
                  v25 = 0;
                v84 = v25;
                do
                {
                  if (*(_QWORD *)v87 != v82)
                    objc_enumerationMutation(v79);
                  if (v84 == v24)
                  {
                    v13 = v78 + v24;
                    goto LABEL_29;
                  }
                  v26 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v24);
                  objc_msgSend(v26, "objectAtIndex:", 0);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectAtIndex:", 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectAtIndex:", 2);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectAtIndex:", 3);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectAtIndex:", 5);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "componentsSeparatedByCharactersInSet:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "componentsJoinedByString:", CFSTR(" "));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@,%@,%@,%@"), v27, v34, v28, v29, v30);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "addObject:", v35);

                  -[NSDateFormatter dateFromString:](v81->_dateFormatter, "dateFromString:", v29);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v85, "compare:", v36) == 1)
                  {
                    v37 = v36;

                    v85 = v37;
                  }
                  if (objc_msgSend(v11, "compare:", v36) == -1)
                  {
                    v38 = v36;

                    v11 = v38;
                  }

                  ++v24;
                }
                while (v83 != v24);
                v13 = v78 + v24;
                v83 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
                if (v83)
                  continue;
                break;
              }
            }
LABEL_29:

            v39 = objc_msgSend(v76, "count");
            if (v75 > 0xE)
              break;
            v20 = v75 + 1;
            if (v75 + 1 >= v39)
              break;
          }
          while (v13 < v77);
        }
        v40 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v70, "institutionName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](v81->_dateFormatter, "stringFromDate:", v85);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](v81->_dateFormatter, "stringFromDate:", v11);
        v43 = v13;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v43;
        objc_msgSend(v68, "addObject:", v46);

        v14 = v71 + 1;
      }
      while (v71 + 1 != v69);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    }
    while (v69);
  }
  if (v64 == 2)
    v47 = 150;
  else
    v47 = 250;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v48;
  v98[1] = CFSTR("Your task is the following:");
  v98[2] = CFSTR("- Analyze the transactions.");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Answer the following question asked by the user: \"%@\"."), v65);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v49;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Limit your answer to %lu words."), v47);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v50;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("- Do not add comments, and only allow bulleted list formatting"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v98[5] = v51;
  v98[6] = CFSTR("- Minimize mathematical operations such as sums or totals, and inform the user that the model has limited support for mathematical operations since it's still in the beta phase.");
  v98[7] = CFSTR("\n");
  objc_msgSend(v68, "componentsJoinedByString:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v98[8] = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 9);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v85, "compare:", v54))
  {

    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v11, "compare:", v55);

  if (!v56)
  {
LABEL_41:
    *(float *)&v57 = a5;
    v62 = v63;
    -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v81, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", 0, v64, v63, v57);
    goto LABEL_42;
  }
  v96[0] = CFSTR("role");
  v96[1] = CFSTR("content");
  v97[0] = CFSTR("ROLE_USER");
  objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v61 = a5;
  v62 = v63;
  -[FHInferenceController streamingQueryWithAlternatingRoles:modelId:temperature:delegate:](v81, "streamingQueryWithAlternatingRoles:modelId:temperature:delegate:", v60, v64, v63, v61);

LABEL_42:
}

uint64_t __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

BOOL __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  objc_msgSend(a2, "objectAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v6, "objectAtIndex:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateFromString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "compare:", v11) == -1;
  return v12;
}

- (FHDatabaseEntity)transactionAndFeauturesEntities
{
  return self->_transactionAndFeauturesEntities;
}

- (void)setTransactionAndFeauturesEntities:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAndFeauturesEntities, a3);
}

- (FHDatabaseEntity)transactionsEntities
{
  return self->_transactionsEntities;
}

- (void)setTransactionsEntities:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsEntities, a3);
}

- (FHDatabaseEntity)accountEntities
{
  return self->_accountEntities;
}

- (void)setAccountEntities:(id)a3
{
  objc_storeStrong((id *)&self->_accountEntities, a3);
}

- (NSArray)selectFieldsForTransactionsAndFeatures
{
  return self->_selectFieldsForTransactionsAndFeatures;
}

- (void)setSelectFieldsForTransactionsAndFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_selectFieldsForTransactionsAndFeatures, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (NSString)acDawTicket
{
  return self->_acDawTicket;
}

- (void)setAcDawTicket:(id)a3
{
  objc_storeStrong((id *)&self->_acDawTicket, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDateFormatter)monthOnlyDateFormatter
{
  return self->_monthOnlyDateFormatter;
}

- (void)setMonthOnlyDateFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthOnlyDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_acDawTicket, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_selectFieldsForTransactionsAndFeatures, 0);
  objc_storeStrong((id *)&self->_accountEntities, 0);
  objc_storeStrong((id *)&self->_transactionsEntities, 0);
  objc_storeStrong((id *)&self->_transactionAndFeauturesEntities, 0);
}

@end
