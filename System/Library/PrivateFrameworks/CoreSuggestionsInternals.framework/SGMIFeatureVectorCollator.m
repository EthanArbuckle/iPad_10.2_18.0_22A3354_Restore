@implementation SGMIFeatureVectorCollator

- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9
{
  return -[SGMIFeatureVectorCollator initWithMessagesFromDaysAgo:throughDaysAgo:limit:withBiomeData:store:useSpotlightDataForMissingBiomeData:preLoadedFeatureNames:simulatedCSSIs:](self, "initWithMessagesFromDaysAgo:throughDaysAgo:limit:withBiomeData:store:useSpotlightDataForMissingBiomeData:preLoadedFeatureNames:simulatedCSSIs:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (SGMIFeatureVectorCollator)initWithMessagesFromDaysAgo:(unint64_t)a3 throughDaysAgo:(unint64_t)a4 limit:(unint64_t)a5 withBiomeData:(BOOL)a6 store:(id)a7 useSpotlightDataForMissingBiomeData:(BOOL)a8 preLoadedFeatureNames:(id)a9 simulatedCSSIs:(id)a10
{
  id v16;
  id v17;
  SGMIFeatureVectorCollator *v18;
  SGMIFeatureVectorCollator *v19;
  id v22;
  objc_super v23;

  v22 = a7;
  v16 = a9;
  v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)SGMIFeatureVectorCollator;
  v18 = -[SGMIFeatureVectorCollator init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_startInDaysAgo = a3;
    v18->_endInDaysAgo = a4;
    v18->_limit = a5;
    v18->_withBiomeData = a6;
    objc_storeStrong((id *)&v18->_store, a7);
    v19->_useSpotlightDataForMissingBiomeData = a8;
    objc_storeStrong((id *)&v19->_featureNames, a9);
    objc_storeStrong((id *)&v19->_simulatedCSSIs, a10);
  }

  return v19;
}

- (void)forEach:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SGSqlEntityStore *v8;
  BOOL useSpotlightDataForMissingBiomeData;
  NSArray *v10;
  BOOL v11;
  SGSqlEntityStore *v12;
  id v13;
  id v14;
  NSArray *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  SGSqlEntityStore *v19;
  id v20;
  id v21;
  NSArray *v22;
  id v23;
  _QWORD *v24;
  BOOL v25;
  BOOL v26;
  _QWORD v27[3];
  char v28;

  v4 = a3;
  if (self->_withBiomeData)
  {
    +[SGMIBiomeUtility summarizeStreamByMessageStartingFromDaysAgo:](SGMIBiomeUtility, "summarizeStreamByMessageStartingFromDaysAgo:", self->_startInDaysAgo);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biomeSummaryByMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biomeMessageIdByPersistentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self->_store;
  useSpotlightDataForMissingBiomeData = self->_useSpotlightDataForMissingBiomeData;
  v10 = self->_featureNames;
  v11 = self->_simulatedCSSIs != 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __37__SGMIFeatureVectorCollator_forEach___block_invoke;
  v18[3] = &unk_1E7DB1578;
  v25 = v11;
  v12 = v8;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v24 = v27;
  v14 = v6;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v26 = useSpotlightDataForMissingBiomeData;
  v16 = v4;
  v23 = v16;
  v17 = (void *)MEMORY[0x1C3BD5158](v18);
  +[SGMISpotlightUtility queryFromDaysAgo:throughDaysAgo:limit:withError:simulatedCSSIs:handler:](SGMISpotlightUtility, "queryFromDaysAgo:throughDaysAgo:limit:withError:simulatedCSSIs:handler:", self->_startInDaysAgo, self->_endInDaysAgo, self->_limit, 0, self->_simulatedCSSIs, v17);

  _Block_object_dispose(v27, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedCSSIs, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
}

void __37__SGMIFeatureVectorCollator_forEach___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  SGSimpleMailMessage *v6;
  SGSimpleMailMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  SGMIFeatureVector *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SGMIFeatureVector *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = -[SGSimpleMailMessage initWithSearchableItem:]([SGSimpleMailMessage alloc], "initWithSearchableItem:", v5);
  v7 = v6;
  if (!*(_BYTE *)(a1 + 80))
  {
    v8 = *(void **)(a1 + 32);
    -[SGSimpleMailMessage spotlightBundleIdentifier](v6, "spotlightBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage spotlightUniqueIdentifier](v7, "spotlightUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageIdForBundleIdentifier:uniqueIdentifier:", v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        v13 = "SGMIFeatureVectorCollator: message ID %@ was mapped via spotlight mapping table.";
LABEL_29:
        _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
      }
    }
    else
    {
      v14 = *(void **)(a1 + 40);
      -[SGSimpleMailMessage spotlightUniqueIdentifier](v7, "spotlightUniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[SGSimpleMailMessage spotlightUniqueIdentifier](v7, "spotlightUniqueIdentifier");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        sgMailIntelligenceLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, "SGMIFeatureVectorCollator: No mapping found, creating SGSimpleMailMessage with hashed message ID: %@", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        goto LABEL_8;
      }
      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        v13 = "SGMIFeatureVectorCollator: message ID %@ was mapped with Biome stream.";
        goto LABEL_29;
      }
    }

LABEL_8:
    -[SGSimpleMailMessage setMessageId:](v7, "setMessageId:", v11);

  }
  v16 = [SGMIFeatureVector alloc];
  -[SGSimpleMailMessage messageId](v7, "messageId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v19 = *(void **)(a1 + 48);
  -[SGSimpleMailMessage messageId](v7, "messageId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v16, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", v17, v18, v7, &unk_1E7E0C920, v21, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  if (*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v5, "attributeSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributeForKey:", CFSTR("com_apple_mail_repliedTo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", &unk_1E7E0CA58);

    if (v25)
    {
      sgMailIntelligenceLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = *(void **)(a1 + 48);
        -[SGSimpleMailMessage messageId](v7, "messageId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:");
        v30 = CFSTR(" not");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          v31 = &stru_1E7DB83A8;
        else
          v31 = CFSTR(" not");
        v32 = *(void **)(a1 + 48);
        -[SGSimpleMailMessage messageId](v7, "messageId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          -[SGMIFeatureVector cachedFeature:](v22, "cachedFeature:", 3001);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            v30 = &stru_1E7DB83A8;
        }
        *(_DWORD *)buf = 138412546;
        v39 = v31;
        v40 = 2112;
        v41 = v30;
        _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "SGMIFeatureVectorCollator: Use the CSSI's repliedTo attribute to set the UserReplied feature, biome information was%@ available and UserReplied was%@ already set.", buf, 0x16u);
        if (v34)

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMIFeatureVector setFeatureToNumberValue:forName:](v22, "setFeatureToNumberValue:forName:", v27, 3001);

    }
  }
  buf[0] = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  if (buf[0])
    *a3 = 1;

}

@end
