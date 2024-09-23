@implementation FPImportProgressReport

- (FPImportProgressReport)init
{
  FPImportProgressReport *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPImportProgressReport;
  result = -[FPImportProgressReport init](&v3, sel_init);
  if (result)
  {
    result->_stateOfOtherJobs = -1;
    result->_xpcActivityTimeSinceLastRegistration = 0;
    result->_xpcActivityTimeSinceLastActivation = 0;
    result->_xpcActivityTimeSinceLastAbleToRun = 0;
    result->_xpcActivityDasdContext = -1;
    result->_latestFolderSelectedForImport = -1;
    result->_latestFolderSelectedForImportTimestamp = -1;
    result->_latestFolderSelectedForImportState = -1;
    *(_DWORD *)&result->_isStreamResetRunning = 0;
    *(_WORD *)&result->_latestFolderSelectedForImportWasModifiedRemotely = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *errorDetails;
  NSArray *itemsPendingReconciliation;
  NSArray *itemsPendingScanningDisk;
  NSArray *itemsPendingScanningProvider;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsReconciled, CFSTR("_numberOfItemsReconciled"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsInError, CFSTR("_numberOfItemsInError"));
  errorDetails = self->_errorDetails;
  if (errorDetails)
    objc_msgSend(v9, "encodeObject:forKey:", errorDetails, CFSTR("_errorDetails"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_dbCreationTimestamp, CFSTR("_dbCreationTimestamp"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_isStreamResetRunning, CFSTR("_isStreamResetRunning"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_stateOfDownloadJobs, CFSTR("_stateOfDownloadJobs"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_stateOfUploadJobs, CFSTR("_stateOfUploadJobs"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_stateOfOtherJobs, CFSTR("_stateOfOtherJobs"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsPendingReconciliation, CFSTR("_numberOfItemsPendingReconciliation"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsPendingSelection, CFSTR("_numberOfItemsPendingSelection"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsPendingScanningDisk, CFSTR("_numberOfItemsPendingScanningDisk"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfItemsPendingScanningProvider, CFSTR("_numberOfItemsPendingScanningProvider"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_xpcActivityRegisteredWithDuet, CFSTR("_xpcActivityRegisteredWithDuet"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_xpcActivityTimeSinceLastRegistration, CFSTR("_xpcActivityTimeSinceLastRegistration"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_xpcActivityIsActive, CFSTR("_xpcActivityIsActive"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_xpcActivityTimeSinceLastActivation, CFSTR("_xpcActivityTimeSinceLastActivation"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_xpcActivityTimeSinceLastAbleToRun, CFSTR("_xpcActivityTimeSinceLastAbleToRun"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_xpcActivityDasdContext, CFSTR("_xpcActivityDasdContext"));
  itemsPendingReconciliation = self->_itemsPendingReconciliation;
  if (itemsPendingReconciliation)
    objc_msgSend(v9, "encodeObject:forKey:", itemsPendingReconciliation, CFSTR("_itemsPendingReconciliation"));
  itemsPendingScanningDisk = self->_itemsPendingScanningDisk;
  if (itemsPendingScanningDisk)
    objc_msgSend(v9, "encodeObject:forKey:", itemsPendingScanningDisk, CFSTR("_itemsPendingScanningDisk"));
  itemsPendingScanningProvider = self->_itemsPendingScanningProvider;
  v8 = v9;
  if (itemsPendingScanningProvider)
  {
    objc_msgSend(v9, "encodeObject:forKey:", itemsPendingScanningProvider, CFSTR("_itemsPendingScanningProvider"));
    v8 = v9;
  }
  objc_msgSend(v8, "encodeInteger:forKey:", self->_latestFolderSelectedForImport, CFSTR("_latestFolderSelectedForImport"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_latestFolderSelectedForImportTimestamp, CFSTR("_latestFolderSelectedForImportTimestamp"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_latestFolderSelectedForImportState, CFSTR("_latestFolderSelectedForImportState"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_latestFolderSelectedForImportWasModifiedOnDisk, CFSTR("_latestFolderSelectedForImportWasModifiedOnDisk"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_latestFolderSelectedForImportWasModifiedRemotely, CFSTR("_latestFolderSelectedForImportWasModifiedRemotely"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_latestFolderSelectedForImportIsMonitored, CFSTR("_latestFolderSelectedForImportIsMonitored"));

}

- (FPImportProgressReport)initWithCoder:(id)a3
{
  id v4;
  FPImportProgressReport *v5;
  uint64_t v6;
  NSArray *errorDetails;
  uint64_t v8;
  NSArray *itemsPendingReconciliation;
  uint64_t v10;
  NSArray *itemsPendingScanningDisk;
  uint64_t v12;
  NSArray *itemsPendingScanningProvider;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPImportProgressReport;
  v5 = -[FPImportProgressReport init](&v15, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_status"));
    v5->_numberOfItemsReconciled = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsReconciled"));
    v5->_numberOfItemsInError = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsInError"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_errorDetails"));
    v6 = objc_claimAutoreleasedReturnValue();
    errorDetails = v5->_errorDetails;
    v5->_errorDetails = (NSArray *)v6;

    v5->_dbCreationTimestamp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dbCreationTimestamp"));
    v5->_isStreamResetRunning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isStreamResetRunning"));
    v5->_stateOfDownloadJobs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stateOfDownloadJobs"));
    v5->_stateOfUploadJobs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stateOfUploadJobs"));
    v5->_stateOfOtherJobs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stateOfOtherJobs"));
    v5->_numberOfItemsPendingReconciliation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsPendingReconciliation"));
    v5->_numberOfItemsPendingSelection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsPendingSelection"));
    v5->_numberOfItemsPendingScanningDisk = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsPendingScanningDisk"));
    v5->_numberOfItemsPendingScanningProvider = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfItemsPendingScanningProvider"));
    v5->_xpcActivityRegisteredWithDuet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_xpcActivityRegisteredWithDuet"));
    v5->_xpcActivityTimeSinceLastRegistration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_xpcActivityTimeSinceLastRegistration"));
    v5->_xpcActivityIsActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_xpcActivityIsActive"));
    v5->_xpcActivityTimeSinceLastActivation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_xpcActivityTimeSinceLastActivation"));
    v5->_xpcActivityTimeSinceLastAbleToRun = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_xpcActivityTimeSinceLastAbleToRun"));
    v5->_xpcActivityDasdContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_xpcActivityDasdContext"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_itemsPendingReconciliation"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemsPendingReconciliation = v5->_itemsPendingReconciliation;
    v5->_itemsPendingReconciliation = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_itemsPendingScanningDisk"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemsPendingScanningDisk = v5->_itemsPendingScanningDisk;
    v5->_itemsPendingScanningDisk = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_itemsPendingScanningProvider"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemsPendingScanningProvider = v5->_itemsPendingScanningProvider;
    v5->_itemsPendingScanningProvider = (NSArray *)v12;

    v5->_latestFolderSelectedForImport = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_latestFolderSelectedForImport"));
    v5->_latestFolderSelectedForImportTimestamp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_latestFolderSelectedForImportTimestamp"));
    v5->_latestFolderSelectedForImportState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_latestFolderSelectedForImportState"));
    v5->_latestFolderSelectedForImportWasModifiedOnDisk = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_latestFolderSelectedForImportWasModifiedOnDisk"));
    v5->_latestFolderSelectedForImportWasModifiedRemotely = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_latestFolderSelectedForImportWasModifiedRemotely"));
    v5->_latestFolderSelectedForImportIsMonitored = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_latestFolderSelectedForImportIsMonitored"));
  }

  return v5;
}

- (NSDictionary)json
{
  void *v3;
  void *v4;
  unint64_t status;
  void *v6;
  void *v7;
  NSArray *errorDetails;
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
  NSArray *itemsPendingReconciliation;
  void *v26;
  NSArray *itemsPendingScanningDisk;
  void *v28;
  NSArray *itemsPendingScanningProvider;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  status = self->_status;
  if (status <= 2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", off_1E444D1D8[status], CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsReconciled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfItemsReconciled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsInError);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfItemsInError"));

  errorDetails = self->_errorDetails;
  if (errorDetails)
  {
    -[NSArray fp_map:](errorDetails, "fp_map:", &__block_literal_global_28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("errorDetails"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dbCreationTimestamp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dbCreationTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStreamResetRunning);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("isStreamResetRunning"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stateOfDownloadJobs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("stateOfDownloadJobs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stateOfUploadJobs);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("stateOfUploadJobs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stateOfOtherJobs);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("stateOfOtherJobs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsPendingReconciliation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("numberOfItemsPendingReconciliation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsPendingSelection);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("numberOfItemsPendingSelection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsPendingScanningDisk);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("numberOfItemsPendingScanningDisk"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfItemsPendingScanningProvider);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("numberOfItemsPendingScanningProvider"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_xpcActivityRegisteredWithDuet);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("xpcActivityRegisteredWithDuet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_xpcActivityTimeSinceLastRegistration);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("xpcActivityTimeSinceLastRegistration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_xpcActivityIsActive);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("xpcActivityIsActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_xpcActivityTimeSinceLastActivation);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("xpcActivityTimeSinceLastActivation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_xpcActivityTimeSinceLastAbleToRun);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("xpcActivityTimeSinceLastAbleToRun"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_xpcActivityDasdContext);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("xpcActivityDasdContext"));

  itemsPendingReconciliation = self->_itemsPendingReconciliation;
  if (itemsPendingReconciliation)
  {
    -[NSArray fp_map:](itemsPendingReconciliation, "fp_map:", &__block_literal_global_384);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("itemsPendingReconciliation"));

  }
  itemsPendingScanningDisk = self->_itemsPendingScanningDisk;
  if (itemsPendingScanningDisk)
  {
    -[NSArray fp_map:](itemsPendingScanningDisk, "fp_map:", &__block_literal_global_388);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("itemsPendingScanningDisk"));

  }
  itemsPendingScanningProvider = self->_itemsPendingScanningProvider;
  if (itemsPendingScanningProvider)
  {
    -[NSArray fp_map:](itemsPendingScanningProvider, "fp_map:", &__block_literal_global_392);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("itemsPendingScanningProvider"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_latestFolderSelectedForImport);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("latestFolderSelectedForImport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_latestFolderSelectedForImportTimestamp);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("latestFolderSelectedForImportTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_latestFolderSelectedForImportState);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("latestFolderSelectedForImportState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_latestFolderSelectedForImportWasModifiedOnDisk);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("latestFolderSelectedForImportWasModifiedOnDisk"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_latestFolderSelectedForImportWasModifiedRemotely);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("latestFolderSelectedForImportWasModifiedRemotely"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_latestFolderSelectedForImportIsMonitored);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("latestFolderSelectedForImportIsMonitored"));

  return (NSDictionary *)v4;
}

uint64_t __30__FPImportProgressReport_json__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "json");
}

uint64_t __30__FPImportProgressReport_json__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "json");
}

uint64_t __30__FPImportProgressReport_json__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "json");
}

uint64_t __30__FPImportProgressReport_json__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "json");
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)numberOfItemsReconciled
{
  return self->_numberOfItemsReconciled;
}

- (void)setNumberOfItemsReconciled:(int64_t)a3
{
  self->_numberOfItemsReconciled = a3;
}

- (int64_t)numberOfItemsInError
{
  return self->_numberOfItemsInError;
}

- (void)setNumberOfItemsInError:(int64_t)a3
{
  self->_numberOfItemsInError = a3;
}

- (NSArray)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)dbCreationTimestamp
{
  return self->_dbCreationTimestamp;
}

- (void)setDbCreationTimestamp:(int64_t)a3
{
  self->_dbCreationTimestamp = a3;
}

- (BOOL)isStreamResetRunning
{
  return self->_isStreamResetRunning;
}

- (void)setIsStreamResetRunning:(BOOL)a3
{
  self->_isStreamResetRunning = a3;
}

- (int64_t)stateOfDownloadJobs
{
  return self->_stateOfDownloadJobs;
}

- (void)setStateOfDownloadJobs:(int64_t)a3
{
  self->_stateOfDownloadJobs = a3;
}

- (int64_t)stateOfUploadJobs
{
  return self->_stateOfUploadJobs;
}

- (void)setStateOfUploadJobs:(int64_t)a3
{
  self->_stateOfUploadJobs = a3;
}

- (int64_t)stateOfOtherJobs
{
  return self->_stateOfOtherJobs;
}

- (void)setStateOfOtherJobs:(int64_t)a3
{
  self->_stateOfOtherJobs = a3;
}

- (int64_t)numberOfItemsPendingReconciliation
{
  return self->_numberOfItemsPendingReconciliation;
}

- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3
{
  self->_numberOfItemsPendingReconciliation = a3;
}

- (int64_t)numberOfItemsPendingSelection
{
  return self->_numberOfItemsPendingSelection;
}

- (void)setNumberOfItemsPendingSelection:(int64_t)a3
{
  self->_numberOfItemsPendingSelection = a3;
}

- (int64_t)numberOfItemsPendingScanningDisk
{
  return self->_numberOfItemsPendingScanningDisk;
}

- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3
{
  self->_numberOfItemsPendingScanningDisk = a3;
}

- (int64_t)numberOfItemsPendingScanningProvider
{
  return self->_numberOfItemsPendingScanningProvider;
}

- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3
{
  self->_numberOfItemsPendingScanningProvider = a3;
}

- (BOOL)xpcActivityRegisteredWithDuet
{
  return self->_xpcActivityRegisteredWithDuet;
}

- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3
{
  self->_xpcActivityRegisteredWithDuet = a3;
}

- (unint64_t)xpcActivityTimeSinceLastRegistration
{
  return self->_xpcActivityTimeSinceLastRegistration;
}

- (void)setXpcActivityTimeSinceLastRegistration:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastRegistration = a3;
}

- (BOOL)xpcActivityIsActive
{
  return self->_xpcActivityIsActive;
}

- (void)setXpcActivityIsActive:(BOOL)a3
{
  self->_xpcActivityIsActive = a3;
}

- (unint64_t)xpcActivityTimeSinceLastActivation
{
  return self->_xpcActivityTimeSinceLastActivation;
}

- (void)setXpcActivityTimeSinceLastActivation:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastActivation = a3;
}

- (unint64_t)xpcActivityTimeSinceLastAbleToRun
{
  return self->_xpcActivityTimeSinceLastAbleToRun;
}

- (void)setXpcActivityTimeSinceLastAbleToRun:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastAbleToRun = a3;
}

- (int64_t)xpcActivityDasdContext
{
  return self->_xpcActivityDasdContext;
}

- (void)setXpcActivityDasdContext:(int64_t)a3
{
  self->_xpcActivityDasdContext = a3;
}

- (NSArray)itemsPendingReconciliation
{
  return self->_itemsPendingReconciliation;
}

- (void)setItemsPendingReconciliation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)itemsPendingScanningDisk
{
  return self->_itemsPendingScanningDisk;
}

- (void)setItemsPendingScanningDisk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)itemsPendingScanningProvider
{
  return self->_itemsPendingScanningProvider;
}

- (void)setItemsPendingScanningProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)latestFolderSelectedForImport
{
  return self->_latestFolderSelectedForImport;
}

- (void)setLatestFolderSelectedForImport:(int64_t)a3
{
  self->_latestFolderSelectedForImport = a3;
}

- (int64_t)latestFolderSelectedForImportTimestamp
{
  return self->_latestFolderSelectedForImportTimestamp;
}

- (void)setLatestFolderSelectedForImportTimestamp:(int64_t)a3
{
  self->_latestFolderSelectedForImportTimestamp = a3;
}

- (int64_t)latestFolderSelectedForImportState
{
  return self->_latestFolderSelectedForImportState;
}

- (void)setLatestFolderSelectedForImportState:(int64_t)a3
{
  self->_latestFolderSelectedForImportState = a3;
}

- (BOOL)latestFolderSelectedForImportWasModifiedOnDisk
{
  return self->_latestFolderSelectedForImportWasModifiedOnDisk;
}

- (void)setLatestFolderSelectedForImportWasModifiedOnDisk:(BOOL)a3
{
  self->_latestFolderSelectedForImportWasModifiedOnDisk = a3;
}

- (BOOL)latestFolderSelectedForImportWasModifiedRemotely
{
  return self->_latestFolderSelectedForImportWasModifiedRemotely;
}

- (void)setLatestFolderSelectedForImportWasModifiedRemotely:(BOOL)a3
{
  self->_latestFolderSelectedForImportWasModifiedRemotely = a3;
}

- (BOOL)latestFolderSelectedForImportIsMonitored
{
  return self->_latestFolderSelectedForImportIsMonitored;
}

- (void)setLatestFolderSelectedForImportIsMonitored:(BOOL)a3
{
  self->_latestFolderSelectedForImportIsMonitored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsPendingScanningProvider, 0);
  objc_storeStrong((id *)&self->_itemsPendingScanningDisk, 0);
  objc_storeStrong((id *)&self->_itemsPendingReconciliation, 0);
  objc_storeStrong((id *)&self->_errorDetails, 0);
}

@end
