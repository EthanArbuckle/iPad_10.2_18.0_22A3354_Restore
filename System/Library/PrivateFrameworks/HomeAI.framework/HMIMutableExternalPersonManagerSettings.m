@implementation HMIMutableExternalPersonManagerSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMIExternalPersonManagerSettings *v4;

  v4 = -[HMIExternalPersonManagerSettings init](+[HMIExternalPersonManagerSettings allocWithZone:](HMIExternalPersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMIExternalPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v4, "setImportingFromPhotoLibraryEnabled:", -[HMIExternalPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"));
  -[HMIExternalPersonManagerSettings setSharingFaceClassificationsEnabled:](v4, "setSharingFaceClassificationsEnabled:", -[HMIExternalPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"));
  return v4;
}

@end
