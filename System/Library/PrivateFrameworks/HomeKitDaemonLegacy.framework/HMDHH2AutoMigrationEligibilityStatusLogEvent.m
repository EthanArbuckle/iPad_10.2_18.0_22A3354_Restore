@implementation HMDHH2AutoMigrationEligibilityStatusLogEvent

- (HMDHH2AutoMigrationEligibilityStatusLogEvent)initWithAutoMigrationEligibilityResult:(id)a3 migrationByOwnerManualEligibilityResult:(id)a4 migrationByOwnerAutoEligibilityResult:(id)a5 didRunMigrationTaskOnCurrentBuild:(BOOL)a6 currentBuildStartedOnHH1:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  HMDHH2AutoMigrationEligibilityStatusLogEvent *v16;
  HMDHH2AutoMigrationEligibilityStatusLogEvent *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHH2AutoMigrationEligibilityStatusLogEvent;
  v16 = -[HMMLogEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentUserAutoMigrationEligibilityResult, a3);
    objc_storeStrong((id *)&v17->_currentUserMigrationByOwnerManualEligibilityResult, a4);
    objc_storeStrong((id *)&v17->_currentUserMigrationByOwnerAutoEligibilityResult, a5);
    v17->_didRunMigrationTaskOnCurrentBuild = a6;
    v17->_currentBuildStartedOnHH1 = a7;
  }

  return v17;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.hh2AutoMigrationEligibilityStatus");
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
  id v27;
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
  void *v43;
  _QWORD v44[16];
  _QWORD v45[18];

  v45[16] = *MEMORY[0x1E0C80C00];
  v44[0] = CFSTR("currentUserAutoMigrationEligibilityStatus");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v43, "status"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v42;
  v44[1] = CFSTR("currentUserAutoMigrationiCloudAccountStatus");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v41, "iCloudAccountStatus"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v40;
  v44[2] = CFSTR("currentUserAutoMigrationUnsupportedDevices");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v39, "unsupportedDevices"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v38;
  v44[3] = CFSTR("currentUserAutoMigrationHasOnlyEmptyHomes");
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "hasOnlyEmptyHomes"))
    v6 = &unk_1E8B350B8;
  else
    v6 = &unk_1E8B350D0;
  v45[3] = v6;
  v44[4] = CFSTR("currentUserAutoMigrationByOwnerManualEligibilityStatus");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerManualEligibilityResult](self, "currentUserMigrationByOwnerManualEligibilityResult");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v36, "status"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v35;
  v44[5] = CFSTR("currentUserAutoMigrationByOwnerManualUnsupportedDevices");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerManualEligibilityResult](self, "currentUserMigrationByOwnerManualEligibilityResult");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsupportedDevices"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v33;
  v44[6] = CFSTR("currentUserAutoMigrationByOwnerManualHasOnlyEmptyHomes");
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerManualEligibilityResult](self, "currentUserMigrationByOwnerManualEligibilityResult");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "hasOnlyEmptyHomes"))
    v9 = &unk_1E8B350B8;
  else
    v9 = &unk_1E8B350D0;
  v45[6] = v9;
  v44[7] = CFSTR("currentUserAutoMigrationByOwnerAutoEligibilityStatus");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerAutoEligibilityResult](self, "currentUserMigrationByOwnerAutoEligibilityResult");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v31, "status"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v30;
  v44[8] = CFSTR("currentUserAutoMigrationByOwnerAutoUnsupportedDevices");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerAutoEligibilityResult](self, "currentUserMigrationByOwnerAutoEligibilityResult");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsupportedDevices"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v28;
  v44[9] = CFSTR("currentUserAutoMigrationByOwnerAutoHasOnlyEmptyHomes");
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserMigrationByOwnerAutoEligibilityResult](self, "currentUserMigrationByOwnerAutoEligibilityResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasOnlyEmptyHomes"))
    v13 = &unk_1E8B350B8;
  else
    v13 = &unk_1E8B350D0;
  v45[9] = v13;
  v44[10] = CFSTR("didScheduleDryRunOnCurrentSWVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent didRunMigrationTaskOnCurrentBuild](self, "didRunMigrationTaskOnCurrentBuild"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v14;
  v44[11] = CFSTR("didRunMigrationTaskOnCurrentBuild");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent didRunMigrationTaskOnCurrentBuild](self, "didRunMigrationTaskOnCurrentBuild"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v15;
  v44[12] = CFSTR("currentBuildStartedOnHH1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentBuildStartedOnHH1](self, "currentBuildStartedOnHH1"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v16;
  v44[13] = CFSTR("numOwnedNonEmptyHomes_autoMigrationEligibility");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "numberOwnedNonEmptyHomes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v19;
  v44[14] = CFSTR("nunUnownedSharedHomes_autoMigrationEligibility");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "numberUnownedSharedHomes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v22;
  v44[15] = CFSTR("numOwnedHomesWithSharedUsers_autoMigrationEligibility");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2AutoMigrationEligibilityStatusLogEvent currentUserAutoMigrationEligibilityResult](self, "currentUserAutoMigrationEligibilityResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOwnedSharedHomes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 16);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v27;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserAutoMigrationEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerManualEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 56, 1);
}

- (HMDHH2AutoMigrationEligibilityResult)currentUserMigrationByOwnerAutoEligibilityResult
{
  return (HMDHH2AutoMigrationEligibilityResult *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)didRunMigrationTaskOnCurrentBuild
{
  return self->_didRunMigrationTaskOnCurrentBuild;
}

- (BOOL)currentBuildStartedOnHH1
{
  return self->_currentBuildStartedOnHH1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserMigrationByOwnerAutoEligibilityResult, 0);
  objc_storeStrong((id *)&self->_currentUserMigrationByOwnerManualEligibilityResult, 0);
  objc_storeStrong((id *)&self->_currentUserAutoMigrationEligibilityResult, 0);
}

@end
