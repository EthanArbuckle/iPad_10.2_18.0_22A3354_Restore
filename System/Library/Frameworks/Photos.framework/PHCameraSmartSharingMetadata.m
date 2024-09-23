@implementation PHCameraSmartSharingMetadata

- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 identities:(id)a4 homeLocations:(id)a5 frequentLocations:(id)a6 locationShiftingRequired:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PHCameraSmartSharingMetadata *v16;
  uint64_t v17;
  NSDate *creationDate;
  uint64_t v19;
  NSString *libraryScopeLocalIdentifier;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v49;
  PHCameraSmartSharingMetadata *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v62.receiver = self;
  v62.super_class = (Class)PHCameraSmartSharingMetadata;
  v16 = -[PHCameraSmartSharingMetadata init](&v62, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v17;

    v53 = v12;
    v19 = objc_msgSend(v12, "copy");
    libraryScopeLocalIdentifier = v16->_libraryScopeLocalIdentifier;
    v16->_libraryScopeLocalIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1E0C9AA60];
    if (v21)
      v24 = (void *)v21;
    else
      v24 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_identities, v24);

    v51 = v14;
    v25 = objc_msgSend(v14, "copy");
    v26 = (void *)v25;
    if (v25)
      v27 = (void *)v25;
    else
      v27 = v23;
    objc_storeStrong((id *)&v16->_homeLocations, v27);

    v49 = v15;
    v28 = objc_msgSend(v15, "copy");
    v29 = (void *)v28;
    if (v28)
      v30 = (void *)v28;
    else
      v30 = v23;
    objc_storeStrong((id *)&v16->_frequentLocations, v30);

    v50 = v16;
    v16->_locationShiftingRequired = a7;
    v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v52 = v13;
    v32 = v13;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v59 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v37, "contactIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v55 != v41)
                  objc_enumerationMutation(v38);
                v43 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                if (objc_msgSend(v43, "length"))
                  objc_msgSend(v31, "addObject:", v43);
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            }
            while (v40);
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v34);
    }

    objc_msgSend(v31, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "copy");
    v46 = (void *)v45;
    if (v45)
      v47 = (void *)v45;
    else
      v47 = (void *)MEMORY[0x1E0C9AA60];
    v16 = v50;
    objc_storeStrong((id *)&v50->_filterContactIDs, v47);

    v13 = v52;
    v12 = v53;
    v14 = v51;
    v15 = v49;
  }

  return v16;
}

- (PHCameraSmartSharingMetadata)initWithLibraryScopeIdentifier:(id)a3 filterContactIDs:(id)a4 homeLocations:(id)a5 isOnTrip:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PHCameraSmartSharingIdentity *v17;
  void *v18;
  PHCameraSmartSharingIdentity *v19;
  PHCameraSmartSharingMetadata *v20;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
        v17 = [PHCameraSmartSharingIdentity alloc];
        v28 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PHCameraSmartSharingIdentity initWithPhoneNumber:emailAddress:contactIdentifiers:](v17, "initWithPhoneNumber:emailAddress:contactIdentifiers:", 0, 0, v18);
        objc_msgSend(v10, "addObject:", v19);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }

  v20 = -[PHCameraSmartSharingMetadata initWithLibraryScopeIdentifier:identities:homeLocations:frequentLocations:locationShiftingRequired:](self, "initWithLibraryScopeIdentifier:identities:homeLocations:frequentLocations:locationShiftingRequired:", v23, v10, v9, 0, 0);
  return v20;
}

