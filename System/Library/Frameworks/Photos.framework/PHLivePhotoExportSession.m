@implementation PHLivePhotoExportSession

- (PHLivePhotoExportSession)initWithResourceFileURLs:(id)a3
{
  id v5;
  PHLivePhotoExportSession *v6;
  PHLivePhotoExportSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLivePhotoExportSession;
  v6 = -[PHLivePhotoExportSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileURLs, a3);

  return v7;
}

- (id)writeToFileURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  PHLivePhotoExportSessionOptions *v9;
  void (**v10)(id, id);
  id v11;
  BOOL v12;
  id v13;
  NSURL **p_imageURL;
  NSURL *v15;
  NSURL **p_videoURL;
  NSURL *v17;
  NSURL *v18;
  NSURL *v19;
  NSURL *v20;
  void *v21;
  int v22;
  NSURL *v23;
  NSURL *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v30;
  NSURL *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSURL *v51;
  void *v52;
  NSURL *v53;
  NSURL *v55;
  NSURL *obj;
  NSURL *v57;
  NSURL *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  NSURL *v64;
  NSURL *v65;
  void *v66;
  NSArray *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  NSURL *v73;
  NSURL *v74;
  id v75;
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (PHLivePhotoExportSessionOptions *)a4;
  v10 = (void (**)(id, id))a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v9)
    v9 = objc_alloc_init(PHLivePhotoExportSessionOptions);
  v75 = 0;
  v12 = -[PHLivePhotoExportSession _isOutputURLValid:withOptions:error:](self, "_isOutputURLValid:withOptions:error:", v8, v9, &v75);
  v13 = v75;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = self->_fileURLs;
    p_imageURL = &self->_imageURL;
    v15 = self->_imageURL;
    p_videoURL = &self->_videoURL;
    v17 = self->_videoURL;
    v18 = v17;
    if (v15 && v17)
    {
      v19 = v15;
      v20 = v17;
LABEL_20:
      if (*p_imageURL && *p_videoURL && !v13)
      {
        v29 = -[PHLivePhotoExportSessionOptions format](v9, "format");
        if (v29 == 1)
        {
          v63 = v11;
          v65 = v20;
          v58 = v19;
          v35 = (void *)MEMORY[0x1E0C99E98];
          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "UUIDString");
          v38 = v8;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL pathExtension](*p_imageURL, "pathExtension");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@.%@"), v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "fileURLWithPath:relativeToURL:", v41, v38);
          v42 = objc_claimAutoreleasedReturnValue();

          v60 = (void *)MEMORY[0x1E0C99E98];
          v43 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "UUIDString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL pathExtension](*p_videoURL, "pathExtension");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%@.%@"), v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v60;
          v61 = v38;
          objc_msgSend(v48, "fileURLWithPath:relativeToURL:", v47, v38);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = *p_imageURL;
          v34 = (void *)v42;
          v69 = 0;
          objc_msgSend(v50, "copyItemAtURL:toURL:error:", v51, v42, &v69);
          v13 = v69;

          if (!v13)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = *p_videoURL;
            v68 = 0;
            objc_msgSend(v52, "copyItemAtURL:toURL:error:", v53, v49, &v68);
            v13 = v68;

            if (!v13)
            {
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v42, CFSTR("PHLivePhotoExportSessionInfoPhotoURLKey"));
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v49, CFSTR("PHLivePhotoExportSessionInfoVideoURLKey"));
            }
          }

          v19 = v58;
          v8 = v61;
          v11 = v63;
          v20 = v65;
        }
        else
        {
          if (v29)
          {
            if (v10)
            {
              v21 = v66;
              objc_msgSend(v66, "setCompletedUnitCount:", 100);
              v13 = 0;
LABEL_34:
              v10[2](v10, v11);
LABEL_40:

              goto LABEL_41;
            }
            v13 = 0;
LABEL_39:
            v21 = v66;
            goto LABEL_40;
          }
          v30 = objc_alloc(MEMORY[0x1E0D75318]);
          -[NSURL path](*p_videoURL, "path");
          v31 = v20;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL path](*p_imageURL, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v30, "initWithPathToVideo:pathToImage:", v32, v33);

          v20 = v31;
          v70 = 0;
          objc_msgSend(v34, "writeToBundleAtURL:error:", v8, &v70);
          v13 = v70;
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("PHLivePhotoExportSessionInfoBundleURLKey"));
        }

      }
      if (v10)
      {
        v21 = v66;
        objc_msgSend(v66, "setCompletedUnitCount:", 100);
        if (v13)
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("PHLivePhotoExportSessionInfoErrorKey"));
        goto LABEL_34;
      }
      goto LABEL_39;
    }
    v59 = v8;
    v62 = v11;
    v73 = v17;
    v74 = v15;
    v72 = v13;
    v22 = objc_msgSend((id)objc_opt_class(), "_identifyResourceURLs:outImageURL:outVideoURL:error:", v67, &v74, &v73, &v72);
    obj = v74;
    v23 = v74;

    v24 = v73;
    v64 = v73;

    v25 = v72;
    if (v22)
    {
      v57 = v23;
      if (v23)
      {
        v55 = v24;
        v20 = v64;
        if (!v64)
        {
          v13 = v25;
          v19 = v23;
          v8 = v59;
          v11 = v62;
          goto LABEL_20;
        }
        v26 = (void *)objc_opt_class();
        v76[0] = v23;
        v76[1] = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v25;
        v28 = objc_msgSend(v26, "_canCreateLivePhotoWithURLs:outError:", v27, &v71);
        v13 = v71;

        v11 = v62;
        if (v28)
        {
          objc_storeStrong((id *)p_imageURL, obj);
          objc_storeStrong((id *)p_videoURL, v55);
        }
        v19 = v57;
        v8 = v59;
        goto LABEL_19;
      }
      v13 = v25;
      v19 = 0;
      v8 = v59;
    }
    else
    {
      v13 = v25;
      v8 = v59;
      v19 = v23;
    }
    v11 = v62;
