@implementation PHAssetResourceBag

- (PHAssetResourceBag)initWithAssetResources:(id)a3 assetCreationRequest:(id)a4
{
  id v7;
  id v8;
  PHAssetResourceBag *v9;
  PHAssetResourceBag *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAssetResourceBag;
  v9 = -[PHAssetResourceBag init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetResources, a3);
    objc_storeWeak((id *)&v10->_assetCreationRequest, v8);
  }

  return v10;
}

- (id)assetResourceWithType:(int64_t)a3
{
  NSArray *assetResources;
  uint64_t v5;
  _QWORD v7[5];

  assetResources = self->_assetResources;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PHAssetResourceBag_assetResourceWithType___block_invoke;
  v7[3] = &__block_descriptor_40_e40_B32__0__PHExternalAssetResource_8Q16_B24l;
  v7[4] = a3;
  v5 = -[NSArray indexOfObjectPassingTest:](assetResources, "indexOfObjectPassingTest:", v7);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_assetResources, "objectAtIndexedSubscript:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_extractValidatedImageURL:(id *)a3 imageData:(id *)a4 fromResource:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _PHPhotoLibraryValidator *v19;
  BOOL v20;
  id v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;

  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURL");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResourceBag.m"), 362, CFSTR("have both image data and url; can't tell which to validate"));

  }
  v18 = objc_msgSend(v13, "type");
  v19 = -[_PHPhotoLibraryValidator initWithPhotoLibrary:]([_PHPhotoLibraryValidator alloc], "initWithPhotoLibrary:", v14);

  if (!v15)
  {
    if (!v17)
      goto LABEL_22;
    v28 = 0;
    v22 = -[PHValidator validateURL:withOptions:error:](v19, "validateURL:withOptions:error:", v17, 4, &v28);
    v21 = v28;
    if (!v22)
      goto LABEL_15;
    v15 = 0;
LABEL_12:
    v23 = 1;
    if (!a3)
      goto LABEL_19;
LABEL_18:
    *a3 = objc_retainAutorelease(v17);
    goto LABEL_19;
  }
  if (v18 != 1 && v18 != 19)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    _PHAssetResourceTypeDescription(v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ph_errorWithCode:localizedDescription:", 3300, CFSTR("NSData unsupported for resource type %@; pass a url instead"),
      v25);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v29 = 0;
  v20 = -[PHValidator validateData:withOptions:error:](v19, "validateData:withOptions:error:", v15, 16, &v29);
  v21 = v29;
  if (v20)
    goto LABEL_12;
LABEL_15:

  if (v21)
  {
    if (a7)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Unable to obtain image url"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
LABEL_17:
    v21 = objc_retainAutorelease(v21);
    v23 = 0;
    v15 = 0;
    v17 = 0;
    *a7 = v21;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_23:
  v23 = 0;
  v15 = 0;
  v17 = 0;
  if (a3)
    goto LABEL_18;
LABEL_19:
  if (a4)
    *a4 = objc_retainAutorelease(v15);

  return v23;
}

