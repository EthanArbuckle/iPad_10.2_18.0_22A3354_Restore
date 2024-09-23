@implementation NUVideoUtilities

+ (id)defaultVideoSettingsForAVAssetReaderWithHDR:(BOOL)a3 forAuxiliaryImageType:(int64_t)a4
{
  _BOOL4 v5;
  uint64_t *v6;

  v5 = a3;
  if (defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__onceToken != -1)
    dispatch_once(&defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__onceToken, &__block_literal_global_12301);
  if (a4 == 2)
  {
    v6 = &defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsDisparity;
  }
  else if ((unint64_t)a4 < 2 || a4 == 11)
  {
    v6 = &defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettings;
    if (v5)
      v6 = &defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsHDR;
  }
  else
  {
    v6 = &defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettings;
    if (a4 != 12)
      v6 = &defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsAuxiliary;
  }
  return (id)*v6;
}

+ (id)rgbVideoSettingsForAVAssetReader
{
  if (rgbVideoSettingsForAVAssetReader_onceToken != -1)
    dispatch_once(&rgbVideoSettingsForAVAssetReader_onceToken, &__block_literal_global_31_12300);
  return (id)rgbVideoSettingsForAVAssetReader_videoSettings;
}

+ (BOOL)deviceSupportsHardwareHEVCEncoding
{
  return objc_msgSend(MEMORY[0x1E0D75320], "deviceSupportsHardwareHEVCEncoding");
}

+ (BOOL)deviceSupportsHardware10BitHEVCEncoding
{
  return (objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceHEVCCapabilities") >> 2) & 1;
}

+ (BOOL)deviceSupportsHighDynamicRangeVideo
{
  return objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceIsEligibleForHDRPlayback");
}

+ (id)originalCodecOfVideoTrack:(id)a3
{
  void *v3;
  void *v4;
  FourCharCode MediaSubType;

  objc_msgSend(a3, "formatDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v4);
  return NUStringForTypeCode(MediaSubType);
}

+ (id)defaultExportCodecForHDRVideo:(BOOL)a3
{
  _BOOL4 v3;
  char v4;
  id *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  uint8_t buf[2];

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D75128], "currentDeviceHEVCCapabilities");
  v5 = (id *)MEMORY[0x1E0C8AE78];
  if (v3 || (v4 & 2) == 0)
  {
    v6 = v3 & ((v4 & 8) >> 3);
    if (!v6)
      v5 = (id *)MEMORY[0x1E0C8AE70];
    if ((v6 & 1) == 0 && v3)
    {
      if ((v4 & 4) != 0)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
        v7 = _NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v8 = "Asked to export an HDR composition, but HW encoders are instance-limited. We may use the software encoder";
        v9 = buf;
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
        v7 = _NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v11 = 0;
        v8 = "Asked to export an HDR composition, but no HW encoder is available. We WILL use the software encoder";
        v9 = (uint8_t *)&v11;
      }
      _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
LABEL_17:
      v5 = (id *)MEMORY[0x1E0C8AE78];
    }
  }
  return *v5;
}

+ (id)defaultOutputColorSpaceForComposition:(id)a3
{
  return 0;
}

+ (BOOL)isAVAssetHDR:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "firstEnabledVideoTrackInAsset:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "formatDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v8, (CFStringRef)*MEMORY[0x1E0CA8E98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8AF58]) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8AF48]);

  return v10;
}

+ (BOOL)isAVAssetDolbyProfile5:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "firstEnabledVideoTrackInAsset:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "formatDescriptions", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v11 |= CMVideoFormatDescriptionGetVideoDynamicRange() == 5;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11 & 1;
}

+ (id)bestOutputSettingsPresetForTargetVideoSize:(id)a3 codec:(unsigned int)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  var1 = a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C8B2D0], "availableOutputSettingsPresets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = var0 * var1;
  if (a4 == 1752589105 && v9 > 4147200)
  {
    v10 = (void *)*MEMORY[0x1E0C8ABD0];
    if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C8ABD0]) & 1) != 0)
      goto LABEL_19;
  }
  else if (a4 != 1752589105)
  {
    goto LABEL_7;
  }
  v10 = (void *)*MEMORY[0x1E0C8ABC8];
  if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C8ABC8]) & 1) != 0)
    goto LABEL_19;
LABEL_7:
  if (v9 > 4147200)
  {
    v10 = (void *)*MEMORY[0x1E0C8ABB0];
    if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C8ABB0]) & 1) != 0)
      goto LABEL_19;
    goto LABEL_11;
  }
  if (v9 > 1382400)
  {
LABEL_11:
    v10 = (void *)*MEMORY[0x1E0C8ABA8];
    if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C8ABA8]) & 1) != 0)
      goto LABEL_19;
    goto LABEL_14;
  }
  if (v9 < 691201)
  {
    if (v9 < 460801)
    {
LABEL_18:
      v10 = (void *)*MEMORY[0x1E0C8ABB8];
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_14:
  v10 = (void *)*MEMORY[0x1E0C8ABA0];
  if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C8ABA0]) & 1) != 0)
    goto LABEL_19;
LABEL_17:
  v10 = (void *)*MEMORY[0x1E0C8ABC0];
  if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0C8ABC0]) & 1) == 0)
    goto LABEL_18;
LABEL_19:
  v11 = v10;

  return v11;
}

+ (id)firstEnabledVideoTrackInAsset:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *specific;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_12004();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = (uint64_t)v50;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v58 = v56;
        objc_msgSend(v57, "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = (uint64_t)v56;
        v72 = 2114;
        v73 = v60;
        _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v53)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = (uint64_t)v55;
      _os_log_error_impl(&dword_1A6553000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities firstEnabledVideoTrackInAsset:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 273, CFSTR("Invalid parameter not satisfying: %s"), v61, v62, v63, v64, (uint64_t)"error != nil");
  }
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v5);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v66 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEnabled") & 1) != 0)
        {
          v22 = v12;

          goto LABEL_28;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
  v13 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v71 = (uint64_t)v6;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "No enabled video tracks in asset %{public}@", buf, 0xCu);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
  }
  v14 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v24 = v14;
    objc_msgSend(v6, "tracks");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134217984;
    v71 = v26;
    _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Asset track count: %ld", buf, 0xCu);

    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
  }
  v15 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v27 = v15;
    objc_msgSend(v6, "tracks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "segments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");
    *(_DWORD *)buf = 134217984;
    v71 = v31;
    _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Asset track edit count: %ld", buf, 0xCu);

    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
  }
  v16 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v32 = v16;
    objc_msgSend(v6, "tracks");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v71 = (uint64_t)v33;
    _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Asset tracks: %{public}@", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v18 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v71 = (uint64_t)v17;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Asset URL: %{public}@", buf, 0xCu);
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    }
    v19 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)MEMORY[0x1E0CB3620];
      v35 = v19;
      objc_msgSend(v34, "defaultManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Asset file exists: %d", buf, 8u);

      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    }
    v20 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)MEMORY[0x1E0CB3620];
      v40 = v20;
      objc_msgSend(v39, "defaultManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isReadableFileAtPath:", v42);
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Asset file readable: %d", buf, 8u);

      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    }
    v21 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v44 = (void *)MEMORY[0x1E0CB3620];
      v45 = v21;
      objc_msgSend(v44, "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "attributesOfItemAtPath:error:", v47, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = (uint64_t)v48;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Asset file attributes: %{public}@", buf, 0xCu);

    }
  }
  +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("no enabled video tracks"), v6);
  v22 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v22;
}

+ (id)auxiliaryTrackInAsset:(id)a3 ofType:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  NSObject *v27;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[3];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a5)
  {
    NUAssertLogger_12004();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v36;
        v59 = 2114;
        v60 = v40;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 305, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A8], v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    NUMediaCharacteristicForAuxiliaryImageType(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (!v10
            || objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "hasMediaCharacteristic:", v10))
          {
            v17 = v16;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        v17 = 0;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
    }
LABEL_16:

    if (a4 == 2 && !v17)
    {
      objc_msgSend(v11, "firstObject");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v55[0] = NUMediaCharacteristicPortraitEffectsMatte;
      v55[1] = NUMediaCharacteristicSkinMatte;
      v55[2] = NUMediaCharacteristicSkyMatte;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = NUMediaCharacteristicStyleDelta;
      v54[1] = NUMediaCharacteristicOriginalStyleLinear;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v46;
        while (2)
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v22);
            if ((objc_msgSend(v17, "hasMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j)) & 1) != 0)
            {

              v18 = 0;
              goto LABEL_33;
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v24)
            continue;
          break;
        }
      }

      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
      v27 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6553000, v27, OS_LOG_TYPE_INFO, "Could not find disparity track with expected media characteristic, using the first auxiliary track instead", buf, 2u);
      }

    }
    v17 = v17;
    v18 = v17;
LABEL_33:

  }
  else
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("no auxiliary tracks"), v8);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11 = 0;
  objc_msgSend(a2, "firstEnabledVideoTrackInAsset:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    objc_msgSend(a2, "minimumFrameDurationForAssetTrack:", v7);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v9 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Failed to get video track in asset: %@, error: %@", buf, 0x16u);
    }
    CMTimeMake((CMTime *)retstr, 1, 60);
  }

  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAsset:(SEL)a3 videoComposition:(id)a4
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    NUAssertLogger_12004();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities minimumFrameDurationForAsset:videoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 358, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"asset != nil");
  }
  v10 = v9;
  v11 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  retstr->var3 = *(_QWORD *)(v11 + 16);
  if (!v9)
  {
    objc_msgSend(a2, "minimumFrameDurationForAsset:", v8);
LABEL_7:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
    retstr->var3 = *(_QWORD *)&buf[16];
    goto LABEL_8;
  }
  v12 = objc_msgSend(v9, "sourceTrackIDForFrameTiming");
  if (!(_DWORD)v12)
  {
    objc_msgSend(v10, "frameDuration");
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D75130], "trackWithTrackID:forAsset:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "minimumFrameDurationForAssetTrack:", v13);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
  retstr->var3 = *(_QWORD *)&buf[16];

LABEL_8:
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDurationForAssetTrack:(SEL)a3
{
  id v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;
  CMTime time1;
  __int128 v9;
  int64_t v10;
  CMTime v11;

  v5 = a4;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  CMTimeMake((CMTime *)retstr, 1, 60);
  memset(&v11, 0, sizeof(v11));
  CMTimeMake(&v11, 1, 240);
  v9 = 0uLL;
  v10 = 0;
  if (v5)
  {
    objc_msgSend(v5, "minFrameDuration");
    if ((BYTE12(v9) & 1) != 0)
    {
      *(_OWORD *)&retstr->var0 = v9;
      retstr->var3 = v10;
    }
  }
  time1 = (CMTime)*retstr;
  v7 = v11;
  if (CMTimeCompare(&time1, &v7) < 0)
    *(CMTime *)retstr = v11;

  return result;
}

+ (float)nominalFrameRateForAsset:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  float v6;
  float v7;

  objc_msgSend(a1, "firstEnabledVideoTrackInAsset:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "nominalFrameRate");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (unint64_t)nominalFrameRateRoundedToNearestTraditionalFrameRate:(float)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  float v8;
  uint64_t i;
  unsigned int v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(&unk_1E50A3868, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
    return 60;
  v5 = v4;
  v6 = *(_QWORD *)v14;
  v7 = 60;
  v8 = 3.4028e38;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(&unk_1E50A3868);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntValue");
      v11 = vabds_f32((float)v10, a3);
      if (v11 < v8)
      {
        v8 = v11;
        v7 = v10;
      }
    }
    v5 = objc_msgSend(&unk_1E50A3868, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v5);
  return v7;
}

