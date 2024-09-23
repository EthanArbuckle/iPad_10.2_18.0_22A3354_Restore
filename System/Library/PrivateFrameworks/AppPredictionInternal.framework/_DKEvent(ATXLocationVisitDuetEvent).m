@implementation _DKEvent(ATXLocationVisitDuetEvent)

- (ATXLocationVisitDuetEvent)atx_convertToLocationVisitEvent
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  ATXLocationVisitDuetEvent *v6;
  void *v7;
  void *v8;
  ATXLocationVisitDuetEvent *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A68], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DKEvent(ATXLocationVisitDuetEvent) atx_convertToLocationVisitEvent].cold.1(v5);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DKEvent(ATXLocationVisitDuetEvent) atx_convertToLocationVisitEvent].cold.3((uint64_t)v4, v5, v10, v11, v12, v13, v14, v15);
    goto LABEL_12;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  if (!v5)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_DKEvent(ATXLocationVisitDuetEvent) atx_convertToLocationVisitEvent].cold.2((uint64_t)v4, v16, v17, v18, v19, v20, v21, v22);

LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v6 = [ATXLocationVisitDuetEvent alloc];
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXLocationVisitDuetEvent initWithLocationOfInterestIdentifier:startDate:endDate:](v6, "initWithLocationOfInterestIdentifier:startDate:endDate:", v5, v7, v8);

LABEL_13:
  return v9;
}

- (void)atx_convertToLocationVisitEvent
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Value for metadata key for LocationVisit 'identifier' is not a number, %@", a5, a6, a7, a8, 2u);
}

@end
