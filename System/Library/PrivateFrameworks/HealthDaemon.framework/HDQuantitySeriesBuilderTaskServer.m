@implementation HDQuantitySeriesBuilderTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5A38];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (HDQuantitySeriesBuilderTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDQuantitySeriesBuilderTaskServer *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  HDQuantitySeriesBuilderTaskServer *v15;
  objc_super v17;

  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantitySeriesBuilderTaskServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  if (v12)
  {
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    if (!v11)
    {
      v15 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_configuration, a4);
    v12->_state = 0;
  }
  v15 = v12;
LABEL_6:

  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_insertQuantitySeries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HDQuantitySeriesBuilderTaskServer_remote_insertQuantitySeries_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __76__HDQuantitySeriesBuilderTaskServer_remote_insertQuantitySeries_completion___block_invoke(uint64_t a1)
{
  -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_queue_insertQuantitySeries:(void *)a3 completion:
{
  id v5;
  void (**v6)(id, uint64_t, id);
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
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
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  void (**v33)(id, uint64_t, id);
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E6DFE258, &unk_1E6DFE270, &unk_1E6DFE288, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v8 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v7, CFSTR("insert"), (uint64_t)&v34);
    v9 = v34;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        v11 = *(void **)(a1 + 48);
        v29 = v9;
        v12 = -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:series:forceInsert:error:](a1, v5, v11, 0, &v29);
        v13 = v29;

        v6[2](v6, v12, v13);
        v10 = v13;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(*(id *)(a1 + 88), "quantityType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "canonicalUnit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "values");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "value");
        objc_msgSend(v14, "quantityWithUnit:doubleValue:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CB6A40];
        objc_msgSend(*(id *)(a1 + 88), "quantityType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "startDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 88), "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_unfrozenQuantitySampleWithQuantityType:quantity:startDate:device:", v21, v19, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong((id *)(a1 + 48), v24);
        *(_QWORD *)(a1 + 56) = 1;
        objc_msgSend((id)a1, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sampleSavingDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke;
        v30[3] = &unk_1E6CFD2E8;
        v30[4] = a1;
        v33 = v6;
        v31 = v5;
        v32 = v24;
        v28 = v24;
        objc_msgSend(v26, "saveSamples:withCompletion:", v27, v30);

      }
    }
    else
    {
      v6[2](v6, 0, v9);
    }

  }
}

