@implementation HDRaceRouteLocationSeriesQueryServer

- (HDRaceRouteLocationSeriesQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDRaceRouteLocationSeriesQueryServer *v11;
  uint64_t v12;
  NSUUID *clusterUUID;
  uint64_t v14;
  NSUUID *workoutUUID;
  double v16;
  objc_super v18;

  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HDRaceRouteLocationSeriesQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "clusterUUID");
    v12 = objc_claimAutoreleasedReturnValue();
    clusterUUID = v11->_clusterUUID;
    v11->_clusterUUID = (NSUUID *)v12;

    v11->_workoutSelection = objc_msgSend(v10, "workoutSelection");
    objc_msgSend(v10, "workoutUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    workoutUUID = v11->_workoutUUID;
    v11->_workoutUUID = (NSUUID *)v14;

    objc_msgSend(v10, "timestampAnchor");
    v11->_timestampAnchor = v16;
    v11->_limit = objc_msgSend(v10, "limit");
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSUUID *workoutUUID;
  double v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  id v13;
  NSUUID *clusterUUID;
  unint64_t workoutSelection;
  double timestampAnchor;
  unint64_t limit;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HDRaceRouteLocationSeriesQueryServer;
  -[HDQueryServer _queue_start](&v32, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__52;
  v30 = __Block_byref_object_dispose__52;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HDRaceRouteLocationSeriesQueryServer__queue_start__block_invoke;
  aBlock[3] = &unk_1E6CF1DC0;
  v25 = &v26;
  v5 = v4;
  v23 = v5;
  v6 = v3;
  v24 = v6;
  v7 = _Block_copy(aBlock);
  workoutUUID = self->_workoutUUID;
  if (!workoutUUID)
  {
    clusterUUID = self->_clusterUUID;
    workoutSelection = self->_workoutSelection;
    timestampAnchor = self->_timestampAnchor;
    limit = self->_limit;
    -[HDQueryServer profile](self, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v19 = +[HDRaceRouteClusterEntity enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:profile:error:dataHandler:](HDRaceRouteClusterEntity, "enumerateRoutePointsForClusterUUID:workoutSelection:timestampAnchor:limit:profile:error:dataHandler:", clusterUUID, workoutSelection, limit, v18, &v20, v7, timestampAnchor);
    v13 = v20;

    if (v19)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v5, "client_deliverError:forQuery:", v13, v6);
    goto LABEL_6;
  }
  v9 = self->_timestampAnchor;
  v10 = self->_limit;
  -[HDQueryServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = +[HDRaceRouteWorkoutEntity enumerateRoutePointsForWorkoutUUID:timestampAnchor:limit:profile:error:dataHandler:](HDRaceRouteWorkoutEntity, "enumerateRoutePointsForWorkoutUUID:timestampAnchor:limit:profile:error:dataHandler:", workoutUUID, v10, v11, &v21, v7, v9);
  v13 = v21;

  if (!v12)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "client_deliverRaceRouteLocations:isFinal:query:", v27[5], 1, v6);
LABEL_6:

  _Block_object_dispose(&v26, 8);
}

uint64_t __52__HDRaceRouteLocationSeriesQueryServer__queue_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") >= 0xC8)
  {
    objc_msgSend(*(id *)(a1 + 32), "client_deliverRaceRouteLocations:isFinal:query:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, *(_QWORD *)(a1 + 40));
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end
