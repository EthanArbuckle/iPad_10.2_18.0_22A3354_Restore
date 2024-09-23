@implementation ATXIntentStream

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5
{
  return -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:](self, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:", a3, a4, a5, 0, 0);
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7
{
  return -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:INIntentFilter:linkActionFilter:](self, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:INIntentFilter:linkActionFilter:", a3, a4, a5, a6, a7, 0, 0);
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 INIntentFilter:(id)a8 linkActionFilter:(id)a9
{
  return -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:limit:INIntentFilter:linkActionFilter:](self, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:limit:INIntentFilter:linkActionFilter:", a3, a4, a5, a6, a7, 100, a8, a9);
}

- (id)getIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 limit:(unint64_t)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  unint64_t v29;

  v11 = a7;
  v17 = a10;
  v18 = a9;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_opt_new();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __141__ATXIntentStream_getIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_limit_INIntentFilter_linkActionFilter___block_invoke;
  v27[3] = &unk_1E4D59958;
  v28 = v22;
  v29 = a8;
  v23 = v22;
  -[ATXIntentStream _enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:](self, "_enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:", v21, v20, a5, v19, v11, 1, v18, v17, v27);

  objc_msgSend(v23, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

BOOL __141__ATXIntentStream_getIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_limit_INIntentFilter_linkActionFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 40);
}

- (unint64_t)numberOfIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[1] = 3221225472;
  v10[2] = __64__ATXIntentStream_numberOfIntentEventsBetweenStartDate_endDate___block_invoke;
  v10[3] = &unk_1E4D59980;
  v10[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  -[ATXIntentStream _enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:](self, "_enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:", v6, v7, 2, 0, 0, 0, 0, 0, v10);
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __64__ATXIntentStream_numberOfIntentEventsBetweenStartDate_endDate___block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (void)_enumerateIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 forSource:(int64_t)a5 bundleIdFilter:(id)a6 allowMissingTitles:(BOOL)a7 reversed:(BOOL)a8 INIntentFilter:(id)a9 linkActionFilter:(id)a10 block:(id)a11
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v48;
  void *context;
  void *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  int64_t v56;
  BOOL v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61[2];

  v11 = a8;
  v14 = a3;
  v15 = a4;
  v44 = a6;
  v41 = a9;
  v16 = a10;
  v43 = a11;
  context = (void *)MEMORY[0x1A85A4F90]();
  v17 = objc_alloc_init(MEMORY[0x1E0D44288]);
  if (v11)
    v18 = v15;
  else
    v18 = v14;
  v50 = v15;
  v51 = v14;
  if (v11)
    v19 = v14;
  else
    v19 = v15;
  v61[0] = 0;
  v48 = v17;
  objc_msgSend(v17, "transcriptPublisherWithStreamName:fromDate:toDate:maxEvents:reversed:error:", 0, v18, v19, 0, v11, v61, v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v61[0];
  BiomeLibrary();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "App");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "Intent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v18, v19, 0, 0, v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 || !v20)
  {
    __atxlog_handle_default();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ATXIntentStream _enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:].cold.1();

    v26 = v25;
  }
  else
  {
    objc_msgSend(v25, "orderedMergeWithOther:comparator:", v20, &__block_literal_global_40);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v26;
  v29 = (void *)MEMORY[0x1E0C99E60];
  +[ATXIntentGlobals sharedInstance](ATXIntentGlobals, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "approvedSiriKitIntents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2;
  v58[3] = &unk_1E4D599C8;
  v34 = v42;
  v59 = v34;
  v35 = v16;
  v60 = v35;
  objc_msgSend(v28, "filterWithIsIncluded:", v58);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v33;
  v52[1] = 3221225472;
  v52[2] = __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_16;
  v52[3] = &unk_1E4D599F0;
  v52[4] = self;
  v56 = a5;
  v37 = v44;
  v57 = a7;
  v53 = v37;
  v54 = v32;
  v38 = v43;
  v55 = v38;
  v39 = v32;
  v40 = (id)objc_msgSend(v36, "sinkWithCompletion:shouldContinue:", &__block_literal_global_15_0, v52);

  objc_autoreleasePoolPop(context);
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = *(_QWORD *)(a1 + 40);
      if (v4)
        goto LABEL_4;
LABEL_7:
      v5 = 1;
      goto LABEL_12;
    }
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1();

LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
    goto LABEL_7;
LABEL_4:
  v5 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v3);
LABEL_12:

  return v5;
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_13_cold_1(v2);

  }
}

