@implementation HDHeadphoneAudioExposureControlServer

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BE45698], "taskIdentifier");
}

- (HDHeadphoneAudioExposureControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDHeadphoneAudioExposureControlServer *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDHearingProfileExtension *profileExtension;
  uint64_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  HDHeadphoneAudioExposureControlServer *v20;
  objc_super v22;

  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDHeadphoneAudioExposureControlServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v22, sel_initWithUUID_configuration_client_delegate_, a3, a4, v11, a6);
  if (v12)
  {
    objc_msgSend(v11, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_profile, v13);

    objc_msgSend(v11, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profileExtensionWithIdentifier:", *MEMORY[0x24BE45688]);
    v15 = objc_claimAutoreleasedReturnValue();
    profileExtension = v12->_profileExtension;
    v12->_profileExtension = (HDHearingProfileExtension *)v15;

    objc_storeStrong((id *)&v12->_client, a5);
    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x24BE40E10], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v12);

    v20 = v12;
  }

  return v12;
}

- (id)diagnosticDescription
{
  return &stru_24DC61090;
}

- (void)remote_rebuildWithCompletion:(id)a3
{
  HDHearingProfileExtension *profileExtension;
  void (**v4)(id, uint64_t, id);
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDHearingProfileExtension headphoneDoseManager](profileExtension, "headphoneDoseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "_rebuildWithError:", &v8);
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchInfoWithCompletion:(id)a3
{
  HDHearingProfileExtension *profileExtension;
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHearingProfileExtension headphoneDoseManager](profileExtension, "headphoneDoseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "_infoWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_fetchInfoDictWithCompletion:(id)a3
{
  HDHearingProfileExtension *profileExtension;
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHearingProfileExtension headphoneDoseManager](profileExtension, "headphoneDoseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "_infoDictWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_insertQuantityWithExposure:(double)a3 duration:(double)a4 startDate:(id)a5 includesNotificationSample:(BOOL)a6 synced:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void (**v37)(id, uint64_t, id);
  id v38;
  void *v39;
  _QWORD v40[3];

  v9 = a7;
  v10 = a6;
  v40[2] = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v37 = (void (**)(id, uint64_t, id))a8;
  v14 = v13;
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingTimeInterval:", -a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "dateByAddingTimeInterval:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD3E68];
  HKHeadphoneAudioExposureType();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v18;
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v18, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "quantitySampleWithType:quantity:startDate:endDate:", v20, v21, v15, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v17, "dateByAddingTimeInterval:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateByAddingTimeInterval:", -604800.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD3988];
    HKHeadphoneAudioExposureEventType();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "categorySampleWithType:value:startDate:endDate:", v26, 1, v24, v23);
    v27 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = v28;
    v40[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v27;
  }
  else
  {
    v39 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HDStandardTaskServer profile](self, "profile");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dataManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHeadphoneAudioExposureControlServer _headphoneProvenanceForRemoteDevice:](self, "_headphoneProvenanceForRemoteDevice:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v33 = objc_msgSend(v31, "insertDataObjects:withProvenance:creationDate:error:", v29, v32, &v38, CFAbsoluteTimeGetCurrent());
  v34 = v38;

  v37[2](v37, v33, v34);
}

