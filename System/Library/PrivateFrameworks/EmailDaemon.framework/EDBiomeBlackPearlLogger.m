@implementation EDBiomeBlackPearlLogger

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EDBiomeBlackPearlLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (OS_os_log *)(id)log_log_10;
}

void __30__EDBiomeBlackPearlLogger_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

- (EDBiomeBlackPearlLogger)initWithStreamType:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_block_t v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EDBiomeBlackPearlLogger;
  v4 = -[EDBiomeBlackPearlLogger init](&v13, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("em_biome_stream_blackpearl", v5);
    v7 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v6;

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__EDBiomeBlackPearlLogger_initWithStreamType___block_invoke;
    v10[3] = &unk_1E949B658;
    v12 = a3;
    v11 = v4;
    v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
    dispatch_async(*((dispatch_queue_t *)v4 + 1), v8);

  }
  return (EDBiomeBlackPearlLogger *)v4;
}

void __46__EDBiomeBlackPearlLogger_initWithStreamType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 1)
  {
    BiomeLibrary();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Mail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Recategorization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStream:", v4);
    goto LABEL_5;
  }
  if (!v2)
  {
    BiomeLibrary();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Mail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Categorization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStream:", v4);
LABEL_5:

  }
  objc_msgSend(*(id *)(a1 + 32), "stream");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSource:", v5);

  v8 = objc_alloc_init(MEMORY[0x1E0D02718]);
  objc_msgSend(*(id *)(a1 + 32), "setDatabase:");

}

