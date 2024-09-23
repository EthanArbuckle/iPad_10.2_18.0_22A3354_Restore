@implementation PAMediaConversionServiceImagingUtilities

+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4
{
  id v5;
  size_t Count;
  void *v7;
  size_t i;
  CFDictionaryRef v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  Count = CGImageSourceGetCount(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (Count)
  {
    for (i = 0; i != Count; ++i)
    {
      v9 = CGImageSourceCopyPropertiesAtIndex(a3, i, 0);
      if (v5)
      {
        objc_msgSend(v5, "processMetadata:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (CFDictionaryRef)v10;
      }
      if (v9)
      {
        objc_msgSend(v7, "addObject:", v9);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
    }
  }

  return v7;
}

+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5
{
  const __CFURL *v7;
  id v8;
  const __CFDictionary *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  size_t PrimaryImageIndex;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  const __CFURL *v20;
  void *v21;
  int v22;
  const __CFData *v23;
  void *v24;
  const __CFURL *v25;
  CGImageSource *v26;
  CFDictionaryRef v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const __CFURL *v41;
  const __CFURL *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  const __CFDictionary *v47;
  id v48;
  CGImageSource *cf;
  id v50;
  size_t index;
  const __CFURL *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  id v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  const __CFURL *v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  v8 = a4;
  v63 = *MEMORY[0x1E0CBD240];
  v64[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageSourceCreateWithURL(v7, v9);
  if (v10)
  {
    v11 = v10;
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v10);
    v50 = a1;
    objc_msgSend(a1, "imagePropertiesByImageIndexInImageSource:processedWithMetadataPolicy:", v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    index = PrimaryImageIndex;
    objc_msgSend(v13, "objectAtIndexedSubscript:", PrimaryImageIndex);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(PrimaryImageIndex) = objc_msgSend(v14, "isEqual:", v15);

    if ((_DWORD)PrimaryImageIndex)
    {

      v14 = (void *)MEMORY[0x1E0C9AA70];
    }
    CFRelease(v11);
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v17 = *MEMORY[0x1E0C99AD0];
    v58 = 0;
    v18 = -[__CFURL getResourceValue:forKey:error:](v7, "getResourceValue:forKey:error:", &v59, v17, &v58);
    v19 = v59;

    v20 = (const __CFURL *)v58;
    if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v20;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get type identifier of image source URL: %@", buf, 0xCu);
    }
    v52 = v20;
    objc_msgSend(v8, "processMetadata:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v22 = PFFigCopyImageFileWithPropertiesToData();
    v23 = (const __CFData *)0;
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[__CFURL path](v7, "path");
        v41 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v62 = v41;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to perform passthrough conversion for %@", buf, 0xCu);

      }
    }
    else
    {
      v26 = CGImageSourceCreateWithData(v23, 0);
      if (v26)
      {
        v44 = v19;
        v45 = v14;
        v46 = v13;
        v47 = v9;
        v48 = v8;
        cf = v26;
        v27 = CGImageSourceCopyPropertiesAtIndex(v26, index, 0);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v21;
        v30 = (void *)v28;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v43 = v29;
        v31 = v29;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v54 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              -[__CFDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v36, v43);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v37)
              {
                objc_msgSend(v31, "objectForKeyedSubscript:", v36);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v36);

              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          }
          while (v33);
        }

        v25 = v52;
        if (objc_msgSend(v30, "count"))
        {
          v13 = v46;
          objc_msgSend(v50, "imageDataByAddingMissingPrimaryImageProperties:toImageDataSource:primaryImageIndex:inputImagePropertiesByIndex:", v30, cf, index, v46);
          v39 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v39;
          v9 = v47;
          v19 = v44;
          if (!v39)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              -[__CFURL path](v7, "path");
              v42 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v62 = v42;
              _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to apply metadata properties missed by Fig during passthrough conversion for %@.", buf, 0xCu);

            }
            v24 = 0;
          }
        }
        else
        {
          v13 = v46;
          v9 = v47;
          v19 = v44;
        }
        CFRelease(cf);

        v8 = v48;
        v14 = v45;
        v21 = v43;
        goto LABEL_33;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v62 = (const __CFURL *)v24;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create an image source from Fig outputData (%{public}@) to inspect for adding any missing metadata properties.", buf, 0xCu);
      }
    }
    v25 = v52;
