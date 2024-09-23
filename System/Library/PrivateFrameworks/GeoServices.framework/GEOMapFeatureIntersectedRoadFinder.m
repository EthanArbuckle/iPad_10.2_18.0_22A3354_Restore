@implementation GEOMapFeatureIntersectedRoadFinder

- (id)findRoadsAtPreviousIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "endFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "endFeature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, "Road has no underlying feature: %@", (uint8_t *)&v21, 0xCu);
    }

    v16 = 0;
  }
  objc_msgSend(v10, "startJunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureIntersectedRoadFinder _findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:](self, "_findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:", v18, a4, objc_msgSend(v10, "muid"), v16, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)findRoadsAtNextIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "endFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "endFeature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_FAULT, "Road has no underlying feature: %@", (uint8_t *)&v21, 0xCu);
    }

    v16 = 0;
  }
  objc_msgSend(v10, "endJunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureIntersectedRoadFinder _findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:](self, "_findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:", v18, a4, objc_msgSend(v10, "muid"), v16, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  -[GEOMapFeatureIntersectedRoadFinder _findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:](self, "_findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:", a3, a4, 0, 0, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 featuresToIgnore:(id)a6 handler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  _GEOMapFeatureAccessRequest *v21;
  void *v22;
  void *v23;
  _GEOMapFeatureAccessRequest *v24;
  _GEOMapFeatureAccessRequest *existingRequest;
  _GEOMapFeatureAccessRequest *v26;
  _GEOMapFeatureAccessRequest *v27;
  _GEOMapFeatureAccessRequest *v28;
  _GEOMapFeatureAccessRequest *v29;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (!v14)
  {
    if (v17)
      (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
    v29 = objc_alloc_init(_GEOMapFeatureAccessRequest);
    goto LABEL_10;
  }
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "joinAllRoadsByMuid");

  if ((v20 & 1) == 0)
  {
    -[GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:](self, "findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:", v14, a4, a5, 0, v15, v16, v18);
    v29 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v28 = v29;
    goto LABEL_11;
  }
  if (!self->super._existingRequest)
  {
    v21 = [_GEOMapFeatureAccessRequest alloc];
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tileLoader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v21, "initWithTileLoader:", v23);
    existingRequest = self->super._existingRequest;
    self->super._existingRequest = v24;

  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__19;
  v37[4] = __Block_byref_object_dispose__19;
  v38 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke;
  v36[3] = &unk_1E1C06D60;
  v36[4] = v37;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_2;
  v31[3] = &unk_1E1C06DB0;
  v31[4] = self;
  v34 = v37;
  v32 = v18;
  v35 = a4;
  v33 = v16;
  -[GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:](self, "findUnjoinedRoadsAtJunction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:handler:completionHandler:", v14, a4, a5, 0, v15, v36, v31);
  v26 = (_GEOMapFeatureAccessRequest *)objc_claimAutoreleasedReturnValue();
  v27 = self->super._existingRequest;
  self->super._existingRequest = v26;

  v28 = self->super._existingRequest;
  _Block_object_dispose(v37, 8);

LABEL_11:
  return v28;
}

void __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v3 = v8;
  }
  objc_msgSend(v4, "addObject:", v3);

}

void __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "requestParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_3;
  block[3] = &unk_1E1C06D88;
  v8 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v9 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

}