LABEL_19:
    v20 = v64;
    goto LABEL_20;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("PHLivePhotoExportSessionInfoErrorKey"));
  if (v10)
    v10[2](v10, v11);
  v21 = 0;
LABEL_41:

  return v21;
}

- (BOOL)_isOutputURLValid:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  id v24;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "fileExistsAtPath:", v10) & 1) != 0)
    {
      v11 = objc_msgSend(v8, "format");

      if (v11 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("destination already exists: '%@'"), v7);
        goto LABEL_7;
      }
    }
    else
    {

    }
    v16 = objc_msgSend(v8, "format");
    if (v16 != 1)
    {
      if (!v16)
      {
        objc_msgSend(v7, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x1E0D75488];
        v19 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D75488]);

        if ((v19 & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v7, "pathExtension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "ph_genericErrorWithLocalizedDescription:", CFSTR("destination has extension '%@' but requires '%@'"), v21, v18);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (a5)
            *a5 = v22;

          goto LABEL_16;
        }
      }
LABEL_18:
      v15 = 1;
      goto LABEL_19;
    }
    if ((objc_msgSend(v7, "hasDirectoryPath") & 1) != 0)
      goto LABEL_18;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("destination is not directory, PHLivePhotoExportFormatResources requires a directory");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v24 = v7;
    v13 = CFSTR("destination is not a file url: '%@'");
  }
  objc_msgSend(v12, "ph_genericErrorWithLocalizedDescription:", v13, v24);
LABEL_7:
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_19;
  }
  v15 = 0;
  *a5 = v14;
LABEL_19:

  return v15;
}

- (NSArray)fileURLs
{
  return self->_fileURLs;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
}

+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6
{
  id v6;
  void (**v7)(void *, void *);
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__43106;
  v51 = __Block_byref_object_dispose__43107;
  v52 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PHLivePhotoExportSession__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke;
  aBlock[3] = &unk_1E35DF858;
  aBlock[4] = &v47;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (!v8)
  {

    v9 = 0;
    goto LABEL_28;
  }
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v43;
  v12 = *MEMORY[0x1E0D75488];
  v40 = *MEMORY[0x1E0CEC520];
  v39 = *MEMORY[0x1E0CEC568];
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
      objc_msgSend(v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v12);

      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v14);
        v18 = v17;
        if (v17)
        {
          v19 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v17, "imagePath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fileURLWithPath:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v18, "videoPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fileURLWithPath:", v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v24;
          v10 = (id)v21;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Bundle at url %@ is corrupted"), v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v23);
        }

      }
      else
      {
        v25 = (void *)MEMORY[0x1E0CEC3F8];
        objc_msgSend(v14, "pathExtension");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "typeWithFilenameExtension:", v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if (objc_msgSend(v18, "conformsToType:", v40))
          {
            if (v10)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Multiple image fileURLs"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, v27);

            }
            else
            {
              v10 = v14;
            }
          }
          else if (objc_msgSend(v18, "conformsToType:", v39))
          {
            if (v9)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Multiple video fileURLs"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, v28);

            }
            else
            {
              v9 = v14;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unknown type for fileURL %@"), v14);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v29);

          }
        }
      }

      ++v13;
    }
    while (v8 != v13);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    v8 = v30;
  }
  while (v30);

  if (!v10)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing image fileURL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v31);

    v10 = 0;
    if (v9)
      goto LABEL_30;
    goto LABEL_29;
  }
  if (v9)
    goto LABEL_30;
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing video fileURL"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v32);

LABEL_30:
  v33 = v48[5];
  if (v33)
  {
    v34 = (void *)v48[5];
    a5 = a6;
    if (!a6)
      goto LABEL_37;
    goto LABEL_36;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  v34 = v9;
  if (a5)
LABEL_36:
    *a5 = objc_retainAutorelease(v34);
LABEL_37:

  _Block_object_dispose(&v47, 8);
  return v33 == 0;
}

+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 outError:(id *)a4
{
  id v5;
  PHValidator *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v11;

  v5 = a3;
  v6 = objc_alloc_init(PHValidator);
  v11 = 0;
  v7 = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](v6, "validateURLs:withOptions:videoComplementMetadata:error:", v5, 66, 0, &v11);

  v8 = v11;
  v9 = v8;
  if (a4 && !v7)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

void __80__PHLivePhotoExportSession__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoKitGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Failed to export live photo: %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v5 + 40))
  {
    if (v3)
    {
      v6 = v3;
      v7 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
    }

  }
}

@end
