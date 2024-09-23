@implementation PLPhotoEditPersistenceManager(PhotosFrameworkAdditions)

+ (id)compositionControllerWithAdjustmentData:()PhotosFrameworkAdditions asset:imageOrientation:outMasterWidth:outMasterHeight:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  double Seconds;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  id v28;
  CMTime time;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "fetchPropertySetsIfNeeded");
  objc_msgSend(v12, "photoIrisProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "photoIrisVideoDuration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  if ((PLOrientationIsValid() & 1) == 0)
  {
    objc_msgSend(v12, "originalMetadataProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = (int)objc_msgSend(v16, "originalExifOrientation");

  }
  objc_msgSend(MEMORY[0x1E0D71980], "importPropertiesWithEXIFOrientation:duration:", a5, Seconds);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D71988]);
    objc_msgSend(v11, "formatIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formatVersion");
    v21 = a7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v19, "loadPhotoEditData:formatIdentifier:formatVersion:importProperties:error:", v18, v20, v22, v17, &v28);
    v27 = objc_claimAutoreleasedReturnValue();
    v23 = v28;

    if (v23)
    {
      PLPhotoEditGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v23;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "+[PLPhotoEditPersistenceManager compositionControllerWithAdjustmentData:asset:] could not create composition from persistence manager: %@", buf, 0xCu);
      }

    }
    if (a6 && v21)
      objc_msgSend(v19, "loadMasterDimensionsFromPhotoEditData:outMasterWidth:outMasterHeight:", v18, a6, v21);

    v25 = (void *)v27;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
