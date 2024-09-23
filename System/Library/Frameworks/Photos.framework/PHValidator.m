@implementation PHValidator

+ (unsigned)mediaTypeForContentType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(MEMORY[0x1E0D752F0], "supportedImageTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)))
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(MEMORY[0x1E0D752F0], "imageTypesUnsupportedForImport");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v33;
              while (2)
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v33 != v21)
                    objc_enumerationMutation(v18);
                  if ((objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j)) & 1) != 0)
                  {
                    v17 = 1;
                    goto LABEL_38;
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
                if (v20)
                  continue;
                break;
              }
            }
            v17 = 2;
LABEL_38:

            goto LABEL_41;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (v6)
          continue;
        break;
      }
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(MEMORY[0x1E0D752F0], "supportedMovieTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (k = 0; k != v10; ++k)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k)) & 1) != 0)
          {
            v17 = 16;
            goto LABEL_41;
          }
        }
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        if (v10)
          continue;
        break;
      }
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(MEMORY[0x1E0D752F0], "supportedAudioTypes", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (m = 0; m != v14; ++m)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(v3, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * m)) & 1) != 0)
          {
            v17 = 4;
            goto LABEL_41;
          }
        }
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_41:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (unsigned)mediaTypeForURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  char v12;
  char v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeForURL:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "mediaTypeForContentType:", v5);
    if (v6 == 4)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v4, 0);
      v11 = objc_msgSend(v8, "isPlayable") == 0;
      v12 = 4;
      v13 = 8;
    }
    else
    {
      v7 = v6;
      if (v6 != 16)
      {
LABEL_11:

        goto LABEL_12;
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v4, 0);
      objc_msgSend(MEMORY[0x1E0D75130], "mainVideoTrackForAsset:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isDecodable");

      v11 = v10 == 0;
      v12 = 16;
      v13 = 32;
    }
    if (v11)
      v7 = v12;
    else
      v7 = v13;

    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (BOOL)isSupportedAudioAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supportedAudioTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filenameExtension:conformsToOneOfTypes:", v4, v5);

  return (char)v3;
}

+ (BOOL)isSupportedMovieAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supportedMovieTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filenameExtension:conformsToOneOfTypes:", v4, v5);

  return (char)v3;
}

+ (BOOL)isSupportedImageAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(a3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "supportedImageTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filenameExtension:conformsToOneOfTypes:", v4, v5);

  return (char)v3;
}

- (BOOL)validateURL:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](self, "validateURLs:withOptions:videoComplementMetadata:error:", v10, a4, 0, a5, v12, v13);
  return (char)a5;
}

- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  return -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](self, "validateURLs:withOptions:videoComplementMetadata:error:", a3, a4, 0, a5);
}

- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  _PHValidation *v13;
  uint64_t v14;
  id v15;
  _PHValidation *v16;
  id v17;
  _PHValidation *v18;
  id v19;
  _PHValidation *v20;
  id v21;
  _PHValidation *v22;
  id v23;
  _PHValidation *v24;
  id v25;
  _PHValidation *v26;
  _PHValidation *v27;
  id v28;
  id v29;
  BOOL v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  PHValidator *v36;
  id v37;
  id v38;
  _PHValidation *v39;
  _QWORD v40[4];
  id v41;
  PHValidator *v42;
  _PHValidation *v43;
  _QWORD v44[4];
  id v45;
  PHValidator *v46;
  _PHValidation *v47;
  _QWORD v48[4];
  id v49;
  _PHValidation *v50;
  PHValidator *v51;
  _QWORD v52[4];
  id v53;
  _PHValidation *v54;
  PHValidator *v55;
  _QWORD v56[4];
  id v57;
  _PHValidation *v58;
  _QWORD v59[4];
  id v60;
  _PHValidation *v61;

  v10 = a3;
  v11 = a5;
  v12 = a4 | 2;
  if ((a4 & 0x70) == 0)
    v12 = a4;
  v13 = -[_PHValidation initWithOptions:]([_PHValidation alloc], "initWithOptions:", (v12 >> 1) & 1 | v12);
  v14 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke;
  v59[3] = &unk_1E35DF9E8;
  v15 = v10;
  v60 = v15;
  v16 = v13;
  v61 = v16;
  -[_PHValidation validateOption:usingBlock:](v16, "validateOption:usingBlock:", 1, v59);
  v56[0] = v14;
  v56[1] = 3221225472;
  v56[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_2;
  v56[3] = &unk_1E35DF9E8;
  v17 = v15;
  v57 = v17;
  v18 = v16;
  v58 = v18;
  -[_PHValidation validateOption:usingBlock:](v18, "validateOption:usingBlock:", 2, v56);
  v52[0] = v14;
  v52[1] = 3221225472;
  v52[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_3;
  v52[3] = &unk_1E35DFAF8;
  v19 = v17;
  v53 = v19;
  v20 = v18;
  v54 = v20;
  v55 = self;
  -[_PHValidation validateOption:usingBlock:](v20, "validateOption:usingBlock:", 4, v52);
  v48[0] = v14;
  v48[1] = 3221225472;
  v48[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_4;
  v48[3] = &unk_1E35DFAF8;
  v21 = v19;
  v49 = v21;
  v22 = v20;
  v50 = v22;
  v51 = self;
  -[_PHValidation validateOption:usingBlock:](v22, "validateOption:usingBlock:", 8, v48);
  v44[0] = v14;
  v44[1] = 3221225472;
  v44[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_5;
  v44[3] = &unk_1E35DFAF8;
  v23 = v21;
  v45 = v23;
  v46 = self;
  v24 = v22;
  v47 = v24;
  -[_PHValidation validateOption:usingBlock:](v24, "validateOption:usingBlock:", 16, v44);
  v40[0] = v14;
  v40[1] = 3221225472;
  v40[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_6;
  v40[3] = &unk_1E35DFAF8;
  v25 = v23;
  v41 = v25;
  v42 = self;
  v26 = v24;
  v43 = v26;
  -[_PHValidation validateOption:usingBlock:](v26, "validateOption:usingBlock:", 32, v40);
  v32 = v14;
  v33 = 3221225472;
  v34 = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_7;
  v35 = &unk_1E35DE750;
  v36 = self;
  v37 = v25;
  v38 = v11;
  v39 = v26;
  v27 = v26;
  v28 = v11;
  v29 = v25;
  -[_PHValidation validateOption:usingBlock:](v27, "validateOption:usingBlock:", 64, &v32);
  v30 = -[_PHValidation isValid:](v27, "isValid:", a6, v32, v33, v34, v35, v36);

  return v30;
}

- (BOOL)validateData:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  id v8;
  _PHValidation *v9;
  _PHValidation *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PHValidator *v15;
  _PHValidation *v16;

  v8 = a3;
  v9 = -[_PHValidation initWithOptions:]([_PHValidation alloc], "initWithOptions:", a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PHValidator_validateData_withOptions_error___block_invoke;
  v13[3] = &unk_1E35DFAF8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[_PHValidation validateOption:usingBlock:](v10, "validateOption:usingBlock:", 16, v13);
  LOBYTE(a5) = -[_PHValidation isValid:](v10, "isValid:", a5);

  return (char)a5;
}

- (BOOL)isValidImagePathExtension:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D752F0];
  v4 = a3;
  objc_msgSend(v3, "supportedImageTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filenameExtension:conformsToOneOfTypes:", v4, v5);

  return (char)v3;
}

- (BOOL)isValidVideoPathExtension:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D752F0];
  v4 = a3;
  objc_msgSend(v3, "supportedMovieTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "filenameExtension:conformsToOneOfTypes:", v4, v5);

  return (char)v3;
}

- (BOOL)_validateImageSource:(CGImageSource *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", CGImageSourceGetType(a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
    {
      if (CGImageSourceGetCount(a3))
      {
        v7 = 0;
        v8 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Empty image source"), v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Invalidate image type (%@)"), v6);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
LABEL_10:

    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing image source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (!v8)
    *a4 = objc_retainAutorelease(v7);
LABEL_13:

  return v8;
}

- (BOOL)_validateVideoURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  int v20;
  int v21;
  BOOL v22;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (v5)
  {
    v6 = (void *)MEMORY[0x19AEBEADC]();
    v7 = (void *)MEMORY[0x1E0D719A8];
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "canSaveVideoToLibrary:", v8);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = dispatch_semaphore_create(0);
      v12 = (void *)MEMORY[0x1E0C8AFC0];
      v13 = *MEMORY[0x1E0C89E30];
      v14 = *MEMORY[0x1E0C8A2E0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __39__PHValidator__validateVideoURL_error___block_invoke;
      v24[3] = &unk_1E35DE778;
      v26 = &v27;
      v15 = v11;
      v25 = v15;
      objc_msgSend(v12, "determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:", v13, v10, v14, v24);
      v16 = dispatch_time(0, 20000000000);
      v17 = dispatch_semaphore_wait(v15, v16) != 0;

    }
    else
    {
      v17 = 0;
    }
    if (*((_BYTE *)v28 + 24))
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Incompatible video"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *((unsigned __int8 *)v28 + 24);
        *(_DWORD *)buf = 138413058;
        v32 = v5;
        v33 = 1024;
        v34 = v9;
        v35 = 1024;
        v36 = v20;
        v37 = 1024;
        v38 = v17;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Incompatible video %@ (compatible=%d, valid=%d, timeout=%d)", buf, 0x1Eu);
      }

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing video URL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((_BYTE *)v28 + 24))
  {
    *a4 = objc_retainAutorelease(v18);
    v21 = *((unsigned __int8 *)v28 + 24);
  }
  v22 = v21 != 0;

  _Block_object_dispose(&v27, 8);
  return v22;
}

