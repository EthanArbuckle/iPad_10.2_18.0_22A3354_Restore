@implementation INImageFilePersistence

- (NSString)serviceIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.intents.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)servicePriority
{
  return 50;
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  _BOOL4 v9;
  _INDataImage *v11;
  NSObject *v12;
  void *v13;
  _INDataImage *v14;
  _INDataImage *v15;
  _INDataImage *v16;
  _INDataImage *v17;
  void *v18;
  _INDataImage *v19;
  _INDataImage *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  _INDataImage *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  _INDataImage *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  __objc2_class **p_superclass;
  NSObject *v51;
  _BOOL4 v52;
  id v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  char v65;
  void *v66;
  id v67;
  _INDataImage *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id *v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id *v87;
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  _INDataImage *v91;
  uint64_t v92;
  _QWORD v93[2];

  v9 = a4;
  v93[1] = *MEMORY[0x1E0C80C00];
  v11 = (_INDataImage *)a3;
  if (-[INImageFilePersistence canStoreImage:](self, "canStoreImage:", v11))
  {
    -[INImageFilePersistence purgeExpiredImagesInEphemeralStore:](self, "purgeExpiredImagesInEphemeralStore:", 0);
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
      v90 = 2112;
      v91 = v11;
      _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s Attempting to store image %@ using file persistence", buf, 0x16u);
    }
    -[_INDataImage _imageData](v11, "_imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v11;
      else
        v14 = 0;
      v15 = v14;
      if (v15)
      {
        v16 = v15;
        v17 = [_INDataImage alloc];
        -[_INDataImage _imageData](v11, "_imageData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[_INDataImage initWithImageData:](v17, "initWithImageData:", v18);

        -[INImage _preferredScaledSize](v11, "_preferredScaledSize");
        -[INImage _setPreferredScaledSize:](v19, "_setPreferredScaledSize:");
        if (v9)
        {
LABEL_10:
          -[INImage _in_downscaledImageForFilePersistence](v19, "_in_downscaledImageForFilePersistence");
          v20 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
LABEL_19:
          v28 = v20;
          -[_INDataImage _imageData](v20, "_imageData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29 && v9)
          {
            v30 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
              v90 = 2112;
              v91 = v19;
              _os_log_error_impl(&dword_18BEBC000, v30, OS_LOG_TYPE_ERROR, "%s No scaled image data, falling back to unscaled data image: %@", buf, 0x16u);
            }
            -[_INDataImage _imageData](v19, "_imageData");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v29)
          {
            v83 = 0;
            objc_msgSend(v29, "_in_writeDataToPathForImage:storeType:error:", v19, a6, &v83);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v83;
            if (v31)
            {
              v33 = v31;
              a7 = v33;
LABEL_51:

              goto LABEL_52;
            }
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = (void *)MEMORY[0x1E0CB3940];
            -[_INDataImage description](v11, "description");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", CFSTR("Failed to store image %@ in service %@"), v61, self);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKey:", v62, *MEMORY[0x1E0CB2D50]);

            if (v32)
              objc_msgSend(v59, "setObject:forKey:", v32, *MEMORY[0x1E0CB3388]);
            if (a7)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, v59);
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }

            v33 = 0;
          }
          else
          {
            if (!a7)
            {
LABEL_52:

              goto LABEL_53;
            }
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v86 = *MEMORY[0x1E0CB2D50];
            v35 = (void *)MEMORY[0x1E0CB3940];
            -[_INDataImage description](v11, "description");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("Failed to store image %@ in service %@"), v32, self);
            v33 = (id *)objc_claimAutoreleasedReturnValue();
            v87 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, v36);
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a7 = v37;

          }
          a7 = 0;
          goto LABEL_51;
        }
      }
      else
      {
        v19 = 0;
        if (v9)
          goto LABEL_10;
      }
      v20 = v19;
      goto LABEL_19;
    }
    -[INImage _uri](v11, "_uri");
    v19 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[INImage _sandboxExtensionData](v11, "_sandboxExtensionData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = -[_INDataImage startAccessingSecurityScopedResource](v19, "startAccessingSecurityScopedResource");

        LODWORD(v26) = 1;
        if (!v19)
          goto LABEL_40;
LABEL_31:
        if ((-[_INDataImage isFileURL](v19, "isFileURL") & v27) != 1)
          goto LABEL_40;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v80 = a7;
        v38 = (int)v26;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INDataImage path](v19, "path");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v26, "fileExistsAtPath:", v39);

        LODWORD(v26) = v38;
        a7 = v80;
        if (!v40)
          goto LABEL_40;
        v41 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
          v90 = 2112;
          v91 = v11;
          _os_log_impl(&dword_18BEBC000, v41, OS_LOG_TYPE_INFO, "%s Copying file URL image to intents directory: %@", buf, 0x16u);
        }
        -[INImage _in_writeableFilePersistenceConfigurationForStoreType:](v11, "_in_writeableFilePersistenceConfigurationForStoreType:", a6);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "filePath");
        v43 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "fileExistsAtPath:", v43);

        if (!v45)
          goto LABEL_59;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INDataImage filePathURL](v19, "filePathURL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "absoluteString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v46, "contentsEqualAtPath:andPath:", v43, v48);

        p_superclass = INCodableAttributeRelationship.superclass;
        v51 = INSiriLogContextIntents;
        v52 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
        if (v49)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136315394;
            v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
            v90 = 2112;
            v91 = v11;
            _os_log_impl(&dword_18BEBC000, v51, OS_LOG_TYPE_INFO, "%s URL image already exists and is the same at destination path: %@, not copying (but updating modified date)", buf, 0x16u);
          }
          v53 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v43);
