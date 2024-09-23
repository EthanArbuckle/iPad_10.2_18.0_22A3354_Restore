@implementation HDRaceRouteClusterServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HDRaceRouteClusterServer *v18;
  HDRaceRouteClusterManager *v19;
  HDRaceRouteClusterManager *raceRouteClusterManager;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", CFSTR("com.apple.health.RacePreviousRoute"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "raceRouteClusterManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDRaceRouteClusterServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v19 = v17;
    raceRouteClusterManager = v18->_raceRouteClusterManager;
    v18->_raceRouteClusterManager = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    raceRouteClusterManager = (HDRaceRouteClusterManager *)(id)objc_claimAutoreleasedReturnValue();
    if (raceRouteClusterManager)
    {
      if (a7)
        *a7 = objc_retainAutorelease(raceRouteClusterManager);
      else
        _HKLogDroppedError();
    }

    v18 = 0;
  }

  return v18;
}

- (void)remote_fetchRaceRouteClustersForActivityType:(unint64_t)a3 completion:(id)a4
{
  HDRaceRouteClusterManager *raceRouteClusterManager;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  raceRouteClusterManager = self->_raceRouteClusterManager;
  v14 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[HDRaceRouteClusterManager raceRouteClustersForActivityType:error:](raceRouteClusterManager, "raceRouteClustersForActivityType:error:", a3, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_msgSend(v7, "count");
    HKStringFromBool();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v16 = a3;
    v17 = 2048;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Fetched racing clusters (activity-type %lu, count %lu) with success=%{public}@, error=%{public}@", buf, 0x2Au);

  }
  v6[2](v6, v7, v8);

}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6AA0], "taskIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raceRouteClusterManager, 0);
}

@end