- (BOOL)_validateLivePhotoResourceURLs:(id)a3 videoComplementMetadata:(id)a4 error:(id *)a5
{
  id v8;
  void (**v9)(void *, uint64_t, const __CFString *, _QWORD);
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  int v31;
  id v32;
  void *v33;
  BOOL v34;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[8];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__38695;
  v58 = __Block_byref_object_dispose__38696;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PHValidator__validateLivePhotoResourceURLs_videoComplementMetadata_error___block_invoke;
  aBlock[3] = &unk_1E35DE7A0;
  aBlock[4] = self;
  aBlock[5] = &v50;
  aBlock[6] = &v54;
  aBlock[7] = a2;
  v9 = (void (**)(void *, uint64_t, const __CFString *, _QWORD))_Block_copy(aBlock);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
  if (!v11)
  {

    v12 = 0;
    goto LABEL_21;
  }
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v46 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v16, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PHValidator isValidImagePathExtension:](self, "isValidImagePathExtension:", v17))
      {
        if (v13)
        {
          v19 = CFSTR("Multiple image resources");
LABEL_19:
          v9[2](v9, 3302, v19, 0);

          goto LABEL_20;
        }
        v13 = v16;
      }
      else
      {
        if (!-[PHValidator isValidVideoPathExtension:](self, "isValidVideoPathExtension:", v17))
          goto LABEL_13;
        if (v12)
        {
          v19 = CFSTR("Multiple video resources");
          goto LABEL_19;
        }
        v12 = v16;
      }
      v18 = v16;
LABEL_13:

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    if (v11)
      continue;
    break;
  }
LABEL_20:

  if (!v13)
  {
LABEL_21:
    v9[2](v9, 3303, CFSTR("Missing image resource"), 0);
    v13 = 0;
  }
  if (!v12)
    v9[2](v9, 3303, CFSTR("Missing video resource"), 0);
  v20 = (void *)v55[5];
  if (!v20)
  {
    v44 = 0;
    -[PHValidator getLivePhotoImageMetadataFromURL:pairingIdentifier:](self, "getLivePhotoImageMetadataFromURL:pairingIdentifier:", v13, &v44);
    v21 = v44;
    if (!v21)
      v9[2](v9, 3302, CFSTR("Invalid image metadata"), 0);
    v42 = *MEMORY[0x1E0CA2E18];
    v43 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v40 = v42;
    v41 = v43;
    v38 = 0;
    v39 = 0;
    -[PHValidator getLivePhotoVideoMetadataFromURL:videoComplementMetadata:pairingIdentifier:videoDuration:imageDisplayTime:error:](self, "getLivePhotoVideoMetadataFromURL:videoComplementMetadata:pairingIdentifier:videoDuration:imageDisplayTime:error:", v12, v37, &v39, &v42, &v40, &v38);
    v22 = v39;
    v23 = v38;
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = v24;
    if (!v22)
      objc_msgSend(v24, "addObject:", CFSTR("pairing identifier"));
    if ((BYTE12(v42) & 0x1D) != 1)
      objc_msgSend(v25, "addObject:", CFSTR("video duration"));
    if ((BYTE12(v40) & 0x1D) != 1)
    {
      PLPhotoKitGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v23;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "PHValidator: non-fatal error, invalid or missing image display time, underlying error: %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v25, "count"))
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Invalid video metadata: %@"), v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, uint64_t, const __CFString *, id))v9)[2](v9, 3302, v29, v23);

    }
    if (!v55[5] && (objc_msgSend(v21, "isEqualToString:", v22) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid image/video pairing, image identifier (%@) does not match video identifier (%@)"), v21, v22);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 3302, v30, 0);

    }
    v20 = (void *)v55[5];
  }
  v31 = *((unsigned __int8 *)v51 + 24);
  v32 = v20;
  v33 = v32;
  if (!v31 && a5)
    *a5 = objc_retainAutorelease(v32);

  v34 = *((_BYTE *)v51 + 24) != 0;
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v34;
}