+ (void)readNextPixelBuffer:(id)a3 output:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_12004();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "reader != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v33;
        v64 = 2114;
        v65 = v37;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 435, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"reader != nil");
  }
  if (!v9)
  {
    NUAssertLogger_12004();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "output != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v42;
        v64 = 2114;
        v65 = v46;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 436, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"output != nil");
  }
  if (!v10)
  {
    NUAssertLogger_12004();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v51;
        v64 = 2114;
        v65 = v55;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextPixelBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 437, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"block != nil");
  }
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __53__NUVideoUtilities_readNextPixelBuffer_output_block___block_invoke;
  v60[3] = &unk_1E5062110;
  v61 = v10;
  v11 = v10;
  objc_msgSend(a1, "readNextSampleBuffer:output:block:", v8, v9, v60);

}

+ (void)readNextSampleBuffer:(id)a3 output:(id)a4 block:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *, uint64_t);
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *, uint64_t))a5;
  if (!v49)
  {
    NUAssertLogger_12004();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "reader != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v31;
        v52 = 2114;
        v53 = v35;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextSampleBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 453, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"reader != nil");
  }
  if (!v8)
  {
    NUAssertLogger_12004();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v40;
        v52 = 2114;
        v53 = v44;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readNextSampleBuffer:output:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 454, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"block != nil");
  }
  v9 = objc_msgSend(v7, "copyNextSampleBuffer");
  if (!v9)
  {
    v11 = objc_msgSend(v49, "status");
    switch(v11)
    {
      case 2:
        v13 = 0;
        v16 = 1;
LABEL_14:
        v8[2](v8, 0, v13, v16);

        goto LABEL_15;
      case 4:
        v14 = CFSTR("Asset reader was canceled");
        v15 = 10;
        break;
      case 3:
        objc_msgSend(v49, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read next sample buffer from asset reader"), v49, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v16 = 0;
        goto LABEL_14;
      default:
        v14 = CFSTR("Unknown error reading from asset reader");
        v15 = 7;
        break;
    }
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", v15, v14, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v10 = (const void *)v9;
  v8[2](v8, v9, 0, 0);
  CFRelease(v10);
LABEL_15:

}

+ (BOOL)metadataTrack:(id)a3 containsIdentifier:(id)a4
{
  id v5;
  void *v6;
  const opaqueCMFormatDescription *v7;
  void *v8;
  char v9;
  BOOL v10;

  v5 = a4;
  objc_msgSend(a3, "formatDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "firstObject");

  v10 = 0;
  if (v7)
  {
    CMMetadataFormatDescriptionGetIdentifiers(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v5);

    if ((v9 & 1) != 0)
      v10 = 1;
  }

  return v10;
}

+ (BOOL)metadataTrack:(id)a3 containsIdentifiers:(id)a4
{
  id v5;
  void *v6;
  const opaqueCMFormatDescription *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "formatDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "firstObject");

  if (v7)
  {
    CMMetadataFormatDescriptionGetIdentifiers(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if (!objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16))
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifier:", a3, *MEMORY[0x1E0CA4CC0]);
}

+ (BOOL)isMetadataTrackWithStillImageTransformInLivePhoto:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifier:", a3, *MEMORY[0x1E0CA2570]);
}

+ (BOOL)isMetadataTrackWithStillImageDimensionsInLivePhoto:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifier:", a3, CFSTR("mdta/com.apple.quicktime.live-photo-still-image-transform-reference-dimensions"));
}

+ (BOOL)isMetadataTrackWithLivePhotoInfo:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifier:", a3, *MEMORY[0x1E0D053E0]);
}

+ (BOOL)videoTrackContainsDolbyVisionMetadata:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8A808]);

  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "formatDescriptions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v19 = v3;
      v8 = *(_QWORD *)v22;
      v9 = *MEMORY[0x1E0CA8E98];
      v10 = *MEMORY[0x1E0CA8EA8];
      v11 = *MEMORY[0x1E0CA2240];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(obj);
          CMFormatDescriptionGetExtensions(*(CMFormatDescriptionRef *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v10))
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = v15;
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dvvC"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {

                LOBYTE(v5) = 1;
                goto LABEL_14;
              }
            }
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          continue;
        break;
      }
      LOBYTE(v5) = 0;
LABEL_14:
      v3 = v19;
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

+ (id)metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a1, "isMetadataTrackStillImageDisplayTimeMarkerInLivePhoto:", v9))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)metadataTrackWithStillImageTransformInLivePhotoAsset:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a1, "isMetadataTrackWithStillImageTransformInLivePhoto:", v9))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)metadataTrackWithStillImageDimensionsInLivePhotoAsset:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a1, "isMetadataTrackWithStillImageDimensionsInLivePhoto:", v9))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)metadataTrackContainsPortraitVideoData:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifiers:", a3, &unk_1E50A3880);
}

+ (id)metadataTrackWithPortraitVideoDataInAsset:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(a1, "metadataTrackContainsPortraitVideoData:", v9) & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)isAssetUnsupportedLegacyPortraitVideo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  CMTimeRange v17;
  CMTime duration;
  CMTime start;
  CMTimeRange v20;
  CMTime v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(a1, "metadataTrackWithPortraitVideoDataInAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v4, &v22);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_14;
  v7 = (void *)v6;
  memset(&v21, 0, sizeof(v21));
  objc_msgSend(v5, "minFrameDuration");
  if ((unsigned __int128)0 >> 96)
  {
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    duration = v21;
    CMTimeRangeMake(&v20, &start, &duration);
    v17 = v20;
    objc_msgSend(v7, "setTimeRange:", &v17);
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v5, 0);
  if ((objc_msgSend(v7, "canAddOutput:", v8) & 1) == 0)
  {

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "addOutput:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v8);
  if (objc_msgSend(v7, "startReading"))
  {
    objc_msgSend(v9, "nextTimedMetadataGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelReading");
    v11 = v10 != 0;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C8B220];
      objc_msgSend(v10, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "metadataItemsFromArray:filteredByIdentifier:", v13, CFSTR("mdta/com.apple.quicktime.formatInfo-dictionary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "count") != 0;
    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v11 = 0;
    v15 = 1;
  }

  if (!v15)
    goto LABEL_14;
LABEL_15:

  return v11;
}

+ (id)metadataTrackWithIdenfifier:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(a1, "metadataTrack:containsIdentifier:", v12, v6) & 1) != 0)
        {
          v13 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)getCinematicAudioParametersFromAudioMix:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  const __CFString *v13;
  double v14;
  double v15;
  const __CFString *v16;
  const __CFString *v17;
  double v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __int128 v23;
  float v24;
  __int128 v25;
  uint64_t v26;
  int v27;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "inputParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v27 = 0;
    v25 = *MEMORY[0x1E0CA2E68];
    v23 = v25;
    v26 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v8 = v26;
    objc_msgSend(v7, "getDialogMixBiasRampForTime:startValue:endValue:timeRange:", &v25, &v27, 0, 0);
    LODWORD(v9) = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("dialogMix"));

    v24 = 0.0;
    v25 = v23;
    v26 = v8;
    objc_msgSend(v7, "getRenderingStyleRampForTime:startValue:endValue:timeRange:", &v25, &v24, 0, 0);
    *(float *)&v11 = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("renderingStyle"));

    v13 = CFSTR("studio");
    *(float *)&v14 = v24;
    LODWORD(v15) = 1.0;
    v16 = CFSTR("camera");
    v17 = CFSTR("unknown");
    LODWORD(v18) = 2.0;
    if (v24 == 7.0)
      v17 = CFSTR("original");
    if (v24 != 2.0)
      v16 = v17;
    if (v24 != 1.0)
      v13 = v16;
    if (v24 == 0.0)
      v19 = CFSTR("voice");
    else
      v19 = v13;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("renderingStyleString"), v14, v15, v18);
    objc_msgSend(v7, "effects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("effect"));
  }

  return v5;
}

+ (BOOL)metadataTrackContainsCinematicAudioData:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifier:", a3, kCinematicAudioMetadataIdentifier);
}

+ (BOOL)metadataTrackContainsLegacyCinematicAudioData:(id)a3
{
  return objc_msgSend(a1, "metadataTrack:containsIdentifiers:", a3, &unk_1E50A3898);
}

+ (id)metadataTrackWithCinematicAudioDataInAsset:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(a1, "metadataTrackContainsCinematicAudioData:", v9) & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)assetIsCinematicAudio:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "cinematicAudioTrackInAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)audioTrackIsCinematicAudio:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "formatDescriptions", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (FigAudioFormatDescriptionGetCinematicAudioEffectEligibility())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)cinematicAudioTrackInAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)assetReaderAudioSettingsForTrackType:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v16 = xmmword_1A6719E0C;
    v17 = *(_OWORD *)algn_1A6719E1C;
    v21[0] = &unk_1E50A26D0;
    v3 = *MEMORY[0x1E0C898A0];
    v20[0] = *MEMORY[0x1E0C89930];
    v20[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v4;
    v20[2] = *MEMORY[0x1E0C898E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1819304813);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C898F0];
    v21[2] = v5;
    v21[3] = &unk_1E50A26E8;
    v7 = *MEMORY[0x1E0C89910];
    v20[3] = v6;
    v20[4] = v7;
    v21[4] = MEMORY[0x1E0C9AAB0];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v21;
    v10 = v20;
  }
  else
  {
    v16 = xmmword_1A6719E2C;
    v17 = *(_OWORD *)algn_1A6719E3C;
    v19[0] = &unk_1E50A2700;
    v11 = *MEMORY[0x1E0C898A0];
    v18[0] = *MEMORY[0x1E0C89930];
    v18[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v4;
    v18[2] = *MEMORY[0x1E0C898E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1819304813);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C898F0];
    v19[2] = v5;
    v19[3] = &unk_1E50A26E8;
    v13 = *MEMORY[0x1E0C89910];
    v18[3] = v12;
    v18[4] = v13;
    v19[4] = MEMORY[0x1E0C9AAB0];
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v19;
    v10 = v18;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)assetWriterAudioSettingsForTrackWithSampleRate:(double)a3 isAmbisonic:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v17 = xmmword_1A6719E0C;
    v18 = *(_OWORD *)&qword_1A6719E1C;
    v21[0] = *MEMORY[0x1E0C898E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1634754915, 4028628997, 0, 0, unk_1A6719E24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v21[1] = *MEMORY[0x1E0C89970];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C898C8];
    v22[1] = v6;
    v22[2] = &unk_1E50A2718;
    v8 = *MEMORY[0x1E0C89930];
    v21[2] = v7;
    v21[3] = v8;
    v22[3] = &unk_1E50A26D0;
    v21[4] = *MEMORY[0x1E0C898A0];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v17, 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v22;
    v12 = v21;
  }
  else
  {
    v17 = xmmword_1A6719E2C;
    v18 = *(_OWORD *)&qword_1A6719E3C;
    v19[0] = *MEMORY[0x1E0C898E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1633772320, 6619138, 0, 0, unk_1A6719E44);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v19[1] = *MEMORY[0x1E0C89970];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C898C8];
    v20[1] = v6;
    v20[2] = &unk_1E50A2730;
    v14 = *MEMORY[0x1E0C89930];
    v19[2] = v13;
    v19[3] = v14;
    v20[3] = &unk_1E50A2700;
    v19[4] = *MEMORY[0x1E0C898A0];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v17, 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v20;
    v12 = v19;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)assetWriterAudioSettingsForAudioTrackFormatDescription:(opaqueCMFormatDescription *)a3
{
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a3);
  if (StreamBasicDescription)
  {
    v4 = StreamBasicDescription;
    v5 = *MEMORY[0x1E0C898E0];
    v14[0] = &unk_1E50A2748;
    v6 = *MEMORY[0x1E0C89970];
    v13[0] = v5;
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", StreamBasicDescription->mSampleRate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    v13[2] = *MEMORY[0x1E0C89930];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4->mChannelsPerFrame);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A6553000, v10, OS_LOG_TYPE_INFO, "AudioStreamBasicDescription missing", v12, 2u);
    }
    v9 = 0;
  }
  return v9;
}