- (void)remote_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  HDQuantitySeriesBuilderTaskServer *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke;
  block[3] = &unk_1E6CFA0F0;
  v20 = v12;
  v21 = self;
  v23 = v11;
  v24 = v13;
  v22 = v10;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v12;
  dispatch_async(queue, block);

}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2;
    v7[3] = &unk_1E6CEFB70;
    v4 = *(id *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v10 = v4;
    v7[4] = v5;
    v8 = v6;
    v9 = *(id *)(a1 + 56);
    -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:completion:](v2, v3, v7);

  }
  else
  {
    -[HDQuantitySeriesBuilderTaskServer _queue_finishSeriesWithMetadata:endDate:completion:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v3 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_3;
    v6[3] = &unk_1E6CE7E08;
    v6[1] = 3221225472;
    v6[4] = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    dispatch_async(v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_3(uint64_t a1)
{
  -[HDQuantitySeriesBuilderTaskServer _queue_finishSeriesWithMetadata:endDate:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_queue_finishSeriesWithMetadata:(void *)a3 endDate:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  void (**v49)(id, _QWORD, id);
  id v50;
  id location;
  id v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E6DFE270, &unk_1E6DFE288, &unk_1E6DFE2A0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v11 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v10, CFSTR("finish"), (uint64_t)&v52);
    v12 = v52;
    v13 = v52;
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 56);
    if ((v11 & 1) == 0)
    {
      if (!v15)
      {
        *(_QWORD *)(a1 + 56) = 9;
        objc_storeStrong((id *)(a1 + 72), v12);
      }
      v9[2](v9, 0, v14);
      goto LABEL_8;
    }
    *(_QWORD *)(a1 + 56) = 8;
    if (v15 == 1)
    {
      *(_QWORD *)(a1 + 56) = 6;
      objc_initWeak(&location, (id)a1);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HDQuantitySeriesBuilderTaskServer__queue_finishSeriesWithMetadata_endDate_completion___block_invoke;
      aBlock[3] = &unk_1E6CFD310;
      objc_copyWeak(&v50, &location);
      v7 = v7;
      v47 = v7;
      v48 = v8;
      v49 = v9;
      v16 = _Block_copy(aBlock);
      v17 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v16;

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
LABEL_8:

      goto LABEL_9;
    }
    v45 = v13;
    v18 = v7;
    if (!v18)
      goto LABEL_13;
    objc_msgSend((id)a1, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "applicationSDKVersionToken");

    if ((dyld_version_token_at_least() & 1) == 0)
    {
      objc_msgSend(v18, "hk_copyWithoutPrivateMetadataKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_retainAutorelease(v26);
      v25 = 1;
      goto LABEL_17;
    }
    objc_msgSend((id)a1, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "entitlements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hasPrivateMetadataAccess");

    if (!objc_msgSend(v18, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v24, v21, &v45))v25 = 0;
    else
LABEL_13:
      v25 = 1;
    v27 = v18;
LABEL_17:

    v7 = v27;
    v28 = v45;

    if ((v25 & 1) == 0)
    {
      v9[2](v9, 0, v28);
      v14 = v28;
      goto LABEL_8;
    }
    objc_msgSend((id)a1, "profile");
    v29 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dataManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "quantitySeriesManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(a1 + 48);
    v44 = v28;
    v42 = v29;
    objc_msgSend(v32, "freezeSeries:metadata:endDate:error:", v33, v7, v29, &v44);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v44;

    if (v34)
    {
      v35 = v14;
      objc_msgSend(v34, "frozenIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v34, "frozenIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "profile");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v35;
        +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDQuantitySampleSeriesEntity, "objectWithUUID:encodingOptions:profile:error:", v37, 0, v38, &v43);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v43;

        if (v39)
        {
          v53[0] = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, id))v9)[2](v9, v40, 0);

        }
        else
        {
          v9[2](v9, 0, v14);
        }
        v8 = v42;

        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v41);

      v14 = v35;
    }
    else
    {
      v9[2](v9, 0, v14);
    }
    v8 = v42;
LABEL_28:

    goto LABEL_8;
  }
LABEL_9:

}

- (void)remote_discardWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HDQuantitySeriesBuilderTaskServer_remote_discardWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__HDQuantitySeriesBuilderTaskServer_remote_discardWithCompletion___block_invoke(uint64_t a1)
{
  -[HDQuantitySeriesBuilderTaskServer _queue_discardWithCompletion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_discardWithCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id location;
  id v22;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E6DFE258, &unk_1E6DFE270, &unk_1E6DFE288, &unk_1E6DFE2B8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v5 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v4, CFSTR("discard"), (uint64_t)&v22);
    v6 = v22;
    if ((v5 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 5;
      if (v7 == 1)
      {
        *(_QWORD *)(a1 + 56) = 3;
        objc_initWeak(&location, (id)a1);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__HDQuantitySeriesBuilderTaskServer__queue_discardWithCompletion___block_invoke;
        aBlock[3] = &unk_1E6CF2920;
        objc_copyWeak(&v20, &location);
        v19 = v3;
        v8 = _Block_copy(aBlock);
        v9 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v8;

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
      else if (v7)
      {
        v10 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = 0;
        v11 = v10;

        objc_msgSend((id)a1, "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "quantitySeriesManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v6;
        v15 = objc_msgSend(v14, "discardSeries:error:", v11, &v17);
        v16 = v17;

        (*((void (**)(id, uint64_t, id))v3 + 2))(v3, v15, v16);
        v6 = v16;
      }
      else
      {
        (*((void (**)(id, uint64_t, _QWORD))v3 + 2))(v3, 1, 0);
      }
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v3 + 2))(v3, 0, v6);
    }

  }
}