uint64_t __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    if (v6)
      v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    else
      v8 = 1;

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1();

  v8 = 1;
LABEL_12:

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (id)getIntentEventForSourceItemID:(id)a3 forSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke;
  v17[3] = &unk_1E4D59A18;
  v18 = v6;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke_2;
  v15[3] = &unk_1E4D59A40;
  v10 = v18;
  v16 = v10;
  -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:limit:INIntentFilter:linkActionFilter:](self, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:limit:INIntentFilter:linkActionFilter:", v7, v8, a4, 0, 0, 2, v17, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXIntentStream getIntentEventForSourceItemID:forSource:].cold.1();

  }
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __59__ATXIntentStream_getIntentEventForSourceItemID_forSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "executionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)_getIntentEventFromLinkActionRecord:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  LNMetadataProvider *metadataProvider;
  LNMetadataProvider *v24;
  LNMetadataProvider *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  ATXAction *v32;
  void *v33;
  void *v34;
  ATXIntentEvent *v35;
  void *v36;
  ATXIntentEvent *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v43;
  ATXAction *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  id v50;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "executionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "action");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.2();
      v37 = 0;
      goto LABEL_50;
    }
    objc_msgSend(v10, "predictions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      __atxlog_handle_default();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.3();
      v37 = 0;
      goto LABEL_49;
    }
    v49 = v11;
    -[NSObject displayRepresentation](v15, "displayRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "atx_efficientLocalizedString");
    v18 = objc_claimAutoreleasedReturnValue();

    if (!a6 && !-[NSObject length](v18, "length"))
    {
      __atxlog_handle_default();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.9();
      v37 = 0;
      v39 = v18;
      v11 = v49;
      goto LABEL_48;
    }
    -[NSObject displayRepresentation](v15, "displayRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "atx_efficientLocalizedString");
    v48 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      v22 = objc_msgSend(v10, "source");
      if (v49 && !objc_msgSend(v49, "isEqualToString:", v21))
      {
        __atxlog_handle_default();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.8();
          v37 = 0;
          v39 = v18;
          v11 = v49;
LABEL_38:
          v38 = v48;
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
          goto LABEL_51;
        }
      }
      else
      {
        if (a4)
        {
          if (a4 == 2 || a4 == 1 && v22 != 3)
            goto LABEL_13;
        }
        else if (v22 == 3)
        {
LABEL_13:
          metadataProvider = self->_metadataProvider;
          if (!metadataProvider)
          {
            v24 = (LNMetadataProvider *)objc_alloc_init(MEMORY[0x1E0D44208]);
            v25 = self->_metadataProvider;
            self->_metadataProvider = v24;

            metadataProvider = self->_metadataProvider;
          }
          -[NSObject identifier](v13, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          -[LNMetadataProvider actionForBundleIdentifier:andActionIdentifier:error:](metadataProvider, "actionForBundleIdentifier:andActionIdentifier:error:", v21, v26, &v50);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v50;

          v46 = (void *)v27;
          if (v27)
          {
            v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD738]), "initWithAppBundleIdentifier:linkAction:linkActionMetadata:", v21, v13, v27);
            if (v47)
            {
              v29 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v10, "executionDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "executionDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v29, "initWithStartDate:endDate:", v30, v31);

              LOBYTE(v43) = 0;
              v32 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:]([ATXAction alloc], "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v47, v12, v21, 0, 0, 0, v43, v18, v48);
              objc_msgSend(v10, "predictions");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "_pas_mappedArrayWithTransform:", &__block_literal_global_25);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v32;
              -[ATXAction setPredictableParameterCombinations:](v32, "setPredictableParameterCombinations:", v34);

              v35 = [ATXIntentEvent alloc];
              -[NSObject _className](v47, "_className");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:action:](v35, "initWithBundleId:intentType:dateInterval:action:", v21, v36, v45, v32);

              v38 = v48;
              v39 = v18;

              v40 = (void *)v45;
            }
            else
            {
              __atxlog_handle_default();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.7((uint64_t)v21, v13);
              v37 = 0;
              v40 = v41;
              v39 = v18;
              v38 = v48;
            }

            v11 = v49;
          }
          else
          {
            __atxlog_handle_default();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.6();
            v37 = 0;
            v39 = v18;
            v38 = v48;
            v11 = v49;
          }

          goto LABEL_47;
        }
        __atxlog_handle_default();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.5(v22 == 3, a4, v28);
      }
    }
    else
    {
      __atxlog_handle_default();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.4(v13);
    }
    v37 = 0;
    v39 = v18;
    v11 = v49;
    goto LABEL_38;
  }
  __atxlog_handle_default();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[ATXIntentStream _getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:].cold.1();
  v37 = 0;