uint64_t (**__133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_3(uint64_t a1))(id, _QWORD)
{
  GEOMapFeatureMultiSegmentRoadFinder *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (**result)(id, _QWORD);

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v2 = [GEOMapFeatureMultiSegmentRoadFinder alloc];
    objc_msgSend(*(id *)(a1 + 32), "requestParameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[GEOMapFeatureAccessFinder initWithRequestParameters:](v2, "initWithRequestParameters:", v3);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setExistingRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v7 = *(_QWORD *)(a1 + 64);
    v8 = 3;
    if (v7 == 2)
      v8 = 1;
    if (v7 == 3)
      v9 = 2;
    else
      v9 = v8;
    return (uint64_t (**)(id, _QWORD))(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "findConnectedSegmentsForRoads:directionality:handler:completionHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    result = *(uint64_t (***)(id, _QWORD))(a1 + 40);
    if (result)
      return (uint64_t (**)(id, _QWORD))result[2](result, 0);
  }
  return result;
}

- (id)findUnjoinedRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 requireExactMuidMatch:(BOOL)a6 featuresToIgnore:(id)a7 handler:(id)a8 completionHandler:(id)a9
{
  void *v9;
  _BOOL4 v12;
  id v16;
  NSObject *v17;
  void *v18;
  _GEOMapFeatureAccessRequest *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _GEOMapFeatureAccessRequest *existingRequest;
  _GEOMapFeatureAccessRequest *v28;
  _GEOMapFeatureAccessRequest *v29;
  id v30;
  void *v31;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v32;
  GEOMapFeatureTileFinder *v33;
  void *v34;
  GEOMapFeatureTileFinder *v35;
  uint64_t v36;
  unsigned int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  __int128 v45;
  GEOMapFeatureTileFinder *v46;
  id v47;
  double v48;
  double v49;
  void *v50;
  NSObject *v51;
  id v52;
  _GEOMapFeatureAccessRequest *v53;
  _GEOMapFeatureAccessRequest *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *group;
  id v61;
  id v62;
  id v63;
  _QWORD block[4];
  id v65;
  id v66;
  id v67;
  uint8_t *v68;
  _QWORD v69[4];
  NSObject *v70;
  GEOMapFeatureTileFinder *v71;
  id v72;
  uint64_t *v73;
  uint8_t *v74;
  _QWORD v75[5];
  id v76;
  id v77;
  id v78;
  _QWORD *v79;
  unint64_t v80;
  unint64_t v81;
  BOOL v82;
  _QWORD v83[3];
  char v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  BOOL v94;
  uint8_t buf[8];
  uint8_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  id *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _QWORD v107[4];

  v12 = a6;
  v107[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v61 = a7;
  v62 = a8;
  v63 = a9;
  v101 = 0;
  v102 = (id *)&v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__19;
  v105 = __Block_byref_object_dispose__19;
  v106 = 0;
  if (a5 || !v12)
  {
    group = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v96 = buf;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__19;
    v99 = __Block_byref_object_dispose__19;
    v100 = 0;
    v58 = v20;
    objc_msgSend(v16, "tile");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "connectivityJunction");
    v22 = MEMORY[0x1E0C809B0];
    if (v21)
    {
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke;
      v85[3] = &unk_1E1C06E00;
      v86 = v59;
      v91 = v21;
      v94 = v12;
      v87 = v61;
      v92 = a5;
      v88 = v16;
      v93 = a4;
      v89 = v20;
      v23 = group;
      v90 = v23;
      v24 = (void *)MEMORY[0x18D765024](v85);
      dispatch_group_enter(v23);
      -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v26, v24);

      existingRequest = self->super._existingRequest;
      if (existingRequest)
      {
        v28 = self->super._existingRequest;
      }
      else
      {
        v29 = [_GEOMapFeatureAccessRequest alloc];
        -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tileLoader");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v29, "initWithTileLoader:", v25);
      }
      objc_storeStrong(v102 + 5, v28);
      if (!existingRequest)
      {

      }
      v20 = v58;
      v22 = MEMORY[0x1E0C809B0];
    }
    if (objc_msgSend(v16, "isOnTileBorder")
      && objc_msgSend(v16, "primaryID")
      && objc_msgSend(v16, "secondaryID"))
    {
      v83[0] = 0;
      v83[1] = v83;
      v83[2] = 0x2020000000;
      v84 = 0;
      v75[0] = v22;
      v75[1] = 3221225472;
      v75[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_3;
      v75[3] = &unk_1E1C06E28;
      v79 = v83;
      v75[4] = self;
      v30 = v16;
      v76 = v30;
      v80 = a4;
      v81 = a5;
      v82 = v12;
      v77 = v61;
      v78 = v20;
      v31 = (void *)MEMORY[0x18D765024](v75);
      v32 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 53, 0);
      v33 = [GEOMapFeatureTileFinder alloc];
      -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v33, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v32), v32, 0, 53, v34);

      -[GEOMapFeatureTileFinder setExistingRequest:](v35, "setExistingRequest:", self->super._existingRequest);
      v36 = objc_msgSend(v59, "tileKey");
      LOBYTE(v33) = *(_BYTE *)(v36 + 10);
      v37 = *(unsigned __int16 *)(v36 + 8);
      v38 = *(_QWORD *)v36;
      *(_QWORD *)((char *)v107 + 1) = (*(_QWORD *)v36 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v36 >> 8) & 0x3F) << 40);
      v39 = *(_QWORD *)((char *)v107 + 1);
      LOBYTE(v107[0]) = v38;
      v40 = v107[0];
      objc_msgSend(v30, "tilePoint");
      v42 = v41;
      v44 = v43;
      *((_QWORD *)&v45 + 1) = BYTE4(v38) | ((((v38 >> 40) | (v37 << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v37 >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v33 & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v33 >> 4) << 52);
      *(_QWORD *)&v45 = v39;
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_4;
      v69[3] = &unk_1E1C06EA0;
      v70 = group;
      v73 = &v101;
      v46 = v35;
      v71 = v46;
      v47 = v31;
      v72 = v47;
      v74 = buf;
      LODWORD(v48) = v42;
      LODWORD(v49) = v44;
      -[GEOMapFeatureIntersectedRoadFinder _tilesBorderingTile:atPoint:withHandler:](self, "_tilesBorderingTile:atPoint:withHandler:", v40, (unint64_t)(v45 >> 56), v69, v48, v49);

      _Block_object_dispose(v83, 8);
      v20 = v58;
      v22 = MEMORY[0x1E0C809B0];
    }
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "queue");
    v51 = objc_claimAutoreleasedReturnValue();
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_7;
    block[3] = &unk_1E1C06EC8;
    v52 = v20;
    v65 = v52;
    v66 = v62;
    v67 = v63;
    v68 = buf;
    dispatch_group_notify(group, v51, block);

    v53 = (_GEOMapFeatureAccessRequest *)v102[5];
    if (v53 || (v53 = self->super._existingRequest) != 0)
    {
      v19 = v53;
    }
    else
    {
      v55 = [_GEOMapFeatureAccessRequest alloc];
      -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "tileLoader");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_GEOMapFeatureAccessRequest initWithTileLoader:](v55, "initWithTileLoader:", v57);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOGetGEOMapFeatureAccessLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Error calling GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction. requireExactMuidMatch is YES but muid is 0.", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: (requireExactMuidMatch && muid == 0) == NO", buf, 2u);
    }
    if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("requireExactMuidMatch is YES but muid is 0"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v63 + 2))(v63, v18);

    }
    v19 = objc_alloc_init(_GEOMapFeatureAccessRequest);
  }
  _Block_object_dispose(&v101, 8);

  return v19;
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v2 = *(_QWORD *)(a1 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_2;
  v8[3] = &unk_1E1C06DD8;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 80);
  v9 = v4;
  v12 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 88);
  v10 = v6;
  v13 = v7;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "forEachEdgeOnJunction:visitor:", v2, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  GEOMapFeatureRoad *v9;
  void *v10;
  GEOMapFeatureRoad *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15 = v3;
  objc_msgSend(v3, "road");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 72)
      || (v6 = *(_QWORD *)(a1 + 56)) == 0
      || (objc_msgSend(v15, "road"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "muid"),
          v7,
          v6 == v8))
    {
      v9 = [GEOMapFeatureRoad alloc];
      objc_msgSend(v15, "road");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GEOMapFeatureRoad initWithFeature:](v9, "initWithFeature:", v10);

      -[GEOMapFeatureRoad startJunction](v11, "startJunction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "connectivityJunction");
      v14 = v13 == objc_msgSend(*(id *)(a1 + 40), "connectivityJunction");

      -[GEOMapFeatureRoad updateForDesiredRoadDirectionality:isOutboundRoad:](v11, "updateForDesiredRoadDirectionality:isOutboundRoad:", *(_QWORD *)(a1 + 64), v14);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

    }
  }

}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_3(uint64_t a1, void *a2, float a3, float a4)
{
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;

  v7 = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(unsigned __int8 *)(v10 + 24);
  v11 = v10 + 24;
  if (!v12)
  {
    v14 = v7;
    *(float *)&v8 = a3;
    *(float *)&v9 = a4;
    objc_msgSend(*(id *)(a1 + 32), "_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:shouldStop:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 48), v8, v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v13);

    v7 = v14;
  }

}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  float v20;
  float v21;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_5;
  v18[3] = &unk_1E1C06E50;
  v11 = *(void **)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v20 = a4;
  v21 = a5;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_6;
  v15[3] = &unk_1E1C06E78;
  v17 = *(_QWORD *)(a1 + 64);
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v11, "findTileWithKey:handler:completionHandler:", a2, a3, v18, v15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

uint64_t __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40), *(float *)(a1 + 44));
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_6(uint64_t a1, void *a2)
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