- (BOOL)_extractValidatedVideoURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  _PHPhotoLibraryValidator *v13;
  _BOOL4 v14;
  id v15;
  id WeakRetained;
  char v17;
  id v18;
  BOOL v19;
  BOOL v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_PHPhotoLibraryValidator initWithPhotoLibrary:]([_PHPhotoLibraryValidator alloc], "initWithPhotoLibrary:", v11);

  if (v12)
  {
    v27 = 0;
    v14 = -[PHValidator validateURL:withOptions:error:](v13, "validateURL:withOptions:error:", v12, 8, &v27);
    v15 = v27;
    if (v14)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_assetCreationRequest);
      v26 = v15;
      v17 = objc_msgSend(WeakRetained, "validateReadAccessForContentURL:assetResource:error:", v12, v10, &v26);
      v18 = v26;

      if ((v17 & 1) != 0)
      {
        v25 = v18;
        v19 = -[PHValidator validateURL:withOptions:error:](v13, "validateURL:withOptions:error:", v12, 32, &v25);
        v15 = v25;

        if (v19)
        {
          v20 = 1;
          if (!a3)
            goto LABEL_16;
          goto LABEL_15;
        }
      }
      else
      {
        v15 = v18;
      }
    }
  }
  else
  {
    objc_msgSend(v10, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = CFSTR("NSData unsupported for video; pass a url instead");
      v23 = 3300;
    }
    else
    {
      v22 = CFSTR("Missing required video url");
      v23 = 3303;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", v23, v22);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v15)
  {
    if (a6)
      goto LABEL_14;
LABEL_18:
    v20 = 0;
    v12 = 0;
    if (!a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unable to obtain video url"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6)
    goto LABEL_18;
LABEL_14:
  v15 = objc_retainAutorelease(v15);
  v20 = 0;
  v12 = 0;
  *a6 = v15;
  if (a3)
LABEL_15:
    *a3 = objc_retainAutorelease(v12);
LABEL_16:

  return v20;
}

- (BOOL)_extractValidatedAudioURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a4;
  objc_msgSend(v8, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0D719A8];
    objc_msgSend(v9, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v11, "isAudioFileExtension:", v12);

    if ((v11 & 1) != 0)
    {
      v13 = 0;
      v14 = 1;
      if (!a3)
        goto LABEL_14;
      goto LABEL_13;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v10, "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unsupported audio file extension: %@"), v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = CFSTR("NSData unsupported for audio; pass a url instead");
      v17 = 3300;
    }
    else
    {
      v16 = CFSTR("Missing required audio file url");
      v17 = 3303;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", v17, v16);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v13)
  {
    if (a6)
      goto LABEL_12;
LABEL_16:
    v14 = 0;
    v10 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unable to obtain audio url"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6)
    goto LABEL_16;
LABEL_12:
  v13 = objc_retainAutorelease(v13);
  v14 = 0;
  v10 = 0;
  *a6 = v13;
  if (a3)
LABEL_13:
    *a3 = objc_retainAutorelease(v10);
LABEL_14:

  return v14;
}

- (BOOL)_extractValidatedAdjustmentsURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;

  v8 = a4;
  objc_msgSend(v8, "fileURL");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithURL:", v9);

    if (v11)
    {
      v12 = 0;
      v13 = 1;
      if (!a3)
        goto LABEL_13;
      goto LABEL_12;
    }

  }
  else
  {
    objc_msgSend(v8, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = CFSTR("NSData unsupported for adjustments; pass a url instead");
      v16 = 3300;
    }
    else
    {
      v15 = CFSTR("Missing required adjustment data file url");
      v16 = 3303;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", v16, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (!a6)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unable to obtain adjustment data"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6)
  {
LABEL_15:
    v13 = 0;
    v10 = 0;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_11:
  v12 = objc_retainAutorelease(v12);
  v13 = 0;
  v10 = 0;
  *a6 = v12;
  if (a3)
LABEL_12:
    *a3 = objc_retainAutorelease(v10);
LABEL_13:

  return v13;
}

- (id)_validateAssetResourceForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  PHAssetResourceValidatedContext *v31;
  id *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "type");
  v10 = v9;
  switch(v9)
  {
    case 1:
    case 4:
    case 5:
    case 8:
    case 13:
    case 19:
      v51 = 0;
      v52 = 0;
      v50 = 0;
      v11 = -[PHAssetResourceBag _extractValidatedImageURL:imageData:fromResource:photoLibrary:error:](self, "_extractValidatedImageURL:imageData:fromResource:photoLibrary:error:", &v52, &v51, v7, v8, &v50);
      v12 = (uint64_t)v52;
      v15 = (uint64_t)v51;
      v14 = v50;
      break;
    case 2:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
      v48 = 0;
      v49 = 0;
      v11 = -[PHAssetResourceBag _extractValidatedVideoURL:fromResource:photoLibrary:error:](self, "_extractValidatedVideoURL:fromResource:photoLibrary:error:", &v49, v7, v8, &v48);
      v12 = (uint64_t)v49;
      v13 = v48;
      goto LABEL_3;
    case 3:
      v46 = 0;
      v47 = 0;
      v11 = -[PHAssetResourceBag _extractValidatedAudioURL:fromResource:photoLibrary:error:](self, "_extractValidatedAudioURL:fromResource:photoLibrary:error:", &v47, v7, v8, &v46);
      v12 = (uint64_t)v47;
      v13 = v46;
      goto LABEL_3;
    case 7:
    case 16:
      v44 = 0;
      v45 = 0;
      v11 = -[PHAssetResourceBag _extractValidatedAdjustmentsURL:fromResource:photoLibrary:error:](self, "_extractValidatedAdjustmentsURL:fromResource:photoLibrary:error:", &v45, v7, v8, &v44);
      v12 = (uint64_t)v45;
      v13 = v44;
LABEL_3:
      v14 = v13;
      v15 = 0;
      break;
    case 17:
    case 18:
LABEL_7:
      objc_msgSend(v7, "fileURL");
      v12 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v14 = 0;
      v16 = v12 == 0;
LABEL_8:
      v11 = !v16;
      break;
    default:
      v11 = 0;
      v15 = 0;
      v12 = 0;
      v14 = 0;
      switch(v9)
      {
        case 'k':
        case 'o':
          objc_msgSend(v7, "fileURL");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "data");
          v15 = objc_claimAutoreleasedReturnValue();
          v14 = 0;
          v16 = (v12 | v15) == 0;
          goto LABEL_8;
        case 'l':
        case 'n':
          goto LABEL_7;
        case 'm':
          goto LABEL_11;
        default:
          v12 = 0;
          v14 = 0;
          break;
      }
      break;
  }
LABEL_11:
  objc_msgSend(v7, "creationOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniformTypeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)v12;
  if (v11 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PHUniformTypeConformsToResourceType(v19, v10);

    if ((v20 & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      _PHAssetResourceTypeDescription(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Invalid uti '%@' specified for resource type %@"), v18, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v14 = (id)v23;
    }
  }
  -[PHAssetResourceBag assetCreationRequest](self, "assetCreationRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "helper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clientAuthorization");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isCameraClient");

  if ((v27 & 1) != 0)
  {
    if (!v11)
      goto LABEL_25;
LABEL_24:
    v30 = v42;
    v31 = -[PHAssetResourceValidatedContext initWithResource:validatedURL:validatedData:]([PHAssetResourceValidatedContext alloc], "initWithResource:validatedURL:validatedData:", v7, v42, v15);
    goto LABEL_31;
  }
  if (!v11)
  {
LABEL_25:
    v32 = a5;
    goto LABEL_26;
  }
  objc_msgSend(v7, "creationOptions");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "shouldMoveFile") & 1) != 0)
  {
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(v7, "creationOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "shouldIngestInPlace") & 1) != 0)
    goto LABEL_22;
  objc_msgSend(v7, "fileURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    goto LABEL_24;
  v35 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v7, "fileURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "libraryURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v35, "hasDiskSpaceToCopyFileAtURL:toVolumeAtURL:error:", v36, v38, &v43);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v43;

  if (!v29)
  {
    PLPhotoKitGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v7;
      v55 = 2112;
      v56 = v28;
      _os_log_impl(&dword_1991EC000, v40, OS_LOG_TYPE_ERROR, "Failed to determine available space for copying asset resource %@: %@", buf, 0x16u);
    }

    v29 = 0;
    goto LABEL_22;
  }
  v32 = a5;
  if ((objc_msgSend(v29, "BOOLValue") & 1) != 0)
  {
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3305, CFSTR("Not enough space to copy resources"));
  v39 = objc_claimAutoreleasedReturnValue();

  v14 = (id)v39;
LABEL_26:
  v30 = v42;
  if (v32)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unknown error: Unable to validate resource"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_retainAutorelease(v14);
    v31 = 0;
    *v32 = v14;
  }
  else
  {
    v31 = 0;
  }
LABEL_31:

  return v31;
}

