@implementation ATXMicrolocationVisitDuetEvent

- (ATXMicrolocationVisitDuetEvent)initWithDominantMicrolocationUUID:(id)a3 microlocationProbabilities:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  ATXMicrolocationVisitDuetEvent *v13;
  ATXMicrolocationVisitDuetEvent *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMicrolocationVisitDuetEvent;
  v13 = -[ATXDuetEvent initWithStartDate:endDate:](&v16, sel_initWithStartDate_endDate_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dominantMicrolocationUUID, a3);
    objc_storeStrong((id *)&v14->_microlocationUUIDProbabilities, a4);
  }

  return v14;
}

- (ATXMicrolocationVisitDuetEvent)initWithDKEvent:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXMicrolocationVisitDuetEvent *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXMicrolocationVisitDuetEvent.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithUUIDString:", v10);

    objc_msgSend(v5, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __atxlog_handle_default();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ATXMicrolocationVisitDuetEvent initWithDKEvent:].cold.2((uint64_t)v14, v18, v19, v20, v21, v22, v23, v24);
        goto LABEL_15;
      }
      if (v11)
      {
        objc_msgSend(v5, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXMicrolocationVisitDuetEvent initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:](self, "initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:", v11, v14, v15, v16);

        v17 = self;
LABEL_16:

        goto LABEL_17;
      }
    }
    __atxlog_handle_default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXMicrolocationVisitDuetEvent initWithDKEvent:].cold.1((uint64_t)v11, (uint64_t)v14, v18);
LABEL_15:

    v17 = 0;
    goto LABEL_16;
  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ATXMicrolocationVisitDuetEvent initWithDKEvent:].cold.3(v5, v11);
  v17 = 0;
LABEL_17:

  return v17;
}

- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValues
{
  return -[ATXMicrolocationVisitDuetEvent initWithCurrentContextStoreValuesWithTwoHourLimit:](self, "initWithCurrentContextStoreValuesWithTwoHourLimit:", 1);
}

- (ATXMicrolocationVisitDuetEvent)initWithCurrentContextStoreValuesWithTwoHourLimit:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  ATXMicrolocationVisitDuetEvent *v36;
  id v38;
  uint8_t buf[4];
  double v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  void *v45;
  _QWORD v46[2];

  v3 = a3;
  v46[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("confidence >= %@"), &unk_1E83D0A30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v10, v6, 0, 1, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setExecuteConcurrently:", 1);
  __atxlog_handle_default();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "eventStreams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = *(double *)&v15;
    v41 = 2080;
    v42 = "-[ATXMicrolocationVisitDuetEvent initWithCurrentContextStoreValuesWithTwoHourLimit:]";
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Duet query: %{public}@, %s, %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v16, "executeQuery:error:", v11, &v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;

  if (v18)
  {
    __atxlog_handle_default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXMicrolocationVisitDuetEvent initWithCurrentContextStoreValuesWithTwoHourLimit:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    objc_msgSend(v17, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "timeIntervalSince1970");
      v28 = v27;
      -[NSObject startDate](v19, "startDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSince1970");
      v31 = v30;

      if (!v3 || (v32 = v28 - v31, v32 <= 2.0))
      {
        self = -[ATXMicrolocationVisitDuetEvent initWithDKEvent:](self, "initWithDKEvent:", v19);
        v36 = self;
        goto LABEL_15;
      }
      __atxlog_handle_default();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v40 = v32;
        _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "Skipping microlocation event because it happened too long ago (%.2f seconds ago)", buf, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_default();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = *(double *)&v35;
        _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "%@ - No microlocation event found.", buf, 0xCu);

      }
    }

  }
  v36 = 0;
LABEL_15:

  return v36;
}

- (id)identifier
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  -[ATXDuetEvent startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[_ATXActionUtils localHourOfDayFromDate:](_ATXActionUtils, "localHourOfDayFromDate:", v3);

  v5 = CFSTR("6_to_12");
  v6 = CFSTR("18_to_24");
  if ((unint64_t)v4 < 0x12)
    v6 = CFSTR("12_to_18");
  if ((unint64_t)v4 >= 0xC)
    v5 = v6;
  if (v4 >= 6)
    v7 = v5;
  else
    v7 = CFSTR("0_to_6");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Microlocation_%@_%@"), self->_dominantMicrolocationUUID, v7);
}

- (id)description
{
  id v3;
  NSUUID *dominantMicrolocationUUID;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  dominantMicrolocationUUID = self->_dominantMicrolocationUUID;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Dominant microlocation: %@, start date: %@, end date: %@"), dominantMicrolocationUUID, v5, v6);

  return v7;
}

- (NSUUID)dominantMicrolocationUUID
{
  return self->_dominantMicrolocationUUID;
}

- (NSDictionary)microlocationUUIDProbabilities
{
  return self->_microlocationUUIDProbabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microlocationUUIDProbabilities, 0);
  objc_storeStrong((id *)&self->_dominantMicrolocationUUID, 0);
}

- (void)initWithDKEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, (uint64_t)a3, "While fetching microlocations, dominantMicrolocationUUID (%@) or microlocationUUIDProbabilities (%@) was nil.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Value for metadata key for Microlocation 'probabilityVector' is not an NSDictionary, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDKEvent:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a2, v8, "Value of _DKEvent was %@, not %@", (uint8_t *)&v9);

}

- (void)initWithCurrentContextStoreValuesWithTwoHourLimit:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error fetching latest microlocation %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