- (void)remote_fetchDoseLimitWithCompletion:(id)a3
{
  HDHearingProfileExtension *profileExtension;
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  profileExtension = self->_profileExtension;
  v4 = (void (**)(id, void *, id))a3;
  -[HDHearingProfileExtension headphoneDoseManager](profileExtension, "headphoneDoseManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "_fetchDoseLimitInfoWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_overrideDoseLimit:(id)a3 completion:(id)a4
{
  HDHearingProfileExtension *profileExtension;
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  profileExtension = self->_profileExtension;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDHearingProfileExtension headphoneDoseManager](profileExtension, "headphoneDoseManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "_overrideDoseLimit:error:", v7, &v11);

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (id)_headphoneProvenanceForRemoteDevice:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    -[HDHeadphoneAudioExposureControlServer _headphoneProvenanceForRemoteWatch](self, "_headphoneProvenanceForRemoteWatch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HDStandardTaskServer profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataProvenanceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultLocalDataProvenance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_headphoneProvenanceForRemoteWatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[3];
  id v52;
  id v53;
  _QWORD v54[6];

  v54[4] = *MEMORY[0x24BDAC8D0];
  -[HDHeadphoneAudioExposureControlServer _makeAirPods](self, "_makeAirPods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v3;
  -[HDHeadphoneAudioExposureControlServer _makeEarPods](self, "_makeEarPods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v4;
  -[HDHeadphoneAudioExposureControlServer _makeBeatsHeadphones](self, "_makeBeatsHeadphones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v5;
  -[HDHeadphoneAudioExposureControlServer _makeUnknownHeadphones](self, "_makeUnknownHeadphones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"));
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(v10, "sourceForAppleDeviceWithUUID:identifier:name:productType:createIfNecessary:error:", v8, CFSTR("com.apple.health.demo_watch"), CFSTR("Fake Person's Watch"), CFSTR("Watch1,2"), 1, &v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v53;

  if (v11)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v12;
    objc_msgSend(v14, "deviceEntityForDevice:error:", v15, &v52);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v52;

    if (v16)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "daemon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "behavior");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x24BE40AA0];
      -[HDStandardTaskServer profile](self, "profile");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v47, "currentSyncIdentityPersistentID");
      objc_msgSend(v19, "currentOSBuild");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = *MEMORY[0x24BE40878];
      if (v20)
        v22 = v20;
      v44 = v22;
      v48 = v8;
      v49 = v7;
      if (v19)
        objc_msgSend(v19, "currentOSVersionStruct");
      else
        memset(v51, 0, sizeof(v51));
      objc_msgSend(v19, "currentOSVersion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localTimeZone");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "name");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v45, CFSTR("Watch1,2"), v44, v51, v38, v40, v41, v42, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v48;
      v7 = v49;
    }
    else
    {
      _HKInitializeLogging();
      v31 = *MEMORY[0x24BDD2FF0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF0], OS_LOG_TYPE_ERROR))
      {
        v12 = v50;
        -[HDHeadphoneAudioExposureControlServer _headphoneProvenanceForRemoteWatch].cold.2((uint64_t)v50, v31, v32, v33, v34, v35, v36, v37);
        v30 = 0;
        goto LABEL_15;
      }
      v30 = 0;
    }
    v12 = v50;
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  v23 = *MEMORY[0x24BDD2FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF0], OS_LOG_TYPE_ERROR))
    -[HDHeadphoneAudioExposureControlServer _headphoneProvenanceForRemoteWatch].cold.1((uint64_t)v12, v23, v24, v25, v26, v27, v28, v29);
  v30 = 0;
LABEL_16:

  return v30;
}

- (id)_makeAirPods
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD3AF8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("AirPods"), CFSTR("Apple, Inc."), CFSTR("AirPods 1,1"), 0, 0, 0, v4, 0);

  return v5;
}

- (id)_makeEarPods
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD3AF8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("EarPods"), CFSTR("Apple, Inc."), CFSTR("EarPods 1,1"), 0, 0, 0, v4, 0);

  return v5;
}

- (id)_makeBeatsHeadphones
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD3AF8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("Powerbeats Pro"), CFSTR("Beats By Dre"), CFSTR("Powerbeats Pro 1,1"), 0, 0, 0, v4, 0);

  return v5;
}

- (id)_makeUnknownHeadphones
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD3AF8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", 0, CFSTR("Foo, Inc."), CFSTR("FooPods 1,1"), 0, 0, 0, v4, 0);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_headphoneProvenanceForRemoteWatch
{
  OUTLINED_FUNCTION_8(&dword_21A0AA000, a2, a3, "Error creating headphone device entity %{public}@", a5, a6, a7, a8, 2u);
}

@end