- (BOOL)_validateAssetResourcesForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  PHExternalAssetResource *v26;
  PHExternalAssetResource *primaryResource;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  SEL v37;
  id *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "valueForKey:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  -[PHAssetResourceBag assetCreationRequest](self, "assetCreationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend((id)v12, "_supportsAssetResourceTypes:mediaType:mediaSubtype:importedBy:", v11, &self->_mediaType, &self->_mediaSubtype, (__int16)objc_msgSend(v13, "importedBy"));

  if ((v12 & 1) != 0)
  {
    v37 = a2;
    v38 = a5;
    v39 = v11;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v40 = v9;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v43;
LABEL_4:
      v20 = 0;
      v21 = v18;
      while (1)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v15);
        v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v20);
        v41 = v21;
        -[PHAssetResourceBag _validateAssetResourceForAssetCreation:photoLibrary:error:](self, "_validateAssetResourceForAssetCreation:photoLibrary:error:", v22, v10, &v41);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v41;

        if (!v23)
          break;
        objc_msgSend(v14, "addObject:", v23);

        ++v20;
        v21 = v18;
        if (v17 == v20)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_18;
        }
      }

      v11 = v39;
      v9 = v40;
      a5 = v38;
      if (v38)
        goto LABEL_12;
      goto LABEL_16;
    }
    v18 = 0;