LABEL_70:
          v77 = p_superclass[238];
          v70 = 1;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
            v90 = 2112;
            v91 = v43;
            _os_log_impl(&dword_18BEBC000, v77, OS_LOG_TYPE_INFO, "%s URL image now available at file path: %@", buf, 0x16u);
          }
          v67 = 0;
          goto LABEL_73;
        }
        if (v52)
        {
          *(_DWORD *)buf = 136315394;
          v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
          v90 = 2112;
          v91 = v11;
          _os_log_impl(&dword_18BEBC000, v51, OS_LOG_TYPE_INFO, "%s URL image already exists and is different at destination path: %@, removing the old one and copying", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "isDeletableFileAtPath:", v43);

        if ((v65 & 1) == 0)
        {
          v76 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
            v90 = 2112;
            v91 = v11;
            _os_log_error_impl(&dword_18BEBC000, v76, OS_LOG_TYPE_ERROR, "%s URL image at destination path is not deleteable: %@", buf, 0x16u);
          }
          goto LABEL_70;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0;
        objc_msgSend(v66, "removeItemAtPath:error:", v43, &v82);
        v67 = v82;

        if (!v67)
        {
LABEL_59:
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v43);
          v68 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = 0;
          objc_msgSend(v69, "copyItemAtURL:toURL:error:", v19, v68, &v81);
          v67 = v81;

          if (!v67)
          {
            if (v9)
            {
              +[INImage imageWithURL:](INImage, "imageWithURL:", v68);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[INImage _preferredScaledSize](v11, "_preferredScaledSize");
              objc_msgSend(v71, "_setPreferredScaledSize:");
              objc_msgSend(v71, "_in_downscaledImageForFilePersistence");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "_uri");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v73)
              {
                v74 = INSiriLogContextIntents;
                if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v89 = "-[INImageFilePersistence storeImage:scaled:qualityOfService:storeType:error:]";
                  v90 = 2112;
                  v91 = v68;
                  _os_log_error_impl(&dword_18BEBC000, v74, OS_LOG_TYPE_ERROR, "%s Failed to scale image at URL %@", buf, 0x16u);
                }
              }

            }
            v75 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v43);

            p_superclass = (__objc2_class **)(INCodableAttributeRelationship + 8);
            goto LABEL_70;
          }

        }
        v70 = 0;
LABEL_73:
        objc_msgSend(v42, "identifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
          *v80 = objc_retainAutorelease(v67);
        if (v70)
          v79 = v78;
        else
          v79 = 0;
        a7 = v79;

        goto LABEL_53;
      }
    }
    else
    {
      LODWORD(v26) = 0;
    }
    v27 = 1;
    if (!v19)
    {
LABEL_40:
      if (a7)
      {
        v54 = (void *)MEMORY[0x1E0CB35C8];
        v84 = *MEMORY[0x1E0CB2D50];
        v55 = (int)v26;
        v56 = (void *)MEMORY[0x1E0CB3940];
        -[_INDataImage description](v11, "description");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringWithFormat:", CFSTR("No valid data to store for image %@ in service %@"), v57, self);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, v26);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        LODWORD(v26) = v55;
      }
      if ((v26 & v27) == 1)
        -[_INDataImage stopAccessingSecurityScopedResource](v19, "stopAccessingSecurityScopedResource");
      goto LABEL_44;
    }
    goto LABEL_31;
  }
  if (a7)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB2D50];
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v19 = (_INDataImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Image class %@ not supported by store"), v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, v25);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_44:
    a7 = 0;
LABEL_53:

  }
  return a7;
}

