@implementation HMDCameraUserSettingsConfiguration

- (HMDCameraUserSettingsConfiguration)initWithUser:(id)a3
{
  id v4;
  HMDCameraUserSettingsConfiguration *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraUserSettingsConfiguration;
  v5 = -[HMDCameraUserSettingsConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "photosPersonManagerSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sharingFaceClassificationsEnabled = objc_msgSend(v6, "isSharingFaceClassificationsEnabled");

    objc_msgSend(v4, "photosPersonManagerSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_importingFromPhotoLibraryEnabled = objc_msgSend(v7, "isImportingFromPhotoLibraryEnabled");

    v5->_owner = objc_msgSend(v4, "isOwner");
  }

  return v5;
}

- (BOOL)isSharingFaceClassificationsEnabled
{
  return self->_sharingFaceClassificationsEnabled;
}

- (BOOL)isImportingFromPhotoLibraryEnabled
{
  return self->_importingFromPhotoLibraryEnabled;
}

- (BOOL)isOwner
{
  return self->_owner;
}

@end