LABEL_18:

    v25 = objc_msgSend(v14, "count");
    if (v25 != -[NSArray count](self->_assetResources, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("PHAssetResourceBag.m"), 594, CFSTR("expect 1-to-1 resource to validation context"));

    }
    objc_storeStrong((id *)&self->_assetResourceContexts, v14);
    objc_msgSend((id)objc_opt_class(), "_primaryAssetResource:", v14);
    v26 = (PHExternalAssetResource *)objc_claimAutoreleasedReturnValue();
    primaryResource = self->_primaryResource;
    self->_primaryResource = v26;

    -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v39;
    if (v28)
    {
      self->_hasCurrentAdjustment = 1;
    }
    else
    {
      -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        self->_hasCurrentAdjustment = 1;
      }
      else
      {
        -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 107);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        self->_hasCurrentAdjustment = v30 != 0;

      }
    }

    -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasOriginalAdjustment = v31 != 0;

    -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasRAW = v32 != 0;

    -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      self->_hasSpatialOverCapture = 1;
    }
    else
    {
      -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasSpatialOverCapture = v34 != 0;

    }
    v24 = 1;
    v9 = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("No known asset format supports this resource combination"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a5)
    {
LABEL_16:
      v24 = 0;
      goto LABEL_30;
    }
LABEL_12:
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Unknown error: Unable to validate resource"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_retainAutorelease(v18);
    v24 = 0;
    *a5 = v18;
  }
LABEL_30:

  return v24;
}

- (BOOL)hasAdjustments
{
  BOOL v2;
  void *v4;

  if (self->_hasCurrentAdjustment || self->_hasOriginalAdjustment)
    return 1;
  -[PHAssetResourceBag assetResourceWithType:](self, "assetResourceWithType:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

- (BOOL)validateForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  BOOL *p_valid;
  _BOOL4 valid;
  id v11;
  NSArray *assetResources;
  BOOL v13;
  BOOL v14;
  id v16;

  v6 = a3;
  if (self->_didValidateForInsertion)
  {
    v7 = 0;
    valid = self->_valid;
    p_valid = &self->_valid;
    v8 = valid;
    if (a4 && !v8)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Previous validation failed"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v11;

      v7 = 0;
    }
  }
  else
  {
    assetResources = self->_assetResources;
    v16 = 0;
    v13 = -[PHAssetResourceBag _validateAssetResourcesForAssetCreation:photoLibrary:error:](self, "_validateAssetResourcesForAssetCreation:photoLibrary:error:", assetResources, v6, &v16);
    v7 = v16;
    self->_valid = v13;
    p_valid = &self->_valid;
    *(p_valid - 1) = 1;
    if (a4 && !v13)
    {
      if (v7)
      {
        v7 = objc_retainAutorelease(v7);
        *a4 = v7;
        goto LABEL_9;
      }
      goto LABEL_4;
    }
  }
LABEL_9:
  v14 = *p_valid;

  return v14;
}

