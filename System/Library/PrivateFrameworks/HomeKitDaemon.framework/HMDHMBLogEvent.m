@implementation HMDHMBLogEvent

- (HMDHMBLogEvent)initWithCloudZoneID:(id)a3
{
  id v4;
  HMDHMBLogEvent *v5;
  HMDHMBLogEvent *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMDHMBLogEvent;
  v5 = -[HMMLogEvent init](&v34, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  v5->_zoneType = 0;
  objc_msgSend(v4, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("camera-clips-"));

  if ((v9 & 1) != 0)
  {
    v10 = 1;
LABEL_12:
    v6->_zoneType = v10;
    goto LABEL_13;
  }
  objc_msgSend(v4, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("accessory-profile-data-"));

  if ((v13 & 1) != 0)
  {
    v10 = 2;
    goto LABEL_12;
  }
  objc_msgSend(v4, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("trust-"));

  if ((v16 & 1) != 0)
  {
    v10 = 3;
    goto LABEL_12;
  }
  objc_msgSend(v4, "zoneID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "zoneName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("user-data-private-"));

  if ((v19 & 1) != 0)
  {
    v10 = 4;
    goto LABEL_12;
  }
  objc_msgSend(v4, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("user-data-shared-"));

  if (v22)
  {
    v10 = 5;
    goto LABEL_12;
  }
LABEL_13:
  v6->_containerType = 0;
  objc_msgSend(v4, "containerID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", CFSTR("com.apple.willow.config"));

  if ((v25 & 1) != 0)
  {
    v26 = 3;
LABEL_19:
    v6->_containerType = v26;
    goto LABEL_20;
  }
  objc_msgSend(v4, "containerID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqual:", CFSTR("com.apple.homekit"));

  if ((v29 & 1) != 0)
  {
    v26 = 1;
    goto LABEL_19;
  }
  objc_msgSend(v4, "containerID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "containerIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqual:", CFSTR("com.apple.homekit.camera.clips"));

  if (v32)
  {
    v26 = 2;
    goto LABEL_19;
  }
LABEL_20:

  return v6;
}

- (int)containerType
{
  return self->_containerType;
}

- (int)zoneType
{
  return self->_zoneType;
}

@end
