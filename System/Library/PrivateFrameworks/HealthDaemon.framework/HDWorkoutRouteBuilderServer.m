@implementation HDWorkoutRouteBuilderServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB74C0];
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E60], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E60], "clientInterface");
}

- (void)remote_insertRouteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HDSeriesBuilderServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer_remote_insertRouteData_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__HDWorkoutRouteBuilderServer_remote_insertRouteData_completion___block_invoke(void **a1)
{
  -[HDWorkoutRouteBuilderServer _queue_insertRouteData:completion:](a1[4], a1[5], a1[6]);
}

- (void)_queue_insertRouteData:(void *)a3 completion:
{
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v30 = 0;
    v7 = objc_msgSend(a1, "queue_canInsertDataWithError:", &v30);
    v8 = v30;
    if ((v7 & 1) != 0)
    {
      v29 = 0;
      v9 = v5;
      if (objc_msgSend(v9, "count"))
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = (void *)MEMORY[0x1E0CB35C8];
                v17 = objc_opt_class();
                objc_msgSend(v16, "hk_assignError:code:format:", &v29, 3, CFSTR("%@: Invalid data series object %@"), v17, objc_opt_class());

                v15 = 0;
                goto LABEL_17;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            if (v12)
              continue;
            break;
          }
        }

        v15 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v29, 3, CFSTR("%@: Route data cannot be nil or empty."), objc_opt_class());
        v15 = 0;
      }
LABEL_17:

      v18 = v29;
      if ((v15 & 1) != 0)
      {
        v19 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke;
        aBlock[3] = &unk_1E6CF9798;
        aBlock[4] = a1;
        v20 = v9;
        v27 = v20;
        v21 = v6;
        v28 = v21;
        v23[0] = v19;
        v23[1] = 3221225472;
        v23[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_6;
        v23[3] = &unk_1E6CECC58;
        v23[4] = a1;
        v25 = _Block_copy(aBlock);
        v24 = v20;
        v22 = v25;
        objc_msgSend(a1, "createSeriesSampleIfNeeded:errorHandler:", v23, v21);

      }
      else if (v6)
      {
        (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v18);
      }
      v8 = v18;
    }
    else if (v6)
    {
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v8);
    }

  }
}

- (void)remote_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HDSeriesBuilderServer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__HDWorkoutRouteBuilderServer_remote_finishRouteWithWorkout_metadata_completion___block_invoke;
  v15[3] = &unk_1E6CE7E08;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __81__HDWorkoutRouteBuilderServer_remote_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  char *v15;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  if (v1)
  {
    objc_msgSend(v1, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(v1, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workoutBuilderID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_finishRouteWithWorkout_metadata_completion_, CFSTR("This route builder is attached to a workout builder and will be finished with the workout builder"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v10);

    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke;
      v11[3] = &unk_1E6CF97E8;
      v14 = v6;
      v11[4] = v1;
      v12 = v5;
      v13 = v4;
      v15 = sel__queue_finishRouteWithWorkout_metadata_completion_;
      objc_msgSend(v1, "queue_freezeBuilderWithCompletion:", v11);

    }
  }

}

- (void)server_insertRouteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HDSeriesBuilderServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer_server_insertRouteData_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__HDWorkoutRouteBuilderServer_server_insertRouteData_completion___block_invoke(void **a1)
{
  -[HDWorkoutRouteBuilderServer _queue_insertRouteData:completion:](a1[4], a1[5], a1[6]);
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a1[4];
  v7 = a3;
  objc_msgSend(v6, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v5, "count");
  v10 = objc_msgSend(v7, "count");

  objc_msgSend(v5, "_setCount:", v10 + v9);
  objc_msgSend(a1[4], "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sampleSavingDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_2;
  v19[3] = &unk_1E6CE7E08;
  v20 = a1[5];
  v21 = v5;
  v22 = a1[4];
  v23 = a1[6];
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_5;
  v17[3] = &unk_1E6CF7CA8;
  v18 = a1[6];
  v16 = v5;
  objc_msgSend(v12, "performIfAuthorizedToSaveObjectTypes:usingBlock:errorHandler:", v14, v19, v17);

}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  BOOL v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = +[HDLocationSeriesSampleEntity insertLocationData:seriesIdentifier:profile:error:](HDLocationSeriesSampleEntity, "insertLocationData:seriesIdentifier:profile:error:", v2, v3, v4, &v14);
  v6 = v14;

  objc_msgSend(*(id *)(a1 + 48), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_3;
  block[3] = &unk_1E6CF9770;
  v8 = *(void **)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 48);
  v13 = v5;
  v11 = v6;
  v12 = v8;
  v9 = v6;
  dispatch_async(v7, block);

}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_4;
  v3[3] = &unk_1E6CEBC78;
  v5 = *(id *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "queue_setState:completion:", 1, v3);

}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 0;
LABEL_4:
    (*(void (**)(_QWORD, BOOL, uint64_t))(v1 + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) != 0, v2);
    return;
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to save series data."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v3);

}