- (id)_validatedContextForResource:(id)a3
{
  id v4;
  NSArray *assetResourceContexts;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  assetResourceContexts = self->_assetResourceContexts;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PHAssetResourceBag__validatedContextForResource___block_invoke;
  v10[3] = &unk_1E35DED78;
  v6 = v4;
  v11 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](assetResourceContexts, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_assetResourceContexts, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)validatedURLForAssetResource:(id)a3
{
  void *v3;
  void *v4;

  -[PHAssetResourceBag _validatedContextForResource:](self, "_validatedContextForResource:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validatedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)validatedDataForAssetResource:(id)a3
{
  void *v3;
  void *v4;

  -[PHAssetResourceBag _validatedContextForResource:](self, "_validatedContextForResource:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validatedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHAssetCreationRequest)assetCreationRequest
{
  return (PHAssetCreationRequest *)objc_loadWeakRetained((id *)&self->_assetCreationRequest);
}

- (NSArray)assetResources
{
  return self->_assetResources;
}

- (BOOL)didValidateForInsertion
{
  return self->_didValidateForInsertion;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)hasCurrentAdjustment
{
  return self->_hasCurrentAdjustment;
}

- (BOOL)hasOriginalAdjustment
{
  return self->_hasOriginalAdjustment;
}

- (BOOL)hasRAW
{
  return self->_hasRAW;
}

- (BOOL)hasSpatialOverCapture
{
  return self->_hasSpatialOverCapture;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtype
{
  return self->_mediaSubtype;
}

- (PHExternalAssetResource)primaryResource
{
  return self->_primaryResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResource, 0);
  objc_storeStrong((id *)&self->_assetResources, 0);
  objc_destroyWeak((id *)&self->_assetCreationRequest);
  objc_storeStrong((id *)&self->_assetResourceContexts, 0);
}

BOOL __51__PHAssetResourceBag__validatedContextForResource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __44__PHAssetResourceBag_assetResourceWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)_supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 mediaSubtype:(unint64_t *)a5 importedBy:(signed __int16)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v22;
  _BOOL4 v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  BOOL v33;
  int v34;
  int v35;
  int v36;
  _BOOL4 v37;
  int v38;
  char v39;
  char v40;
  int v41;
  BOOL v42;
  char v43;
  uint64_t v44;
  char v45;
  int v46;
  BOOL v47;
  int v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char valid;
  int v54;
  BOOL v55;
  int v57;
  BOOL v58;
  char v59;
  char v60;
  char v61;
  char v62;
  BOOL v63;
  char v64;
  BOOL v65;
  int v66;
  int64_t *v67;
  unint64_t *v68;
  int v69;
  _BOOL4 v70;
  uint64_t v71;
  int v72;
  int v73;
  _BOOL4 v74;
  char v75;
  int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v9 = a3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v82 != v13)
          objc_enumerationMutation(v9);
        v15 = 1 << objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "unsignedIntegerValue");
        if ((v15 & v12) != 0)
        {

          goto LABEL_141;
        }
        v12 |= v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v67 = a4;
  v68 = a5;

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (!v17)
  {
    v19 = 0;
    v71 = 0;
LABEL_144:

    if (v67)
      *v67 = v19;
    if (v68)
      *v68 = v71;
    v55 = 1;
    goto LABEL_142;
  }
  v18 = v17;
  v19 = 0;
  v71 = 0;
  v20 = a6 & 0xFFFE;
  v21 = (v12 & 2) == 0;
  v22 = v12 & 0x45044;
  v23 = (v12 & 4) == 0;
  v24 = v12 & 0x2AE0A;
  if ((v12 & 0x2AE0A) == 0x2AE0A)
    v23 = 1;
  v25 = v24 != 175626;
  v26 = v24 == 175626 || (v12 & 0x4004) != 16388;
  v27 = (v12 & 0x2AE0A) != 0x2AE0A && (v12 & 0x4004) == 16388;
  v65 = v27;
  v28 = (v12 & 0x2AE0A) != 0x2AE0A && (~v12 & 0x84) == 0;
  v29 = v22 == 282692;
  if (v22 == 282692)
    v21 = 1;
  v30 = v22 != 282692;
  v31 = v22 != 282692 && (~v12 & 0x12) == 0;
  v32 = !v29 && (v12 & 0x2002) == 8194;
  v70 = v32;
  v33 = v29 || (v12 & 0x2002) != 8194;
  v34 = v30 & (v12 >> 1);
  v35 = v12 & 0xC4;
  if ((~v12 & 0xEE00) == 0)
    v31 = 0;
  v74 = v31;
  v36 = v35 == 196 || v26;
  v69 = v36;
  v37 = v35 != 196 && (v12 & 0x4004) == 16388;
  v38 = v12 & 0x18;
  v39 = (v12 & 0x200) == 0 || v33;
  v76 = v12 & 0x18;
  if (v38 == 24)
    v40 = 1;
  else
    v40 = v39;
  if (v38 == 24)
    LOBYTE(v41) = 0;
  else
    v41 = v30 & (v12 >> 1);
  v59 = v41;
  v42 = (v12 & 0x8202) == 0x202 && v21;
  v63 = v42;
  v64 = v40;
  v43 = a6 != 5 || v21;
  v62 = v43;
  v66 = a6 & 0xFFFE;
  v44 = *(_QWORD *)v78;
  v45 = v20 != 4 || v23;
  if (v20 != 4)
    v21 = 1;
  v46 = v25 & (v12 >> 2);
  if ((~v12 & 0x30080) == 0)
    v45 = 1;
  v61 = v45;
  v47 = (v12 & 0x80002) != 0 && v30;
  v73 = v30 & (v12 >> 19);
  v72 = *(_DWORD *)&v28 & ((v12 & 0x40) >> 6);
  v48 = v23 || v37;
  v49 = (~v12 & 0xFE44) == 0 || v21;
  v60 = v49;
  v58 = v47;
  v75 = v47 | v46;
  v57 = v48 ^ 1;
  while (2)
  {
    v50 = 0;
LABEL_73:
    if (*(_QWORD *)v78 != v44)
      objc_enumerationMutation(v16);
    v51 = objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v50), "integerValue");
    switch(v51)
    {
      case 1:
        if ((v34 & 1) != 0)
          goto LABEL_124;
        goto LABEL_140;
      case 2:
        if ((v46 & 1) == 0)
          goto LABEL_140;
        v19 = 2;
        goto LABEL_137;
      case 3:
        if ((v60 & 1) != 0)
          goto LABEL_140;
        if (!v19)
          v19 = 3;
        goto LABEL_137;
      case 4:
        if (!v74)
          goto LABEL_140;
        goto LABEL_137;
      case 5:
        valid = hasValidFullSizePhoto(v12);
        goto LABEL_117;
      case 6:
      case 12:
        if ((v72 & 1) == 0)
          goto LABEL_140;
        goto LABEL_137;
      case 7:
        if (v66 == 4)
        {
          if (!(v34 | v46))
            goto LABEL_140;
LABEL_130:
          if (v70)
          {
            if ((hasValidFullSizePhoto(v12) & v69 & 1) == 0)
              goto LABEL_140;
          }
          else if ((v69 & 1) == 0)
          {
            goto LABEL_140;
          }
LABEL_137:
          if (v18 == ++v50)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
            if (!v18)
              goto LABEL_144;
            continue;
          }
          goto LABEL_73;
        }
        if (v58 || ((hasValidFullSizePhoto(v12) | v57) & 1) != 0)
          goto LABEL_137;