+ (BOOL)track:(id)a3 hasSamplesForEachSampleInTrack:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTimeRange otherRange;
  CMTimeRange range2;
  CMTimeRange range;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  CMTimeRange buf;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    NUAssertLogger_12004();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "track");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v29;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v33;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 839, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"track");
  }
  v7 = v6;
  if (!v6)
  {
    NUAssertLogger_12004();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "referenceTrack");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v38;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v42;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 840, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"referenceTrack");
  }
  memset(&buf, 0, sizeof(buf));
  objc_msgSend(v5, "timeRange");
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  objc_msgSend(v7, "timeRange");
  v54 = 0;
  v55 = 0;
  v56 = 0;
  objc_msgSend(v7, "minFrameDuration");
  memset(&range, 0, sizeof(range));
  memset(&otherRange, 0, sizeof(otherRange));
  CMTimeRangeGetUnion(&range2, &range, &otherRange);
  range = buf;
  if (CMTimeRangeEqual(&range, &range2))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v5, "segments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "isEmpty") & 1) != 0)
          {
            v13 = 0;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isAssetUnsupportedCorruptPortraitVideo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v4, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v6 = v18;
  +[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:](NUVideoUtilities, "auxiliaryTrackInAsset:ofType:error:", v4, 2, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:](NUVideoUtilities, "metadataTrackWithPortraitVideoDataInAsset:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11 || v9 == 0)
    goto LABEL_10;
  if ((objc_msgSend(a1, "track:hasSamplesForEachSampleInTrack:", v7, v5) & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v14 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    v15 = "Detected corrupt cinematic asset with mismatched disparity track. Effect will not be applied. %@";
    goto LABEL_21;
  }
  if ((objc_msgSend(a1, "track:hasSamplesForEachSampleInTrack:", v10, v5) & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v14 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    v15 = "Detected corrupt cinematic asset with mismatched metadata track. Effect will not be applied. %@";
LABEL_21:
    _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_18:
    v13 = 1;
    goto LABEL_19;
  }
LABEL_10:
  v13 = 0;
LABEL_19:

  return v13;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)readStillImageTimeFromVideoAsset:(SEL)a3
{
  id v6;
  _OWORD *v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  NSObject *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v18;
  CMTime v19;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (_OWORD *)MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(a2, "metadataTrackWithStillImageDisplayTimeMarkerInLivePhotoAsset:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_9:
    retstr->var0 = value;
    retstr->var1 = timescale;
    retstr->var2 = flags;
    retstr->var3 = epoch;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v6, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if ((objc_msgSend(v12, "canAddOutput:", v11) & 1) != 0)
  {
    objc_msgSend(v12, "addOutput:", v11);
    objc_msgSend(v12, "startReading");
    do
    {
      v14 = (opaqueCMSampleBuffer *)objc_msgSend(v11, "copyNextSampleBuffer");
      if (!v14)
        break;
      v15 = v14;
      if (CMSampleBufferGetNumSamples(v14))
      {
        CMSampleBufferGetOutputPresentationTimeStamp(&v19, v15);
        value = v19.value;
        flags = v19.flags;
        timescale = v19.timescale;
        epoch = v19.epoch;
      }
      CFRelease(v15);
    }
    while ((flags & 1) == 0);
    objc_msgSend(v12, "cancelReading");

    goto LABEL_9;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
  v16 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    LODWORD(v19.value) = 138412290;
    *(CMTimeValue *)((char *)&v19.value + 4) = (CMTimeValue)v12;
    _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_INFO, "Unable to add sampleOutput to reader: %@", (uint8_t *)&v19, 0xCu);
  }
  *(_OWORD *)&retstr->var0 = *v7;
  retstr->var3 = epoch;

LABEL_15:
  return result;
}

+ (BOOL)readFromReader:(id)a3 andWriteToWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 progress:(id)a10 error:(id *)a11
{
  _BOOL4 v13;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFArray *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  unsigned int v44;
  unint64_t v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  const char *v55;
  NSObject *v56;
  dispatch_queue_t v57;
  id v58;
  id v59;
  NSObject *v60;
  dispatch_queue_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *specific;
  NSObject *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  _BOOL4 v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  NSObject *group;
  id v114;
  id v115;
  id v116;
  _QWORD v117[4];
  NSObject *v118;
  _QWORD v119[4];
  id v120;
  NSObject *v121;
  uint8_t *v122;
  __int128 v123;
  int64_t var3;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  NSObject *v129;
  _QWORD *v130;
  _QWORD *v131;
  uint8_t *v132;
  uint64_t *v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  char v137;
  _QWORD v138[3];
  char v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[4];
  __int128 v151;
  uint64_t v152;
  uint8_t buf[24];
  void *v154;
  __int128 v155;
  uint64_t v156;
  _BYTE v157[128];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[4];

  v13 = a6;
  v160[1] = *MEMORY[0x1E0C80C00];
  v116 = a3;
  v114 = a4;
  v108 = a7;
  v115 = a10;
  if (!a11)
  {
    NUAssertLogger_12004();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v75;
      _os_log_error_impl(&dword_1A6553000, v74, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v78)
      {
        v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v82 = (void *)MEMORY[0x1E0CB3978];
        v83 = v81;
        objc_msgSend(v82, "callStackSymbols");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v81;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v85;
        _os_log_error_impl(&dword_1A6553000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v78)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "componentsJoinedByString:", CFSTR("\n"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v80;
      _os_log_error_impl(&dword_1A6553000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 944, CFSTR("Invalid parameter not satisfying: %s"), v86, v87, v88, v89, (uint64_t)"error != NULL");
  }
  v109 = 0;
  v107 = a5;
  if ((a5->var2 & 1) != 0 && v13)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v16 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_INFO, "Creating custom metadata input for keyframe time", buf, 2u);
    }
    *(_QWORD *)buf = 0;
    v17 = *MEMORY[0x1E0CA2518];
    v158[0] = *MEMORY[0x1E0CA2528];
    v158[1] = v17;
    v18 = *MEMORY[0x1E0CA2468];
    v159[0] = *MEMORY[0x1E0CA4CC0];
    v159[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v160[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 1);
    v20 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v20, (CMMetadataFormatDescriptionRef *)buf);
    v21 = objc_alloc(MEMORY[0x1E0C8B020]);
    v109 = (void *)objc_msgSend(v21, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7D0], 0, *(_QWORD *)buf);
    CFRelease(*(CFTypeRef *)buf);
    if (!objc_msgSend(v114, "canAddInput:", v109))
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add metadata track input to asset writer"), v116);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    objc_msgSend(v114, "addInput:", v109);

  }
  if ((objc_msgSend(v116, "startReading") & 1) != 0)
  {
    if ((objc_msgSend(v114, "startWriting") & 1) != 0)
    {
      v112 = *MEMORY[0x1E0CA2E68];
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      v111 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      *(_QWORD *)&buf[16] = v111;
      objc_msgSend(v114, "startSessionAtSourceTime:", buf);
      if (v109)
        v22 = -1;
      else
        v22 = 0;
      objc_msgSend(v116, "outputs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      objc_msgSend(v114, "inputs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24 == objc_msgSend(v25, "count") + v22;

      if (!v26)
      {
        NUAssertLogger_12004();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reader outputs should match writer inputs"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v91;
          _os_log_error_impl(&dword_1A6553000, v90, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_12004();
        v93 = objc_claimAutoreleasedReturnValue();
        v94 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
        if (v92)
        {
          if (v94)
          {
            v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v98 = (void *)MEMORY[0x1E0CB3978];
            v99 = v97;
            objc_msgSend(v98, "callStackSymbols");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "componentsJoinedByString:", CFSTR("\n"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v97;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v101;
            _os_log_error_impl(&dword_1A6553000, v93, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v94)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "componentsJoinedByString:", CFSTR("\n"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v96;
          _os_log_error_impl(&dword_1A6553000, v93, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 979, CFSTR("Reader outputs should match writer inputs"), v102, v103, v104, v105, v106);
      }
      v151 = *MEMORY[0x1E0CA2E18];
      v152 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v150[0] = 0;
      v150[1] = v150;
      v150[2] = 0x2020000000;
      v150[3] = 0;
      v27 = (uint64_t *)MEMORY[0x1E0C8A808];
      if (v115)
      {
        objc_msgSend(v116, "asset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
          objc_msgSend(v28, "duration");
        else
          memset(buf, 0, sizeof(buf));
        v151 = *(_OWORD *)buf;
        v152 = *(_QWORD *)&buf[16];
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        objc_msgSend(v116, "outputs");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v147;
          v41 = *v27;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v147 != v40)
                objc_enumerationMutation(v38);
              objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * i), "mediaType");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "isEqualToString:", v41);

              v37 += v44;
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
          }
          while (v39);
        }

      }
      else
      {
        v37 = 0;
      }
      v140 = 0;
      v141 = &v140;
      v142 = 0x3032000000;
      v143 = __Block_byref_object_copy__11997;
      v144 = __Block_byref_object_dispose__11998;
      v145 = 0;
      group = dispatch_group_create();
      v45 = 0;
      v110 = *v27;
      while (1)
      {
        objc_msgSend(v116, "outputs");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v45 < objc_msgSend(v46, "count");

        if (!v47)
          break;
        objc_msgSend(v114, "inputs");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v116, "outputs");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectAtIndexedSubscript:", v45);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v115)
        {
          objc_msgSend(v51, "mediaType");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", v110);

        }
        else
        {
          v53 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("export_track_queue_%lu"), v45);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v55 = (const char *)objc_msgSend(v54, "UTF8String");
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = dispatch_queue_create(v55, v56);

        v138[0] = 0;
        v138[1] = v138;
        v138[2] = 0x2020000000;
        v139 = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3810000000;
        v154 = &unk_1A674C0CB;
        v155 = v112;
        v156 = v111;
        dispatch_group_enter(group);
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke;
        v125[3] = &unk_1E5062158;
        v137 = v53;
        v130 = v138;
        v131 = v150;
        v126 = v115;
        v134 = v37;
        v58 = v49;
        v127 = v58;
        v59 = v51;
        v135 = v151;
        v136 = v152;
        v128 = v59;
        v132 = buf;
        v133 = &v140;
        v129 = group;
        objc_msgSend(v58, "requestMediaDataWhenReadyOnQueue:usingBlock:", v57, v125);

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v138, 8);

        ++v45;
      }
      if (v109)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = dispatch_queue_create("metadata track queue", v60);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        dispatch_group_enter(group);
        v119[0] = MEMORY[0x1E0C809B0];
        v119[1] = 3221225472;
        v119[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_147;
        v119[3] = &unk_1E5062180;
        v122 = buf;
        v120 = v109;
        v123 = *(_OWORD *)&v107->var0;
        var3 = v107->var3;
        v121 = group;
        objc_msgSend(v120, "requestMediaDataWhenReadyOnQueue:usingBlock:", v61, v119);

        _Block_object_dispose(buf, 8);
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_group_enter(group);
      if (v115 && objc_msgSend(v115, "isCancelled"))
      {
        objc_msgSend(v116, "cancelReading");
        objc_msgSend(v114, "cancelWriting");
        dispatch_group_leave(group);
      }
      else
      {
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_148;
        v117[3] = &unk_1E5064008;
        v118 = group;
        objc_msgSend(v114, "finishWritingWithCompletionHandler:", v117);

      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if (objc_msgSend(v116, "status") == 3)
      {
        v62 = (void *)v141[5];
        if (v62)
        {
          v35 = 0;
          *a11 = objc_retainAutorelease(v62);
LABEL_66:

          _Block_object_dispose(&v140, 8);
          _Block_object_dispose(v150, 8);
          goto LABEL_23;
        }
        objc_msgSend(v116, "error");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read from AVAsset"), v116, v68);
        v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a11 = v69;

        goto LABEL_65;
      }
      if (objc_msgSend(v116, "status") == 4)
      {
        objc_msgSend(v116, "error");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 10, CFSTR("Cancelled read from AVAsset"), v116, v63);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_65;
      }
      if (objc_msgSend(v114, "status") != 3)
      {
        if (objc_msgSend(v114, "status") != 4)
        {
          v35 = 1;
          goto LABEL_66;
        }
        objc_msgSend(v114, "error");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 10, CFSTR("Cancelled write to AVAsset"), v114, v70);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_65:
        v35 = 0;
        goto LABEL_66;
      }
      objc_msgSend(v114, "error");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "domain");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v65, "isEqualToString:", *MEMORY[0x1E0C8A2F8]))
      {
        v66 = objc_msgSend(v64, "code") == -11840;

        if (v66)
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 12, CFSTR("Failed to write AVAsset"), v114, v64);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        }
      }
      else
      {

      }
      v71 = (void *)v141[5];
      if (!v71)
      {
        objc_msgSend(v114, "error");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to write to AVAsset"), v114, v72);
        v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a11 = v73;

        goto LABEL_64;
      }
      v67 = objc_retainAutorelease(v71);