LABEL_33:

    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v7;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to create image source from %@", buf, 0xCu);
  }
  v24 = 0;
LABEL_34:

  return v24;
}

+ (id)imageDataByAddingMissingPrimaryImageProperties:(id)a3 toImageDataSource:(CGImageSource *)a4 primaryImageIndex:(unint64_t)a5 inputImagePropertiesByIndex:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  size_t Count;
  CFDictionaryRef v14;
  uint64_t v15;
  const __CFString *v16;
  size_t v17;
  CGImageDestination *v18;
  size_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CGImageDestination *v24;
  size_t v25;
  CGImageSource *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  __CFData *v34;
  __CFData *v35;
  __CFData *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v9 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v43, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v11;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding metadata properties missed by Fig: [%{public}@]", buf, 0xCu);

  }
  CGImageSourceGetType(a4);
  v12 = objc_claimAutoreleasedReturnValue();
  Count = CGImageSourceGetCount(a4);
  v14 = CGImageSourceCopyProperties(a4, 0);
  v15 = *MEMORY[0x1E0CBCE60];
  -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE60]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v37 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v12;
  v16 = (const __CFString *)v12;
  v17 = Count;
  v18 = CGImageDestinationCreateWithData(v37, v16, Count, 0);
  if (v17)
  {
    v19 = 0;
    v20 = *MEMORY[0x1E0CBC790];
    v46 = *MEMORY[0x1E0CBD1B8];
    v47 = *MEMORY[0x1E0CBC7B0];
    v44 = *MEMORY[0x1E0CBC760];
    v45 = *MEMORY[0x1E0CBD1A0];
    v41 = *MEMORY[0x1E0CBC790];
    v42 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v20);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v47);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v46, v45);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v44);
      if (a5 == v19)
      {
        objc_msgSend(v21, "addEntriesFromDictionary:", v43);
      }
      else
      {
        v23 = v15;
        v24 = v18;
        v25 = v17;
        v26 = a4;
        v27 = a5;
        if (v19 >= objc_msgSend(v9, "count"))
        {
          v29 = 0x1E0C99000uLL;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0x1E0C99000;
        }
        objc_msgSend(*(id *)(v29 + 3640), "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v28, "isEqual:", v30);

        if ((v31 & 1) == 0)
          objc_msgSend(v21, "addEntriesFromDictionary:", v28);

        a5 = v27;
        a4 = v26;
        v17 = v25;
        v18 = v24;
        v15 = v23;
        v20 = v41;
        v9 = v42;
      }
      objc_msgSend(v21, "objectForKeyedSubscript:", v15);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        objc_msgSend(a1, "stereoGroupInfoForImageIndex:containerImageGroups:", v19, v40);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, v15);

      }
      CGImageDestinationAddImageFromSource(v18, a4, v19, (CFDictionaryRef)v21);

      ++v19;
    }
    while (v17 != v19);
  }
  if (CGImageDestinationFinalize(v18))
  {
    v34 = v37;
    v35 = v37;
    if (!v18)
      goto LABEL_21;
    goto LABEL_20;
  }
  v35 = 0;
  v34 = v37;
  if (v18)
LABEL_20:
    CFRelease(v18);
LABEL_21:

  return v35;
}