LABEL_140:

LABEL_141:
        v55 = 0;
LABEL_142:

        return v55;
      case 8:
        goto LABEL_116;
      case 9:
        if ((v73 & 1) != 0)
        {
          if (v76 == 24)
            goto LABEL_140;
        }
        else if ((v59 & 1) == 0)
        {
          goto LABEL_140;
        }
        v71 = 8;
        goto LABEL_137;
      case 10:
        v54 = hasValidFullSizePhoto(v12);
        goto LABEL_106;
      case 11:
        v54 = hasValidFullSizePhoto(v12);
        if ((v12 & 0x100) == 0)
          goto LABEL_140;
LABEL_106:
        if (!v54 || v76 == 24)
          goto LABEL_140;
        goto LABEL_137;
      case 13:
        if (v63)
          goto LABEL_140;
        goto LABEL_137;
      case 14:
        if (!v65)
          goto LABEL_140;
        goto LABEL_137;
      case 15:
        if ((v64 & 1) != 0)
          goto LABEL_140;
        goto LABEL_137;
      case 16:
        if (!v74)
          goto LABEL_137;
LABEL_116:
        valid = hasValidFullSizePhoto(v12);
        if ((v12 & 0x100) == 0)
          goto LABEL_140;
LABEL_117:
        if ((valid & 1) == 0)
          goto LABEL_140;
        goto LABEL_137;
      case 17:
        if ((v62 & 1) != 0)
          goto LABEL_140;
        goto LABEL_137;
      case 18:
        if ((v61 & 1) != 0)
          goto LABEL_140;
        goto LABEL_137;
      case 19:
        if ((v73 & 1) == 0)
          goto LABEL_140;
