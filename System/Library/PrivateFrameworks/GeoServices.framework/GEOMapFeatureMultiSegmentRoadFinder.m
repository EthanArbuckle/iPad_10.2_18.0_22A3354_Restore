@implementation GEOMapFeatureMultiSegmentRoadFinder

- (id)findConnectedSegmentsForRoads:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  _GEOMapFeatureAccessRequest *v23;
  void *v25;
  void *v26;
  NSObject *group;
  _QWORD block[4];
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = a6;
  v26 = v8;
  if (v9)
  {
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__50;
    v40[4] = __Block_byref_object_dispose__50;
    v41 = 0;
    group = dispatch_group_create();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v16, "muid"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "muid"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v11, "containsObject:", v17);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "muid"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v19);

              dispatch_group_enter(group);
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke;
              v33[3] = &unk_1E1C07E58;
              v35 = v40;
              v34 = group;
              v20 = -[GEOMapFeatureMultiSegmentRoadFinder findConnectedSegmentsForRoad:directionality:handler:completionHandler:](self, "findConnectedSegmentsForRoad:directionality:handler:completionHandler:", v16, a4, v9, v33);

            }
          }
          else
          {
            v9[2](v9, v16);
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v13);
    }

    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke_2;
    block[3] = &unk_1E1C03F50;
    v31 = v25;
    v32 = v40;
    dispatch_group_notify(group, v22, block);

    v23 = self->super.super._existingRequest;
    _Block_object_dispose(v40, 8);

    v10 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (id)findConnectedSegmentsForRoad:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _GEOMapFeatureAccessRequest *v15;
  _QWORD block[4];
  id v18;
  GEOMapFeatureMultiSegmentRoadFinder *v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke;
    block[3] = &unk_1E1C0CD38;
    v18 = v10;
    v20 = v11;
    v21 = v12;
    v22 = a4;
    v19 = self;
    dispatch_async(v14, block);

    v15 = self->super.super._existingRequest;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  if (objc_msgSend(*(id *)(a1 + 32), "muid"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__50;
    v28[4] = __Block_byref_object_dispose__50;
    v29 = 0;
    v3 = dispatch_group_create();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 64);
    v6 = MEMORY[0x1E0C809B0];
    if ((v5 & 1) != 0)
    {
      dispatch_group_enter(v3);
      v7 = *(void **)(a1 + 40);
      v8 = objc_msgSend(*(id *)(a1 + 32), "muid");
      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_2;
      v25[3] = &unk_1E1C07E58;
      v27 = v28;
      v26 = v4;
      objc_msgSend(v7, "_recursivelyFindRoadSegmentsWithMuid:segments:directionality:completionHandler:", v8, v2, 1, v25);

      v5 = *(_QWORD *)(a1 + 64);
    }
    if ((v5 & 2) != 0)
    {
      dispatch_group_enter(v4);
      v9 = *(void **)(a1 + 40);
      v10 = objc_msgSend(*(id *)(a1 + 32), "muid");
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_3;
      v22[3] = &unk_1E1C07E58;
      v24 = v28;
      v23 = v4;
      objc_msgSend(v9, "_recursivelyFindRoadSegmentsWithMuid:segments:directionality:completionHandler:", v10, v2, 2, v22);

    }
    objc_msgSend(*(id *)(a1 + 40), "requestParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_4;
    block[3] = &unk_1E1C068F0;
    v21 = v28;
    v13 = *(id *)(a1 + 56);
    v18 = v2;
    v19 = v13;
    v14 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v20 = v14;
    v15 = v2;
    dispatch_group_notify(v4, v12, block);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
  }
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_roadForRoadSegments:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
}

- (id)_roadForRoadSegments:(id)a3
{
  id v3;
  GEOMapFeatureMultiSegmentRoad *v4;
  GEOMapFeatureMultiSegmentRoad *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (GEOMapFeatureMultiSegmentRoad *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[GEOMapFeatureMultiSegmentRoad initWithRoadSegments:]([GEOMapFeatureMultiSegmentRoad alloc], "initWithRoadSegments:", v3);
  }
  v5 = v4;

  return v5;
}

- (void)_recursivelyFindRoadSegmentsWithMuid:(unint64_t)a3 segments:(id)a4 directionality:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD v39[5];
  id v40;
  _QWORD *v41;
  unint64_t v42;
  BOOL v43;
  _QWORD v44[3];
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v10 = a6;
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (a3)
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke;
    v39[3] = &unk_1E1C0CD60;
    v39[4] = self;
    v42 = a3;
    v43 = a5 == 2;
    v14 = v28;
    v40 = v14;
    v41 = v44;
    v26 = (void *)MEMORY[0x18D765024](v39);
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke_2;
    v33[3] = &unk_1E1C0CD88;
    v33[4] = self;
    v36 = v44;
    v35 = v10;
    v37 = a3;
    v15 = v14;
    v34 = v15;
    v38 = a5;
    v27 = (void *)MEMORY[0x18D765024](v33);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v30;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "feature");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
      }
      while (v18);
    }

    if (a5 == 2)
    {
      objc_msgSend(v17, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startJunction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:](self, "findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:", v23, 3, a3, 1, v16, v26, v27);
    }
    else
    {
      objc_msgSend(v17, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endJunction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:](self, "findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:", v23, 2, a3, 1, v16, v26, v27);
    }

    _Block_object_dispose(v44, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "requestParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend(v6, "muid") == *(_QWORD *)(a1 + 56))
  {
    v5 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v5, "insertObject:atIndex:", v6, 0);
    else
      objc_msgSend(v5, "addObject:", v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "requestParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = v7;
  if (!v7 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_recursivelyFindRoadSegmentsWithMuid:segments:directionality:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
LABEL_6:
    v5 = v7;
  }

}

@end