LABEL_62:
      *a11 = v67;
LABEL_64:

      goto LABEL_65;
    }
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v114, "outputURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Could not start writing AVAsset %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v114, "error");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, v33, v114, v34);
    *a11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v116, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not start reading AVAsset"), v116, v30);
    *a11 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_22:
  v35 = 0;
LABEL_23:

  return v35;
}

+ (BOOL)updateVideoMetadataAtURL:(id)a3 withItems:(id)a4 stillImageTime:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v44;
  void *v45;
  void *specific;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE buf[24];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!a6)
  {
    NUAssertLogger_12004();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities updateVideoMetadataAtURL:withItems:stillImageTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1164, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"error != NULL");
  }
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v12, a6);
  if (!v13)
  {
    LOBYTE(v39) = 0;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:isDirectory:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v18;
  objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v15, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathExtension:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathExtension");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NUFileTypeFromExtension(v22);
  v23 = objc_claimAutoreleasedReturnValue();

  v66 = (void *)v23;
  v67 = (void *)v21;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B018]), "initWithURL:fileType:error:", v21, v23, a6);
  if (!v24)
  {
    LOBYTE(v39) = 0;
    v40 = v67;
    v41 = v68;
    v42 = v66;
    goto LABEL_29;
  }
  v60 = a6;
  v61 = v15;
  v64 = v9;
  objc_msgSend(v12, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  v63 = v11;
  objc_msgSend(v26, "addObjectsFromArray:", v11);
  v65 = v26;
  objc_msgSend(v24, "setMetadata:", v26);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v62 = v12;
  objc_msgSend(v12, "tracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (!v27)
    goto LABEL_16;
  v28 = v27;
  v29 = *(_QWORD *)v72;
  v69 = *MEMORY[0x1E0C8A7D0];
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v72 != v29)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      if ((a5->var2 & 1) != 0)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "mediaType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", v69);

        if ((v33 & 1) != 0)
          continue;
      }
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v31, 0);
      objc_msgSend(v34, "setAlwaysCopiesSampleData:", 0);
      if ((objc_msgSend(v13, "canAddOutput:", v34) & 1) != 0)
      {
        objc_msgSend(v13, "addOutput:", v34);
        v35 = objc_alloc(MEMORY[0x1E0C8B020]);
        objc_msgSend(v31, "mediaType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v35, "initWithMediaType:outputSettings:", v36, 0);

        if (objc_msgSend(v24, "canAddInput:", v37))
        {
          objc_msgSend(v24, "addInput:", v37);

          continue;
        }
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track input to asset writer"), v13);
        *v60 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track output to asset reader"), v13);
        *v60 = (id)objc_claimAutoreleasedReturnValue();
      }

      LOBYTE(v39) = 0;
      v11 = v63;
      v9 = v64;
      v15 = v61;
      v12 = v62;
      v40 = v67;
      v41 = v68;
      goto LABEL_24;
    }
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v28)
      continue;
    break;
  }
LABEL_16:

  *(_OWORD *)buf = *(_OWORD *)&a5->var0;
  *(_QWORD *)&buf[16] = a5->var3;
  if (!+[NUVideoUtilities readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:](NUVideoUtilities, "readFromReader:andWriteToWriter:stillImageTime:createCustomMetadata:geometryTransform:inputSize:outputSize:progress:error:", v13, v24, buf, 1, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v60))
  {
    LOBYTE(v39) = 0;
    v11 = v63;
    v9 = v64;
    v15 = v61;
    v12 = v62;
    v40 = v67;
    v41 = v68;
LABEL_27:
    v42 = v66;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v64;
  v39 = objc_msgSend(v38, "removeItemAtURL:error:", v64, v60);

  v15 = v61;
  v40 = v67;
  if (!v39)
  {
    v12 = v62;
    v11 = v63;
    v41 = v68;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  obj = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = objc_msgSend(obj, "moveItemAtURL:toURL:error:", v67, v64, v60);
  v12 = v62;
  v11 = v63;
  v41 = v68;
LABEL_24:
  v42 = v66;

LABEL_28:
LABEL_29:

LABEL_30:
  return v39;
}

+ (id)deepMutableCopyVideoComposition:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *specific;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v3, "instructions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
          v14 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v15 = (void *)MEMORY[0x1E0CB3940];
            v16 = v14;
            objc_msgSend(v15, "stringWithFormat:", CFSTR("incorrect class of video instruction"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = v17;
            _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            v18 = _NULogOnceToken;
            v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
            if (v18 != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
          }
          else
          {
            v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
          }
          v20 = (id)_NUAssertLogger;
          v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
          if (v19)
          {
            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = v23;
              _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            }
          }
          else if (v21)
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v25 = (void *)MEMORY[0x1E0CB3978];
            v26 = specific;
            objc_msgSend(v25, "callStackSymbols");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = specific;
            v39 = 2114;
            v40 = v28;
            _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
          _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities deepMutableCopyVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1346, CFSTR("incorrect class of video instruction"), v29, v30, v31, v32, v33);
        }
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "setInstructions:", v5);
  return v4;
}