LABEL_51:

  return v37;
}

ATXActionPredictableParameters *__96__ATXIntentStream__getIntentEventFromLinkActionRecord_source_bundleIdFilter_allowMissingTitles___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXActionPredictableParameters *v3;
  ATXActionPredictableParameters *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "parameterIdentifiers");
  v3 = (ATXActionPredictableParameters *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [ATXActionPredictableParameters alloc];
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v2, "parameterIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
    v3 = -[ATXActionPredictableParameters initWithParameterKeys:](v4, "initWithParameterKeys:", v7);

  }
  return v3;
}

- (id)_unarchiveInteractionFromBMAppIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(v3, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:].cold.2();

    }
  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:].cold.1();
    v6 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (id)_uuidForBMAppIntent:(id)a3 interaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (v9 = objc_alloc(MEMORY[0x1E0CB3A28]),
        objc_msgSend(v6, "itemID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10),
        v10,
        !v11))
  {
    if (!v7)
    {
      -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:](self, "_unarchiveInteractionFromBMAppIntent:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12
      || (v13 = objc_alloc(MEMORY[0x1E0CB3A28]),
          objc_msgSend(v7, "identifier"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14),
          v14,
          !v11))
    {
      objc_msgSend(v7, "intent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v7, "intent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v16, "initWithUUIDString:", v18);

      }
    }
  }

  return v11;
}

- (id)_getIntentEventFromBMAppIntent:(id)a3 source:(int64_t)a4 bundleIdFilter:(id)a5 allowMissingTitles:(BOOL)a6 intentsToKeep:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  ATXIntentEvent *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  ATXAction *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  ATXIntentEvent *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  os_log_t log;
  os_log_t loga;
  NSObject *logb;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  int64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (!objc_msgSend(v12, "intentType"))
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.1();
    goto LABEL_7;
  }
  if (objc_msgSend(v12, "handlingStatus") != 5)
  {
    -[ATXIntentStream _unarchiveInteractionFromBMAppIntent:](self, "_unarchiveInteractionFromBMAppIntent:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.3();
      v16 = 0;
      goto LABEL_69;
    }
    -[ATXIntentStream _uuidForBMAppIntent:interaction:](self, "_uuidForBMAppIntent:interaction:", v12, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.4();
      goto LABEL_18;
    }
    if (-[NSObject direction](v15, "direction") == 2)
    {
      __atxlog_handle_default();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.5();
LABEL_18:
      v16 = 0;
LABEL_68:

LABEL_69:
      goto LABEL_70;
    }
    if (!a6)
    {
      -[NSObject intent](v15, "intent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "atx_titleLengthWithoutLocalizing");

      if (!v20)
      {
        __atxlog_handle_default();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.12();
        goto LABEL_18;
      }
    }
    objc_msgSend(v12, "intentClass");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[NSObject intent](v15, "intent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "_type") == 2)
      {

      }
      else
      {
        v22 = objc_msgSend(v14, "containsObject:", v18);

        if ((v22 & 1) == 0)
        {
          __atxlog_handle_default();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.11();
          v16 = 0;
          goto LABEL_67;
        }
      }
    }
    -[NSObject intent](v15, "intent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_className");
    v24 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v24, "isEqualToString:", CFSTR("INIntent")))
    {
      __atxlog_handle_default();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.6();
      v16 = 0;
      goto LABEL_66;
    }
    objc_msgSend(v12, "bundleID");
    v25 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v25, "length"))
    {
      if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild")
        && -[NSObject hasPrefix:](v25, "hasPrefix:", CFSTR("appshack.")))
      {
        -[NSObject substringFromIndex:](v25, "substringFromIndex:", objc_msgSend(CFSTR("appshack."), "length"));
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = v26;
      }
      if (!v13 || (objc_msgSend(v13, "isEqualToString:", v25) & 1) != 0)
      {
        log = v25;
        v27 = -[NSObject _donatedBySiri](v15, "_donatedBySiri");
        if (v27 != objc_msgSend(v12, "donatedBySiri"))
        {
          __atxlog_handle_default();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.9();

        }
        if (a4)
        {
          if (a4 == 2 || a4 == 1 && (v27 & 1) == 0)
          {
LABEL_43:
            v50 = v24;
            -[NSObject intent](v15, "intent");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "_intents_bundleIdForDisplay");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            if (v30)
              v32 = (void *)v30;
            else
              v32 = log;
            v25 = v32;

            v33 = [ATXAction alloc];
            -[NSObject intent](v15, "intent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v48) = 0;
            v35 = -[ATXAction initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v33, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v34, v17, v25, 0, 0, 0, v48, 0, 0);

            -[NSObject dateInterval](v15, "dateInterval");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            loga = (os_log_t)v35;
            if (!v36)
            {
              __atxlog_handle_default();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.8();

              v38 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v12, "absoluteTimestamp");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "absoluteTimestamp");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)objc_msgSend(v38, "initWithStartDate:endDate:", v39, v40);

              v35 = (uint64_t)loga;
            }
            v41 = [ATXIntentEvent alloc];
            -[NSObject intent](v15, "intent");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "_className");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v35;
            v44 = (void *)v42;
            v16 = -[ATXIntentEvent initWithBundleId:intentType:dateInterval:action:](v41, "initWithBundleId:intentType:dateInterval:action:", v25, v42, v36, v43);

            v24 = v50;
            v45 = loga;
            goto LABEL_65;
          }
        }
        else if (v27)
        {
          goto LABEL_43;
        }
        __atxlog_handle_default();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.7();
        v16 = 0;
        v25 = log;
        goto LABEL_65;
      }
      __atxlog_handle_default();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.10();
    }
    else
    {
      __atxlog_handle_default();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        -[NSObject intent](v15, "intent");
        logb = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v46;
        v56 = 2112;
        v57 = v24;
        v58 = 2048;
        v59 = a4;
        _os_log_error_impl(&dword_1A49EF000, logb, OS_LOG_TYPE_ERROR, "Donation Processing (INIntent) - Rejected: filtered out because there was no bundleId for intent: %@, intentType: %@, intentSource: %lld", buf, 0x20u);

        v45 = logb;
      }
    }
    v16 = 0;
