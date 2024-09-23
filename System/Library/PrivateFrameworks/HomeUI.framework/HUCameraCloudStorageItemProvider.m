@implementation HUCameraCloudStorageItemProvider

- (HUCameraCloudStorageItemProvider)initWithCameraProfile:(id)a3
{
  id v5;
  HUCameraEraseRecordingsItem *v6;
  void *v7;
  HUCameraCloudStorageItemProvider *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v6 = -[HUCameraEraseRecordingsItem initWithCameraProfile:]([HUCameraEraseRecordingsItem alloc], "initWithCameraProfile:", v5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HUCameraCloudStorageItemProvider;
  v8 = -[HFStaticItemProvider initWithItems:](&v11, sel_initWithItems_, v7);

  if (v8)
  {
    -[HFStaticItemProvider reloadItems](v8, "reloadItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithNoResult");

    objc_storeStrong((id *)&v8->_cameraProfile, a3);
  }

  return v8;
}

- (HUCameraCloudStorageItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCameraProfile_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraCloudStorageItemProvider.m"), 94, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraCloudStorageItemProvider init]",
    v5);

  return 0;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
