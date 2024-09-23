@implementation GDInteractionStoreShim

+ (id)interactionFromCDInteraction:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  GDInteraction *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *started;

  v3 = a3;
  objc_msgSend_sender(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_sender(v3, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1C10692D4((uint64_t)GDInteractionStoreShim, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_recipients(v3, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__pas_mappedArrayWithTransform_(v12, v13, (uint64_t)&unk_1E7A49958, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [GDInteraction alloc];
  objc_msgSend_startDate(v3, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endDate(v3, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleId(v3, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_mechanism(v3, v29, v30, v31);
  v36 = objc_msgSend_direction(v3, v33, v34, v35);
  v40 = objc_msgSend_selfParticipantStatus(v3, v37, v38, v39);
  started = (void *)objc_msgSend_initWithStartDate_endDate_bundleId_mechanism_direction_sender_recipients_selfParticipantStatus_(v16, v41, (uint64_t)v20, (uint64_t)v24, v28, v32, v36, v7, v15, v40);

  return started;
}

+ (id)interactionHistoryFromStore:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend_predicateWithValue_(MEMORY[0x1E0CB3880], v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v8 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v9, (uint64_t)CFSTR("startDate"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  v11 = (void *)MEMORY[0x1C3BA7BEC]();
  v44[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v44, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_error_(v3, v14, (uint64_t)v7, (uint64_t)v13, 10000, 0, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v40;

  if (v15)
  {
    v35 = v3;

    objc_autoreleasePoolPop(v11);
    v17 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = v15;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, (uint64_t)v41, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v37;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v18);
          objc_msgSend_interactionFromCDInteraction_(GDInteractionStoreShim, v21, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v25), v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend_addObject_(v17, v26, (uint64_t)v28, v27);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v36, (uint64_t)v41, 16);
      }
      while (v23);
    }

    v32 = (void *)objc_msgSend_copy(v17, v29, v30, v31);
    v3 = v35;
  }
  else
  {
    GDDefaultLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v16;
      _os_log_error_impl(&dword_1C0771000, v33, OS_LOG_TYPE_ERROR, "GDInteractionStoreShim: interactionHistoryFromStore error: %@", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v11);
    v32 = 0;
  }

  return v32;
}

+ (id)interactionHistoryEnumeratorWithBatchSize:(unint64_t)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend_defaultDatabaseDirectory(MEMORY[0x1E0D158E0], a2, a3, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_storeWithDirectory_readOnly_(v6, v8, (uint64_t)v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_interactionHistoryEnumeratorFromStore_batchSize_(a1, v10, (uint64_t)v9, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)interactionHistoryEnumeratorWithPredicate:(id)a3 sortDescriptor:(id)a4 batchSize:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;

  v8 = (void *)MEMORY[0x1E0D158E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend_defaultDatabaseDirectory(v8, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_storeWithDirectory_readOnly_(v8, v15, (uint64_t)v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_interactionHistoryEnumeratorFromStore_predicate_sortDescriptor_batchSize_(a1, v17, (uint64_t)v16, (uint64_t)v10, v9, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)interactionHistoryEnumeratorFromStore:(id)a3 batchSize:(unint64_t)a4
{
  id v5;
  GDInteractionEnumeration *v6;
  const char *v7;
  void *v8;

  v5 = a3;
  v6 = [GDInteractionEnumeration alloc];
  v8 = (void *)objc_msgSend_initWithStore_batchSize_(v6, v7, (uint64_t)v5, a4);

  return v8;
}

+ (id)interactionHistoryEnumeratorFromStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  GDInteractionEnumeration *v12;
  const char *v13;
  void *v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [GDInteractionEnumeration alloc];
  v14 = (void *)objc_msgSend_initWithStore_predicate_sortDescriptor_batchSize_(v12, v13, (uint64_t)v11, (uint64_t)v10, v9, a6);

  return v14;
}

@end