+ (id)requiredVideoCompositionOutputTracksForAsset:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D75130];
  v4 = *MEMORY[0x1E0C8A808];
  v5 = a3;
  objc_msgSend(v3, "tracksWithMediaType:forAsset:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A8], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)readerOutputForAsset:(id)a3 outputSettings:(id)a4 videoComposition:(id)a5 auxiliaryImageType:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!a7)
  {
    NUAssertLogger_12004();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readerOutputForAsset:outputSettings:videoComposition:auxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1371, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  v15 = v14;
  if (v14)
  {
    objc_msgSend(a1, "requiredVideoCompositionOutputTracksForAsset:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B008]), "initWithVideoTracks:videoSettings:", v16, v13);
    objc_msgSend(v17, "setVideoComposition:", v15);
  }
  else
  {
    if ((unint64_t)a6 > 1)
      +[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:](NUVideoUtilities, "auxiliaryTrackInAsset:ofType:error:", v12, a6, a7);
    else
      +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v12, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(a1, "readerOutputForAssetTrack:outputSettings:error:", v16, v13, a7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

+ (id)readerOutputForAssetTrack:(id)a3 outputSettings:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 auxiliaryImageType:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CVBuffer *v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!a8)
  {
    NUAssertLogger_12004();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readVideoFrameAtTime:fromAsset:outputSettings:videoComposition:auxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1411, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  v17 = v16;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v14, a8);
  if (v18)
  {
    objc_msgSend(a1, "readerOutputForAsset:outputSettings:videoComposition:auxiliaryImageType:error:", v14, v15, v17, a7, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      *(_OWORD *)buf = *(_OWORD *)&a3->var0;
      *(_QWORD *)&buf[16] = a3->var3;
      v20 = (__CVBuffer *)objc_msgSend(a1, "readVideoFrameAtTime:fromAsset:reader:readerOutput:error:", buf, v14, v18, v19, a8);
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (__CVBuffer)readVideoFrameAtTime:(id *)a3 fromAsset:(id)a4 reader:(id)a5 readerOutput:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  __CVBuffer *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, const void *, void *, int);
  void *v20;
  id v21;
  CMTime *p_start;
  id *v23;
  __int128 v24;
  int64_t var3;
  CMTime start;
  uint64_t v27;
  CMTimeRange v28;
  CMTime duration;
  CMTimeRange v30;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "setAlwaysCopiesSampleData:", 1);
  CMTimeMake(&duration, 1, 240);
  start = *(CMTime *)a3;
  CMTimeRangeMake(&v30, &start, &duration);
  v28 = v30;
  objc_msgSend(v12, "setTimeRange:", &v28);
  if ((objc_msgSend(v12, "canAddOutput:", v13) & 1) == 0)
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track output to asset reader"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v14 = 0;
    *a7 = v15;
    goto LABEL_7;
  }
  objc_msgSend(v12, "addOutput:", v13);
  if ((objc_msgSend(v12, "startReading") & 1) == 0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  start.value = 0;
  *(_QWORD *)&start.timescale = &start;
  start.epoch = 0x2020000000;
  v27 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __77__NUVideoUtilities_readVideoFrameAtTime_fromAsset_reader_readerOutput_error___block_invoke;
  v20 = &unk_1E50621A8;
  p_start = &start;
  v23 = a7;
  v24 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v21 = v11;
  +[NUVideoUtilities readNextPixelBuffer:output:block:](NUVideoUtilities, "readNextPixelBuffer:output:block:", v12, v13, &v17);
  objc_msgSend(v12, "cancelReading", v17, v18, v19, v20);
  v14 = *(__CVBuffer **)(*(_QWORD *)&start.timescale + 24);

  _Block_object_dispose(&start, 8);
LABEL_7:

  return v14;
}

+ (id)readTimedMetadataGroupAtTime:(id *)a3 fromTrack:(id)a4 outputSettings:(id)a5 videoComposition:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CMTimeEpoch epoch;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CMTimeRange v39;
  CMTimeRange v40;
  CMTime time1;
  CMTimeRange range;
  CMTime lhs;
  CMTime time2;
  CMTime rhs;
  CMTime buf;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a7)
  {
    NUAssertLogger_12004();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v30;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v34;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1477, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v14 = v13;
  objc_msgSend(v11, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v15, a7);
  if (v16)
  {
    memset(&buf, 0, sizeof(buf));
    +[NUVideoUtilities minimumFrameDurationForAsset:](NUVideoUtilities, "minimumFrameDurationForAsset:", v15);
    if (v11)
      objc_msgSend(v11, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    CMTimeRangeGetEnd(&lhs, &range);
    rhs = buf;
    CMTimeSubtract(&time2, &lhs, &rhs);
    time1 = (CMTime)*a3;
    CMTimeMinimum(&rhs, &time1, &time2);
    *(_OWORD *)&a3->var0 = *(_OWORD *)&rhs.value;
    epoch = rhs.epoch;
    a3->var3 = rhs.epoch;
    *(_OWORD *)&rhs.value = *(_OWORD *)&a3->var0;
    rhs.epoch = epoch;
    time1 = buf;
    CMTimeRangeMake(&v40, &rhs, &time1);
    v39 = v40;
    objc_msgSend(v16, "setTimeRange:", &v39);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v11, v12);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v19);
    if ((objc_msgSend(v16, "canAddOutput:", v19) & 1) != 0)
    {
      objc_msgSend(v16, "addOutput:", v19);
      if ((objc_msgSend(v16, "startReading") & 1) != 0)
      {
        objc_msgSend(v20, "nextTimedMetadataGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cancelReading");
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v16, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Cannot add track output to asset reader"), v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0;
    *a7 = v21;
    goto LABEL_13;
  }
  v17 = 0;
LABEL_14:

  return v17;
}

+ (int64_t)videoOrientationForAssetPreferredTransform:(CGAffineTransform *)a3
{
  __n128 v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v7[3];

  v3 = *(__n128 *)&a3->c;
  v7[0] = *(__n128 *)&a3->a;
  v7[1] = v3;
  v7[2] = *(__n128 *)&a3->tx;
  v4 = NUOrientationFromCGAffineTransform(v7);
  v5 = NUOrientationConcat(v4, 4);
  return NUOrientationConcat(4, v5);
}

+ (int64_t)videoOrientationForAsset:(id)a3 videoComposition:(id)a4
{
  int64_t v4;
  void *v6;
  id v7;
  NSObject *v8;
  _BYTE v10[48];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4)
    return 1;
  v11 = 0;
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", a3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    objc_msgSend(v6, "preferredTransform");
    v4 = objc_msgSend(a1, "videoOrientationForAssetPreferredTransform:", v10);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Failed to get video track: %{public}@", buf, 0xCu);
    }
    v4 = 1;
  }

  return v4;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)naturalSizeOfTrack:(id)a3 oriented:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  _OWORD v16[3];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "naturalSize");
  v8 = (uint64_t)v7;
  objc_msgSend(v6, "naturalSize");
  v10 = (uint64_t)v9;
  if (((uint64_t)v9 | v8) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    if (!v4)
      goto LABEL_7;
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (v6)
    objc_msgSend(v6, "preferredTransform");
  else
    memset(v16, 0, sizeof(v16));
  v8 = NUOrientationTransformImageSize(objc_msgSend(a1, "videoOrientationForAssetPreferredTransform:", v16), v8, v10);
  v10 = v11;
LABEL_7:

  v12 = v8;
  v13 = v10;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)encodedPixelSizeOfTrack:(id)a3 oriented:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t Dimensions;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "formatDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v8);
  v10 = (int)Dimensions;
  v11 = Dimensions >> 32;
  if ((((int)Dimensions | (unint64_t)(Dimensions >> 32)) & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

    if (!v4)
      goto LABEL_7;
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (v6)
    objc_msgSend(v6, "preferredTransform");
  else
    memset(v17, 0, sizeof(v17));
  v10 = NUOrientationTransformImageSize(objc_msgSend(a1, "videoOrientationForAssetPreferredTransform:", v17), v10, v11);
  v11 = v12;
LABEL_7:

  v13 = v10;
  v14 = v11;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

+ ($209B98C1CDF2DEBD503CBDE3C0ED7C90)cleanApertureOfTrack:(SEL)a3 oriented:(id)a4
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  CGPoint v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGSize size;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  CGSize v19;
  CGPoint v20;
  _OWORD v21[3];
  _OWORD v22[2];
  CGRect v23;
  CGRect CleanAperture;

  v5 = a5;
  v8 = a4;
  objc_msgSend(v8, "formatDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CleanAperture = CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v10, 0);
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  v23 = CleanAperture;
  NU::RectT<long>::RectT(v22, &v23, 1);
  v11 = (CGPoint)v22[0];
  v12 = ($0AC6E346AE4835514AAA8AC86D8F4844)v22[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v22[0];
  retstr->var1 = v12;
  if (v5)
  {
    v19 = (CGSize)v12;
    v20 = v11;
    v13 = objc_msgSend(a2, "encodedPixelSizeOfTrack:oriented:", v8, 0);
    v15 = v14;
    if (v8)
      objc_msgSend(v8, "preferredTransform");
    else
      memset(v21, 0, sizeof(v21));
    v16 = objc_msgSend(a2, "videoOrientationForAssetPreferredTransform:", v21);
    v23.origin = v20;
    v23.size = v19;
    NU::RectT<long>::applyOrientation((uint64_t *)&v23, v16, v13, v15);
    size = v23.size;
    retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v23.origin;
    retstr->var1 = ($0AC6E346AE4835514AAA8AC86D8F4844)size;
  }

  return result;
}

+ (id)newPixelBufferOfSize:(id)a3 format:(unsigned int)a4
{
  size_t var1;
  size_t var0;
  const __CFDictionary *v7;
  CVReturn v8;
  CVReturn v9;
  NSObject *v10;
  NUCVPixelBuffer *v11;
  NUCVPixelBuffer *v12;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  CVReturn v22;
  uint64_t v23;
  _QWORD v24[2];

  var1 = a3.var1;
  var0 = a3.var0;
  v24[1] = *MEMORY[0x1E0C80C00];
  v23 = *MEMORY[0x1E0CA8FF0];
  v24[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferOut = 0;
  v8 = CVPixelBufferCreate(0, var0, var1, a4, v7, &pixelBufferOut);
  if (v8)
  {
    v9 = v8;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v16 = var0;
      v17 = 1024;
      v18 = var1;
      v19 = 1024;
      v20 = a4;
      v21 = 1024;
      v22 = v9;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Failed to allocate CVPixelBuffer of size: %dx%d, format: %u, error: %d", buf, 0x1Au);
    }
    v11 = 0;
  }
  else
  {
    v12 = [NUCVPixelBuffer alloc];
    v11 = -[NUCVPixelBuffer initWithCVPixelBuffer:](v12, "initWithCVPixelBuffer:", pixelBufferOut);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v11;
}

+ ($D3A4C128BFADF90F63068A1E85A19F01)conformRange:(SEL)a3 inRange:(id *)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  $D3A4C128BFADF90F63068A1E85A19F01 *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTimeRange v15;
  CMTimeRange otherRange;
  CMTimeRange range;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v7 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
  v8 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&otherRange.start.epoch = v8;
  *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(a2, "convertTimeRange:toMaximumTimeScaleOfRange:", &range, &otherRange);
  v9 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
  v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&otherRange.start.epoch = v10;
  *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  result = ($D3A4C128BFADF90F63068A1E85A19F01 *)CMTimeRangeContainsTimeRange(&range, &otherRange);
  if (!(_DWORD)result)
  {
    v12 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&otherRange.start.epoch = v12;
    *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
    v13 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v15.start.value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v15.start.epoch = v13;
    *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&retstr->var1.var1;
    result = ($D3A4C128BFADF90F63068A1E85A19F01 *)CMTimeRangeGetIntersection(&range, &otherRange, &v15);
    v14 = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&range.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&range.duration.timescale;
  }
  return result;
}

+ ($D3A4C128BFADF90F63068A1E85A19F01)convertTimeRange:(SEL)a3 toMaximumTimeScaleOfRange:(id *)a4
{
  int32_t var1;
  CMTime v9;
  CMTime start;
  CMTime time;
  CMTime v12;

  if (a5->var0.var1 <= a5->var1.var1)
    var1 = a5->var1.var1;
  else
    var1 = a5->var0.var1;
  memset(&v12, 0, sizeof(v12));
  time = (CMTime)a4->var0;
  CMTimeConvertScale(&v12, &time, var1, kCMTimeRoundingMethod_RoundAwayFromZero);
  memset(&time, 0, sizeof(time));
  start = (CMTime)a4->var1;
  CMTimeConvertScale(&time, &start, var1, kCMTimeRoundingMethod_RoundTowardZero);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  start = v12;
  v9 = time;
  return ($D3A4C128BFADF90F63068A1E85A19F01 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v9);
}

+ (id)repeatVideoComposition:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  CMTimeEpoch v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int64_t v79;
  __int128 v80;
  uint64_t v81;
  CMTimeRange v82;
  __int128 v83;
  _OWORD v84[2];
  CMTime duration;
  CMTimeRange v86;
  CMTime start;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CMTime v91;
  CMTime v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CMTime lhs;
  __int128 v98;
  _OWORD v99[2];
  CMTime rhs;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  CMTime v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_12004();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoComposition != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v50;
        LOWORD(v107.flags) = 2114;
        *(_QWORD *)((char *)&v107.flags + 2) = v54;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1640, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"videoComposition != nil");
  }
  if (a4 <= 0)
  {
    NUAssertLogger_12004();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count > 0");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v59;
        LOWORD(v107.flags) = 2114;
        *(_QWORD *)((char *)&v107.flags + 2) = v63;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1641, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    NUAssertLogger_12004();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v107, 0xCu);

    }
    v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E0CB3978];
        v70 = v68;
        objc_msgSend(v69, "callStackSymbols");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v107.value) = 138543618;
        *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v68;
        LOWORD(v107.flags) = 2114;
        *(_QWORD *)((char *)&v107.flags + 2) = v72;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v107, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107.value) = 138543362;
      *(CMTimeValue *)((char *)&v107.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v107, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideoComposition:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1642, CFSTR("Invalid parameter not satisfying: %s"), v73, v74, v75, v76, (uint64_t)"error != nil");
  }
  v8 = v7;
  if (a4 == 1)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v7, "instructions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v78 = v8;
      v80 = *MEMORY[0x1E0CA2E68];
      *(_OWORD *)&v107.value = *MEMORY[0x1E0CA2E68];
      v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v107.epoch = v11;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v77 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v102 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            if (v17)
            {
              objc_msgSend(v17, "timeRange");
            }
            else
            {
              memset(v99, 0, sizeof(v99));
              v98 = 0u;
            }
            rhs = *(CMTime *)((char *)v99 + 8);
            lhs = v107;
            CMTimeAdd(&v107, &lhs, &rhs);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
        }
        while (v14);
      }

      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0;
      *(_OWORD *)&lhs.value = v80;
      lhs.epoch = v11;
      v79 = a4;
      do
      {
        v81 = v19;
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v20 = v12;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v94 != v23)
                objc_enumerationMutation(v20);
              v25 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * j);
              v26 = (void *)objc_msgSend(v25, "copy");
              objc_msgSend(v25, "renderContext");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "setRenderContext:", v27);
              memset(&v92, 0, sizeof(v92));
              if (v26)
              {
                objc_msgSend(v26, "timeRange");
              }
              else
              {
                v89 = 0u;
                v90 = 0u;
                v88 = 0u;
              }
              *(_OWORD *)&v91.value = v88;
              v91.epoch = v89;
              start = lhs;
              CMTimeAdd(&v92, &v91, &start);
              if (v26)
              {
                objc_msgSend(v26, "timeRange");
              }
              else
              {
                memset(v84, 0, sizeof(v84));
                v83 = 0u;
              }
              duration = *(CMTime *)((char *)v84 + 8);
              start = v92;
              CMTimeRangeMake(&v86, &start, &duration);
              v82 = v86;
              objc_msgSend(v26, "setTimeRange:", &v82);
              objc_msgSend(v18, "addObject:", v26);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
          }
          while (v22);
        }

        v92 = lhs;
        start = v107;
        CMTimeAdd(&lhs, &v92, &start);
        v19 = v81 + 1;
      }
      while (v81 + 1 != v79);
      v8 = v78;
      v9 = (id)objc_msgSend(v78, "copy");
      objc_msgSend(v9, "setInstructions:", v18);

      v10 = v77;
    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("missing instructions"), v8);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