- (void)purgeExpiredImagesInEphemeralStore:(BOOL)a3
{
  __objc2_class **p_superclass;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _QWORD v63[2];
  _BYTE v64[128];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  p_superclass = INCodableAttributeRelationship.superclass;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Looking for images that have expired in the ephemeral store", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "lastEphemeralStorePurgingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "timeIntervalSinceNow"), v7 <= -180.0))
  {
    v45 = v6;
    _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C999D0];
    v11 = *MEMORY[0x1E0C998D8];
    v65[0] = *MEMORY[0x1E0C999D0];
    v65[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v43 = (void *)v8;
    objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v12, 5, &v54);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v54;

    if (!v13)
    {
      v15 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
        v57 = 2112;
        v58 = v14;
        _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Failed to purge ephemeral images with error: %@", buf, 0x16u);
      }
    }
    v42 = v14;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v16)
    {
      v17 = v16;
      v48 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v48)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v63[0] = v10;
          v63[1] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2, v42);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          objc_msgSend(v19, "resourceValuesForKeys:error:", v20, &v49);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v49;

          if (v21)
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", v10);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "BOOLValue");

            if ((v24 & 1) == 0)
            {
              objc_msgSend(v19, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                objc_msgSend(v26, "timeIntervalSinceNow");
                v29 = fabs(v28);
                if (v29 > 7776000.0)
                {
                  v30 = p_superclass[238];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    v31 = (void *)MEMORY[0x1E0CB37E8];
                    v32 = v30;
                    objc_msgSend(v31, "numberWithDouble:", v29);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315906;
                    v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                    v57 = 2112;
                    v58 = v25;
                    v59 = 2112;
                    v60 = &unk_1E23E9F50;
                    v61 = 2112;
                    v62 = v33;
                    _os_log_impl(&dword_18BEBC000, v32, OS_LOG_TYPE_INFO, "%s Deleting item at path %@ as it has exceeded the expiration duration interval of %@ with an interval of %@", buf, 0x2Au);

                  }
                  -[INImageFilePersistence _deleteItemAtFilePath:](self, "_deleteItemAtFilePath:", v25);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v34)
                  {
                    v35 = INSiriLogContextIntents;
                    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                      v57 = 2112;
                      v58 = v25;
                      v59 = 2112;
                      v60 = v34;
                      _os_log_error_impl(&dword_18BEBC000, v35, OS_LOG_TYPE_ERROR, "%s Failed to delete file at path %@: %@", buf, 0x20u);
                    }
                  }

                  p_superclass = (__objc2_class **)(INCodableAttributeRelationship + 8);
                }
              }
              else
              {
                v39 = p_superclass[238];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
                  v57 = 2112;
                  v58 = v25;
                  _os_log_error_impl(&dword_18BEBC000, v39, OS_LOG_TYPE_ERROR, "%s Item %@ has no creation date", buf, 0x16u);
                }
              }

            }
          }
          else
          {
            v36 = p_superclass[238];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = v36;
              objc_msgSend(v19, "path");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v56 = "-[INImageFilePersistence purgeExpiredImagesInEphemeralStore:]";
              v57 = 2112;
              v58 = v38;
              v59 = 2112;
              v60 = v22;
              _os_log_error_impl(&dword_18BEBC000, v37, OS_LOG_TYPE_ERROR, "%s Attributes for path %@ could not be gathered: %@", buf, 0x20u);

            }
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v17);
    }

    v40 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLastEphemeralStorePurgingDate:", v41);

    v6 = v45;
  }

}

- (BOOL)canStoreImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    -[INImageFilePersistence _supportedClasses](self, "_supportedClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", objc_opt_class()))
    {
      objc_msgSend(v4, "_in_writeableFilePersistenceConfigurationForStoreType:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)_supportedClasses
{
  return self->__supportedClasses;
}

+ (NSDate)lastEphemeralStorePurgingDate
{
  return (NSDate *)(id)_lastEphemeralStorePurgingDate;
}

- (INImageFilePersistence)init
{
  INImageFilePersistence *v2;
  void *v3;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)INImageFilePersistence;
  v2 = -[INImageFilePersistence init](&v5, sel_init);
  if (v2)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[INImageFilePersistence _setSupportedClasses:](v2, "_setSupportedClasses:", v3);

  }
  return v2;
}

- (void)_setSupportedClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (void)setLastEphemeralStorePurgingDate:(id)a3
{
  objc_storeStrong((id *)&_lastEphemeralStorePurgingDate, a3);
}

- (void)purgeExpiredImagesInEphemeralStore
{
  -[INImageFilePersistence purgeExpiredImagesInEphemeralStore:](self, "purgeExpiredImagesInEphemeralStore:", 1);
}