uint64_t __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return result;
}

- (id)_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 muid:(unint64_t)a7 requireExactMuidMatch:(BOOL)a8 featuresToIgnore:(id)a9 shouldStop:(BOOL *)a10
{
  float var1;
  float var0;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t i;
  uint64_t v31;
  BOOL v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  BOOL *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  var1 = a4.var1;
  var0 = a4.var0;
  v18 = a3;
  v19 = a5;
  v20 = a9;
  if (*a10)
  {
    v21 = 0;
  }
  else
  {
    v33 = a8;
    -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v23);

    objc_msgSend(v18, "lines");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v25;
    if (objc_msgSend(v25, "muid"))
    {
      v28 = 0;
      v29 = 0;
      for (i = 0; i < objc_msgSend(v18, "junctionsCount"); ++i)
      {
        v31 = objc_msgSend(v18, "junctions");
        if (objc_msgSend(v19, "primaryID")
          && objc_msgSend(v19, "primaryID") == *(_QWORD *)(v31 + v28 + 16)
          && objc_msgSend(v19, "secondaryID")
          && objc_msgSend(v19, "secondaryID") == *(_QWORD *)(v31 + v28 + 24))
        {
          v29 = v31 + v28;
        }
        v28 += 32;
      }
      if (v29)
      {
        v43 = 0;
        v44 = &v43;
        v45 = 0x3032000000;
        v46 = __Block_byref_object_copy__19;
        v47 = __Block_byref_object_dispose__19;
        v48 = 0;
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __176__GEOMapFeatureIntersectedRoadFinder__intersectedRoadsInAdjacentTile_tileBorderPoint_junction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_shouldStop___block_invoke;
        v35[3] = &unk_1E1C06EF0;
        v38 = a10;
        v42 = v33;
        v39 = a7;
        v40 = v29;
        v41 = a6;
        v36 = v20;
        v37 = &v43;
        objc_msgSend(v18, "forEachEdgeOnJunction:visitor:", v29, v35);
        v21 = (id)v44[5];

        _Block_object_dispose(&v43, 8);
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      *(float *)&v26 = var0;
      *(float *)&v27 = var1;
      -[GEOMapFeatureIntersectedRoadFinder _old_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:featuresToIgnore:](self, "_old_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:featuresToIgnore:", v18, v19, a6, v20, v26, v27);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v21;
}

void __176__GEOMapFeatureIntersectedRoadFinder__intersectedRoadsInAdjacentTile_tileBorderPoint_junction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_shouldStop___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  GEOMapFeatureRoad *v12;
  void *v13;
  GEOMapFeatureRoad *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  v3 = a2;
  if (!**(_BYTE **)(a1 + 48))
  {
    v24 = v3;
    objc_msgSend(v3, "road");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "type");

    v3 = v24;
    if (v5 == 1)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v24, "road");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

      v3 = v24;
      if ((v6 & 1) == 0)
      {
        if (!*(_BYTE *)(a1 + 80)
          || (v8 = *(_QWORD *)(a1 + 56)) == 0
          || (objc_msgSend(v24, "road"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "muid"),
              v9,
              v3 = v24,
              v8 == v10))
        {
          if (objc_msgSend(v3, "junctionA") == *(_QWORD *)(a1 + 64)
            || (v11 = objc_msgSend(v24, "junctionB") == *(_QWORD *)(a1 + 64), v3 = v24, v11))
          {
            v12 = [GEOMapFeatureRoad alloc];
            objc_msgSend(v24, "road");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[GEOMapFeatureRoad initWithFeature:](v12, "initWithFeature:", v13);

            -[GEOMapFeatureRoad startJunction](v14, "startJunction");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "connectivityJunction") == *(_QWORD *)(a1 + 64);

            -[GEOMapFeatureRoad updateForDesiredRoadDirectionality:isOutboundRoad:](v14, "updateForDesiredRoadDirectionality:isOutboundRoad:", *(_QWORD *)(a1 + 72), v16);
            v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v20 = *(void **)(v19 + 40);
              *(_QWORD *)(v19 + 40) = v18;

              v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            }
            objc_msgSend(v17, "addObject:", v14);
            v21 = *(_QWORD *)(a1 + 56);
            if (v21)
            {
              objc_msgSend(v24, "road");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "muid");

              if (v21 == v23)
                **(_BYTE **)(a1 + 48) = 1;
            }

            v3 = v24;
          }
        }
      }
    }
  }

}

