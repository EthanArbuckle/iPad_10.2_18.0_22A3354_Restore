@implementation SGMIBiomeUtility

+ (id)summarizeStreamByMessage
{
  return (id)objc_msgSend(a1, "summarizeStreamByMessageStartingFromDaysAgo:", 30);
}

+ (id)summarizeStreamByMessageStartingFromDaysAgo:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SGMIBiomeSummaryResults *v10;
  NSObject *v11;
  SGMIBiomeSummaryResults *v12;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0D1E0E8], "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D024C0], "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("mailIntelligence"), v7);
    objc_msgSend(v8, "publisherFromStartTime:", CFAbsoluteTimeGetCurrent() - (double)(86400 * a3 + 86400));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMIBiomeUtility summarizeStreamByMessageWithPublisher:](SGMIBiomeUtility, "summarizeStreamByMessageWithPublisher:", v9);
    v10 = (SGMIBiomeSummaryResults *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "Error retrieving directory for Biome stream data", v14, 2u);
    }

    v12 = [SGMIBiomeSummaryResults alloc];
    v10 = -[SGMIBiomeSummaryResults initWithBiomeSummaryByMessage:biomeMessageIdByPersistentId:](v12, "initWithBiomeSummaryByMessage:biomeMessageIdByPersistentId:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
  }

  return v10;
}

+ (id)summarizeStreamByMessageWithPublisher:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SGMIBiomeSummaryResults *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke_10;
  v13[3] = &unk_1E7DB7408;
  v14 = v4;
  v15 = v6;
  v16 = v5;
  v7 = v5;
  v8 = v6;
  v9 = v4;
  v10 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", &__block_literal_global_34660, v13);
  v11 = -[SGMIBiomeSummaryResults initWithBiomeSummaryByMessage:biomeMessageIdByPersistentId:]([SGMIBiomeSummaryResults alloc], "initWithBiomeSummaryByMessage:biomeMessageIdByPersistentId:", v9, v7);

  return v11;
}

void __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke_10(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v13, "timestamp");
    +[SGMIBiomeEventReducer updateSummaryDict:fetchedUnreadMessages:event:timestamp:](SGMIBiomeEventReducer, "updateSummaryDict:fetchedUnreadMessages:event:timestamp:", a1[4], a1[5], v3);
    objc_msgSend(v3, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentID"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    v6 = (void *)v5;
    objc_msgSend(v3, "messageId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v3, "messageId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<%@>"), v9);

      v10 = (void *)a1[6];
      objc_msgSend(v3, "payload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("persistentID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v12);

      goto LABEL_5;
    }
  }
LABEL_6:

}

void __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = 136315138;
      v9 = objc_msgSend(v7, "UTF8String");
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGMIBiomeUtility: Error: %s", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGMIBiomeUtility: Successfully consumed stream", (uint8_t *)&v8, 2u);
  }

}

@end