uint64_t __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_7;
  block[3] = &unk_1E6CEBCA0;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  block[4] = v4;
  v7 = v5;
  dispatch_async(v2, block);

}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "seriesSample");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

void __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v25 = v5;
    v8 = objc_msgSend(v6, "canAddMetadata:errorOut:", v7, &v25);
    v9 = v25;

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sampleSavingDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "seriesSample");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sampleType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_2;
      v20[3] = &unk_1E6CF97C0;
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v23 = v16;
      v24 = v17;
      v22 = *(id *)(a1 + 40);
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_3;
      v18[3] = &unk_1E6CF7CA8;
      v19 = *(id *)(a1 + 56);
      objc_msgSend(v11, "performIfAuthorizedToSaveObjectTypes:usingBlock:errorHandler:", v14, v20, v18);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    v5 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to finish the series data."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40)
    || (objc_msgSend(v3, "dataManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsDataObject:", *(_QWORD *)(a1 + 40)),
        v5,
        (v6 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "seriesSample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v30 = 0;
    +[HDSeriesBuilderEntity freezeSeriesWithIdentifier:metadata:profile:error:](HDWorkoutRouteBuilderEntity, "freezeSeriesWithIdentifier:metadata:profile:error:", v8, v9, v4, &v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v30;

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "client");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "baseDataEntityEncodingOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v11;
      +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDLocationSeriesSampleEntity, "objectWithUUID:encodingOptions:profile:error:", v10, v13, v4, &v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v29;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        if (v14)
        {
          objc_msgSend(v14, "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "UUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0;
          objc_msgSend(*(id *)(a1 + 32), "profile");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v15;
          v19 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v16, v17, 0, 0, &v28, v18, &v27);
          v25 = v28;
          v24 = v27;

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "postNotificationName:object:", CFSTR("HDHealthStoreServerDidAssociateWorkoutSamples"), 0);

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

          v15 = v24;
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    else
    {
      v15 = v11;
    }
    if (v15)
      v23 = v15;
    else
      v23 = v2;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v23);
LABEL_16:

    goto LABEL_17;
  }
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 64), CFSTR("Workout has not been saved."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

LABEL_17:
}

uint64_t __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)seriesSample
{
  HKWorkoutRoute *route;
  HKWorkoutRoute *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  route = self->_route;
  if (route)
  {
    v3 = route;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB6E58];
    -[HDSeriesBuilderServer configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_workoutRouteWithDevice:metadata:", v7, 0);
    v3 = (HKWorkoutRoute *)objc_claimAutoreleasedReturnValue();

    -[HDStandardTaskServer taskUUID](self, "taskUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutRoute _setUUID:](v3, "_setUUID:", v8);

  }
  return v3;
}

- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  HKWorkoutRoute *v9;
  HKWorkoutRoute *route;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD);
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a3;
  v8 = a4;
  if (self->_route)
  {
    v7[2](v7);
  }
  else
  {
    if (-[HDSeriesBuilderServer queue_state](self, "queue_state"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDWorkoutRouteBuilderServer.m"), 221, CFSTR("route missing."));

    }
    -[HDWorkoutRouteBuilderServer seriesSample](self, "seriesSample");
    v9 = (HKWorkoutRoute *)objc_claimAutoreleasedReturnValue();
    route = self->_route;
    self->_route = v9;

    -[HDStandardTaskServer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sampleSavingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutRouteBuilderServer seriesSample](self, "seriesSample");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke;
    v16[3] = &unk_1E6CF7528;
    v16[4] = self;
    v17 = v8;
    v18 = v7;
    objc_msgSend(v12, "saveSamples:withCompletion:", v14, v16);

  }
}

void __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to save series sample."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke_2;
    v9[3] = &unk_1E6CF28A8;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "associateToWorkoutBuilderWithCompletion:", v9);

  }
  else
  {
    if (v5)
      v8 = v5;
    else
      v8 = v6;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v8);
  }

}

void __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to associate series to workout builder."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v7)
      v6 = v7;
    else
      v6 = v5;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v6);
  }

}

- (void)queue_recoverBuilder
{
  HKWorkoutRoute *v3;
  HKWorkoutRoute *route;
  objc_super v5;

  -[HDWorkoutRouteBuilderServer seriesSample](self, "seriesSample");
  v3 = (HKWorkoutRoute *)objc_claimAutoreleasedReturnValue();
  route = self->_route;
  self->_route = v3;

  v5.receiver = self;
  v5.super_class = (Class)HDWorkoutRouteBuilderServer;
  -[HDSeriesBuilderServer queue_recoverBuilder](&v5, sel_queue_recoverBuilder);
}

- (HKWorkoutRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

@end