+ (id)repeatAudio:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTimeEpoch v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id obj;
  __int128 v79;
  CMTimeRange start;
  CMTime duration;
  CMTime rhs;
  CMTime v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CMTimeRange range;
  CMTime v89;
  uint64_t v90;
  _BYTE v91[128];
  CMTimeRange buf;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_12004();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "audio != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v54;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1692, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"audio != nil");
  }
  if (a4 <= 0)
  {
    NUAssertLogger_12004();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count > 0");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v59;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v63;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1693, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    NUAssertLogger_12004();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v47)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v69 = (void *)MEMORY[0x1E0CB3978];
        v70 = v68;
        objc_msgSend(v69, "callStackSymbols");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v68;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v72;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatAudio:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1694, CFSTR("Invalid parameter not satisfying: %s"), v73, v74, v75, v76, (uint64_t)"error != nil");
  }
  v8 = v7;
  if (a4 == 1
    || (objc_msgSend(v7, "inputParameters"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        !v10))
  {
    v27 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v90 = 0;
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v8, "inputParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&v89.value = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v89.epoch = v13;
    do
    {
      range.start = v89;
      v14 = objc_msgSend(v12, "getVolumeRampForTime:startVolume:endVolume:timeRange:", &range, (char *)&v90 + 4, &v90, &buf);
      range = buf;
      CMTimeRangeGetEnd(&v89, &range);
    }
    while ((v14 & 1) != 0);
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "inputParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v77 = v8;
    objc_msgSend(v8, "inputParameters");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v85 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          v23 = (void *)objc_msgSend(v22, "mutableCopy");
          v24 = 1;
          do
          {
            *(_OWORD *)&range.start.value = v79;
            range.start.epoch = v13;
            if (objc_msgSend(v22, "getVolumeRampForTime:startVolume:endVolume:timeRange:", &range, (char *)&v90 + 4, &v90, &buf))
            {
              do
              {
                memset(&v83, 0, sizeof(v83));
                range.start = v89;
                CMTimeMultiplyByRatio(&rhs, &range.start, v24, 1);
                *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
                range.start.epoch = buf.start.epoch;
                CMTimeAdd(&v83, &range.start, &rhs);
                memset(&range, 0, sizeof(range));
                start.start = v83;
                duration = buf.duration;
                CMTimeRangeMake(&range, &start.start, &duration);
                LODWORD(v25) = HIDWORD(v90);
                LODWORD(v26) = v90;
                start = range;
                objc_msgSend(v23, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &start, v25, v26);
                range = buf;
                CMTimeRangeGetEnd(&start.start, &range);
                *(_OWORD *)&range.start.value = *(_OWORD *)&start.start.value;
                range.start.epoch = start.start.epoch;
              }
              while ((objc_msgSend(v22, "getVolumeRampForTime:startVolume:endVolume:timeRange:", &range, (char *)&v90 + 4, &v90, &buf) & 1) != 0);
            }
            range = buf;
            CMTimeRangeGetEnd(&start.start, &range);
            ++v24;
          }
          while (v24 != a4);
          objc_msgSend(v17, "addObject:", v23);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setInputParameters:", v17);

    v8 = v77;
  }

  return v27;
}

+ (id)repeatVideo:(id)a3 count:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  int v23;
  NSObject *v25;
  void *v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  CMTime v79;
  CMTime v80;
  id v81;
  _OWORD v82[3];
  CMTime lhs;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CMTime rhs;
  CMTime v88;
  _OWORD v89[3];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CMTime v97;
  CMTime v98;
  _BYTE v99[128];
  CMTime buf[2];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_12004();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "video != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v46;
        LOWORD(buf[0].flags) = 2114;
        *(_QWORD *)((char *)&buf[0].flags + 2) = v50;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1769, CFSTR("Invalid parameter not satisfying: %s"), v51, v52, v53, v54, (uint64_t)"video != nil");
  }
  if (a4 <= 0)
  {
    NUAssertLogger_12004();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count > 0");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v55;
        LOWORD(buf[0].flags) = 2114;
        *(_QWORD *)((char *)&buf[0].flags + 2) = v59;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1770, CFSTR("Invalid parameter not satisfying: %s"), v60, v61, v62, v63, (uint64_t)"count > 0");
  }
  if (!a5)
  {
    NUAssertLogger_12004();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v65 = (void *)MEMORY[0x1E0CB3978];
        v66 = v64;
        objc_msgSend(v65, "callStackSymbols");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v64;
        LOWORD(buf[0].flags) = 2114;
        *(_QWORD *)((char *)&buf[0].flags + 2) = v68;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities repeatVideo:count:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1771, CFSTR("Invalid parameter not satisfying: %s"), v69, v70, v71, v72, (uint64_t)"error != nil");
  }
  v8 = v7;
  if (a4 == 1)
  {
    v9 = v7;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C8B268]);
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      memset(buf, 0, sizeof(buf));
      if (v12
        && (objc_msgSend(v12, "timeRange"), (buf[0].flags & 1) != 0)
        && (buf[1].flags & 1) != 0
        && !buf[1].epoch
        && (buf[1].value & 0x8000000000000000) == 0)
      {
        v98 = buf[1];
        v97 = buf[0];
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        objc_msgSend(v8, "tracks");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
        v15 = 0;
        if (v75)
        {
          v16 = *(_QWORD *)v94;
          v77 = v14;
          v78 = v10;
          v73 = *(_QWORD *)v94;
          v74 = v13;
          do
          {
            v17 = 0;
            v18 = v15;
            while (2)
            {
              if (*(_QWORD *)v94 != v16)
                objc_enumerationMutation(v14);
              v76 = v17;
              v19 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v17);
              objc_msgSend(v19, "mediaType");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addMutableTrackWithMediaType:preferredTrackID:", v20, objc_msgSend(v19, "trackID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v19, "preferredTransform");
              }
              else
              {
                v91 = 0u;
                v92 = 0u;
                v90 = 0u;
              }
              v89[0] = v90;
              v89[1] = v91;
              v89[2] = v92;
              objc_msgSend(v21, "setPreferredTransform:", v89);
              objc_msgSend(v19, "preferredVolume");
              objc_msgSend(v21, "setPreferredVolume:");
              objc_msgSend(v21, "setNaturalTimeScale:", objc_msgSend(v19, "naturalTimeScale"));
              memset(&v88, 0, sizeof(v88));
              if (v19)
              {
                objc_msgSend(v19, "timeRange");
              }
              else
              {
                v85 = 0u;
                v86 = 0u;
                v84 = 0u;
              }
              *(_OWORD *)&rhs.value = v84;
              rhs.epoch = v85;
              lhs = v97;
              CMTimeAdd(&v88, &lhs, &rhs);
              v22 = a4;
              do
              {
                if (v19)
                  objc_msgSend(v19, "timeRange");
                else
                  memset(v82, 0, sizeof(v82));
                v81 = v18;
                lhs = v88;
                v23 = objc_msgSend(v21, "insertTimeRange:ofTrack:atTime:error:", v82, v19, &lhs, &v81);
                v15 = v81;

                if (!v23)
                {
                  +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update track"), v21, v15);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  v9 = 0;
                  v10 = v78;
                  v13 = v74;
                  goto LABEL_38;
                }
                v80 = v88;
                v79 = v98;
                CMTimeAdd(&lhs, &v80, &v79);
                v88 = lhs;
                v18 = v15;
                --v22;
              }
              while (v22);

              v17 = v76 + 1;
              v18 = v15;
              v14 = v77;
              v10 = v78;
              v16 = v73;
              if (v76 + 1 != v75)
                continue;
              break;
            }
            v13 = v74;
            v75 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
          }
          while (v75);
        }

        v9 = v10;
LABEL_38:

      }
      else
      {
        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("primary video track timerange is invalid"), v8);
        v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("No video tracks in input"), v8);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

+ (id)videoDescription:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  uint64_t i;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v16;
  id obj;
  CMTimeRange v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTimeRange range;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v3;
  objc_msgSend(v3, "tracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "mediaType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v11, "timeRange");
        else
          memset(&v18, 0, sizeof(v18));
        range = v18;
        v13 = (__CFString *)CMTimeRangeCopyDescription(v9, &range);
        objc_msgSend(v11, "segments");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("#:%d  media:%@  range:%@  segments %@\n"), v7 + i, v12, v13, v14);

      }
      v7 = (v7 + i);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)videoCompositionDescription:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  uint64_t i;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  Float64 Seconds;
  void *v23;
  CMTimeRange v24;
  CMTime v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime time;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTimeRange v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTimeRange range;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "appendFormat:", CFSTR("Video Composition: %@\n"), v3);
  objc_msgSend(v4, "appendString:", CFSTR("Instructions: \n"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v3;
  objc_msgSend(v3, "instructions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "timeRange");
        else
          memset(&v34, 0, sizeof(v34));
        range = v34;
        v13 = (__CFString *)CMTimeRangeCopyDescription(v9, &range);
        objc_msgSend(v12, "adjustmentComposition");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("instruction i:%@ tr:%@ c:%@\n"), v12, v13, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(v23, "instructions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (v20)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "timeRange");
          *(_OWORD *)&time.value = v26;
          time.epoch = v27;
          Seconds = CMTimeGetSeconds(&time);
          objc_msgSend(v20, "timeRange");
        }
        else
        {
          v27 = 0u;
          v28 = 0u;
          v26 = 0u;
          memset(&time, 0, sizeof(time));
          Seconds = CMTimeGetSeconds(&time);
          memset(&v24, 0, sizeof(v24));
        }
        CMTimeRangeGetEnd(&v25, &v24);
        objc_msgSend(v4, "appendFormat:", CFSTR("| %5.3f  %5.3f |"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v25));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v17);
  }

  return v4;
}