LABEL_65:

LABEL_66:
LABEL_67:

    goto LABEL_68;
  }
  __atxlog_handle_default();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[ATXIntentStream _getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:].cold.2();
LABEL_7:
  v16 = 0;
LABEL_70:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

- (void)_enumerateIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:reversed:INIntentFilter:linkActionFilter:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXIntentStream: could not obtain Link transcript publisher: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_2_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "ATXIntentStream: Unexpected intent event body: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __157__ATXIntentStream__enumerateIntentEventsBetweenStartDate_endDate_forSource_bundleIdFilter_allowMissingTitles_reversed_INIntentFilter_linkActionFilter_block___block_invoke_13_cold_1(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);

  OUTLINED_FUNCTION_3();
}

- (void)getIntentEventForSourceItemID:forSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "ATXIntentStream: querying Biome for specific intent based on source item id %@ returned multiple events.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Missing UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Missing action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Action not predictable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromLinkActionRecord:(void *)a1 source:bundleIdFilter:allowMissingTitles:.cold.4(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "mangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);

}

- (void)_getIntentEventFromLinkActionRecord:(NSObject *)a3 source:bundleIdFilter:allowMissingTitles:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  LODWORD(v3) = 134218240;
  HIDWORD(v3) = a2;
  OUTLINED_FUNCTION_9_1(&dword_1A49EF000, a2, a3, "Donation Processing (Link) - Rejected: filtered out because source: %lld does not match donatedBySiri: %d", v3, HIDWORD(a2));
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Could not obtain Link action metadata: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromLinkActionRecord:(uint64_t)a1 source:(void *)a2 bundleIdFilter:allowMissingTitles:.cold.7(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_1(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Rejected: filtered out bundle id %@ that doesn't match %@");
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromLinkActionRecord:source:bundleIdFilter:allowMissingTitles:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (Link) - Nil or empty title attached to intent event -- filtering out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unarchiveInteractionFromBMAppIntent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Missing interaction data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unarchiveInteractionFromBMAppIntent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Error unarchiving interaction: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Unknown app intent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Ignoring failed intent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Error unarchiving interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Unable to obtain UUID for interaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Rejected: INInteractionDirectionIncoming", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Rejected: type is INIntent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_9_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Rejected: filtered out because source: %lld does not match _donatedBySiri: %d", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - no date interval; falling back to the date of the Biome event",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Siri donation flags do not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Rejected: filtered out bundle ID %@ that doesn't match %@");
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.11()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEBUG, "Donation Processing (INIntent) - Rejected: not in the intents to keep, %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_getIntentEventFromBMAppIntent:source:bundleIdFilter:allowMissingTitles:intentsToKeep:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Donation Processing (INIntent) - Nil or empty title attached to intent event -- filtering out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
