@implementation ICASDeviceSnapshotData

- (ICASDeviceSnapshotData)initWithUserStartMonth:(id)a3 userStartYear:(id)a4 saltVersion:(id)a5 accountTypeSummary:(id)a6 collabFoldersSummary:(id)a7 totalCountOfPinnedNotes:(id)a8 deviceSnapshotSummary:(id)a9 userSnapshotSummary:(id)a10
{
  id v17;
  ICASDeviceSnapshotData *v18;
  ICASDeviceSnapshotData *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ICASDeviceSnapshotData;
  v18 = -[ICASDeviceSnapshotData init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userStartMonth, a3);
    objc_storeStrong((id *)&v19->_userStartYear, a4);
    objc_storeStrong((id *)&v19->_saltVersion, a5);
    objc_storeStrong((id *)&v19->_accountTypeSummary, a6);
    objc_storeStrong((id *)&v19->_collabFoldersSummary, a7);
    objc_storeStrong((id *)&v19->_totalCountOfPinnedNotes, a8);
    objc_storeStrong((id *)&v19->_deviceSnapshotSummary, a9);
    objc_storeStrong((id *)&v19->_userSnapshotSummary, a10);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DeviceSnapshotData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("userStartMonth");
  -[ICASDeviceSnapshotData userStartMonth](self, "userStartMonth");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[ICASDeviceSnapshotData userStartMonth](self, "userStartMonth");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v27 = (void *)v3;
  v30[0] = v3;
  v29[1] = CFSTR("userStartYear");
  -[ICASDeviceSnapshotData userStartYear](self, "userStartYear");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASDeviceSnapshotData userStartYear](self, "userStartYear");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v25 = (void *)v4;
  v30[1] = v4;
  v29[2] = CFSTR("saltVersion");
  -[ICASDeviceSnapshotData saltVersion](self, "saltVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASDeviceSnapshotData saltVersion](self, "saltVersion");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v23 = (void *)v5;
  v30[2] = v5;
  v29[3] = CFSTR("accountTypeSummary");
  -[ICASDeviceSnapshotData accountTypeSummary](self, "accountTypeSummary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[ICASDeviceSnapshotData accountTypeSummary](self, "accountTypeSummary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v30[3] = v6;
  v29[4] = CFSTR("collabFoldersSummary");
  -[ICASDeviceSnapshotData collabFoldersSummary](self, "collabFoldersSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASDeviceSnapshotData collabFoldersSummary](self, "collabFoldersSummary");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v30[4] = v9;
  v29[5] = CFSTR("totalCountOfPinnedNotes");
  -[ICASDeviceSnapshotData totalCountOfPinnedNotes](self, "totalCountOfPinnedNotes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASDeviceSnapshotData totalCountOfPinnedNotes](self, "totalCountOfPinnedNotes");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v30[5] = v12;
  v29[6] = CFSTR("deviceSnapshotSummary");
  -[ICASDeviceSnapshotData deviceSnapshotSummary](self, "deviceSnapshotSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASDeviceSnapshotData deviceSnapshotSummary](self, "deviceSnapshotSummary");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v30[6] = v15;
  v29[7] = CFSTR("userSnapshotSummary");
  -[ICASDeviceSnapshotData userSnapshotSummary](self, "userSnapshotSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[ICASDeviceSnapshotData userSnapshotSummary](self, "userSnapshotSummary");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v19 = (void *)v18;
  v30[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSArray)accountTypeSummary
{
  return self->_accountTypeSummary;
}

- (NSArray)collabFoldersSummary
{
  return self->_collabFoldersSummary;
}

- (NSNumber)totalCountOfPinnedNotes
{
  return self->_totalCountOfPinnedNotes;
}

- (NSArray)deviceSnapshotSummary
{
  return self->_deviceSnapshotSummary;
}

- (NSArray)userSnapshotSummary
{
  return self->_userSnapshotSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_deviceSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedNotes, 0);
  objc_storeStrong((id *)&self->_collabFoldersSummary, 0);
  objc_storeStrong((id *)&self->_accountTypeSummary, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
}

@end
