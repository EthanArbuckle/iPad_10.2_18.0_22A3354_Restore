@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction

+ (id)candidatePublisherFromStartTime:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidatePublisherWithStartTime:endTime:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidatePublisherFromStartTime:endTime:datastore:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)candidatePublisherFromStartTime:(double)a3 datastore:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidatePublisherFromStartTime:endTime:datastore:", v11, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)candidatePublisherFromStartTime:(id)a3 endTime:(id)a4 datastore:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke;
  v20 = &unk_1E82DBAB0;
  v21 = v9;
  v22 = v7;
  v23 = v8;
  v24 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  objc_msgSend(v14, "_doSync:", &v17);
  objc_msgSend(v11, "bpsPublisher", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_2;
  v6[3] = &unk_1E82DCB88;
  v7 = a1[5];
  v8 = a1[6];
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_3;
  v4[3] = &unk_1E82DEC70;
  v5 = a1[7];
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT alogBundleId.bundleId, alogAction.actionType, slotSetKey.paramHash, alog.date FROM alog, slotSetKey, alogBundleId, alogAction WHERE alog.id=slotSetKey.alogId AND alog.bundleId=alogBundleId.id AND alog.actionType=alogAction.id AND alog.date >= ? AND alog.date <= ? ORDER BY alog.date ASC"), v6, v4, &__block_literal_global_79);

}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindParam:toInt64:", 1, objc_msgSend(v3, "integerValue"));
  objc_msgSend(v4, "bindParam:toInt64:", 2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));

}

uint64_t __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ATXMinimalAction *v6;
  ATXCandidateMinimalAction *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXMinimalAction initWithBundleId:actionType:paramHash:]([ATXMinimalAction alloc], "initWithBundleId:actionType:paramHash:", v4, v5, objc_msgSend(v3, "getInt64ForColumn:", 2));
  v7 = -[ATXCandidate initWithBiomeStoreData:]([ATXCandidateMinimalAction alloc], "initWithBiomeStoreData:", v6);
  v8 = objc_msgSend(v3, "getInt64ForColumn:", 3);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A8]), "initWithEventBody:timestamp:", v7, (double)v8);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v10;
}

uint64_t __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  unsigned __int8 *v5;

  v2 = a2;
  __atxlog_handle_relevance_model();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4_cold_1((uint64_t)v2, v3, v4);

  v5 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  return *v5;
}

void __115__ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction_candidatePublisherFromStartTime_endTime_datastore___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_9_0(&dword_1C9A3B000, a2, a3, "Unable to produce minimalActionCandidateEvents from alog. Error: %@", (uint8_t *)&v3);
}

@end