- (void)getLivePhotoImageMetadataFromURL:(id)a3 pairingIdentifier:(id *)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PFReadPairingIdentifierFromImageAtPath();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v6);

}

- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  int64_t v20;

  v13 = a3;
  v14 = a4;
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v13, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PFVideoComplementMetadataForVideoAtPath();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;

  if (a5)
  {
LABEL_3:
    objc_msgSend(v15, "pairingIdentifier");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  if (a6)
  {
    if (v15)
    {
      objc_msgSend(v15, "videoDuration");
    }
    else
    {
      v19 = 0uLL;
      v20 = 0;
    }
    *(_OWORD *)&a6->var0 = v19;
    a6->var3 = v20;
  }
  if (a7)
  {
    if (v15)
    {
      objc_msgSend(v15, "imageDisplayTime");
    }
    else
    {
      v19 = 0uLL;
      v20 = 0;
    }
    *(_OWORD *)&a7->var0 = v19;
    a7->var3 = v20;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v16);

  return v15 != 0;
}

void __76__PHValidator__validateLivePhotoResourceURLs_videoComplementMetadata_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("PHValidator.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  PLPhotoKitGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, "invalid live photo resource: %{public}@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2938]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), a2, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

intptr_t __39__PHValidator__validateVideoURL_error___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __46__PHValidator_validateData_withOptions_error___block_invoke(uint64_t a1)
{
  CGImageSourceRef v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 32), 0);
  v3 = *(void **)(a1 + 40);
  v6 = 0;
  v4 = objc_msgSend(v3, "_validateImageSource:error:", v2, &v6);
  v5 = v6;
  objc_msgSend(*(id *)(a1 + 48), "assert:error:", v4, v5);
  if (v2)
    CFRelease(v2);

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "assert:code:format:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "isFileURL"), 3302, CFSTR("not a file URL: %@"), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id obj;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v5);
        v11 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v11);

        objc_msgSend(*(id *)(a1 + 40), "assert:code:format:", v9, 3303, CFSTR("file doesn't exist: %@"), v6);
        objc_msgSend(*(id *)(a1 + 40), "assert:code:format:", v11 == 0, 3302, CFSTR("URL is directory: %@"), v6);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        v9 = *(void **)(a1 + 48);
        objc_msgSend(v7, "pathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assert:code:format:", objc_msgSend(v9, "isValidImagePathExtension:", v10), 3302, CFSTR("invalid image path extension: %@"), v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        v9 = *(void **)(a1 + 48);
        objc_msgSend(v7, "pathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assert:code:format:", objc_msgSend(v9, "isValidVideoPathExtension:", v10), 3302, CFSTR("invalid video path extension: %@"), v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGImageSourceRef v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = CGImageSourceCreateWithURL(*(CFURLRef *)(*((_QWORD *)&v12 + 1) + 8 * v6), 0);
        v8 = *(void **)(a1 + 40);
        v11 = 0;
        v9 = objc_msgSend(v8, "_validateImageSource:error:", v7, &v11);
        v10 = v11;
        objc_msgSend(*(id *)(a1 + 48), "assert:error:", v9, v10);
        if (v7)
          CFRelease(v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        v11 = 0;
        v9 = objc_msgSend(v8, "_validateVideoURL:error:", v7, &v11);
        v10 = v11;
        objc_msgSend(*(id *)(a1 + 48), "assert:error:", v9, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = 0;
  v5 = objc_msgSend(v2, "_validateLivePhotoResourceURLs:videoComplementMetadata:error:", v3, v4, &v7);
  v6 = v7;
  objc_msgSend(*(id *)(a1 + 56), "assert:error:", v5, v6);

}

@end
