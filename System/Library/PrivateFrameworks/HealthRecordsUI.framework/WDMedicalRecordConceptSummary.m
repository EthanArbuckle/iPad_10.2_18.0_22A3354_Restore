@implementation WDMedicalRecordConceptSummary

- (WDMedicalRecordConceptSummary)initWithProfile:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  WDMedicalRecordConceptSummary *v9;
  WDMedicalRecordConceptSummary *v10;
  uint64_t v11;
  OS_dispatch_queue *summaryQueue;
  uint64_t v13;
  OS_dispatch_queue *resourceQueue;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *allRecords;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDMedicalRecordConceptSummary;
  v9 = -[WDMedicalRecordConceptSummary init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v10->_dirty = 0;
    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    summaryQueue = v10->_summaryQueue;
    v10->_summaryQueue = (OS_dispatch_queue *)v11;

    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v10->_resourceQueue;
    v10->_resourceQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    allRecords = v10->_allRecords;
    v10->_allRecords = v15;

  }
  return v10;
}

- (void)addMedicalRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__WDMedicalRecordConceptSummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__WDMedicalRecordConceptSummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "allRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (void)setNeedsRecompute
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WDMedicalRecordConceptSummary_setNeedsRecompute__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__WDMedicalRecordConceptSummary_setNeedsRecompute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (void)recomputeIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WDMedicalRecordConceptSummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__WDMedicalRecordConceptSummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
}

- (NSArray)displayItems
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__WDMedicalRecordConceptSummary_displayItems__block_invoke;
  v6[3] = &unk_1E74D1AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__WDMedicalRecordConceptSummary_displayItems__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSString)summarySortString
{
  return (NSString *)&stru_1E74EA150;
}

- (void)_rqueue_setNeedsCompute
{
  NSObject *v3;

  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WDMedicalRecordConceptSummary setDirty:](self, "setDirty:", 1);
}

- (void)_rqueue_recomputeIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WDMedicalRecordConceptSummary *v12;

  -[WDMedicalRecordConceptSummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[WDMedicalRecordConceptSummary dirty](self, "dirty"))
  {
    -[WDMedicalRecordConceptSummary allRecords](self, "allRecords");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[WDMedicalRecordConceptSummary setDirty:](self, "setDirty:", 0);
      -[WDMedicalRecordConceptSummary allRecords](self, "allRecords");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      -[WDMedicalRecordConceptSummary summaryQueue](self, "summaryQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke;
      v10[3] = &unk_1E74D1A90;
      v11 = v7;
      v12 = self;
      v9 = v7;
      dispatch_async(v8, v10);

    }
  }
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  dispatch_group_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  dispatch_group_t v20;
  uint64_t v21;
  id v22;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = dispatch_group_create();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_2;
  v19[3] = &unk_1E74D1EB0;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v20 = v4;
  v21 = v6;
  v8 = v2;
  v22 = v8;
  v9 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(*(id *)(a1 + 40), "summaryQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_4;
  block[3] = &unk_1E74D1288;
  v15 = *(id *)(a1 + 32);
  v16 = v3;
  v11 = *(_QWORD *)(a1 + 40);
  v17 = v8;
  v18 = v11;
  v12 = v8;
  v13 = v3;
  dispatch_group_notify(v9, v10, block);

}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_3;
  v6[3] = &unk_1E74D1E38;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "_displayItemsForRecord:completion:", v5, v6);

}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_5;
  v7[3] = &unk_1E74D1E88;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(a1 + 56), "resourceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_6;
  v5[3] = &unk_1E74D1A90;
  v5[4] = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAllDisplayItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryDidFinishRecompute:", *(_QWORD *)(a1 + 32));

}

- (void)_displayItemsForRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[WDMedicalRecordConceptSummary _displayItemsForObservation:completion:](self, "_displayItemsForObservation:completion:", v7, v6);
  else
    -[WDMedicalRecordConceptSummary _displayItemsForGenericMedicalRecord:completion:](self, "_displayItemsForGenericMedicalRecord:completion:", v7, v6);

}

- (void)_displayItemsForObservation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HRProfile healthRecordsStore](self->_profile, "healthRecordsStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke;
  v13[3] = &unk_1E74D1FC8;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v12, "fetchObservationDetailItemsWithHealthRecordsStore:style:completion:", v9, 2, v13);

}

void __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "summaryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke_2;
  block[3] = &unk_1E74D22D8;
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v10 = a1[4];
  v11 = a1[7];
  v5 = v3;
  dispatch_async(v4, block);

}

