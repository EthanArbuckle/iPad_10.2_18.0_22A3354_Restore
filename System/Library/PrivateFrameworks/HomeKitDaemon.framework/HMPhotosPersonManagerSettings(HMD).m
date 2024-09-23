@implementation HMPhotosPersonManagerSettings(HMD)

- (id)createHMIExternalPersonManagerSettings
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE4D1F0]);
  objc_msgSend(v2, "setImportingFromPhotoLibraryEnabled:", objc_msgSend(a1, "isImportingFromPhotoLibraryEnabled"));
  objc_msgSend(v2, "setSharingFaceClassificationsEnabled:", objc_msgSend(a1, "isSharingFaceClassificationsEnabled"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (uint64_t)createHMIHomePersonManagerSettings
{
  return 0;
}

- (uint64_t)createHMHomePersonManagerSettings
{
  return 0;
}

@end
