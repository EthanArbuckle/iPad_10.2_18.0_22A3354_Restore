@implementation NTKImagesPlistScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1E6CAA018;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  id *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:](NTKPhotosFaceResourcesManifest, "manifestForResourceDirectory:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2003, 0);
      v28 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_26;
  }
  v32 = v11;
  objc_msgSend(v11, "imageList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v14)
  {

    goto LABEL_22;
  }
  v15 = v14;
  v31 = a5;
  v16 = 0;
  v17 = *(_QWORD *)v35;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v35 != v17)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("upAnalysis"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

LABEL_10:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", CFSTR("upAnalysis"));
        objc_msgSend(v22, "removeObjectForKey:", CFSTR("downAnalysis"));
        objc_msgSend(v33, "addObject:", v22);

        v16 = 1;
        goto LABEL_11;
      }
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("downAnalysis"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_10;
      objc_msgSend(v33, "addObject:", v19);
LABEL_11:
      ++v18;
    }
    while (v15 != v18);
    v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    v15 = v23;
  }
  while (v23);

  a5 = v31;
  if ((v16 & 1) != 0)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_impl(&dword_1B72A3000, v24, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Extra analysis data found in plist: '%@'. Will scrub.", buf, 0xCu);
    }

    v11 = v32;
    objc_msgSend(v32, "assetCollectionIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = NTKPhotosWriteImageListForAssetCollection(v33, v25, v27);

    goto LABEL_25;
  }
LABEL_22:
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v7;
    _os_log_impl(&dword_1B72A3000, v29, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Extra analysis data not found in plist: '%@'. Passing through", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "copyItemAtURL:toURL:error:", v7, v8, a5);
  v11 = v32;
LABEL_25:

LABEL_26:
  return v28;
}

@end
