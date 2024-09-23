@implementation HMDResidentSelectionPrimaryResidentChangedLogEvent

- (HMDResidentSelectionPrimaryResidentChangedLogEvent)initWithPrimaryResidentDidChange:(BOOL)a3 isElectedDevicePreferred:(BOOL)a4 isCurrentDevicePrimary:(BOOL)a5 isCurrentDevicePreferred:(BOOL)a6 isPreviousPrimaryRev2:(BOOL)a7 isElectedDeviceLatestSWVersionInHome:(BOOL)a8 residentSelectionMode:(unint64_t)a9 triggerReason:(unint64_t)a10 numResidentsREV3Capable:(unint64_t)a11 numResidentsREV3Incompatible:(unint64_t)a12 minimumVersionInHome:(id)a13 minimumParticipatingtvOS17Version:(id)a14 minimumParticipatingAllVersion:(id)a15 minimumParticipatingtvOS18Version:(id)a16 homeUUID:(id)a17
{
  _BOOL4 v20;
  HMDResidentSelectionPrimaryResidentChangedLogEvent *v22;
  HMDResidentSelectionPrimaryResidentChangedLogEvent *v23;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v20 = a3;
  v30 = a13;
  v29 = a14;
  v28 = a15;
  v27 = a16;
  v31.receiver = self;
  v31.super_class = (Class)HMDResidentSelectionPrimaryResidentChangedLogEvent;
  v22 = -[HMMHomeLogEvent initWithHomeUUID:](&v31, sel_initWithHomeUUID_, a17);
  v23 = v22;
  if (v22)
  {
    v22->_count = v20;
    v22->_isElectedDevicePreferred = a4;
    v22->_isCurrentDevicePrimary = a5;
    v22->_isCurrentDevicePreferred = a6;
    v22->_isPreviousPrimaryRev2 = a7;
    v22->_isElectedDeviceLatestSWVersionInHome = a8;
    v22->_residentSelectionMode = a9;
    v22->_triggerReason = a10;
    v22->_numResidentsREV3Capable = a11;
    v22->_numResidentsREV3Incompatible = a12;
    objc_storeStrong((id *)&v22->_minimumVersionInHome, a13);
    objc_storeStrong((id *)&v23->_minimumParticipatingtvOS17Version, a14);
    objc_storeStrong((id *)&v23->_minimumParticipatingAllVersion, a15);
    objc_storeStrong((id *)&v23->_minimumParticipatingtvOS18Version, a16);
  }

  return v23;
}

