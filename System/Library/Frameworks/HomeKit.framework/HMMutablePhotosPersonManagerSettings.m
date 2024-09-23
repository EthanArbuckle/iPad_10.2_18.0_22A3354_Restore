@implementation HMMutablePhotosPersonManagerSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMPhotosPersonManagerSettings *v4;

  v4 = -[HMPhotosPersonManagerSettings init](+[HMPhotosPersonManagerSettings allocWithZone:](HMPhotosPersonManagerSettings, "allocWithZone:", a3), "init");
  -[HMPhotosPersonManagerSettings setImportingFromPhotoLibraryEnabled:](v4, "setImportingFromPhotoLibraryEnabled:", -[HMPhotosPersonManagerSettings isImportingFromPhotoLibraryEnabled](self, "isImportingFromPhotoLibraryEnabled"));
  -[HMPhotosPersonManagerSettings setSharingFaceClassificationsEnabled:](v4, "setSharingFaceClassificationsEnabled:", -[HMPhotosPersonManagerSettings isSharingFaceClassificationsEnabled](self, "isSharingFaceClassificationsEnabled"));
  return v4;
}

@end
