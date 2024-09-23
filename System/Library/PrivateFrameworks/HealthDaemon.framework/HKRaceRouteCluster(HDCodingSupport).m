@implementation HKRaceRouteCluster(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = a3;
  objc_msgSend(v3, "lastWorkoutMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routePoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v7, "latitude");
    v10 = v9;
    objc_msgSend(v7, "longitude");
    v47 = (void *)objc_msgSend(v8, "initWithLatitude:longitude:", v10, v11);
  }
  else
  {
    v47 = 0;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB6A98]);
  v13 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v3, "uuid");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_UUIDWithData:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v3, "workoutClusterUUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_UUIDWithData:", v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)(int)objc_msgSend(v3, "clusterSize");
  objc_msgSend(v3, "relevance");
  v17 = v16;
  v40 = (int)objc_msgSend(v3, "activityType");
  v18 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "workoutUUID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_UUIDWithData:", v43);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "startDate");
  objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distance");
  v21 = v20;
  objc_msgSend(v4, "duration");
  v23 = v22;
  v24 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v3, "bestWorkoutMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "workoutUUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_UUIDWithData:", v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "startDate");
  objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distance");
  v29 = v28;
  objc_msgSend(v5, "duration");
  v31 = v30;
  objc_msgSend(v3, "routeSnapshot");
  v38 = v5;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v12, "_initWithUUID:workoutClusterUUID:clusterSize:relevanceValue:workoutActivityType:lastWorkoutUUID:lastWorkoutDate:lastWorkoutDistance:lastWorkoutDuration:lastWorkoutStartingPoint:bestWorkoutUUID:bestWorkoutDate:bestWorkoutDistance:bestWorkoutDuration:workoutRouteSnapshot:workoutRouteLabel:", v44, v15, v41, v40, v39, v36, v17, v21, v23, v29, v31, v47, v25, v27, v32,
              v33);

  return v42;
}

@end
