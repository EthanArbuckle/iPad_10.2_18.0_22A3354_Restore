@implementation NTKBasePhotosFace

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKBasePhotosFace;
  v4 = -[NTKFace copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_cachedResourceDirectorySnapshotKey, "copy");
  v6 = (void *)v4[20];
  v4[20] = v5;

  return v4;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

+ (id)_complicationSlotDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  NTKAllUtilitySmallFlatComplicationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllUtilityLargeNarrowComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("top");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA9FE8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(6, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("bottom");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(104, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return CFSTR("top");
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3;
  const __CFString *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top")) & 1) != 0)
  {
    v4 = CFSTR("ABOVE_TIME");
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("bottom"));
    v4 = CFSTR("BELOW_TIME");
    if (!v5)
      v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SLOT_LABEL_%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(v6, CFSTR("slot name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_allowsEditing
{
  return 1;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  NSString *cachedResourceDirectorySnapshotKey;

  cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
  self->_cachedResourceDirectorySnapshotKey = 0;

}

- (id)_resourceDirectorySnapshotKey
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSString *v8;
  __CFString *v9;
  NSString *cachedResourceDirectorySnapshotKey;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (!v7)
  {
LABEL_5:
    cachedResourceDirectorySnapshotKey = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = 0;

LABEL_6:
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isTinker");

    if (v12)
      v9 = CFSTR("T");
    else
      v9 = 0;
    return v9;
  }
  v8 = self->_cachedResourceDirectorySnapshotKey;
  if (v8)
  {
    v9 = v8;
    return v9;
  }
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NTKUniqueIDForNTKPhoto(v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_cachedResourceDirectorySnapshotKey;
    self->_cachedResourceDirectorySnapshotKey = v17;

  }
  v9 = self->_cachedResourceDirectorySnapshotKey;
  if (!v9)
    goto LABEL_6;
  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 != 14)
    return 0;
  NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_PHOTO_POSITION_COMPANION"), CFSTR("Time Position"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKResourceDirectoryScrubber *v11;
  NTKResourceDirectoryScrubber *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v15 = v7;
  v8 = (void *)objc_opt_new();
  v16 = v8;
  v9 = (void *)objc_opt_new();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [NTKResourceDirectoryScrubber alloc];
  v12 = -[NTKResourceDirectoryScrubber initWithOperations:](v11, "initWithOperations:", v10, v15, v16);
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:](v12, "scrubDirectoryAtPath:toDestinationPath:error:", v13, v6, a4);

  return (char)a4;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 1;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E6C9F1C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "photosContent") != 1)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.photos"), 1005, 0);
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_20;
    }
    -[NTKFace resourceDirectory](self, "resourceDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:](NTKPhotosFaceResourcesManifest, "manifestForResourceDirectory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (objc_msgSend(v10, "validateManifestWithError:", a3))
      {
        -[NTKFace resourceDirectory](self, "resourceDirectory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "count");
        objc_msgSend(v10, "imageList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        v16 = v13 == v15;
        if (v16)
        {
          -[NTKBasePhotosFace _migrateLegibility](self, "_migrateLegibility");
        }
        else if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.photos"), 1006, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_19;
      }
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.photos"), 1006, 0);
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    v16 = 0;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (void)_migrateLegibility
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NTKFace resourceDirectory](self, "resourceDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (NTKPhotosUpdateLegibility(v6))
    {
      NTKCloneResourceDirectoryForReader(v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFace setResourceDirectoryByTransferringOwnership:](self, "setResourceDirectoryByTransferringOwnership:", v5);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResourceDirectorySnapshotKey, 0);
}

@end