- (void)logEventForMessageID:(id)a3 eventType:(id)a4 messageDictionary:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
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
  id v55;
  id v56;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v56 = a4;
  v7 = a5;
  +[EDBiomeBlackPearlLogger log](EDBiomeBlackPearlLogger, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v59 = v55;
    v60 = 2112;
    v61 = v56;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "[Biome] Logging event for messageID: %@ and type: %@", buf, 0x16u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("predictedCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EDBiomeBlackPearlLogger _biomeCategoryValueFrom:](self, "_biomeCategoryValueFrom:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("currCategoryView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDBiomeBlackPearlLogger _biomeMailboxValueFrom:](self, "_biomeMailboxValueFrom:", objc_msgSend(v11, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("prevCategoryView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EDBiomeBlackPearlLogger _biomeMailboxValueFrom:](self, "_biomeMailboxValueFrom:", objc_msgSend(v13, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recategorizationBy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EDBiomeBlackPearlLogger _biomeRecategorizationValueFrom:](self, "_biomeRecategorizationValueFrom:", objc_msgSend(v15, "integerValue"));

  v17 = _os_feature_enabled_impl();
  v18 = objc_alloc(MEMORY[0x1E0D020D8]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("receivingAccountDomain"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[EDBiomeBlackPearlLogger _biomeDomainValueFrom:](self, "_biomeDomainValueFrom:", objc_msgSend(v19, "integerValue"));

    v21 = v18;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentId"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v21;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentDeploymentId"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentTreatmentId"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutId"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutDeploymentId"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutFactorPackId"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlModelVersion"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlSenderModelVersion"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlFinalRuleVersion"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlBreakthroughVersion"));
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reasonCodes"));
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isBreakthrough"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v40 = objc_claimAutoreleasedReturnValue();
    v22 = v14;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("elapsedTimeSinceEmailReceived"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isThread"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("senderId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hasIcloudAccountEnabled"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = v20;
    LODWORD(v38) = v16;
    v29 = (void *)v40;
    v28 = (void *)v41;
    v36 = __PAIR64__(v22, v12);
    v30 = (void *)v43;
    LODWORD(v35) = v25;
    v31 = (void *)objc_msgSend(v42, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currCategoryView:prevCategoryView:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:senderId:receivingAccountDomain:hasIcloudAccountEnabled:", v55, v56, v54, v53, v52, v51, v50, v49, v35, v48, v47, v46, v43,
                    v41,
                    v36,
                    v45,
                    v40,
                    v23,
                    v38,
                    v24,
                    v26,
                    v39,
                    v27);

  }
  else
  {
    v32 = v18;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentId"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentDeploymentId"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialExperimentTreatmentId"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutId"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutDeploymentId"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trialRolloutFactorPackId"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlModelVersion"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlSenderModelVersion"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlFinalRuleVersion"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blackPearlBreakthroughVersion"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reasonCodes"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isBreakthrough"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v14;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("elapsedTimeSinceEmailReceived"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isThread"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = v16;
    v37 = __PAIR64__(v34, v12);
    v28 = (void *)v33;
    v30 = (void *)v44;
    LODWORD(v35) = v10;
    v26 = v32;
    v31 = (void *)objc_msgSend(v32, "initWithMessageId:eventType:trialExperimentId:trialExperimentDeploymentId:trialExperimentTreatmentId:trialRolloutId:trialRolloutDeploymentId:trialRolloutFactorPackId:predictedCategory:blackPearlModelVersion:blackPearlSenderModelVersion:blackPearlFinalRuleVersion:blackPearlBreakthroughVersion:reasonCodes:currMailbox:prevMailbox:isBreakthrough:isBlackPearlEnabled:elapsedTimeSinceEmailReceived:recategorizationBy:isThread:", v55, v56, v54, v53, v52, v51, v50, v49, v35, v48, v47, v46, v44,
                    v33,
                    v37,
                    v45,
                    v29,
                    v23,
                    v38,
                    v24);
  }

  -[EDBiomeBlackPearlLogger _donateToBiomeWithEvent:](self, "_donateToBiomeWithEvent:", v31);
}

- (void)logRecategorizationFedStatsForMessage:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("currCategoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EDBiomeBlackPearlLogger _biomeFedStatsCategoryValueFrom:](self, "_biomeFedStatsCategoryValueFrom:", objc_msgSend(v4, "integerValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("prevCategoryView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDBiomeBlackPearlLogger _biomeFedStatsCategoryValueFrom:](self, "_biomeFedStatsCategoryValueFrom:", objc_msgSend(v6, "integerValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("recategorizationBy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDBiomeBlackPearlLogger _biomeRecategorizationScopeValueFrom:](self, "_biomeRecategorizationScopeValueFrom:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("receivingAccountDomain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBiomeBlackPearlLogger _domainStringFrom:](self, "_domainStringFrom:", objc_msgSend(v10, "integerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D020E0]);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("senderId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCategory:previous:scope:sender:domain:language:", v5, v7, v9, v13, v11, 0);

  -[EDBiomeBlackPearlLogger _donateToBiomeWithEvent:](self, "_donateToBiomeWithEvent:", v14);
}

- (id)queryAllEventsForMessageID:(id)a3 andEventType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  EDBiomeBlackPearlLogger *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBiomeBlackPearlLogger queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __67__EDBiomeBlackPearlLogger_queryAllEventsForMessageID_andEventType___block_invoke;
  v18 = &unk_1E949B680;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v21 = self;
  v12 = v8;
  v22 = v12;
  dispatch_sync(v9, &v15);

  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18);
  return v13;
}

void __67__EDBiomeBlackPearlLogger_queryAllEventsForMessageID_andEventType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EDBiomeBlackPearlLogger log](EDBiomeBlackPearlLogger, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "[Biome] Start queryAllEventsForMessageID and eventType %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM \"Mail.Categorization\" where messageID = %@ and eventType = '%@'"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "executeQuery:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v5, "next"))
  {
    objc_msgSend(v5, "row");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);

  }
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[EDBiomeBlackPearlLogger log](EDBiomeBlackPearlLogger, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "[Biome] Error for querying Biome db: %@", buf, 0xCu);

    }
  }

}

- (void)deleteEventsForMessages:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v9, "ef_map:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  -[EDBiomeBlackPearlLogger stream](self, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pruner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke_2;
  v10[3] = &unk_1E949B6A8;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "deleteEventsPassingTest:", v10);

}

id __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

- (void)_donateToBiomeWithEvent:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__EDBiomeBlackPearlLogger__donateToBiomeWithEvent___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);

}

uint64_t __51__EDBiomeBlackPearlLogger__donateToBiomeWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sendEvent:", *(_QWORD *)(a1 + 40));
}

- (int)_biomeCategoryValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return a3 + 1;
  else
    return 0;
}

- (int)_biomeMailboxValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (int)_biomeRecategorizationValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 < 6)
    return a3 + 1;
  else
    return 0;
}

- (int)_biomeDomainValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 < 8)
    return a3 + 1;
  else
    return 0;
}

- (int)_biomeFedStatsCategoryValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return dword_1D317A438[a3];
}

- (int)_biomeRecategorizationScopeValueFrom:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (id)_domainStringFrom:(int64_t)a3
{
  __CFString **v3;

  if ((unint64_t)a3 > 6)
    v3 = kUserEmailDomainOther;
  else
    v3 = off_1E949B6F0[a3];
  return *v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