- (int64_t)state
{
  NSObject *queue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 9;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HDQuantitySeriesBuilderTaskServer_state__block_invoke;
  v6[3] = &unk_1E6CE8110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__HDQuantitySeriesBuilderTaskServer_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (uint64_t)_queue_isStateInAllowedStates:(void *)a3 description:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "hk_map:", &__block_literal_global_144);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromHDQuantitySeriesBuilderTaskServerState(*(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Current state \"%@\" is not in allowed state(s) %@ for action %@"), v13, v11, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a4, 3, v14, *(_QWORD *)(a1 + 72));
  }

  return v10;
}

void __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a3;
  v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 96));
  v7 = v6;
  if (v6)
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke_2;
  v11[3] = &unk_1E6CFD2C0;
  v16 = a2;
  v11[4] = v8;
  v12 = v5;
  v15 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v10 = v5;
  dispatch_async(v9, v11);

}

void __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 40));
    v3 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HDQuantitySeriesBuilderTaskServer__queue_newSeriesSaveCompleted__block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = v2;
    dispatch_async(v3, block);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    *(_QWORD *)(v4 + 56) = 9;
    v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v7;

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  v5 = *(_QWORD *)(v4 + 56);
  switch(v5)
  {
    case 1:
      v6 = 2;
      goto LABEL_11;
    case 3:
      v6 = 4;
      goto LABEL_11;
    case 6:
      v6 = 7;
LABEL_11:
      *(_QWORD *)(v4 + 56) = v6;
      v4 = *(_QWORD *)(a1 + 32);
      break;
  }
  v10 = *(void **)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v13 = 0;
  -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:series:forceInsert:error:](v4, v10, v11, 1, &v13);
  v12 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (uint64_t)_queue_insertQuantitySeries:(void *)a3 series:(int)a4 forceInsert:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v31;

  v9 = a2;
  v10 = a3;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_20;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 != 2)
  {
    if (v11 == 1)
    {
      v12 = *(void **)(a1 + 64);
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v13;

        v12 = *(void **)(a1 + 64);
      }
      objc_msgSend(v9, "values");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v15);

      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_11:
      v20 = 1;
      goto LABEL_20;
    }
  }
  v16 = *(void **)(a1 + 64);
  if (v16
    && (objc_msgSend(v9, "values"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "addObjectsFromArray:", v17),
        v17,
        (v18 = *(void **)(a1 + 64)) != 0))
  {
    v19 = v18;
  }
  else
  {
    objc_msgSend(v9, "values");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v19;
  v22 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  objc_msgSend((id)a1, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "quantitySeriesManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v20 = objc_msgSend(v25, "insertValues:series:error:", v21, v10, &v31);
  v26 = v31;

  if ((v20 & 1) == 0)
  {
    *(_QWORD *)(a1 + 56) = 9;
    v27 = objc_msgSend(v26, "copy");
    v28 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v27;

    v29 = v26;
    if (v29)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

  }
LABEL_20:

  return v20;
}

void __66__HDQuantitySeriesBuilderTaskServer__queue_newSeriesSaveCompleted__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 80));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void __88__HDQuantitySeriesBuilderTaskServer__queue_finishSeriesWithMetadata_endDate_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[HDQuantitySeriesBuilderTaskServer _queue_finishSeriesWithMetadata:endDate:completion:](WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __66__HDQuantitySeriesBuilderTaskServer__queue_discardWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDQuantitySeriesBuilderTaskServer _queue_discardWithCompletion:](WeakRetained, *(_QWORD *)(a1 + 32));

}

__CFString *__85__HDQuantitySeriesBuilderTaskServer__queue_isStateInAllowedStates_description_error___block_invoke(uint64_t a1, void *a2)
{
  return NSStringFromHDQuantitySeriesBuilderTaskServerState(objc_msgSend(a2, "integerValue"));
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A48], "serverInterface");
}

- (id)remoteInterface
{
  return 0;
}

- (id)unitTest_saveSamplesCompletion
{
  return self->_unitTest_saveSamplesCompletion;
}

- (void)setUnitTest_saveSamplesCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_saveSamplesCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_queue_activeHandler, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
