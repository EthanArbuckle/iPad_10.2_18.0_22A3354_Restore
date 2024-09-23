@implementation ARPHomeControlCorrelationUtilities

- (ARPHomeControlCorrelationUtilities)initWithKnowledgeStore:(id)a3
{
  id v5;
  ARPHomeControlCorrelationUtilities *v6;
  ARPHomeControlCorrelationUtilities *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARPHomeControlCorrelationUtilities;
  v6 = -[ARPHomeControlCorrelationUtilities init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);

  return v7;
}

- (BOOL)writeArchive:(id)a3 toFilePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (v9)
    {
      v10 = v9;
      v11 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v24);
    v10 = v24;

    if (!v10)
    {
      v23 = 0;
      objc_msgSend(v8, "writeToFile:options:error:", v7, 1, &v23);
      v10 = v23;
      ARPLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v10)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_impl(&dword_1DD793000, v15, OS_LOG_TYPE_DEFAULT, "Successfully persisted correlations dictionary produced when correlating Home Controls and MicroLocations: %@", buf, 0xCu);
        }

        notify_post((const char *)objc_msgSend(CFSTR("com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery"), "UTF8String"));
        v10 = 0;
        v11 = 1;
        goto LABEL_14;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ARPHomeControlCorrelationUtilities writeArchive:toFilePath:].cold.2((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);

    }
    v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  ARPLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[ARPHomeControlCorrelationUtilities writeArchive:toFilePath:].cold.1(v10);
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)firstHomeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  -[ARPHomeControlCorrelationUtilities homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:](self, "homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlCorrelationUtilities homeKitScenesWithPredicate:sortStartDateAscending:limit:](self, "homeKitScenesWithPredicate:sortStartDateAscending:limit:", v6, v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    v11 = &__block_literal_global;
  else
    v11 = &__block_literal_global_3;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __93__ARPHomeControlCorrelationUtilities_firstHomeKitEventsWithPredicate_sortStartDateAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __93__ARPHomeControlCorrelationUtilities_firstHomeKitEventsWithPredicate_sortStartDateAscending___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 <= 0.0)
  {
    objc_msgSend(v4, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v10 = v13 < 0.0;

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (id)homeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[ARPHomeControlCorrelationUtilities homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:](self, "homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:", v6, v4, 3000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlCorrelationUtilities homeKitScenesWithPredicate:sortStartDateAscending:limit:](self, "homeKitScenesWithPredicate:sortStartDateAscending:limit:", v6, v4, 2000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    v11 = &__block_literal_global_4;
  else
    v11 = &__block_literal_global_5;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __88__ARPHomeControlCorrelationUtilities_homeKitEventsWithPredicate_sortStartDateAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __88__ARPHomeControlCorrelationUtilities_homeKitEventsWithPredicate_sortStartDateAscending___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 <= 0.0)
  {
    objc_msgSend(v4, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v10 = v13 < 0.0;

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (id)homeKitAccessoriesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
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
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v35;
  _QWORD v36[2];
  void *v37;
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D15AF8], "homeKitAccessoryControlStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D15A78], "eligibleForSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForObjectsWithMetadataKey:andValue:", v14, &unk_1EA7D7880);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D15A08];
  v17 = (void *)MEMORY[0x1E0CB3528];
  v36[0] = v8;
  v36[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v19, v10, 0, a5, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPHomeControlCorrelationUtilities.m");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(":%d"), 129);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClientName:", v22);

  objc_msgSend(v20, "setTracker:", &__block_literal_global_18);
  objc_msgSend(v20, "setExecuteConcurrently:", 1);
  -[ARPHomeControlCorrelationUtilities knowledgeStore](self, "knowledgeStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v23, "executeQuery:error:", v20, &v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v35;

  if (v25)
  {
    ARPLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ARPHomeControlCorrelationUtilities homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:].cold.1((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);

    v33 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v33 = v24;
  }

  return v33;
}

uint64_t __99__ARPHomeControlCorrelationUtilities_homeKitAccessoriesWithPredicate_sortStartDateAscending_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)homeKitScenesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v29;
  void *v30;
  _QWORD v31[2];

  v6 = a4;
  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D15AF8];
  v9 = a3;
  objc_msgSend(v8, "homeKitSceneStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15A08], "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v9, v11, 0, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPHomeControlCorrelationUtilities.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(":%d"), 151);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClientName:", v16);

  objc_msgSend(v14, "setTracker:", &__block_literal_global_19);
  objc_msgSend(v14, "setExecuteConcurrently:", 1);
  -[ARPHomeControlCorrelationUtilities knowledgeStore](self, "knowledgeStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v17, "executeQuery:error:", v14, &v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v29;

  if (v19)
  {
    ARPLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ARPHomeControlCorrelationUtilities homeKitScenesWithPredicate:sortStartDateAscending:limit:].cold.1((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);

    v27 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v27 = v18;
  }

  return v27;
}

uint64_t __94__ARPHomeControlCorrelationUtilities_homeKitScenesWithPredicate_sortStartDateAscending_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)writeArchive:(os_log_t)log toFilePath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD793000, log, OS_LOG_TYPE_ERROR, "Empty archive or filePath when trying to persist Home Controls MicroLocation Correlation", v1, 2u);
}

- (void)writeArchive:(uint64_t)a3 toFilePath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error when trying to persist Home Controls MicroLocation Correlation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)homeKitAccessoriesWithPredicate:(uint64_t)a3 sortStartDateAscending:(uint64_t)a4 limit:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error querying HomeKit Accessory events from knowledge store: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)homeKitScenesWithPredicate:(uint64_t)a3 sortStartDateAscending:(uint64_t)a4 limit:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD793000, a2, a3, "Error querying HomeKit Scene events from knowledge store: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
