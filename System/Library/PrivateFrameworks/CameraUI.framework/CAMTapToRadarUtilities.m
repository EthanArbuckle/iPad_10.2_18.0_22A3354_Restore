@implementation CAMTapToRadarUtilities

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 reproducibility:(id)a6 componentID:(id)a7 componentName:(id)a8 componentVersion:(id)a9 keywordIdsString:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includePhotosDiagnose:(BOOL)a13 includeHIDContinuousRecordings:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v64 = a7;
  v23 = a8;
  v24 = a9;
  v63 = a10;
  v25 = a11;
  v26 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v77 = v23;
    v78 = 2114;
    v79 = v19;
    _os_log_impl(&dword_1DB760000, v26, OS_LOG_TYPE_DEFAULT, "Tap-to-Radar initiated for component: %{public}@, title: %{public}@", buf, 0x16u);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  FigCaptureGetModelSpecificName();
  v28 = objc_claimAutoreleasedReturnValue();
  MGCopyAnswer();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)v28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@: %@"), v28, v55, v19);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:");
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, CFSTR("Classification"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, CFSTR("Reproducibility"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v64, CFSTR("ComponentID"));
  v58 = v23;
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("ComponentName"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("ComponentVersion"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("Description"));
  if (objc_msgSend(v63, "length"))
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v63, CFSTR("Keywords"));
  v59 = v22;
  if (!a12)
    objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("AutoDiagnostics"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (a13)
    objc_msgSend(v29, "addObject:", CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics"));
  if (a14)
    objc_msgSend(v30, "addObject:", CFSTR("com.apple.DiagnosticExtensions.HIDContinuousRecordings"));
  v61 = v20;
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "componentsJoinedByString:", CFSTR(","));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("ExtensionIdentifiers"));

  }
  v53 = v30;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v25;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v71 != v35)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v32, "addObject:", v37);

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v34);
  }
  v57 = v24;
  v60 = v21;
  v62 = v19;

  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "length"))
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v38, CFSTR("Attachments"));
  v52 = v38;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v40 = v27;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
        v46 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v40, "objectForKeyedSubscript:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "queryItemWithName:value:", v45, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v48);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v42);
  }

  objc_msgSend(v51, "setQueryItems:", v39);
  objc_msgSend(v51, "URL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((CAMOpenSensitiveURLWithUnlockRequest(v49, 1) & 1) == 0)
  {
    v50 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:].cold.1((uint64_t)v49, v50);

  }
}

+ (id)writeDictionary:(id)a3 toPlistFileWithName:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a4;
    v6 = a3;
    NSTemporaryDirectory();
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v7, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    LOBYTE(v7) = objc_msgSend(v6, "writeToURL:error:", v10, &v14);

    v11 = v14;
    if ((v7 & 1) == 0)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "CAMTapToRadarUtilities: Failed to save tap-to-radar info, error: %{public}@", buf, 0xCu);
      }

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (void)fileRadarWithTitle:(uint64_t)a1 description:(NSObject *)a2 classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CAMTapToRadarUtilities: Failed to open radar url: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