- (id)initDenominatorEvent:(id)a3 residentSelectionMode:(unint64_t)a4
{
  return -[HMDResidentSelectionPrimaryResidentChangedLogEvent initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:](self, "initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:", 0, 0, 0, 0, 0, 0, a4, 0, 0, 0, 0, 0, 0, 0,
           a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent isElectedDevicePreferred](self, "isElectedDevicePreferred");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent isElectedDeviceLatestSWVersionInHome](self, "isElectedDeviceLatestSWVersionInHome");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent isCurrentDevicePrimary](self, "isCurrentDevicePrimary");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent isCurrentDevicePreferred](self, "isCurrentDevicePreferred");
  HMFBooleanToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent isPreviousPrimaryRev2](self, "isPreviousPrimaryRev2");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode");
  v6 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason");
  v7 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent numResidentsREV3Capable](self, "numResidentsREV3Capable");
  v8 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent numResidentsREV3Incompatible](self, "numResidentsREV3Incompatible");
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS17Version](self, "minimumParticipatingtvOS17Version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingAllVersion](self, "minimumParticipatingAllVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS18Version](self, "minimumParticipatingtvOS18Version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("isElectedDevicePreferred: %@ isElectedDeviceLatestSWVersionInHome: %@, isCurrentDevicePrimary: %@, isCurrentDevicePreferred: %@, isPreviousPrimaryREV2: %@, residentSelectionMode: %lu, triggerReason: %lu, numResidentsREV3Capable %lu, numResidentsREV3Incompatible: %lu, minimumVersionInHome: %@, minimumParticipatingtvOS17Version: %@, minimumParticipatingAllVersion: %@, minimumParticipatingtvOS18Version: %@"), v17, v16, v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.residentElectionV3.primaryResidentChanged");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v12;
  void *v13;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("primaryResidentChangedCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("residentSelectionMode"));

  if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode"))
    v6 = &unk_24E96A940;
  else
    v6 = &unk_24E96A928;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RSModeUnknown_INT"));
  if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode") == 3)
    v7 = &unk_24E96A928;
  else
    v7 = &unk_24E96A940;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RSModeAuto_INT"));
  if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode") == 2)
    v8 = &unk_24E96A928;
  else
    v8 = &unk_24E96A940;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("RSModeManual_INT"));
  if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent residentSelectionMode](self, "residentSelectionMode") == 1)
    v9 = &unk_24E96A928;
  else
    v9 = &unk_24E96A940;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RSModeCoordination_INT"));
  if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent count](self, "count"))
  {
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent isElectedDevicePreferred](self, "isElectedDevicePreferred"))
    {
      v10 = &unk_24E96A940;
    }
    else
    {
      v10 = &unk_24E96A928;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("primaryResidentNotPreferred_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent isElectedDeviceLatestSWVersionInHome](self, "isElectedDeviceLatestSWVersionInHome"))
    {
      v11 = &unk_24E96A940;
    }
    else
    {
      v11 = &unk_24E96A928;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("primaryResidentNotLatestSWVersion_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent isPreviousPrimaryRev2](self, "isPreviousPrimaryRev2"))
      v12 = &unk_24E96A928;
    else
      v12 = &unk_24E96A940;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("previousPrimaryREV2_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent isCurrentDevicePrimary](self, "isCurrentDevicePrimary"))
      v13 = &unk_24E96A928;
    else
      v13 = &unk_24E96A940;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isCurrentDevicePrimary_LAST"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent isCurrentDevicePrimary](self, "isCurrentDevicePrimary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isCurrentDevicePrimary_BOOL"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent isCurrentDevicePreferred](self, "isCurrentDevicePreferred"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isCurrentDevicePreferred_BOOL"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent isElectedDeviceLatestSWVersionInHome](self, "isElectedDeviceLatestSWVersionInHome"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isPrimaryResidentLatestSWVersion_BOOL"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent isPreviousPrimaryRev2](self, "isPreviousPrimaryRev2"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isPreviousPrimaryREV2_BOOL"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("triggerReason"));

    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason"))
      v19 = &unk_24E96A940;
    else
      v19 = &unk_24E96A928;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("changeReasonUnknown_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason") == 1)
      v20 = &unk_24E96A928;
    else
      v20 = &unk_24E96A940;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("changeReasonManual_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason") == 2)
      v21 = &unk_24E96A928;
    else
      v21 = &unk_24E96A940;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("changeReasonAuto_INT"));
    if (-[HMDResidentSelectionPrimaryResidentChangedLogEvent triggerReason](self, "triggerReason") == 3)
      v22 = &unk_24E96A928;
    else
      v22 = &unk_24E96A940;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("changeReasonReachability_INT"));
    -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortVersionString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("minimumVersionInHomeVersionString"));

      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buildVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("minimumVersionInHomeBuildString"));

    }
    -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS17Version](self, "minimumParticipatingtvOS17Version");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS17Version](self, "minimumParticipatingtvOS17Version");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortVersionString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("minimumParticipatingtvOS17VersionString"));

      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS17Version](self, "minimumParticipatingtvOS17Version");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "buildVersion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("minimumParticipatingtvOS17BuildString"));

    }
    -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingAllVersion](self, "minimumParticipatingAllVersion");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "shortVersionString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("minimumParticipatingAllVersionString"));

      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingAllVersion](self, "minimumParticipatingAllVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "buildVersion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("minimumParticipatingAllBuildString"));

    }
    -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumVersionInHome](self, "minimumVersionInHome");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS18Version](self, "minimumParticipatingtvOS18Version");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shortVersionString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("minimumParticipatingtvOS18VersionString"));

      -[HMDResidentSelectionPrimaryResidentChangedLogEvent minimumParticipatingtvOS18Version](self, "minimumParticipatingtvOS18Version");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "buildVersion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("minimumParticipatingtvOS18BuildString"));

    }
  }
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (BOOL)isElectedDevicePreferred
{
  return self->_isElectedDevicePreferred;
}

- (BOOL)isCurrentDevicePrimary
{
  return self->_isCurrentDevicePrimary;
}

- (BOOL)isCurrentDevicePreferred
{
  return self->_isCurrentDevicePreferred;
}

- (BOOL)isPreviousPrimaryRev2
{
  return self->_isPreviousPrimaryRev2;
}

- (BOOL)isElectedDeviceLatestSWVersionInHome
{
  return self->_isElectedDeviceLatestSWVersionInHome;
}

- (unint64_t)residentSelectionMode
{
  return self->_residentSelectionMode;
}

- (unint64_t)triggerReason
{
  return self->_triggerReason;
}

- (unint64_t)numResidentsREV3Capable
{
  return self->_numResidentsREV3Capable;
}

- (unint64_t)numResidentsREV3Incompatible
{
  return self->_numResidentsREV3Incompatible;
}

- (HMFSoftwareVersion)minimumVersionInHome
{
  return self->_minimumVersionInHome;
}

- (HMFSoftwareVersion)minimumParticipatingtvOS17Version
{
  return self->_minimumParticipatingtvOS17Version;
}

- (HMFSoftwareVersion)minimumParticipatingAllVersion
{
  return self->_minimumParticipatingAllVersion;
}

- (HMFSoftwareVersion)minimumParticipatingtvOS18Version
{
  return self->_minimumParticipatingtvOS18Version;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumParticipatingtvOS18Version, 0);
  objc_storeStrong((id *)&self->_minimumParticipatingAllVersion, 0);
  objc_storeStrong((id *)&self->_minimumParticipatingtvOS17Version, 0);
  objc_storeStrong((id *)&self->_minimumVersionInHome, 0);
}

+ (id)denominatorEvent:(id)a3 residentSelectionMode:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initDenominatorEvent:residentSelectionMode:", v5, a4);

  return v6;
}

@end
