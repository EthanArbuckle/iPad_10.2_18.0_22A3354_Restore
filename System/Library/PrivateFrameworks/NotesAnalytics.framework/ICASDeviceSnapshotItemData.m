@implementation ICASDeviceSnapshotItemData

- (ICASDeviceSnapshotItemData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 bioAuthEnabled:(id)a5 localNotesEnabled:(id)a6 osVersion:(id)a7 deviceID:(id)a8 audioTranscriptEnabled:(id)a9 audioSummaryEnabled:(id)a10 mathTextEnabled:(id)a11 mathHandwritingEnabled:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  ICASDeviceSnapshotItemData *v22;
  ICASDeviceSnapshotItemData *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASDeviceSnapshotItemData;
  v22 = -[ICASDeviceSnapshotItemData init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_deviceModel, a3);
    objc_storeStrong((id *)&v23->_devicePlatform, obj);
    objc_storeStrong((id *)&v23->_bioAuthEnabled, a5);
    objc_storeStrong((id *)&v23->_localNotesEnabled, v26);
    objc_storeStrong((id *)&v23->_osVersion, v27);
    objc_storeStrong((id *)&v23->_deviceID, a8);
    objc_storeStrong((id *)&v23->_audioTranscriptEnabled, a9);
    objc_storeStrong((id *)&v23->_audioSummaryEnabled, a10);
    objc_storeStrong((id *)&v23->_mathTextEnabled, a11);
    objc_storeStrong((id *)&v23->_mathHandwritingEnabled, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DeviceSnapshotItemData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
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
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("deviceModel");
  -[ICASDeviceSnapshotItemData deviceModel](self, "deviceModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ICASDeviceSnapshotItemData deviceModel](self, "deviceModel");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = CFSTR("devicePlatform");
  -[ICASDeviceSnapshotItemData devicePlatform](self, "devicePlatform");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ICASDeviceSnapshotItemData devicePlatform](self, "devicePlatform");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = CFSTR("bioAuthEnabled");
  -[ICASDeviceSnapshotItemData bioAuthEnabled](self, "bioAuthEnabled");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASDeviceSnapshotItemData bioAuthEnabled](self, "bioAuthEnabled");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = CFSTR("localNotesEnabled");
  -[ICASDeviceSnapshotItemData localNotesEnabled](self, "localNotesEnabled");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[ICASDeviceSnapshotItemData localNotesEnabled](self, "localNotesEnabled");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = CFSTR("osVersion");
  -[ICASDeviceSnapshotItemData osVersion](self, "osVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASDeviceSnapshotItemData osVersion](self, "osVersion");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = CFSTR("deviceID");
  -[ICASDeviceSnapshotItemData deviceID](self, "deviceID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASDeviceSnapshotItemData deviceID](self, "deviceID");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = CFSTR("audioTranscriptEnabled");
  -[ICASDeviceSnapshotItemData audioTranscriptEnabled](self, "audioTranscriptEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICASDeviceSnapshotItemData audioTranscriptEnabled](self, "audioTranscriptEnabled");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = CFSTR("audioSummaryEnabled");
  -[ICASDeviceSnapshotItemData audioSummaryEnabled](self, "audioSummaryEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICASDeviceSnapshotItemData audioSummaryEnabled](self, "audioSummaryEnabled");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = CFSTR("mathTextEnabled");
  -[ICASDeviceSnapshotItemData mathTextEnabled](self, "mathTextEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICASDeviceSnapshotItemData mathTextEnabled](self, "mathTextEnabled");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = CFSTR("mathHandwritingEnabled");
  -[ICASDeviceSnapshotItemData mathHandwritingEnabled](self, "mathHandwritingEnabled");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASDeviceSnapshotItemData mathHandwritingEnabled](self, "mathHandwritingEnabled");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  v36[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (NSNumber)bioAuthEnabled
{
  return self->_bioAuthEnabled;
}

- (NSNumber)localNotesEnabled
{
  return self->_localNotesEnabled;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSNumber)audioTranscriptEnabled
{
  return self->_audioTranscriptEnabled;
}

- (NSNumber)audioSummaryEnabled
{
  return self->_audioSummaryEnabled;
}

- (NSNumber)mathTextEnabled
{
  return self->_mathTextEnabled;
}

- (NSNumber)mathHandwritingEnabled
{
  return self->_mathHandwritingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathHandwritingEnabled, 0);
  objc_storeStrong((id *)&self->_mathTextEnabled, 0);
  objc_storeStrong((id *)&self->_audioSummaryEnabled, 0);
  objc_storeStrong((id *)&self->_audioTranscriptEnabled, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_localNotesEnabled, 0);
  objc_storeStrong((id *)&self->_bioAuthEnabled, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