- (PHCameraSmartSharingMetadata)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCameraSmartSharingMetadata.m"), 147, CFSTR("Unavailable initializer"));

  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingMetadata libraryScopeLocalIdentifier](self, "libraryScopeLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingMetadata creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingMetadata identities](self, "identities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingMetadata homeLocations](self, "homeLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCameraSmartSharingMetadata frequentLocations](self, "frequentLocations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@:%p; libraryScope:%@ creationDate:%@ identities:[%@] homeLocations:[%@] frequentLocations:[%@] locationShiftingRequired:%d>"),
    v4,
    self,
    v5,
    v6,
    v8,
    v10,
    v12,
    -[PHCameraSmartSharingMetadata locationShiftingRequired](self, "locationShiftingRequired"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)hasActiveLibraryScope
{
  void *v2;
  BOOL v3;

  -[PHCameraSmartSharingMetadata libraryScopeLocalIdentifier](self, "libraryScopeLocalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PHCameraSmartSharingMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *v6;
  NSString *libraryScopeLocalIdentifier;
  NSDate *v8;
  NSDate *creationDate;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  PHCameraSmartSharingMetadata *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  if (v5 != +[PHCameraSmartSharingMetadata version](PHCameraSmartSharingMetadata, "version"))
  {
    PLPhotoKitGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v29 = 0;
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134218240;
    v40 = v5;
    v41 = 2048;
    v42 = +[PHCameraSmartSharingMetadata version](PHCameraSmartSharingMetadata, "version");
    v31 = "[PHCameraSmartSharingMetadata] decode warning: version mismatch %ld != %ld";
    v32 = v30;
    v33 = 22;
LABEL_16:
    _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    goto LABEL_17;
  }
  v35.receiver = self;
  v35.super_class = (Class)PHCameraSmartSharingMetadata;
  self = -[PHCameraSmartSharingMetadata init](&v35, sel_init);
  if (self)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryScopeLocalIdentifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    libraryScopeLocalIdentifier = self->_libraryScopeLocalIdentifier;
    self->_libraryScopeLocalIdentifier = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    creationDate = self->_creationDate;
    self->_creationDate = v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("identities"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = MEMORY[0x1E0C9AA60];
    v16 = (void *)(v13 ? v13 : MEMORY[0x1E0C9AA60]);
    objc_storeStrong((id *)&self->_identities, v16);

    v17 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("homeLocations"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = (void *)(v20 ? v20 : v15);
    objc_storeStrong((id *)&self->_homeLocations, v22);

    v23 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("frequentLocations"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = (void *)(v26 ? v26 : v15);
    objc_storeStrong((id *)&self->_frequentLocations, v28);

    self->_locationShiftingRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("locationShiftingRequired"));
    if (!self->_creationDate)
    {
      PLPhotoKitGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v31 = "[PHCameraSmartSharingMetadata] decode fail, nil field";
      v32 = v30;
      v33 = 2;
      goto LABEL_16;
    }
  }
  self = self;
  v29 = self;
LABEL_18:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", +[PHCameraSmartSharingMetadata version](PHCameraSmartSharingMetadata, "version"), CFSTR("version"));
  -[PHCameraSmartSharingMetadata libraryScopeLocalIdentifier](self, "libraryScopeLocalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("libraryScopeLocalIdentifier"));

  -[PHCameraSmartSharingMetadata identities](self, "identities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("identities"));

  -[PHCameraSmartSharingMetadata creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("creationDate"));

  -[PHCameraSmartSharingMetadata homeLocations](self, "homeLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("homeLocations"));

  -[PHCameraSmartSharingMetadata frequentLocations](self, "frequentLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("frequentLocations"));

  objc_msgSend(v9, "encodeBool:forKey:", -[PHCameraSmartSharingMetadata locationShiftingRequired](self, "locationShiftingRequired"), CFSTR("locationShiftingRequired"));
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)libraryScopeLocalIdentifier
{
  return self->_libraryScopeLocalIdentifier;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSArray)filterContactIDs
{
  return self->_filterContactIDs;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (NSArray)frequentLocations
{
  return self->_frequentLocations;
}

- (BOOL)locationShiftingRequired
{
  return self->_locationShiftingRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_filterContactIDs, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_libraryScopeLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (id)_metadataFileURLForPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "urlForApplicationDataFolderIdentifier:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("camera_smart_sharing_metadata.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)retrieveMetadataForPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  NSObject *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "photoDirectoryWithType:createIfNeeded:error:", 20, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("camera_smart_sharing_metadata.plist"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

      if ((v12 & 1) != 0)
      {

        v4 = 0;
        goto LABEL_15;
      }
    }
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v9;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] unable to directly access %@, opening the default photo library, which is slower.", buf, 0xCu);
    }

    +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v14 = *MEMORY[0x1E0D74A08];
  objc_msgSend((id)*MEMORY[0x1E0D74A08], "UTF8String");
  v9 = xpc_copy_entitlement_for_self();
  objc_msgSend((id)*MEMORY[0x1E0D74A10], "UTF8String");
  v15 = xpc_copy_entitlement_for_self();
  v16 = v15;
  if (v9 != MEMORY[0x1E0C81240] && v15 != MEMORY[0x1E0C81240])
  {
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v36 = v14;
    v24 = "[PHCameraSmartSharingMetadata] missing entitlement %@";
    goto LABEL_19;
  }
  v34 = 0;
  v18 = objc_msgSend(v4, "requestSandboxExtensionsIfNeededWithError:", &v34);
  v22 = v34;
  if ((v18 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v22;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] failed to request sandbox extensions:%@ for library:%@", buf, 0x16u);
    }

    goto LABEL_24;
  }
  objc_msgSend(a1, "_metadataFileURLForPhotoLibrary:", v4);
  v19 = objc_claimAutoreleasedReturnValue();

  v9 = v19;
LABEL_15:
  objc_msgSend(a1, "_readMetadataFromFileURL:", v9);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    PLPhotoKitGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEFAULT, "[PHCameraSmartSharingMetadata] unable to retrieve metadata, requesting updated cache and trying again.", buf, 2u);
    }

    if (!v4)
    {
      +[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "photoAnalysisClient");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v30, "requestCameraSmartSharingProcessingForLibraryScopeWithUUID:withOptions:error:", 0, 0, &v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v33;

    if (v31)
    {
      objc_msgSend(a1, "_readMetadataFromFileURL:", v9);
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v21 = (void *)v32;
        goto LABEL_25;
      }
      PLPhotoKitGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        v21 = 0;
LABEL_25:

        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      v24 = "[PHCameraSmartSharingMetadata] failed to retrieve metadata on second try, giving up.";
      v25 = v22;
      v26 = 2;
LABEL_20:
      _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
      goto LABEL_24;
    }
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v36 = v16;
    v24 = "[PHCameraSmartSharingMetadata] error requesting updated metadata:%@";
LABEL_19:
    v25 = v22;
    v26 = 12;
    goto LABEL_20;
  }
  v21 = (void *)v20;
LABEL_26:

  return v21;
}

+ (id)_readMetadataFromFileURL:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject path](v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v16 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v3, 0, &v16);
    v8 = v16;
    if (v7)
    {
      v15 = v8;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;

      if (v9)
      {
        v11 = v9;
        v12 = v11;
      }
      else
      {
        PLPhotoKitGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] retrieveMetadataForLibraryScope error unarchiving file: %@", buf, 0xCu);
        }

        v11 = 0;
        v12 = 0;
      }
    }
    else
    {
      PLPhotoKitGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] retrieveMetadataForLibraryScope error reading file: %@", buf, 0xCu);
      }
      v12 = 0;
      v10 = v8;
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "[PHCameraSmartSharingMetadata] missing file %@ error:%@", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)storeMetadata:(id)a3 forPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)*MEMORY[0x1E0D74A10];
  objc_msgSend((id)*MEMORY[0x1E0D74A10], "UTF8String");
  v11 = (void *)xpc_copy_entitlement_for_self();
  if (v11 == (void *)MEMORY[0x1E0C81240])
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    if (v14)
    {
      objc_msgSend(a1, "_metadataFileURLForPhotoLibrary:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v15;
      v13 = objc_msgSend(v14, "writeToURL:options:error:", v16, 1073741825, &v21);
      v17 = v21;

      if ((v13 & 1) == 0)
      {
        PLPhotoKitGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v17;
          _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] error writing file: %@", buf, 0xCu);
        }

        if (a5)
          *a5 = objc_retainAutorelease(v17);
      }

    }
    else
    {
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] archive error: %@", buf, 0xCu);
      }

      if (a5)
      {
        v17 = objc_retainAutorelease(v15);
        v13 = 0;
        *a5 = v17;
      }
      else
      {
        v13 = 0;
        v17 = v15;
      }
    }

  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "[PHCameraSmartSharingMetadata] missing entitlement %@", buf, 0xCu);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Missing entitlement %@"), v10);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (int64_t)version
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