- (id)_old_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 featuresToIgnore:(id)a7
{
  float var1;
  float var0;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _QWORD *v17;
  GEOMapFeatureRoad *v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  char v23;
  float v24;
  uint64_t v25;
  char v26;
  float v27;
  GEOMapFeatureRoad *v28;
  void *v29;
  void *v31;
  id v32;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _DWORD v42[2];
  _BYTE buf[12];
  __int16 v44;
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  var1 = a4.var1;
  var0 = a4.var0;
  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v32 = a5;
  v35 = a7;
  *(float *)v42 = var0;
  *(float *)&v42[1] = var1;
  v31 = v11;
  objc_msgSend(v11, "lines");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v13)
  {
    v34 = 0;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v16, "type") == 1 && (objc_msgSend(v35, "containsObject:", v16) & 1) == 0)
        {
          v37 = 0;
          v17 = GEOMultiSectionFeaturePoints(v16, 0, &v37);
          if (v37 > 1)
          {
            v22 = 0;
            *(_QWORD *)buf = *v17;
            v36 = v17[v37 - 1];
            v23 = 1;
            do
            {
              v24 = vabds_f32(*(float *)&v42[v22], *(float *)&buf[4 * v22]);
              if ((v23 & 1) == 0)
                break;
              v23 = 0;
              v22 = 1;
            }
            while (v24 < 0.0001);
            v25 = 0;
            v26 = 1;
            do
            {
              v27 = vabds_f32(*(float *)&v42[v25], *((float *)&v36 + v25));
              if ((v26 & 1) == 0)
                break;
              v26 = 0;
              v25 = 1;
            }
            while (v27 < 0.0001);
            if (v24 < 0.0001 || v27 < 0.0001)
            {
              v28 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v16);
              -[GEOMapFeatureRoad updateForDesiredRoadDirectionality:isOutboundRoad:](v28, "updateForDesiredRoadDirectionality:isOutboundRoad:", a6, (v24 < 0.0001) ^ -[GEOMapFeatureRoad isFlipped](v28, "isFlipped"));
              v29 = v34;
              if (!v34)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v34 = v29;
              objc_msgSend(v29, "addObject:", v28);

            }
          }
          else
          {
            v18 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", v16);
            GEOGetGEOMapFeatureAccessLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              -[GEOMapFeatureRoad debugDescription](v18, "debugDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[GEOMapFeatureLine coordinateCount](v18, "coordinateCount");
              *(_DWORD *)buf = 138478083;
              *(_QWORD *)&buf[4] = v20;
              v44 = 1024;
              v45 = v21;
              _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", buf, 0x12u);

            }
          }
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v13);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)_tilesBorderingTile:(uint64_t)a3 atPoint:(uint64_t)a4 withHandler:(uint64_t)a5
{
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  _BOOL4 v14;
  int v15;
  int v16;
  float v17;
  _BOOL4 v18;
  int v19;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  unint64_t v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  __int128 v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  __int128 v41;
  id v42;
  unsigned __int128 v43;
  unsigned __int128 v44;
  uint64_t v45;

  v9 = fabsf(a1);
  v10 = fabsf(a2);
  v11 = fabsf(a2 + -1.0);
  if (v10 > 0.0001)
    v12 = 0.0;
  else
    v12 = 1.0;
  if (v9 > 0.0001)
    v13 = 0.0;
  else
    v13 = 1.0;
  v14 = v11 <= 0.0001 || v10 <= 0.0001;
  if (v11 > 0.0001)
    v15 = 0;
  else
    v15 = -1;
  if (v10 <= 0.0001)
    v16 = 1;
  else
    v16 = v15;
  v17 = fabsf(a1 + -1.0);
  v45 = *MEMORY[0x1E0C80C00];
  v18 = v17 <= 0.0001 || v9 <= 0.0001;
  *(_QWORD *)&v44 = a5;
  *((_QWORD *)&v44 + 1) = a6;
  if (v9 <= 0.0001)
    v19 = -1;
  else
    v19 = v17 <= 0.0001;
  v20 = a7;
  v21 = HIBYTE(v44);
  v22 = *(unsigned __int16 *)((char *)&v44 + 13);
  v23 = *(unsigned int *)((char *)&v44 + 9);
  v24 = (((*(_QWORD *)((char *)&v44 + 1) >> 46) | (*(_DWORD *)((char *)&v44 + 9) << 18)) & 0x3FFFFFF) + v19;
  v42 = v20;
  if (v18)
  {
    v43 = v44;
    v26 = *(unsigned __int16 *)(((unint64_t)&v43 | 9) + 4);
    v25 = ((unint64_t)&v43 | 9) + 4;
    v27 = *(unsigned __int8 *)(((unint64_t)&v43 | 9) + 6);
    v28 = v24 & 0x3FFFFFF;
    *((_QWORD *)&v29 + 1) = (*((_QWORD *)&v44 + 1) >> 8) & 0xFFFFFF00 | ((unint64_t)(v26 | (v27 << 16)) << 32) | (v28 >> 18);
    *(_QWORD *)&v29 = v28 << 46;
    v30 = (v28 << 46) | (v44 >> 8) & 0x3FFFFFFFFFFFLL;
    *(_BYTE *)(v25 + 2) = v27;
    *(_WORD *)v25 = v26;
    *(_QWORD *)((char *)&v43 + 1) = v30;
    *(_DWORD *)((char *)&v43 + 9) = DWORD2(v29);
    (*((void (**)(id, _QWORD, _QWORD, float, float))v20 + 2))(v20, v43, v29 >> 56, v13, a2);
    v20 = v42;
  }
  if (v14)
  {
    v43 = v44;
    v31 = ((unint64_t)&v43 | 9) + 4;
    v32 = *(unsigned __int8 *)(((unint64_t)&v43 | 9) + 6);
    v33 = v44 >> 8;
    v34 = (v16 + ((v23 | ((unint64_t)(v22 | (v21 << 16)) << 32)) >> 8)) & 0x3FFFFFF;
    v35 = BYTE9(v44) | ((unint64_t)(*(unsigned __int16 *)(((unint64_t)&v43 | 9) + 4) | (v32 << 16)) << 32) & 0xFFFFFFFC000000FFLL | ((unint64_t)(v34 & 0x3FFFFFF) << 8);
    *(_BYTE *)(v31 + 2) = v32;
    *(_WORD *)v31 = WORD2(v35);
    *(_DWORD *)((char *)&v43 + 9) = v35;
    *((_QWORD *)&v36 + 1) = v35;
    *(_QWORD *)&v36 = v33;
    (*((void (**)(id, _QWORD, _QWORD, float, float))v20 + 2))(v20, v43, v36 >> 56, a1, v12);
    v20 = v42;
    if (v18)
    {
      v43 = v44;
      v37 = ((unint64_t)&v43 | 9) + 4;
      v38 = *(unsigned __int8 *)(((unint64_t)&v43 | 9) + 6);
      v39 = (v44 >> 8) & 0x3FFFFFFFFFFFLL | ((unint64_t)v24 << 46);
      v40 = ((unint64_t)(*(unsigned __int16 *)(((unint64_t)&v43 | 9) + 4) | (v38 << 16)) << 32) & 0xFFFFFFFC00000000 | (v24 >> 18) | ((unint64_t)v34 << 8);
      *(_BYTE *)(v37 + 2) = v38;
      *(_WORD *)v37 = WORD2(v40);
      *(_QWORD *)((char *)&v43 + 1) = v39;
      *(_DWORD *)((char *)&v43 + 9) = (v24 >> 18) | (v34 << 8);
      *((_QWORD *)&v41 + 1) = v40;
      *(_QWORD *)&v41 = v24 << 46;
      (*((void (**)(id, _QWORD, _QWORD, float, float))v42 + 2))(v42, v43, v41 >> 56, v13, v12);
      v20 = v42;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSegmentRoadFinder, 0);
}

@end