void __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem](WDMedicalRecordDisplayItem, "timelineSummaryContentWithSubtitleItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preferredDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v2);

  objc_msgSend(*(id *)(a1 + 32), "meaningfulDateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v3);

  objc_msgSend(v6, "setMedicalRecord:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setPlacement:", 3);
  objc_msgSend(v6, "setSeparatorStyle:", 0);
  objc_msgSend(v6, "setSeparatorHidden:", 1);
  objc_msgSend(v6, "setExtraTopPadding:", 1);
  objc_msgSend(v6, "setShowDisclosureIndicator:", 1);
  objc_msgSend(v6, "setUseRegularFontForSubtitle:", 1);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlacement:", 5);

  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorHidden:", 1);

  objc_msgSend(*(id *)(a1 + 56), "_updatePlacementForDisplayItems:ofRecord:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (void)_displayItemsForGenericMedicalRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  NSObject *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__3;
  v39[4] = __Block_byref_object_dispose__3;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__3;
  v37[4] = __Block_byref_object_dispose__3;
  v38 = 0;
  v8 = dispatch_group_create();
  +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem](WDMedicalRecordDisplayItem, "timelineSummaryContentWithSubtitleItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  objc_msgSend(v6, "meaningfulDateTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubtitle:", v11);

  objc_msgSend(v9, "setMedicalRecord:", v6);
  objc_msgSend(v9, "setPlacement:", 3);
  objc_msgSend(v9, "setSeparatorStyle:", 0);
  objc_msgSend(v9, "setSeparatorHidden:", 0);
  objc_msgSend(v9, "setExtraTopPadding:", 1);
  objc_msgSend(v9, "setShowDisclosureIndicator:", 1);
  objc_msgSend(v9, "setUseRegularFontForSubtitle:", 1);
  v47[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v42[5];
  v42[5] = v12;

  objc_msgSend(v6, "originIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "signedClinicalDataRecordIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    dispatch_group_enter(v8);
    -[HRProfile clinicalSourcesDataProvider](self->_profile, "clinicalSourcesDataProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke;
    v33[3] = &unk_1E74D2300;
    v34 = v9;
    v35 = v6;
    v36 = v8;
    objc_msgSend(v17, "fetchSignedClinicalDataRecordWithIdentifier:completion:", v15, v33);

  }
  dispatch_group_enter(v8);
  -[HRProfile healthRecordsStore](self->_profile, "healthRecordsStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRProfile conceptStore](self->_profile, "conceptStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_2;
  v30[3] = &unk_1E74D2350;
  v30[4] = self;
  v32 = v37;
  v20 = v8;
  v31 = v20;
  objc_msgSend(v6, "fetchConceptRoomItemsWithHealthRecordsStore:conceptStore:completion:", v18, v19, v30);

  -[WDMedicalRecordConceptSummary summaryQueue](self, "summaryQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_4;
  block[3] = &unk_1E74D2378;
  v28 = v39;
  v29 = v37;
  block[4] = self;
  v25 = v6;
  v26 = v7;
  v27 = &v41;
  v22 = v7;
  v23 = v6;
  dispatch_group_notify(v20, v21, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(&v41, 8);
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "meaningfulDateTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedMeaningfulDateStringWithDateTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setAttributedSubtitle:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "summaryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_3;
  block[3] = &unk_1E74D2328;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updatePlacementForDisplayItems:ofRecord:", v2, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_updatePlacementForDisplayItems:(id)a3 ofRecord:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __74__WDMedicalRecordConceptSummary__updatePlacementForDisplayItems_ofRecord___block_invoke;
  v14 = &unk_1E74D23A0;
  v17 = &v25;
  v7 = v5;
  v15 = v7;
  v18 = &v19;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  v9 = (void *)v26[5];
  if (v9 == (void *)v20[5])
  {
    v10 = 2;
  }
  else
  {
    objc_msgSend(v9, "setPlacement:", 3, v11, v12, v13, v14, v15);
    v9 = (void *)v20[5];
    v10 = 5;
  }
  objc_msgSend(v9, "setPlacement:", v10, v11, v12, v13, v14);
  objc_msgSend((id)v20[5], "setSeparatorHidden:", 1);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

}

void __74__WDMedicalRecordConceptSummary__updatePlacementForDisplayItems_ofRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (!a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  objc_msgSend(v6, "setPlacement:", 4);
  objc_msgSend(v6, "setMedicalRecord:", *(_QWORD *)(a1 + 40));

}

- (WDMedicalRecordSummaryDelegate)delegate
{
  return (WDMedicalRecordSummaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSMutableOrderedSet)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
{
  objc_storeStrong((id *)&self->_allRecords, a3);
}

- (NSArray)allDisplayItems
{
  return self->_allDisplayItems;
}

- (void)setAllDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_allDisplayItems, a3);
}

- (OS_dispatch_queue)summaryQueue
{
  return self->_summaryQueue;
}

- (void)setSummaryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_summaryQueue, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceQueue, a3);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_summaryQueue, 0);
  objc_storeStrong((id *)&self->_allDisplayItems, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