+ (id)stereoGroupInfoForImageIndex:(unint64_t)a3 containerImageGroups:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  BOOL v22;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a4;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    v7 = *MEMORY[0x1E0CBCE38];
    v8 = *MEMORY[0x1E0CBCE48];
    v32 = *MEMORY[0x1E0CBCE10];
    v26 = (void *)*MEMORY[0x1E0CBCE20];
    v31 = *MEMORY[0x1E0CBCE18];
    v25 = (void *)*MEMORY[0x1E0CBCE28];
    v29 = *MEMORY[0x1E0CBCE08];
    v27 = *MEMORY[0x1E0CBCE30];
    v30 = *(_QWORD *)v37;
    v33 = *MEMORY[0x1E0CBCE38];
    do
    {
      v9 = 0;
      v28 = v5;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", v7, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v8) & 1) != 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && objc_msgSend(v12, "unsignedIntegerValue") == a3)
            v14 = v26;
          else
            v14 = 0;
          objc_msgSend(v10, "objectForKeyedSubscript:", v31);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15 && objc_msgSend(v15, "unsignedIntegerValue") == a3)
          {
            v17 = v25;

            v14 = v17;
            v6 = v30;
          }
          if (v14)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v29);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v27);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v19;
              if (v19)
              {
                v40[0] = v7;
                v40[1] = v14;
                v41[0] = v8;
                v41[1] = MEMORY[0x1E0C9AAB0];
                v41[2] = v18;
                v40[2] = v29;
                v40[3] = v27;
                v41[3] = v19;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
                v24 = (id)objc_claimAutoreleasedReturnValue();
                v21 = 1;
              }
              else
              {
                v21 = 3;
              }

              v5 = v28;
            }
            else
            {
              v21 = 3;
            }

            v6 = v30;
          }
          else
          {
            v21 = 3;
          }

          v22 = v21 == 3;
          v7 = v33;
          if (!v22)
            goto LABEL_29;
        }
        else
        {

        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v5);
  }
  v24 = 0;
LABEL_29:

  return v24;
}

+ (id)primaryImagePropertiesForFileAtURL:(id)a3
{
  const __CFURL *v3;
  const __CFDictionary *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  size_t PrimaryImageIndex;
  CFDictionaryRef v8;
  int v10;
  const __CFURL *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFURL *)a3;
  v12[0] = *MEMORY[0x1E0CBD240];
  v12[1] = CFSTR("kCGImageSourceRawPropertiesHint");
  v13[0] = MEMORY[0x1E0C9AAA0];
  v13[1] = CFSTR("ImportOnly");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageSourceCreateWithURL(v3, v4);
  if (v5)
  {
    v6 = v5;
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v5);
    v8 = CGImageSourceCopyPropertiesAtIndex(v6, PrimaryImageIndex, 0);
    CFRelease(v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create image source for %@, skipping", (uint8_t *)&v10, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height;
  double width;
  id v14;
  const __CFURL *v15;
  __CFString *v16;
  CGImageDestinationRef v17;
  CGImageDestinationRef v18;
  char v19;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  height = a5.height;
  width = a5.width;
  v25 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (const __CFURL *)a4;
  v16 = (__CFString *)a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImagingUtilities.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputFileType"));

  }
  v17 = CGImageDestinationCreateWithURL(v15, v16, 1uLL, 0);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);

    }
    v19 = 0;
  }

  return v19;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height;
  double width;
  id v14;
  __CFString *v15;
  __CFData *v16;
  CGImageDestinationRef v17;
  CGImageDestinationRef v18;
  int v19;
  BOOL v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  height = a5.height;
  width = a5.width;
  v26 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (__CFString *)a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImagingUtilities.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputFileType"));

  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v17 = CGImageDestinationCreateWithData(v16, v15, 1uLL, 0);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    v20 = v19;
    if (a4 && v19)
      *a4 = objc_retainAutorelease(v16);
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

+ (BOOL)_generatePosterFrameExportForVideoURL:(id)a3 imageDestinationToAddToAndFinalize:(CGImageDestination *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  id v12;
  void *v13;
  void *v14;
  CGImage *v15;
  CGImage *v16;
  BOOL v17;
  void *v19;
  void *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t v23;

  height = a5.height;
  width = a5.width;
  v23 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImagingUtilities.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageDestination"));

  }
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaximumSize:", width, height);
  objc_msgSend(v14, "setAppliesPreferredTrackTransform:", 1);
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v15 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v14, buf, 0, a6);
  if (v15)
  {
    v16 = v15;
    CGImageDestinationAddImage(a4, v15, 0);
    v17 = CGImageDestinationFinalize(a4);
    if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to finalize image destination for still image extraction for %@", buf, 0xCu);

    }
    CFRelease(v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