+ (BOOL)compositionInstructions:(id)a3 areEqualToCompositionInstructions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(v5, "instructions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instructions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if ((v7 != 0) == (v8 == 0))
    *((_BYTE *)v17 + 24) = 0;
  if (v7 && v8)
  {
    v10 = objc_msgSend(v7, "count");
    if (v10 == objc_msgSend(v9, "count"))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __78__NUVideoUtilities_compositionInstructions_areEqualToCompositionInstructions___block_invoke;
      v13[3] = &unk_1E50621D0;
      v14 = v9;
      v15 = &v16;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

    }
    else
    {
      *((_BYTE *)v17 + 24) = 0;
    }
  }
  v11 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (id)cleanApertureVideoSettingsFor:(id *)a3 scale:(id)a4 videoSize:(id)a5
{
  int64_t var1;
  int64_t var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64x2_t v24[2];
  int64x2_t v25;
  __int128 v26;
  _QWORD v27[4];
  _QWORD v28[5];

  var1 = a5.var1;
  var0 = a5.var0;
  v28[4] = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v7 = a3->var1;
  v24[0] = (int64x2_t)a3->var0;
  v24[1] = (int64x2_t)v7;
  NUPixelRectScaleRational(v24, a4.var0, a4.var1, 1, &v25);
  v8 = NUEvenPixelSize(v26, *((uint64_t *)&v26 + 1));
  v10 = v9;
  if (var0 >= 0)
    v11 = var0;
  else
    v11 = var0 + 1;
  if (var1 >= 0)
    v12 = var1;
  else
    v12 = var1 + 1;
  if (v8 >= 0)
    v13 = v8;
  else
    v13 = v8 + 1;
  v14 = v25.i64[0] - (v11 >> 1);
  if (v9 >= 0)
    v15 = v9;
  else
    v15 = v9 + 1;
  v16 = v14 + (v13 >> 1);
  v17 = v25.i64[1] - (v12 >> 1) + (v15 >> 1);
  v27[0] = *MEMORY[0x1E0C8AE50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v27[1] = *MEMORY[0x1E0C8AE30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  v27[2] = *MEMORY[0x1E0C8AE38];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v27[3] = *MEMORY[0x1E0C8AE48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)debugDescriptionOfAssetTrack:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  objc_msgSend(v4, "segments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\nSegments:\n\t%@"), v9);

  v10 = (void *)objc_msgSend(v7, "copy");
  return v10;
}

+ (id)pixelFormatStringForCVPixelBuffer:(__CVBuffer *)a3
{
  OSType PixelFormatType;
  void *v4;
  const __CFString *v5;
  unsigned int v7;

  if (!a3)
    return &stru_1E5068958;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v4 = (void *)objc_opt_new();
  v7 = bswap32(PixelFormatType);
  objc_msgSend(v4, "appendFormat:", CFSTR("(%.4s)"), &v7);
  switch(PixelFormatType)
  {
    case 0x78343230u:
      v5 = CFSTR(" - 10bit video range");
      goto LABEL_9;
    case 0x34323076u:
      v5 = CFSTR(" - 8bit video range");
      goto LABEL_9;
    case 0x34323066u:
      v5 = CFSTR(" - 8bit full range");
LABEL_9:
      objc_msgSend(v4, "appendString:", v5);
      break;
  }
  return v4;
}

+ (id)compositionFromVideoComposition:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *specific;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  _BYTE v36[12];
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = 0;
  if (!v5)
  {
LABEL_7:
    v6 = v6;
    v14 = v6;
    goto LABEL_21;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v3, "instructions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_6:

    ++v7;
    objc_msgSend(v3, "instructions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v7 >= v13)
      goto LABEL_7;
  }
  v10 = v9;
  v11 = v10;
  if (!v6)
  {
    objc_msgSend(v10, "adjustmentComposition");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
  v15 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = v15;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("More than one NUComposition found in the AVVideoComposition. Cannot determine which to use."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v36 = 138543362;
    *(_QWORD *)&v36[4] = v18;
    _os_log_impl(&dword_1A6553000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v36, 0xCu);

    v19 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v19 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
LABEL_15:
      v20 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = specific;
        v28 = v20;
        objc_msgSend(v26, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v36 = 138543618;
        *(_QWORD *)&v36[4] = specific;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);

        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if (v19 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_15;
  }
  v31 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)MEMORY[0x1E0CB3978];
    v28 = v31;
    objc_msgSend(v33, "callStackSymbols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v36 = 138543362;
    *(_QWORD *)&v36[4] = v35;
    _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);

LABEL_23:
  }
LABEL_20:
  _NUAssertContinueHandler((uint64_t)"+[NUVideoUtilities compositionFromVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1985, CFSTR("More than one NUComposition found in the AVVideoComposition. Cannot determine which to use."), v21, v22, v23, v24, *(uint64_t *)v36);

  v14 = 0;
LABEL_21:

  return v14;
}

+ (id)urlOfAVAsset:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "URL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v5, "tracks");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v4 = 0;
      if (v24)
      {
        v7 = *(_QWORD *)v32;
        v22 = *(_QWORD *)v32;
        v23 = v5;
        v25 = v6;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v32 != v7)
              objc_enumerationMutation(v6);
            v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v9, "segments", v22);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v28;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v28 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                  objc_msgSend(v15, "sourceURL");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v16)
                  {
                    objc_msgSend(v15, "sourceURL");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = objc_msgSend(v4, "isEqual:", v17);

                    if ((v18 & 1) == 0)
                    {
                      if (v4)
                      {
                        if (_NULogOnceToken != -1)
                          dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
                        v21 = _NULogger;
                        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "More than one url found in AVComposition. urlOfAVAsset will return nil.", buf, 2u);
                        }

                        v19 = 0;
                        goto LABEL_25;
                      }
                      objc_msgSend(v15, "sourceURL");
                      v4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v12)
                  continue;
                break;
              }
            }

            v6 = v25;
            v7 = v22;
          }
          v5 = v23;
          v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v24);
      }

    }
    else
    {
      v4 = 0;
    }
  }
  v4 = v4;
  v19 = v4;
LABEL_25:

  return v19;
}

+ (CGAffineTransform)preferredTransformFromOrientation:(SEL)a3 size:(int64_t)a4
{
  int64_t var1;
  int64_t var0;
  uint64_t v8;
  uint64_t v9;

  var1 = a5.var1;
  var0 = a5.var0;
  v8 = NUOrientationConcat(a4, 4);
  v9 = NUOrientationConcat(4, v8);
  return NUOrientationMakeTransformWithSizeAndOrigin(v9, var0, var1, 0, 0, (uint64_t)retstr);
}

+ (id)semanticStylePropertiesFromMetadataGroup:(id)a3 keyTime:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE buf[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_12004();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadataGroup != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2044, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"metadataGroup != nil");
  }
  if (!a5)
  {
    NUAssertLogger_12004();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12004();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v41;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 2045, CFSTR("Invalid parameter not satisfying: %s"), v42, v43, v44, v45, (uint64_t)"error != NULL");
  }
  v8 = v7;
  objc_msgSend(v7, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_QWORD *)&buf[16] = a4->var3;
    +[_NUSemanticStyleProperties semanticStylePropertiesFromVideoMetadata:keyTime:error:](_NUSemanticStyleProperties, "semanticStylePropertiesFromVideoMetadata:keyTime:error:", v11, buf, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Missing metadata group in sample"), v8);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)indexesOfSemanticStyleVideoSampleSlices:(id)a3
{
  void *v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__NUVideoUtilities_indexesOfSemanticStyleVideoSampleSlices___block_invoke;
  v5[3] = &unk_1E50621F8;
  v6 = &unk_1E50A38B0;
  objc_msgSend(a3, "indexesOfObjectsPassingTest:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)trimCompositionTracks:(id)a3 toRange:(id *)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  CMTimeRange *Intersection;
  void *v14;
  BOOL v15;
  __int128 v16;
  __CFString *v17;
  _QWORD v20[4];
  id v21;
  CMTimeRange *v22;
  CMTimeRange v23;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v26;
  CMTimeRange time2;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTimeRange time1;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    v9 = MEMORY[0x1E0CA2E68];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var1.var0;
        time1.start.epoch = a4->var1.var3;
        *(_OWORD *)&time2.start.value = *(_OWORD *)v9;
        time2.start.epoch = *(_QWORD *)(v9 + 16);
        if (!CMTimeCompare(&time1.start, &time2.start))
        {
          v16 = *(_OWORD *)&a4->var0.var3;
          *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0.var0;
          *(_OWORD *)&time1.start.epoch = v16;
          *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&a4->var1.var1;
          v17 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time1);
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 6, CFSTR("duration of the trim is zero or -ve"), v17);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v15 = 0;
          goto LABEL_18;
        }
        memset(&time1, 0, sizeof(time1));
        if (v11)
          objc_msgSend(v11, "timeRange");
        v12 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&v26.start.value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&v26.start.epoch = v12;
        *(_OWORD *)&v26.duration.timescale = *(_OWORD *)&a4->var1.var1;
        memset(&time2, 0, sizeof(time2));
        range = time1;
        +[NUVideoUtilities convertTimeRange:toMaximumTimeScaleOfRange:](NUVideoUtilities, "convertTimeRange:toMaximumTimeScaleOfRange:", &v26, &range);
        if (v11)
          objc_msgSend(v11, "timeRange");
        else
          memset(&otherRange, 0, sizeof(otherRange));
        range = time2;
        Intersection = CMTimeRangeGetIntersection(&v26, &range, &otherRange);
        time2 = v26;
        if (__56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke((uint64_t)Intersection, (uint64_t)&v26))
        {
          v26.start.value = 0;
          *(_QWORD *)&v26.start.timescale = &v26;
          v26.start.epoch = 0x3032000000;
          v26.duration.value = (CMTimeValue)__Block_byref_object_copy__11997;
          *(_QWORD *)&v26.duration.timescale = __Block_byref_object_dispose__11998;
          v26.duration.epoch = (CMTimeEpoch)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "segments");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke_2;
          v20[3] = &unk_1E5062240;
          v23 = time2;
          v21 = &__block_literal_global_235;
          v22 = &v26;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);

          objc_msgSend(v11, "setSegments:", *(_QWORD *)(*(_QWORD *)&v26.start.timescale + 40));
          _Block_object_dispose(&v26, 8);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_18:

  return v15;
}

BOOL __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  int v4;
  _QWORD *v5;
  _BOOL8 result;
  CMTime v7;
  CMTime time1;

  v2 = *(_DWORD *)(a2 + 12);
  result = (v2 & 1) != 0
        && (v4 = *(_DWORD *)(a2 + 36), (v4 & 1) != 0)
        && ((v5 = (_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 40))
         || (*v5 & 0x8000000000000000) != 0
         || (*(_OWORD *)&time1.value = *(_OWORD *)v5,
             time1.epoch = *(_QWORD *)(a2 + 40),
             v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
             CMTimeCompare(&time1, &v7))
         && (v2 = *(_DWORD *)(a2 + 12), (v2 & 1) != 0)
         && (v4 = *(_DWORD *)(a2 + 36), (v4 & 1) != 0))
        && !*(_QWORD *)(a2 + 40)
        && ((v4 | v2) & 0x10) == 0
        && (*v5 & 0x8000000000000000) == 0;
  return result;
}

void __56__NUVideoUtilities_trimCompositionTracks_toRange_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __int128 v5;
  unsigned int (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTimeRange v16;
  CMTimeRange v17;
  CMTime start;
  CMTime lhs;
  CMTime rhs;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTimeRange v27;
  CMTimeRange v28;
  CMTimeRange v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CMTimeRange v33;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeMapping");
    v33 = v29;
    objc_msgSend(v4, "timeMapping");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    memset(&v29, 0, sizeof(v29));
    memset(&v33, 0, sizeof(v33));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    memset(&v27, 0, sizeof(v27));
  }
  v28 = v27;
  v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 80);
  memset(&v23, 0, sizeof(v23));
  otherRange = v27;
  CMTimeRangeGetIntersection(&v23, &range, &otherRange);
  v6 = *(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  range = v23;
  if (v6())
  {
    if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
    {
      memset(&range, 0, 24);
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&v23.start.value;
      otherRange.start.epoch = v23.start.epoch;
      rhs = v28.start;
      CMTimeSubtract(&range.start, &otherRange.start, &rhs);
      memset(&otherRange, 0, 24);
      rhs = v23.duration;
      lhs = v28.duration;
      CMTimeSubtract(&otherRange.start, &rhs, &lhs);
      rhs = v33.start;
      lhs = range.start;
      CMTimeAdd(&v33.start, &rhs, &lhs);
      lhs = v33.duration;
      start = otherRange.start;
      CMTimeAdd(&rhs, &lhs, &start);
      v33.duration = rhs;
    }
    rhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "timeMapping");
      }
      else
      {
        v15 = 0u;
        memset(&v16, 0, sizeof(v16));
        v13 = 0u;
        v14 = 0u;
      }
      v17 = v16;
      CMTimeRangeGetEnd(&rhs, &v17);

    }
    v28.start = rhs;
    v28.duration = v23.duration;
    v9 = (void *)MEMORY[0x1E0C8B190];
    objc_msgSend(v4, "sourceURL", v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "sourceTrackID");
    range = v33;
    otherRange = v28;
    objc_msgSend(v9, "compositionTrackSegmentWithURL:trackID:sourceTimeRange:targetTimeRange:", v10, v11, &range, &otherRange);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12);
  }

}

uint64_t __60__NUVideoUtilities_indexesOfSemanticStyleVideoSampleSlices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "containsMetadataSampleForKey:", NUSourceIdentifierSmartStyleVideoMetadata))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "integerValue", (_QWORD)v15);
          v10 = CFSTR("Invalid");
          if (v9 <= 0xC)
            v10 = off_1E5060F88[v9];
          v11 = v10;
          v12 = objc_msgSend(v3, "containsVideoFrameForKey:", v11);

          if (!v12)
          {
            v13 = 0;
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __78__NUVideoUtilities_compositionInstructions_areEqualToCompositionInstructions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "adjustmentComposition");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "adjustmentComposition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 != 0) == (v9 == 0) || v8 && (objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }

      }
    }
  }

}

