@implementation _DKPredictionQueryFeedback

- (void)logPredictionQueryFeedback:(id)a3 endHistogram:(id)a4 withStorage:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v13 = &stru_1E26E9728;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v7, "countDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("startCountDiction"));
  objc_msgSend(&stru_1E26E9728, "stringByAppendingString:", CFSTR("_startHistogramExists"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_3:
    objc_msgSend(v8, "countDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v14, CFSTR("endCountDictionary"));
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("_endHistogramExists"));
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v15;
  }
LABEL_4:
  if (objc_msgSend(v11, "count"))
  {
    +[_DKDeviceActivityLevelFeedbackMetadataKey predictionQueryResults](_DKDeviceActivityLevelFeedbackMetadataKey, "predictionQueryResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v16;
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_18;
  }
  v17 = 0;
  if ((-[__CFString isEqualToString:](v13, "isEqualToString:", &stru_1E26E9728) & 1) == 0)
  {
LABEL_18:
    +[_DKSystemEventStreams deviceActivityLevelFeedbackStream](_DKSystemEventStreams, "deviceActivityLevelFeedbackStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v18, 0, v10, v10, v13, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v24 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v9, "saveObjects:error:", v20, &v23);
      v21 = v23;

      if (v21)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[_DKPredictionQueryFeedback logPredictionQueryFeedback:endHistogram:withStorage:].cold.1((uint64_t)v21, v22);

      }
    }
  }

}

- (void)logPredictionQueryFeedback:(uint64_t)a1 endHistogram:(NSObject *)a2 withStorage:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Encountered error while saving event to knowledgeStore for _DKPredictionQueryFeedback: %@", (uint8_t *)&v2, 0xCu);
}

@end