LABEL_124:
        v19 = 1;
        goto LABEL_137;
      case 20:
        goto LABEL_140;
      default:
        v52 = v51 - 107;
        if ((unint64_t)(v51 - 107) > 7)
          goto LABEL_137;
        if (((1 << v52) & 0x11) != 0)
        {
          if ((v75 & 1) == 0)
            goto LABEL_140;
          goto LABEL_137;
        }
        if (v51 != 110)
        {
          if (((1 << v52) & 0xA4) != 0)
            goto LABEL_140;
          goto LABEL_137;
        }
        if ((v34 & 1) != 0)
        {
          if ((v12 & 0x80) == 0)
            goto LABEL_140;
        }
        else if ((v46 & ((v12 & 0x80) >> 7)) == 0)
        {
          goto LABEL_140;
        }
        goto LABEL_130;
    }
  }
}

+ (BOOL)supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 importedBy:(signed __int16)a5
{
  return objc_msgSend(a1, "_supportsAssetResourceTypes:mediaType:mediaSubtype:importedBy:", a3, a4, 0, a5);
}

+ (id)_primaryAssetResource:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v4)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_20;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "resource", (_QWORD)v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "type");
      v12 = v11;
      if ((unint64_t)(v11 - 1) < 2)
        goto LABEL_9;
      if (v11 == 3)
      {

        v6 = v10;
        continue;
      }
      if (v11 == 19)
      {
LABEL_9:
        v13 = v10;

        v7 = v13;
      }

      if (v12 <= 0x13 && ((1 << v12) & 0x80006) != 0)
        goto LABEL_20;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v5);
LABEL_20:

  if (v7)
    v15 = v7;
  else
    v15 = v6;
  v16 = v15;

  return v16;
}

@end