- (id)filePathForImageWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[INImageFilePersistence _filePathForImageWithFileName:](self, "_filePathForImageWithFileName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[INImageFilePersistence filePathForImageWithIdentifier:error:]";
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Failed to retrieve file path for image: %@", buf, 0x16u);
      if (!a4)
        goto LABEL_6;
    }
    else if (!a4)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve image file path with identifier %@ from storage service %@"), v6, self, *MEMORY[0x1E0CB2D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6004, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return a4;
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  if (v7)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E2295770);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".."), &stru_1E2295770);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_INFO, "%s Attempting to retrieve image with identifier %@ using file persistence", buf, 0x16u);
    }
    -[INImageFilePersistence _filePathForImageWithFileName:](self, "_filePathForImageWithFileName:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v11, 1, &v34);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v34;
      if (v13)
      {
        v14 = v13;
        v15 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
          v37 = 2112;
          v38 = v14;
          v39 = 2112;
          v40 = v9;
          v41 = 2112;
          v42 = v11;
          _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Encountered error %@ when reading image data for identifier %@ at file path %@", buf, 0x2Au);
        }
        v16 = 0;
        v17 = 1;
      }
      else if (v12)
      {
        objc_msgSend(v9, "pathExtension");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("png"));

        if (v24)
        {
          +[INImage imageWithImageData:](INImage, "imageWithImageData:", v12);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v25 = _INImageSizeProviderClass();
          if (v25)
          {
            objc_msgSend(v25, "imageSizeForImage:", v22);
            objc_msgSend(v22, "_setImageSize:");
          }
          v16 = 0;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E0CB3710];
          v27 = (void *)MEMORY[0x1E0C99E60];
          +[INImage _classesInCluster](INImage, "_classesInCluster");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setWithArray:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          objc_msgSend(v26, "unarchivedObjectOfClasses:fromData:error:", v29, v12, &v33);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v33;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = v30;
          else
            v31 = 0;
          v22 = v31;
          if (v16)
          {
            v32 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v36 = "-[INImageFilePersistence retrieveImageWithIdentifier:completion:]";
              v37 = 2112;
              v38 = v16;
              v39 = 2112;
              v40 = v9;
              v41 = 2112;
              v42 = v11;
              _os_log_error_impl(&dword_18BEBC000, v32, OS_LOG_TYPE_ERROR, "%s Encountered error %@ when unarchiving image data for identifier %@ at file path %@", buf, 0x2Au);
            }
          }

        }
        v14 = 0;
        if (v22)
        {
          v21 = 0;
LABEL_18:
          v7[2](v7, v22, v21);

          goto LABEL_19;
        }
        v17 = 0;
      }
      else
      {
        v16 = 0;
        v17 = 0;
        v14 = 0;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v14 = 0;
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve image with identifier %@ from storage service %@"), v9, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, *MEMORY[0x1E0CB2D50]);

    if ((v17 & 1) != 0 || v16)
    {
      if (v17)
        v20 = v14;
      else
        v20 = v16;
      objc_msgSend(v18, "setObject:forKey:", v20, *MEMORY[0x1E0CB3388]);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6004, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    goto LABEL_18;
  }
  v9 = v6;
LABEL_19:

}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E2295770);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".."), &stru_1E2295770);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[INImageFilePersistence purgeImageWithIdentifier:completion:]";
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Attempting to purge image with identifier %@ from file persistence", (uint8_t *)&v12, 0x16u);
  }
  -[INImageFilePersistence _filePathForImageWithFileName:](self, "_filePathForImageWithFileName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImageFilePersistence _deleteItemAtFilePath:](self, "_deleteItemAtFilePath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v11);

}

- (id)_filePathForImageWithFileName:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v3;
  _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  v8 = v5;
  _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addObject:", v10);
  if (!objc_msgSend(v4, "count"))
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[INImageFilePersistence _filePathForImageWithFileName:]";
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s No possible file paths for image with file name %@", buf, 0x16u);
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v13)
  {
    v14 = v13;
    v23 = v7;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

        if (v19)
        {
          v21 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v29 = "-[INImageFilePersistence _filePathForImageWithFileName:]";
            v30 = 2112;
            v31 = v8;
            v32 = 2112;
            v33 = v17;
            _os_log_impl(&dword_18BEBC000, v21, OS_LOG_TYPE_INFO, "%s Found image data for file name %@ at file path %@", buf, 0x20u);
          }
          v20 = v17;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v14)
        continue;
      break;
    }
    v20 = 0;
LABEL_20:
    v7 = v23;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_deleteItemAtFilePath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v11);
  v6 = v11;

  if (v5)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[INImageFilePersistence _deleteItemAtFilePath:]";
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Successfully deleted image data at file path %@", buf, 0x16u);
    }
  }
  else if (!v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v13 = CFSTR("Could not find image");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6004, v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__supportedClasses, 0);
  objc_storeStrong((id *)&self->_imageBundle, 0);
}

@end