void __77__NUVideoUtilities_readVideoFrameAtTime_fromAsset_reader_readerOutput_error___block_invoke(uint64_t a1, const void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  const __CFAllocator *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  CMTime v15;
  CMTime time;

  v7 = a3;
  v8 = v7;
  if (a2)
  {
    CFRetain(a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  else if (v7 || !a4)
  {
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    time = *(CMTime *)(a1 + 56);
    v11 = (__CFString *)CMTimeCopyDescription(v10, &time);
    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_msgSend(v12, "duration");
    else
      memset(&v15, 0, sizeof(v15));
    v13 = (__CFString *)CMTimeCopyDescription(v10, &v15);
    objc_msgSend(v9, "stringWithFormat:", CFSTR("read past end of video. requestedTime:%@ assetDuration:%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError invalidError:object:](NUError, "invalidError:object:", v14, *(_QWORD *)(a1 + 32));
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _OWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  opaqueCMSampleBuffer *v8;
  CMTime *PresentationTimeStamp;
  double Seconds;
  CMTime *p_lhs;
  void *v12;
  char v13;
  CMTime rhs;
  CMTime lhs;
  CMTime v16;
  CMTime buf;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 128))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v2 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A6553000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "markAsFinished");
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isReadyForMoreMediaData"))
  {
    v3 = (_OWORD *)(a1 + 104);
    do
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        break;
      v4 = (void *)MEMORY[0x1A85C1390]();
      v5 = *(void **)(a1 + 32);
      if (v5 && objc_msgSend(v5, "isCancelled"))
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
        v6 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl(&dword_1A6553000, v6, OS_LOG_TYPE_INFO, "AVAsset reading and writing canceled via NSProgress", (uint8_t *)&buf, 2u);
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v7 = (void *)MEMORY[0x1A85C1390]();
        v8 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 48), "copyNextSampleBuffer");
        objc_autoreleasePoolPop(v7);
        if (v8)
        {
          if (*(_BYTE *)(a1 + 128) && (*(_DWORD *)(a1 + 116) & 0x1D) == 1 && *(uint64_t *)v3 >= 1)
          {
            memset(&buf, 0, sizeof(buf));
            CMSampleBufferGetDuration(&buf, v8);
            if ((buf.flags & 0x1D) == 1)
            {
              lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
              rhs = buf;
              CMTimeAdd(&v16, &lhs, &rhs);
              *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = v16;
              lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
              Seconds = CMTimeGetSeconds(&lhs);
              *(_OWORD *)&lhs.value = *v3;
              lhs.epoch = *(_QWORD *)(a1 + 120);
              p_lhs = &lhs;
              goto LABEL_29;
            }
            memset(&lhs, 0, sizeof(lhs));
            PresentationTimeStamp = CMSampleBufferGetPresentationTimeStamp(&lhs, v8);
            if ((lhs.flags & 0x1D) == 1)
            {
              *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = lhs;
              rhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
              Seconds = CMTimeGetSeconds(&rhs);
              *(_OWORD *)&rhs.value = *v3;
              rhs.epoch = *(_QWORD *)(a1 + 120);
              p_lhs = &rhs;
LABEL_29:
              PresentationTimeStamp = (CMTime *)objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((fmin(Seconds / CMTimeGetSeconds(p_lhs), 1.0)+ (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24))/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
            }
          }
          v12 = (void *)MEMORY[0x1A85C1390](PresentationTimeStamp);
          v13 = objc_msgSend(*(id *)(a1 + 40), "appendSampleBuffer:", v8);
          objc_autoreleasePoolPop(v12);
          CFRelease(v8);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13 ^ 1;
          goto LABEL_31;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
LABEL_31:
      objc_autoreleasePoolPop(v4);
    }
    while ((objc_msgSend(*(id *)(a1 + 40), "isReadyForMoreMediaData") & 1) != 0);
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 128))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)/ (double)*(unint64_t *)(a1 + 96)* (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")));
    }
    objc_msgSend(*(id *)(a1 + 40), "markAsFinished");
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_147(uint64_t a1)
{
  NSObject *v2;
  int32_t v3;
  CMTimeValue v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFArray *v10;
  const __CFAllocator *v11;
  uint64_t v12;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  uint64_t v14;
  uint64_t DataPointer;
  char *v16;
  int32_t v17;
  __int128 v18;
  uint64_t v19;
  CMSampleBufferRef v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  BOOL v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *specific;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  size_t sampleSizeArray;
  CMTime time;
  CMTime v103;
  char *dataPointerOut;
  CMBlockBufferRef theBuffer;
  CMSampleBufferRef v106;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint64_t v108;
  int v109;
  uint8_t v110[4];
  void *v111;
  __int16 v112;
  void *v113;
  CMSampleTimingInfo buf;
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];

  v117[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_359);
    v2 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.duration.value) = 0;
      _os_log_impl(&dword_1A6553000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
  }
  else
  {
    v3 = *(_DWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 68);
    formatDescriptionOut = 0;
    v108 = v5;
    v109 = *(_DWORD *)(a1 + 76);
    theBuffer = 0;
    v106 = 0;
    v6 = *MEMORY[0x1E0CA4CC0];
    v7 = *MEMORY[0x1E0CA2518];
    v115[0] = *MEMORY[0x1E0CA2528];
    v115[1] = v7;
    v8 = *MEMORY[0x1E0CA2468];
    v116[0] = v6;
    v116[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
    v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v10, &formatDescriptionOut);
    if ((_DWORD)v12)
    {
      v21 = v12;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      v22 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v22;
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to CMMetadataFormatDescriptionCreateWithMetadataSpecifications: %d"), v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v25;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        v26 = _NULogOnceToken;
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v26 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      }
      else
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      v28 = (id)_NUAssertLogger;
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (v27)
      {
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v31;
          _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

        }
      }
      else if (v29)
      {
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E0CB3978];
        v67 = specific;
        objc_msgSend(v66, "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)specific;
        LOWORD(buf.duration.flags) = 2114;
        *(_QWORD *)((char *)&buf.duration.flags + 2) = v69;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1241, CFSTR("Failed to CMMetadataFormatDescriptionCreateWithMetadataSpecifications: %d"), v70, v71, v72, v73, v21);
    }
    LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
    v14 = CMBlockBufferCreateWithMemoryBlock(v11, 0, 9uLL, v11, 0, 0, 9uLL, 1u, &theBuffer);
    if ((_DWORD)v14)
    {
      v32 = v14;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      v33 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = v33;
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Failed to CMBlockBufferCreateWithMemoryBlock: %d"), v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v36;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        v37 = _NULogOnceToken;
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v37 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      }
      else
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      v39 = (id)_NUAssertLogger;
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
      if (v38)
      {
        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v42;
          _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

        }
      }
      else if (v40)
      {
        v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v75 = (void *)MEMORY[0x1E0CB3978];
        v76 = v74;
        objc_msgSend(v75, "callStackSymbols");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "componentsJoinedByString:", CFSTR("\n"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v74;
        LOWORD(buf.duration.flags) = 2114;
        *(_QWORD *)((char *)&buf.duration.flags + 2) = v78;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1255, CFSTR("Failed to CMBlockBufferCreateWithMemoryBlock: %d"), v79, v80, v81, v82, v32);
    }
    dataPointerOut = 0;
    DataPointer = CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut);
    if ((_DWORD)DataPointer)
    {
      v43 = DataPointer;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      v44 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v45 = (void *)MEMORY[0x1E0CB3940];
        v46 = v44;
        objc_msgSend(v45, "stringWithFormat:", CFSTR("Failed to CMBlockBufferGetDataPointer: %d"), v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v47;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

        v48 = _NULogOnceToken;
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v48 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      }
      else
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      v50 = (id)_NUAssertLogger;
      v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
      if (v49)
      {
        if (v51)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.duration.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v53;
          _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

        }
      }
      else if (v51)
      {
        v83 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v84 = (void *)MEMORY[0x1E0CB3978];
        v85 = v83;
        objc_msgSend(v84, "callStackSymbols");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "componentsJoinedByString:", CFSTR("\n"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.duration.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v83;
        LOWORD(buf.duration.flags) = 2114;
        *(_QWORD *)((char *)&buf.duration.flags + 2) = v87;
        _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1259, CFSTR("Failed to CMBlockBufferGetDataPointer: %d"), v88, v89, v90, v91, v43);
    }
    v16 = dataPointerOut;
    *(_DWORD *)dataPointerOut = 150994944;
    v16[8] = -1;
    dataPointerOut = v16 + 8;
    *((_DWORD *)v16 + 1) = bswap32(LocalIDForMetadataIdentifyingFactors);
    if (v3)
      v17 = v3;
    else
      v17 = 600;
    memset(&v103, 0, sizeof(v103));
    CMTimeMake(&time, 1, v17);
    CMTimeConvertScale(&v103, &time, v3, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v18 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&buf.decodeTimeStamp.value = v18;
    buf.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    buf.presentationTimeStamp.timescale = v3;
    HIDWORD(buf.presentationTimeStamp.epoch) = v109;
    *(_QWORD *)&buf.presentationTimeStamp.flags = v108;
    buf.duration = v103;
    buf.presentationTimeStamp.value = v4;
    sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
    v19 = CMSampleBufferCreate(v11, theBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &buf, 1, &sampleSizeArray, &v106);
    if ((_DWORD)v19)
    {
      v54 = v19;
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      v55 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        v56 = (void *)MEMORY[0x1E0CB3940];
        v57 = v55;
        objc_msgSend(v56, "stringWithFormat:", CFSTR("Failed to CMSampleBufferCreate: %d"), v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v110 = 138543362;
        v111 = v58;
        _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v110, 0xCu);

        v59 = _NULogOnceToken;
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
        if (v59 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_360);
      }
      else
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
      }
      v61 = (id)_NUAssertLogger;
      v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
      if (v60)
      {
        if (v62)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v110 = 138543362;
          v111 = v64;
          _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v110, 0xCu);

        }
      }
      else if (v62)
      {
        v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v93 = (void *)MEMORY[0x1E0CB3978];
        v94 = v92;
        objc_msgSend(v93, "callStackSymbols");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "componentsJoinedByString:", CFSTR("\n"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v110 = 138543618;
        v111 = v92;
        v112 = 2114;
        v113 = v96;
        _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v110, 0x16u);

      }
      _NUAssertFailHandler((uint64_t)"CMSampleBufferRef StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer(CMTime, int32_t)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUVideoUtilities.m", 1275, CFSTR("Failed to CMSampleBufferCreate: %d"), v97, v98, v99, v100, v54);
    }
    CFRelease(formatDescriptionOut);
    CFRelease(theBuffer);
    v20 = v106;

    objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v20);
    objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    CFRelease(v20);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __142__NUVideoUtilities_readFromReader_andWriteToWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_progress_error___block_invoke_148(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __47__NUVideoUtilities_cinematicAudioTrackInAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioTrackIsCinematicAudio:", a2);
}

void __53__NUVideoUtilities_readNextPixelBuffer_output_block___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v8 = v5;
    if (CMSampleBufferGetImageBuffer(a2))
    {
      v6 = v8;
    }
    else
    {
      +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("unable to get imageBuffer from sampleBuffer"), a2);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
  }
  v9 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__NUVideoUtilities_rgbVideoSettingsForAVAssetReader__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA9040];
  v3[0] = &unk_1E50A3850;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rgbVideoSettingsForAVAssetReader_videoSettings;
  rgbVideoSettingsForAVAssetReader_videoSettings = v0;

}

void __86__NUVideoUtilities_defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = *MEMORY[0x1E0CA9040];
  v0 = v15;
  v16[0] = &unk_1E50A37F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettings;
  defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettings = v1;

  v13 = v0;
  v14 = &unk_1E50A3808;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsHDR;
  defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsHDR = v3;

  v11 = v0;
  v12 = &unk_1E50A3820;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsDisparity;
  defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsDisparity = v5;

  v9 = v0;
  v10 = &unk_1E50A3838;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsAuxiliary;
  defaultVideoSettingsForAVAssetReaderWithHDR_forAuxiliaryImageType__videoSettingsAuxiliary = v7;

}

@end
