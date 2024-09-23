@implementation AVURLAsset

- (AVURLAsset)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  AVURLAsset *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVURLAsset;
  result = -[AVAsset init](&v7, sel_init);
  if (result)
    return (AVURLAsset *)avurlasset_setupGuts(result, URL, options, 0, 0);
  return result;
}

- (BOOL)_shouldOptimizeAccessForLinearMoviePlayback
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetOptimizeAccessForLinearMoviePlaybackKey")), "BOOLValue");
}

- (id)_assetInspectorLoader
{
  return self->_URLAsset->loader;
}

- (BOOL)_hasResourceLoaderDelegate
{
  return -[AVAssetResourceLoader delegate](self->_URLAsset->resourceLoader, "delegate") != 0;
}

+ (id)_getFigAssetCreationOptionsFromURLAssetInitializationOptions:(id)a3 assetLoggingIdentifier:(id)a4 figAssetCreationFlags:(unint64_t *)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  int v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  int v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t j;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t Token;
  const void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v115;
  id *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[56];
  _QWORD v129[5];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetReferenceRestrictionsKey"));
  if (v12)
    v13 = 4 * (objc_msgSend(v12, "unsignedIntegerValue") & 0xF);
  else
    v13 = 8;
  *a5 = v13;
  v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPreferNominalDurationsKey"));
  if (v14)
  {
    if ((objc_msgSend(v14, "BOOLValue") & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
LABEL_6:
    *a5 |= 0x100uLL;
LABEL_7:
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetDoNotLogURLsKey")), "BOOLValue"))*a5 |= 0x200uLL;
  v15 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetTypeKey"));
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(+[AVURLAsset _fileUTTypes](AVURLAsset, "_fileUTTypes"), "containsObject:", v15);
    if (v17 != objc_msgSend(+[AVURLAsset _streamingUTTypes](AVURLAsset, "_streamingUTTypes"), "containsObject:", v16))
    {
      v18 = (_QWORD *)MEMORY[0x1E0CC3C80];
      if (!v17)
        v18 = (_QWORD *)MEMORY[0x1E0CC3C88];
      objc_msgSend(v11, "setObject:forKey:", *v18, *MEMORY[0x1E0CC3728]);
    }
  }
  v19 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetClientBundleIdentifierKey"));
  if (v19)
    objc_msgSend(v11, "setObject:forKey:", v19, *MEMORY[0x1E0CC3708]);
  v20 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetClientAuditTokenKey"));
  if (v20)
    objc_msgSend(v11, "setObject:forKey:", v20, *MEMORY[0x1E0CC3700]);
  v21 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAlternativeConfigurationOptionsKey"));
  if (v21)
    objc_msgSend(v11, "setObject:forKey:", v21, *MEMORY[0x1E0CC36C8]);
  v22 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetSSLPropertiesKey"));
  if (v22)
    objc_msgSend(v11, "setObject:forKey:", v22, *MEMORY[0x1E0CC3878]);
  v23 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetMaxSizeAllowedForCellularAccessKey"));
  v24 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowsCellularAccessKey"));
  if (v24)
  {
    v25 = objc_msgSend(v24, "BOOLValue");
    if (v23 && ((v25 ^ (objc_msgSend(v23, "longLongValue") == 0)) & 1) == 0)
    {
      v67 = (void *)MEMORY[0x1E0C99DA0];
      v68 = *MEMORY[0x1E0C99778];
      v69 = CFSTR("AVURLAssetMaxSizeAllowedForCellularAccessKey and AVURLAssetAllowsCellularAccessKey options are incompatible");
      goto LABEL_190;
    }
    if ((v25 & 1) == 0)
      v23 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  }
  if (v23)
    objc_msgSend(v11, "setObject:forKey:", v23, *MEMORY[0x1E0CC37C0]);
  v26 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowsExpensiveNetworkAccessKey"));
  if (v26 && (objc_msgSend(v26, "BOOLValue") & 1) == 0)
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3750]);
  v27 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowsConstrainedNetworkAccessKey"));
  if (v27 && (objc_msgSend(v27, "BOOLValue") & 1) == 0)
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3748]);
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetInheritURIQueryComponentFromReferencingURIKey")), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37A0]);
  v28 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetBoundNetworkInterfaceName"));
  if (v28)
    objc_msgSend(v11, "setObject:forKey:", v28, *MEMORY[0x1E0CC36E8]);
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetUseAppleWirelessDirectLinkKey")), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC38B0]);
  v29 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPreferPreciseDurationAndTimingKey"));
  if (v29)
    objc_msgSend(v11, "setObject:forKey:", v29, *MEMORY[0x1E0CC3830]);
  v30 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetOutOfBandMIMETypeKey"));
  if (v30)
  {
    v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "componentsSeparatedByString:", CFSTR(";")),
            "firstObject");
    objc_msgSend(v11, "setObject:forKey:", v31, *MEMORY[0x1E0CC3818]);
  }
  v32 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetOverrideFileTypeKey"));
  if (v32)
    objc_msgSend(v11, "setObject:forKey:", v32, *MEMORY[0x1E0CC3810]);
  v33 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowableTypeCategoriesKey"));
  if (v33)
    objc_msgSend(v11, "setObject:forKey:", v33, *MEMORY[0x1E0CC36B0]);
  v34 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowableAudioCodecTypesKey"));
  if (v34)
    objc_msgSend(v11, "setObject:forKey:", v34, *MEMORY[0x1E0CC36A0]);
  v35 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowableVideoCodecTypesKey"));
  if (v35)
    objc_msgSend(v11, "setObject:forKey:", v35, *MEMORY[0x1E0CC36B8]);
  v36 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowableCaptionFormatsKey"));
  if (v36)
    objc_msgSend(v11, "setObject:forKey:", v36, *MEMORY[0x1E0CC36A8]);
  if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", a3))
  {
    v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v11, "setObject:forKey:", v37, *MEMORY[0x1E0CC3870]);
  }
  if (+[AVAsset _assetCreationOptionsPrefersSandboxedOption:](AVAsset, "_assetCreationOptionsPrefersSandboxedOption:", a3))
  {
    v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v11, "setObject:forKey:", v38, *MEMORY[0x1E0CC3838]);
  }
  v39 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetByteRangeInFileKey"));
  if (v39)
    objc_msgSend(v11, "setObject:forKey:", v39, *MEMORY[0x1E0CC36F0]);
  v40 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetHTTPUserAgentKey"));
  v41 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetHTTPHeaderFieldsKey"));
  if (!v41)
  {
    if (!v40)
      goto LABEL_74;
LABEL_70:
    v42 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    goto LABEL_71;
  }
  v42 = (id)v41;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v42 = 0;
  if (!v40)
    goto LABEL_72;
  if (!v42)
    goto LABEL_70;
  v42 = (id)objc_msgSend(v42, "mutableCopy");
  v43 = (void *)objc_msgSend(v42, "allKeys");
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __126__AVURLAsset__getFigAssetCreationOptionsFromURLAssetInitializationOptions_assetLoggingIdentifier_figAssetCreationFlags_error___block_invoke;
  v129[3] = &unk_1E3030F20;
  v129[4] = v42;
  objc_msgSend(v43, "enumerateObjectsUsingBlock:", v129);
LABEL_71:
  objc_msgSend(v42, "setObject:forKey:", v40, CFSTR("User-Agent"));
LABEL_72:
  if (v42)
    objc_msgSend(v11, "setObject:forKey:", v42, *MEMORY[0x1E0CC3798]);
LABEL_74:
  v44 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowedHTTPProtocolTypesKey"));
  if (v44)
    objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0CC36C0]);
  v45 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetApplicationTransportSecurityKey"));
  if (v45)
    objc_msgSend(v11, "setObject:forKey:", v45, *MEMORY[0x1E0CC36E0]);
  v46 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetCacheKey"));
  v47 = objc_msgSend(v46, "URL");
  if (v47)
  {
    objc_msgSend(v11, "setObject:forKey:", v47, *MEMORY[0x1E0CC37E8]);
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0CC3638], *MEMORY[0x1E0CC37D8]);
    if (objc_msgSend(v46, "isProgressiveDownloadCacheEnabled"))
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC36F8]);
    if ((objc_msgSend(v46, "isHTTPLiveStreamingCacheEnabled") & 1) != 0)
    {
      v48 = MEMORY[0x1E0C9AAB0];
      v49 = (_QWORD *)MEMORY[0x1E0CC3790];
LABEL_86:
      objc_msgSend(v11, "setObject:forKey:", v48, *v49);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetCacheUseNonPurgeableMemoryKey")), "BOOLValue"))
  {
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0CC3640], *MEMORY[0x1E0CC37D8]);
    v50 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetCacheNonPurgeableMemoryLimitKey"));
    if (v50)
    {
      v48 = v50;
      v49 = (_QWORD *)MEMORY[0x1E0CC37E0];
      goto LABEL_86;
    }
  }
  v51 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetVideoNotEligibleForAppRecordingKey"));
  v52 = (_QWORD *)MEMORY[0x1E0C9AE40];
  if (v51)
  {
    v53 = objc_msgSend(v51, "BOOLValue");
    v54 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v53)
      v54 = v52;
    objc_msgSend(v11, "setObject:forKey:", *v54, *MEMORY[0x1E0CC38B8]);
  }
  v55 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetUsesNoPersistentCacheKey"));
  v56 = v55;
  if (v55)
  {
    v57 = objc_msgSend(v55, "BOOLValue");
    v58 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v57)
      v58 = v52;
    objc_msgSend(v11, "setObject:forKey:", *v58, *MEMORY[0x1E0CC3800]);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetShouldMatchDataInCacheByURLPathComponentOnlyKey")), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37F0]);
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetShouldMatchDataInCacheByURLWithoutQueryComponentKey")), "BOOLValue"))objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37F8]);
  v59 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetReadAheadOnByteStreamCreationEnabledKey"));
  if (v59)
    objc_msgSend(v11, "setObject:forKey:", v59, *MEMORY[0x1E0CC37B8]);
  v60 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetNetworkProbeRequestDisabledKey"));
  v61 = (_QWORD *)MEMORY[0x1E0CC3740];
  if (v60)
    objc_msgSend(v11, "setObject:forKey:", v60, *MEMORY[0x1E0CC3740]);
  v62 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetNetworkLatencyMitigationKeyPodcastsOnly"));
  if (v62)
  {
    v63 = v62;
    objc_msgSend(v11, "setObject:forKey:", v62, *MEMORY[0x1E0CC3888]);
    objc_msgSend(v11, "setObject:forKey:", v63, *MEMORY[0x1E0CC3730]);
    objc_msgSend(v11, "setObject:forKey:", v63, *v61);
    objc_msgSend(v11, "setObject:forKey:", v63, *MEMORY[0x1E0CC36D8]);
    objc_msgSend(v11, "setObject:forKey:", v63, *MEMORY[0x1E0CC36D0]);
  }
  v64 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetDownloadDestinationURLKey"));
  if (v64)
    objc_msgSend(v11, "setObject:forKey:", v64, *MEMORY[0x1E0CC3760]);
  v65 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetDownloadIsLowPriorityKey"));
  if (v65)
    objc_msgSend(v11, "setObject:forKey:", v65, *MEMORY[0x1E0CC3768]);
  if (v56)
  {
    v66 = objc_msgSend(v56, "BOOLValue");
    if (v64)
    {
      if (v66)
      {
        v67 = (void *)MEMORY[0x1E0C99DA0];
        v68 = *MEMORY[0x1E0C99778];
        v69 = CFSTR("AVURLAssetDownloadDestinationURLKey and AVURLAssetUsesNoPersistentCacheKey options are incompatible");
LABEL_190:
        v113 = (void *)AVErrorForClientProgrammingError(objc_msgSend(v67, "exceptionWithName:reason:userInfo:", v68, v69, 0));
        v11 = 0;
        goto LABEL_191;
      }
    }
  }
  v70 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPreloadDurationWhenNextItemKey"));
  if (v70)
  {
    memset(&v128[32], 0, 24);
    objc_msgSend(v70, "CMTimeValue");
    *(CMTime *)v128 = *(CMTime *)&v128[32];
    objc_msgSend(v11, "setObject:forKey:", AVDictionaryWithTime((CMTime *)v128), *MEMORY[0x1E0CC3840]);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetOptimizeAccessForLinearMoviePlaybackKey")), "BOOLValue"))
  {
    v71 = *MEMORY[0x1E0C9AE50];
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37B8]);
    objc_msgSend(v11, "setObject:forKey:", v71, *MEMORY[0x1E0CC37A8]);
    objc_msgSend(v11, "setObject:forKey:", v71, *MEMORY[0x1E0CC3860]);
    objc_msgSend(v11, "setObject:forKey:", v71, *MEMORY[0x1E0CC3738]);
    objc_msgSend(v11, "setObject:forKey:", v71, *v61);
  }
  v72 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetPrepareForIncrementalFragmentsKey"));
  if (v72)
    objc_msgSend(v11, "setObject:forKey:", v72, *MEMORY[0x1E0CC3850]);
  v117 = a4;
  v73 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetRequiresCustomURLLoadingKey"));
  v74 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetUseClientURLLoadingExclusively"));
  if ((objc_msgSend(v73, "BOOLValue") & 1) != 0 || objc_msgSend(v74, "BOOLValue"))
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3868]);
  v75 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetProtectedContentSupportStorageURLKey"));
  v76 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPurchaseBundleKey"));
  v77 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAirPlayAuthorizationInfoKey"));
  v78 = v77;
  if (v75 || v76 || v77)
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v80 = v79;
    if (v75)
      objc_msgSend(v79, "setValue:forKey:", v75, *MEMORY[0x1E0CC33E0]);
    if (v76)
      objc_msgSend(v80, "setValue:forKey:", v76, *MEMORY[0x1E0CC33E8]);
    if (v78)
      objc_msgSend(v80, "setValue:forKey:", v78, *MEMORY[0x1E0CC33D8]);
    objc_msgSend(v11, "setObject:forKey:", v80, *MEMORY[0x1E0CC3718]);

  }
  v81 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetHTTPCookiesKey"));
  if (objc_msgSend(v81, "count"))
  {
    v82 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v81, "count"));
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v84; ++i)
        {
          if (*(_QWORD *)v125 != v85)
            objc_enumerationMutation(v81);
          v87 = objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * i), "properties");
          if (v87)
            objc_msgSend(v82, "addObject:", v87);
        }
        v84 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
      }
      while (v84);
    }
    objc_msgSend(v11, "setObject:forKey:", v82, *MEMORY[0x1E0CC3698]);
  }
  v88 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentInfoKey"));
  if (v88)
  {
    v89 = objc_msgSend(a1, "_getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:", v88);
    objc_msgSend(v11, "setObject:forKey:", v89, *MEMORY[0x1E0CC38C8]);
  }
  v90 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetOutOfBandAlternateTracksKey"));
  if (v90)
  {
    v91 = v90;
    v115 = v11;
    v116 = a6;
    v92 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v90, "count"));
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v121;
      v96 = *MEMORY[0x1E0CC5F10];
      v119 = *MEMORY[0x1E0C9AE50];
      v118 = *MEMORY[0x1E0CC5EF0];
      do
      {
        for (j = 0; j != v94; ++j)
        {
          if (*(_QWORD *)v121 != v95)
            objc_enumerationMutation(v91);
          v98 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v99 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v98);
            if (!objc_msgSend(v99, "objectForKey:", v96))
              objc_msgSend(v99, "setValue:forKey:", CFSTR("text"), v96);
            if (objc_msgSend((id)objc_msgSend(v99, "objectForKey:", CFSTR("MediaSelectionOptionsTaggedMediaCharacteristics")), "containsObject:", CFSTR("public.auxiliary-content")))objc_msgSend(v99, "setValue:forKey:", v119, v118);
            objc_msgSend(v92, "addObject:", v99);
          }
        }
        v94 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
      }
      while (v94);
    }
    v11 = v115;
    objc_msgSend(v115, "setObject:forKey:", v92, *MEMORY[0x1E0CC3808]);
    a6 = v116;
  }
  v100 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetEnableQUICKey"));
  if (v100)
    objc_msgSend(v11, "setObject:forKey:", v100, *MEMORY[0x1E0CC3778]);
  v101 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetForceQUICKey"));
  if (v101)
    objc_msgSend(v11, "setObject:forKey:", v101, *MEMORY[0x1E0CC3780]);
  v102 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetWhitelistQUICKey"));
  if (v102)
    objc_msgSend(v11, "setObject:forKey:", v102, *MEMORY[0x1E0CC38C0]);
  v103 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetEnableMultiPath"));
  if (v103)
    objc_msgSend(v11, "setObject:forKey:", v103, *MEMORY[0x1E0CC3770]);
  v104 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPrimarySessionIdentifierKey"));
  if (v104)
  {
    v105 = objc_msgSend(v104, "UUIDString");
    objc_msgSend(v11, "setObject:forKey:", v105, *MEMORY[0x1E0CC3858]);
  }
  v106 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetPreferLargeResourceRequests"));
  if (v106)
    objc_msgSend(v11, "setObject:forKey:", v106, *MEMORY[0x1E0CC3828]);
  if (v117)
    objc_msgSend(v11, "setObject:forKey:", v117, *MEMORY[0x1E0CC37B0]);
  v107 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetUnitTestOptions"));
  if (v107)
    objc_msgSend(v11, "setObject:forKey:", v107, *MEMORY[0x1E0CC38A8]);
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetParentNetworkActivityKey")))
  {
    Token = FigNWActivityCreateToken();
    if (Token)
    {
      v109 = (const void *)Token;
      objc_msgSend(v11, "setObject:forKey:", Token, *MEMORY[0x1E0CC3820]);
      CFRelease(v109);
    }
  }
  v110 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetURLRequestAttributionKey"));
  if (v110)
    objc_msgSend(v11, "setObject:forKey:", v110, *MEMORY[0x1E0CC38A0]);
  v111 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetShouldEnableLegacyWebKitCompatibilityModeForContentKeyRequests"));
  if (v111)
    objc_msgSend(v11, "setObject:forKey:", v111, *MEMORY[0x1E0CC3880]);
  v112 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetCustomURLLoaderKey"));
  if (v112)
    objc_msgSend(v11, "setObject:forKey:", v112, *MEMORY[0x1E0CC3720]);
  if ((dyld_program_sdk_at_least() & 1) == 0)
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3758]);
  v113 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetShouldSupportAIMEMetadataKey"));
  if (v113)
  {
    objc_msgSend(v11, "setObject:forKey:", v113, *MEMORY[0x1E0CC3890]);
    v113 = 0;
  }
LABEL_191:
  if (a6 && !v11)
    *a6 = v113;
  return v11;
}

- (id)tracks
{
  NSObject *tracksAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  tracksAccessQueue = self->_URLAsset->tracksAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__AVURLAsset_tracks__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(tracksAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)_UTTypes
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A30](getTypeAccessMutex_sTypeAccessMutex);
  v2 = (void *)gUTTypes;
  if (!gUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1)
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_854);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = +[AVURLAsset _fileUTTypes](AVURLAsset, "_fileUTTypes");
    if (v4)
      objc_msgSend(v3, "unionSet:", v4);
    v5 = +[AVURLAsset _streamingUTTypes](AVURLAsset, "_streamingUTTypes");
    if (v5)
      objc_msgSend(v3, "unionSet:", v5);
    gUTTypes = (uint64_t)(id)objc_msgSend(v3, "allObjects");

    v2 = (void *)gUTTypes;
  }
  v6 = v2;
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A48](getTypeAccessMutex_sTypeAccessMutex);
  return v6;
}

+ (id)_streamingUTTypes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A30](getTypeAccessMutex_sTypeAccessMutex);
  v3 = (void *)gStreamingUTTypes;
  if (!gStreamingUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1)
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_854);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "unionSet:", +[AVURLAsset _figStreamingUTIs](AVURLAsset, "_figStreamingUTIs"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = +[AVURLAsset _figStreamingMIMETypes](AVURLAsset, "_figStreamingMIMETypes");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    v7 = (uint64_t *)MEMORY[0x1E0CEC408];
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v27;
      v10 = *MEMORY[0x1E0CEC408];
      v11 = *MEMORY[0x1E0CEC458];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v13 = (void *)objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E0CEC3F8], "typesWithTag:tagClass:conformingToType:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v10, v11));
          if (AVAssetUTIsAreComplementary(v4, v13))
            objc_msgSend(v4, "addObjectsFromArray:", v13);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      v17 = *v7;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v5);
          v19 = (void *)objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E0CEC3F8], "typesWithTag:tagClass:conformingToType:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), v17, objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("public.playlist"))));
          if (AVAssetUTIsAreComplementary(v4, v19))
            objc_msgSend(v4, "addObjectsFromArray:", v19);
        }
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }
    gStreamingUTTypes = objc_msgSend(v4, "copy");

    v3 = (void *)gStreamingUTTypes;
  }
  v20 = v3;
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A48](getTypeAccessMutex_sTypeAccessMutex);
  return v20;
}

+ (id)_figStreamingUTIs
{
  FigCopySetOfStreamingSupportedUTIs();
  return 0;
}

+ (id)_figStreamingMIMETypes
{
  FigCopySetOfStreamingSupportedMIMETypes();
  return 0;
}

+ (id)_fileUTTypes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A30](getTypeAccessMutex_sTypeAccessMutex);
  v3 = (void *)gFileUTTypes;
  if (!gFileUTTypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1)
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_854);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "unionSet:", +[AVURLAsset _figFileUTIs](AVURLAsset, "_figFileUTIs"));
    v5 = +[AVURLAsset _figFilePathExtensions](AVURLAsset, "_figFilePathExtensions");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      v9 = *MEMORY[0x1E0CEC400];
      v10 = *MEMORY[0x1E0CEC458];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          v12 = (void *)objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E0CEC3F8], "typesWithTag:tagClass:conformingToType:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v9, v10));
          if (AVAssetUTIsAreComplementary(v4, v12))
            objc_msgSend(v4, "addObjectsFromArray:", v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }
    v13 = +[AVURLAsset _figFileMIMETypes](AVURLAsset, "_figFileMIMETypes");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      v17 = *MEMORY[0x1E0CEC408];
      v18 = *MEMORY[0x1E0CEC458];
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v20 = (void *)objc_msgSend(a1, "UTTypeIDArrayFromUTTypeArray:", objc_msgSend(MEMORY[0x1E0CEC3F8], "typesWithTag:tagClass:conformingToType:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v17, v18));
          if (AVAssetUTIsAreComplementary(v4, v20))
            objc_msgSend(v4, "addObjectsFromArray:", v20);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v15);
    }
    objc_msgSend(v4, "unionSet:", +[AVMediaFileType allFileTypeIdentifiers](AVMediaFileType, "allFileTypeIdentifiers"));
    gFileUTTypes = objc_msgSend(v4, "copy");

    v3 = (void *)gFileUTTypes;
  }
  v21 = v3;
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A48](getTypeAccessMutex_sTypeAccessMutex);
  return v21;
}

+ (id)UTTypeIDArrayFromUTTypeArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)_figFileUTIs
{
  FigCopySetOfFormatReaderSupportedUTIs();
  return 0;
}

+ (id)_figFilePathExtensions
{
  FigCopySetOfFormatReaderSupportedFileExtensions();
  return 0;
}

+ (id)_figFileMIMETypes
{
  FigCopySetOfFormatReaderSupportedMIMETypes();
  return 0;
}

- (void)_setAssetInspectorLoader:(id)a3
{
  id v5;
  AVAssetClientURLRequestHelper *URLRequestHelper;
  _QWORD v7[5];

  if (self->_URLAsset->loader != a3)
  {
    -[AVURLAsset _removeFigAssetNotifications](self, "_removeFigAssetNotifications");
    v5 = a3;

    self->_URLAsset->loader = (AVAssetInspectorLoader *)a3;
    URLRequestHelper = self->_URLAsset->URLRequestHelper;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__AVURLAsset__setAssetInspectorLoader___block_invoke;
    v7[3] = &unk_1E3030F48;
    v7[4] = a3;
    -[AVAssetClientURLRequestHelper setFigAssetProvider:](URLRequestHelper, "setFigAssetProvider:", v7);
    -[AVURLAsset _addFigAssetNotifications](self, "_addFigAssetNotifications");
  }
}

- (void)_removeFigAssetNotifications
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = -[AVURLAsset _assetInspectorLoader](self, "_assetInspectorLoader");
  if (v3)
  {
    v4 = v3;
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVAsset _weakReference](self, "_weakReference");
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3668], v4);
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3660], v4);
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3688], v4);
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3690], v4);
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3680], v4);
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3678], v4);
    CFRelease(v6);
  }
}

- (void)_addFigAssetNotifications
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = -[AVURLAsset _assetInspectorLoader](self, "_assetInspectorLoader");
  if (v3)
  {
    v4 = v3;
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVAsset _weakReference](self, "_weakReference");
    CFRetain(v6);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3668], v4, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3660], v4, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3688], v4, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3690], v4, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3680], v4, 0);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, figLoaderNotificationHandler, *MEMORY[0x1E0CC3678], v4, 0);
  }
}

- (Class)_classForFigAssetInspectorLoader
{
  return (Class)objc_opt_class();
}

id __20__AVURLAsset_tracks__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(v2[2] + 48);
  if (!v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = (id)objc_msgSend(v2, "_tracksWithClass:", objc_msgSend(*(id *)(a1 + 32), "_classForAssetTracks"));
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48);
  }
  result = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (Class)_classForAssetTracks
{
  return (Class)objc_opt_class();
}

- (id)_assetInspector
{
  return -[AVAssetInspectorLoader assetInspector](self->_URLAsset->loader, "assetInspector");
}

- (Class)_classForTrackInspectors
{
  return -[AVAssetInspectorLoader _classForTrackInspectors](self->_URLAsset->loader, "_classForTrackInspectors");
}

AVAssetDownloadCache *__39__AVURLAsset__ensureAssetDownloadCache__block_invoke(uint64_t a1)
{
  AVAssetDownloadCache *result;

  result = (AVAssetDownloadCache *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 96), "objectForKey:", CFSTR("AVURLAssetCacheKey"));
  if (!result)
  {
    result = -[AVAssetDownloadCache initWithAsset:]([AVAssetDownloadCache alloc], "initWithAsset:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 72) = result;
  }
  return result;
}

+ (AVURLAsset)URLAssetWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  return (AVURLAsset *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:", URL, options);
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return -[AVAssetInspectorLoader _playbackItem](self->_URLAsset->loader, "_playbackItem");
}

- (id)_absoluteURL
{
  NSURL *v3;

  v3 = -[AVURLAsset URL](self, "URL");
  if (!v3)
    v3 = -[AVURLAsset resolvedURL](self, "resolvedURL");
  return -[NSURL absoluteURL](v3, "absoluteURL");
}

- (NSURL)URL
{
  NSURL *URL;
  id v3;

  URL = self->_URLAsset->URL;
  if (!URL)
  {
    v3 = -[AVURLAsset _assetInspector](self, "_assetInspector");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSURL *)objc_msgSend(v3, "URL");
    return 0;
  }
  return URL;
}

- (AVAssetCache)assetCache
{
  AVAssetCache *result;

  result = -[AVURLAsset _managedAssetCache](self, "_managedAssetCache");
  if (!result)
  {
    -[AVURLAsset _ensureAssetDownloadCache](self, "_ensureAssetDownloadCache");
    return self->_URLAsset->assetCache;
  }
  return result;
}

- (id)_managedAssetCache
{
  return -[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetCacheKey"));
}

- (void)_ensureAssetDownloadCache
{
  AVDispatchOnce *makeOneAssetDownloadCacheOnly;
  _QWORD v3[5];

  makeOneAssetDownloadCacheOnly = self->_URLAsset->makeOneAssetDownloadCacheOnly;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__AVURLAsset__ensureAssetDownloadCache__block_invoke;
  v3[3] = &unk_1E302FA10;
  v3[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeOneAssetDownloadCacheOnly, "runBlockOnce:", v3);
}

void __85__AVURLAsset_AVURLAssetURLHandlingInternal___resourceLoaderWithRemoteHandlerContext___block_invoke(uint64_t a1)
{
  AVAssetResourceLoader *v2;
  unint64_t *v3;

  v2 = -[AVAssetResourceLoader initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:]([AVAssetResourceLoader alloc], "initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16));
  v3 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 56);
  while (!__ldaxr(v3))
  {
    if (!__stlxr((unint64_t)v2, v3))
      return;
  }
  __clrex();

}

uint64_t __39__AVURLAsset__setAssetInspectorLoader___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_figAsset");
}

- (id)_resourceLoaderWithRemoteHandlerContext:(id)a3
{
  AVDispatchOnce *makeOneResourceLoaderOnly;
  _QWORD v6[6];

  makeOneResourceLoaderOnly = self->_URLAsset->makeOneResourceLoaderOnly;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__AVURLAsset_AVURLAssetURLHandlingInternal___resourceLoaderWithRemoteHandlerContext___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = a3;
  -[AVDispatchOnce runBlockOnce:](makeOneResourceLoaderOnly, "runBlockOnce:", v6);
  return self->_URLAsset->resourceLoader;
}

- (AVAssetResourceLoader)resourceLoader
{
  return (AVAssetResourceLoader *)-[AVURLAsset _resourceLoaderWithRemoteHandlerContext:](self, "_resourceLoaderWithRemoteHandlerContext:", 0);
}

- (void)_removeUserInfoObject
{
  if (self->_URLAsset->hasInstanceIdentifierMapping)
    -[AVURLAsset _setUserInfoObject:](self, "_setUserInfoObject:", 0);
}

- (id)contentKeySession
{
  return -[AVWeakReference referencedObject](self->_URLAsset->sessionReference, "referencedObject");
}

- (BOOL)_attachedToExternalContentKeySession
{
  id v2;

  v2 = -[AVWeakReference referencedObject](self->_URLAsset->sessionReference, "referencedObject");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isInternal") ^ 1;
  return (char)v2;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  AVWeakReference *v9;
  unint64_t *p_sessionReference;
  uint64_t CMBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v14;
  int v15;
  CFTypeRef v16;
  uint64_t (*v17)(CFTypeRef, OpaqueFigContentKeyBoss *);
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef v25;
  uint64_t v26;
  uint64_t (*v27)(CFTypeRef, uint64_t);
  AVAssetResourceLoader *v28;
  int v29;
  BOOL v30;
  CFTypeRef cf;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFTypeRef v37;
  CFTypeRef v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = 0;
  v9 = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
  if (!a3)
  {
LABEL_27:
    if (a5)
    {
      if (v9)
        v30 = v9 != self->_URLAsset->sessionReference;
      else
        v30 = 0;
      *a5 = v30;
    }

    v29 = 0;
    goto LABEL_34;
  }
  p_sessionReference = (unint64_t *)&self->_URLAsset->sessionReference;
  do
  {
    if (__ldaxr(p_sessionReference))
    {
      __clrex();
      goto LABEL_27;
    }
  }
  while (__stlxr((unint64_t)v9, p_sessionReference));
  if (!-[AVAsset _figAsset](self, "_figAsset"))
  {
    v15 = FigSignalErrorAt();
    goto LABEL_40;
  }
  -[AVAsset _figAsset](self, "_figAsset");
  CMBaseObject = FigAssetGetCMBaseObject();
  v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v13)
    goto LABEL_30;
  v14 = *MEMORY[0x1E0C9AE00];
  v15 = v13(CMBaseObject, *MEMORY[0x1E0CC3978], *MEMORY[0x1E0C9AE00], &v37);
  if (v15)
    goto LABEL_40;
  if (a4)
  {
    v16 = v37;
    if (v37)
    {
      v17 = *(uint64_t (**)(CFTypeRef, OpaqueFigContentKeyBoss *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 88);
      if (v17)
      {
        v15 = v17(v16, a4);
        if (!v15)
          goto LABEL_12;
LABEL_40:
        v29 = v15;
        goto LABEL_34;
      }
LABEL_30:
      v29 = -12782;
      goto LABEL_34;
    }
  }
LABEL_12:
  -[AVAsset _figAsset](self, "_figAsset");
  v18 = FigAssetGetCMBaseObject();
  v19 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v19)
    goto LABEL_30;
  v15 = v19(v18, *MEMORY[0x1E0CC39A8], v14, &v38);
  if (v15)
    goto LABEL_40;
  v20 = (void *)objc_msgSend(a3, "_contentKeyGroups");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
LABEL_16:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v23)
        objc_enumerationMutation(v20);
      v25 = v38;
      v26 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v24), "_figContentKeySession");
      v27 = *(uint64_t (**)(CFTypeRef, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (!v27)
        goto LABEL_30;
      v15 = v27(v25, v26);
      if (v15)
        goto LABEL_40;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v22)
          goto LABEL_16;
        break;
      }
    }
  }
  v28 = -[AVURLAsset resourceLoader](self, "resourceLoader");
  cf = 0;
  v29 = objc_msgSend(a3, "createAndInstallCustomURLHandlerForAsset:outHandler:", self, &cf);
  if (!v29)
  {
    -[AVAssetResourceLoader _setContentKeySessionCustomURLHandler:](v28, "_setContentKeySessionCustomURLHandler:", cf);
    if (cf)
      CFRelease(cf);
  }
LABEL_34:
  if (v38)
    CFRelease(v38);
  if (v37)
    CFRelease(v37);
  return v29;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (BOOL)_clientURLLoadingRepresentsAccurateNetworkStatistics
{
  if ((objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetClientURLLoadingRepresentsAccurateNetworkStatistics")), "BOOLValue") & 1) != 0|| (objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetUseClientURLLoadingExclusively")), "BOOLValue") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetRequiresCustomURLLoadingKey")), "BOOLValue");
  }
}

- (void)dealloc
{
  AVURLAssetInternal *URLAsset;
  NSObject *tracksAccessQueue;
  objc_super v5;

  if (self->_URLAsset)
  {
    -[AVURLAsset _removeUserInfoObject](self, "_removeUserInfoObject");
    -[AVURLAsset _removeFigAssetNotifications](self, "_removeFigAssetNotifications");
    URLAsset = self->_URLAsset;
    tracksAccessQueue = URLAsset->tracksAccessQueue;
    if (tracksAccessQueue)
    {
      dispatch_release(tracksAccessQueue);
      URLAsset = self->_URLAsset;
    }
    if (URLAsset->requiresSecurityScopeRelease)
    {
      -[NSURL stopAccessingSecurityScopedResource](URLAsset->URL, "stopAccessingSecurityScopedResource");
      URLAsset = self->_URLAsset;
    }

    CFRelease(self->_URLAsset);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVURLAsset;
  -[AVAsset dealloc](&v5, sel_dealloc);
}

+ (NSArray)audiovisualTypes
{
  return (NSArray *)+[AVURLAsset _UTTypes](AVURLAsset, "_UTTypes");
}

+ (id)_avfValidationPlist
{
  if (_avfValidationPlist_loadValidationPlistOnceToken != -1)
    dispatch_once(&_avfValidationPlist_loadValidationPlistOnceToken, &__block_literal_global_2);
  return (id)_avfValidationPlist_sAVFoundationValidationPlist;
}

id __33__AVURLAsset__avfValidationPlist__block_invoke()
{
  id result;

  FigMediaValidatorCreateMediaValidatorPropertyList();
  result = objc_alloc_init(MEMORY[0x1E0C99D80]);
  _avfValidationPlist_sAVFoundationValidationPlist = (uint64_t)result;
  return result;
}

+ (id)_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVURLAsset__avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = a1;
  if (_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_loadValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypesOnceToken != -1)
    dispatch_once(&_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_loadValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypesOnceToken, block);
  return (id)_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_sAVFoundationValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes;
}

void __79__AVURLAsset__avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "_avfValidationPlist");
  FigCopySetOfPlaylistSupportedMIMETypes();
  if (objc_msgSend(0, "count"))
  {
    v2 = (id)objc_msgSend(v1, "mutableCopy");
    v3 = objc_msgSend(0, "allObjects");
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0CC4718]);
  }
  else
  {
    v2 = v1;
  }
  _avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes_sAVFoundationValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes = (uint64_t)v2;
}

+ (id)_figHFSFileTypes
{
  FigCopySetOfFormatReaderSupportedFileTypes();
  return 0;
}

+ (id)_figMIMETypes
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A30](getTypeAccessMutex_sTypeAccessMutex);
  v2 = (void *)gFigMIMETypes;
  if (!gFigMIMETypes)
  {
    if (ensureSupportedFormatsChangedNotificationRegistered_onceToken != -1)
      dispatch_once(&ensureSupportedFormatsChangedNotificationRegistered_onceToken, &__block_literal_global_854);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    v4 = +[AVURLAsset _figFileMIMETypes](AVURLAsset, "_figFileMIMETypes");
    if (v4)
      objc_msgSend(v3, "unionSet:", v4);
    v5 = +[AVURLAsset _figStreamingMIMETypes](AVURLAsset, "_figStreamingMIMETypes");
    if (v5)
      objc_msgSend(v3, "unionSet:", v5);
    gFigMIMETypes = (uint64_t)(id)objc_msgSend(v3, "allObjects");

    v2 = (void *)gFigMIMETypes;
  }
  v6 = v2;
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A48](getTypeAccessMutex_sTypeAccessMutex);
  return v6;
}

+ (NSArray)audiovisualMIMETypes
{
  return (NSArray *)+[AVURLAsset _figMIMETypes](AVURLAsset, "_figMIMETypes");
}

+ (BOOL)isPlayableExtendedMIMEType:(id)a3 options:(id)a4
{
  if (a4
    && objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("AVURLAssetExtendedMIMETypePlayabilityTreatPlaylistMIMETypesAsISOBMFFMediaDataContainersKey")), "BOOLValue"))
  {
    +[AVURLAsset _avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes](AVURLAsset, "_avfValidationPlistWithPlaylistMIMETypesTreatedAsISOBMFFMIMETypes");
  }
  else
  {
    +[AVURLAsset _avfValidationPlist](AVURLAsset, "_avfValidationPlist", a3);
  }
  +[AVURLAsset audiovisualMIMETypes](AVURLAsset, "audiovisualMIMETypes");
  return FigMediaValidatorValidateRFC4281ExtendedMIMEType() == 0;
}

+ (BOOL)isPlayableExtendedMIMEType:(NSString *)extendedMIMEType
{
  return objc_msgSend(a1, "isPlayableExtendedMIMEType:options:", extendedMIMEType, 0);
}

- (AVURLAsset)init
{
  return -[AVURLAsset initWithURL:options:](self, "initWithURL:options:", 0, 0);
}

+ (id)_getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentIDKey"));
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentTypeKey"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentUserAgentKey"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentDownloadParametersKey"));
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentDSIDKey"));
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentPurchasedMediaKindKey"));
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentRentalIDKey"));
  v12 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentHLSAssetURLStringKey"));
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentAlternateContentInfoKey"));
  objc_msgSend(v4, "setValue:forKey:", v5, *MEMORY[0x1E0CC3D70]);
  objc_msgSend(v4, "setValue:forKey:", v6, *MEMORY[0x1E0CC3D88]);
  objc_msgSend(v4, "setValue:forKey:", v7, *MEMORY[0x1E0CC3D90]);
  objc_msgSend(v4, "setValue:forKey:", v8, *MEMORY[0x1E0CC3D60]);
  objc_msgSend(v4, "setValue:forKey:", v9, *MEMORY[0x1E0CC3D58]);
  objc_msgSend(v4, "setValue:forKey:", v10, *MEMORY[0x1E0CC3D78]);
  objc_msgSend(v4, "setValue:forKey:", v11, *MEMORY[0x1E0CC3D80]);
  if (v12)
    objc_msgSend(v4, "setValue:forKey:", v12, *MEMORY[0x1E0CC3D68]);
  if (v13)
  {
    v14 = (void *)objc_msgSend(a1, "_getFigAssetiTunesStoreContentInfoFromURLAssetiTunesStoreContentInfo:", v13);
    v15 = objc_msgSend(v13, "objectForKey:", CFSTR("AVURLAssetiTunesStoreContentAlternateContentInfoAssetURLStringKey"));
    objc_msgSend(v14, "setValue:forKey:", v15, *MEMORY[0x1E0CC3D50]);
    objc_msgSend(v4, "setValue:forKey:", v14, *MEMORY[0x1E0CC3D48]);
  }
  return v4;
}

+ (id)_initializationOptionsClasses
{
  if (_initializationOptionsClasses_onceToken != -1)
    dispatch_once(&_initializationOptionsClasses_onceToken, &__block_literal_global_586);
  return (id)_initializationOptionsClasses_sClassesSet;
}

id __43__AVURLAsset__initializationOptionsClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  _initializationOptionsClasses_sClassesSet = (uint64_t)result;
  return result;
}

uint64_t __126__AVURLAsset__getFigAssetCreationOptionsFromURLAssetInitializationOptions_assetLoggingIdentifier_figAssetCreationFlags_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "caseInsensitiveCompare:", CFSTR("User-Agent"));
    if (!result)
      return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
  }
  return result;
}

- (AVURLAsset)initWithFigCreationOptions:(id)a3 options:(id)a4 figAssetCreationOptions:(id)a5 figAssetCreationFlags:(unint64_t)a6
{
  AVURLAsset *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVURLAsset;
  result = -[AVAsset init](&v11, sel_init);
  if (result)
    return (AVURLAsset *)avurlasset_setupGuts(result, a3, a4, a5, a6);
  return result;
}

- (AVURLAsset)initWithFileURL:(id)a3 offset:(int64_t)a4 length:(int64_t)a5 options:(id)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a6);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0CC33C0]);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  objc_msgSend(v11, "setObject:forKey:", v13, *MEMORY[0x1E0CC33B8]);
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("AVURLAssetByteRangeInFileKey"));
  if (a3 && objc_msgSend(a3, "isFileURL"))
    return -[AVURLAsset initWithURL:options:](self, "initWithURL:options:", a3, v10);
  else
    return 0;
}

- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4
{
  CFTypeID v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  CFTypeID v9;
  signed int valuePtr;

  if (!a3)
    return 0;
  v6 = CFGetTypeID(a3);
  if (v6 != CFDictionaryGetTypeID())
    return 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (!Value)
    return 0;
  v8 = Value;
  v9 = CFGetTypeID(Value);
  if (v9 != CFNumberGetTypeID())
    return 0;
  CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSURL *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (-[AVURLAsset _doNotLogURLs](self, "_doNotLogURLs"))
    v6 = (NSURL *)CFSTR("<redacted>");
  else
    v6 = -[AVURLAsset URL](self, "URL");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, URL = %@>"), v5, self, v6);
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return -[AVAssetInspectorLoader _copyFormatReader](self->_URLAsset->loader, "_copyFormatReader");
}

- (void)_tracksDidChange
{
  NSObject *tracksAccessQueue;
  _QWORD block[5];

  tracksAccessQueue = self->_URLAsset->tracksAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVURLAsset__tracksDidChange__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(tracksAccessQueue, block);
}

void __30__AVURLAsset__tracksDidChange__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48) = 0;
}

- (BOOL)_doNotLogURLs
{
  return objc_msgSend((id)objc_msgSend(-[AVURLAsset creationOptions](self, "creationOptions"), "objectForKey:", CFSTR("AVURLAssetDoNotLogURLsKey")), "BOOLValue");
}

- (NSUUID)httpSessionIdentifier
{
  return (NSUUID *)objc_msgSend(-[AVURLAsset _assetInspector](self, "_assetInspector"), "httpSessionIdentifier");
}

- (id)recommendedDestinationURLPathExtension
{
  id v3;
  id v4;
  void *v6;

  if (-[AVAsset _isStreaming](self, "_isStreaming"))
    return CFSTR("movpkg");
  v4 = -[AVURLAsset identifyingTagClass](self, "identifyingTagClass");
  v3 = -[AVURLAsset identifyingTag](self, "identifyingTag");
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEC400]) & 1) != 0)
    return v3;
  if (v3)
  {
    if (v4)
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithTag:tagClass:conformingToType:", v3, v4, 0);
    else
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
  }
  else
  {
    v6 = 0;
  }
  return (id)objc_msgSend(v6, "preferredFilenameExtension");
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_URLAsset->allowsExpensiveNetworkAccess;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_URLAsset->allowsConstrainedNetworkAccess;
}

- (id)creationOptions
{
  return self->_URLAsset->initializationOptions;
}

- (void)cancelLoading
{
  -[AVAssetInspectorLoader cancelLoading](self->_URLAsset->loader, "cancelLoading");
  -[AVAssetResourceLoader cancelLoading](self->_URLAsset->resourceLoader, "cancelLoading");
}

- (id)lyrics
{
  return -[AVAssetInspectorLoader lyrics](self->_URLAsset->loader, "lyrics");
}

- (unint64_t)referenceRestrictions
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetReferenceRestrictionsKey")), "unsignedIntegerValue");
}

- (BOOL)_requiresInProcessOperation
{
  return +[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", self->_URLAsset->initializationOptions);
}

- (id)contentKeySpecifiersEligibleForPreloading
{
  return -[AVAssetInspectorLoader contentKeySpecifiersEligibleForPreloading](self->_URLAsset->loader, "contentKeySpecifiersEligibleForPreloading");
}

- (BOOL)shouldMatchDataInCacheByURLPathComponentOnly
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetShouldMatchDataInCacheByURLPathComponentOnlyKey")), "BOOLValue");
}

- (BOOL)shouldMatchDataInCacheByURLWithoutQueryComponent
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetShouldMatchDataInCacheByURLWithoutQueryComponentKey")), "BOOLValue");
}

- (NSString)cacheKey
{
  if (!-[AVURLAsset shouldMatchDataInCacheByURLPathComponentOnly](self, "shouldMatchDataInCacheByURLPathComponentOnly"))
    -[AVURLAsset shouldMatchDataInCacheByURLWithoutQueryComponent](self, "shouldMatchDataInCacheByURLWithoutQueryComponent");
  -[AVURLAsset URL](self, "URL");
  return (NSString *)(id)FigCFURLCreateCacheKey();
}

- (id)identifyingTagClass
{
  return (id)objc_msgSend(-[AVURLAsset _assetInspector](self, "_assetInspector"), "identifyingTagClass");
}

- (id)identifyingTag
{
  return (id)objc_msgSend(-[AVURLAsset _assetInspector](self, "_assetInspector"), "identifyingTag");
}

- (id)resolvedURL
{
  return -[AVAssetInspectorLoader resolvedURL](self->_URLAsset->loader, "resolvedURL");
}

- (id)originalNetworkContentURL
{
  return -[AVAssetInspectorLoader originalNetworkContentURL](self->_URLAsset->loader, "originalNetworkContentURL");
}

- (id)downloadDestinationURL
{
  return -[NSDictionary objectForKey:](self->_URLAsset->initializationOptions, "objectForKey:", CFSTR("AVURLAssetDownloadDestinationURLKey"));
}

- (unint64_t)downloadToken
{
  return -[AVAssetInspectorLoader downloadToken](self->_URLAsset->loader, "downloadToken");
}

- (id)SHA1Digest
{
  return (id)objc_msgSend(-[AVURLAsset _assetInspector](self, "_assetInspector"), "SHA1Digest");
}

- (NSArray)variants
{
  return -[AVAssetInspectorLoader variants](self->_URLAsset->loader, "variants");
}

+ (id)instanceIdentifierMapTable
{
  if (sInstanceIdentifierOnceToken != -1)
    dispatch_once(&sInstanceIdentifierOnceToken, &__block_literal_global_711);
  return (id)sInstanceIdentfierMapTable;
}

uint64_t __76__AVURLAsset_AVURLAssetInstanceIdentiferMapping__instanceIdentifierMapTable__block_invoke()
{
  uint64_t result;

  sInstanceIdentifierMapTableQueue = (uint64_t)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avurlasset.instanceIdentifierMapping");
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 0);
  sInstanceIdentfierMapTable = result;
  return result;
}

- (void)_setUserInfoObject:(id)a3
{
  NSString *v5;
  id v6;
  _QWORD v7[8];

  v5 = -[NSUUID UUIDString](-[AVURLAsset httpSessionIdentifier](self, "httpSessionIdentifier"), "UUIDString");
  v6 = +[AVURLAsset instanceIdentifierMapTable](AVURLAsset, "instanceIdentifierMapTable");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AVURLAsset_AVURLAssetInstanceIdentiferMapping___setUserInfoObject___block_invoke;
  v7[3] = &unk_1E3030F90;
  v7[4] = a3;
  v7[5] = v6;
  v7[6] = v5;
  v7[7] = self;
  av_readwrite_dispatch_queue_write((dispatch_queue_t)sInstanceIdentifierMapTableQueue, v7);
}

uint64_t __69__AVURLAsset_AVURLAssetInstanceIdentiferMapping___setUserInfoObject___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    result = objc_msgSend(v2, "setObject:forKey:", v3, a1[6]);
    v5 = 1;
  }
  else
  {
    result = objc_msgSend(v2, "removeObjectForKey:", a1[6]);
    v5 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 16) + 104) = v5;
  return result;
}

+ (void)setUserInfoObject:(id)a3 forURLAsset:(id)a4
{
  objc_msgSend(a4, "_setUserInfoObject:", a3);
}

+ (id)userInfoObjectForURLAsset:(id)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(a3, "httpSessionIdentifier"), "UUIDString");
  if (result)
    return (id)objc_msgSend(a1, "userInfoObjectForURLAssetInstanceIdentifier:", result);
  return result;
}

+ (id)userInfoObjectForURLAssetInstanceIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v4 = objc_msgSend(a1, "instanceIdentifierMapTable");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__AVURLAsset_AVURLAssetInstanceIdentiferMapping__userInfoObjectForURLAssetInstanceIdentifier___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v8;
  block[4] = v4;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sInstanceIdentifierMapTableQueue, block);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __94__AVURLAsset_AVURLAssetInstanceIdentiferMapping__userInfoObjectForURLAssetInstanceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)expire
{
  OpaqueFigAsset *v3;
  OpaqueFigAsset *v4;
  void (*v5)(OpaqueFigAsset *);

  -[AVURLAsset cancelLoading](self, "cancelLoading");
  v3 = -[AVAsset _figAsset](self, "_figAsset");
  if (v3)
  {
    v4 = v3;
    v5 = *(void (**)(OpaqueFigAsset *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v5)
      v5(v4);
  }
}

- (id)_installHandlerForNSURLSessionConfiguration:(id)a3 queue:(id)a4
{
  id v7;
  AVAssetCustomURLBridgeForNSURLSession *v8;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v7, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v7, "setUnderlyingQueue:", a4);
  v8 = -[AVAssetCustomURLBridgeForNSURLSession initWithFigAsset:]([AVAssetCustomURLBridgeForNSURLSession alloc], "initWithFigAsset:", -[AVAsset _figAsset](self, "_figAsset"));
  -[AVAssetCustomURLBridgeForNSURLSession setSession:](v8, "setSession:", objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", a3, v8, v7));
  return v8;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.avfoundation.urlasset");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  if (objc_msgSend(a4, "caseInsensitiveCompare:", CFSTR("com.apple.avfoundation.urlasset")))
  {
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading data from the type identifier %@ is not supported by AVURLAsset."), a4);
    a3 = 0;
    v17 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  }
  else if (a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, &v17);
    v11 = objc_msgSend(v10, "securityScopedURL");
    v12 = objc_msgSend(v10, "assetInitializationOptions");
    if (v11)
      v13 = v17 == 0;
    else
      v13 = 0;
    if (v13)
    {
      v14 = v12;
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = v15;
      if (v14)
        objc_msgSend(v15, "addEntriesFromDictionary:", v14);
      objc_msgSend(v16, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AVURLAssetHasSecurityScopedURLKey"));
      a3 = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v11, v16);

    }
    else
    {
      a3 = 0;
    }
  }
  if (a5 && !a3)
  {
    v8 = (void *)v17;
    if (!v17)
      v8 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
    *a5 = v8;
  }
  return a3;
}

+ (int64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:(id)a3
{
  return 0;
}

+ (id)_objectWithItemProviderFileURL:(id)a3 typeIdentifier:(id)a4 isInPlace:(BOOL)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  id result;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "caseInsensitiveCompare:", CFSTR("com.apple.avfoundation.urlasset")))
  {
    v13[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading file representations for the type identifier %@ is not supported by AVURLAsset."), a4, *MEMORY[0x1E0CB2938]);
    v9 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    if (a6)
    {
      v10 = (void *)v9;
      if (v9)
      {
LABEL_8:
        result = 0;
        *a6 = v10;
        return result;
      }
LABEL_7:
      v10 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
      goto LABEL_8;
    }
    return 0;
  }
  else
  {
    result = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", a3, 0);
    if (a6 && !result)
      goto LABEL_7;
  }
  return result;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.avfoundation.urlasset");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  NSURL *v7;
  void *v8;
  uint64_t v9;
  AVURLAssetItemProviderData *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = -[AVURLAsset URL](self, "URL");
  v14 = 0;
  if (objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.avfoundation.urlasset")))
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading data from the type identifier %@ is not supported by AVURLAsset."), a3);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = -11862;
  }
  else
  {
    if (-[NSURL isFileURL](v7, "isFileURL"))
    {
      v10 = +[AVURLAssetItemProviderData itemProviderDataWithURL:assetInitializationOptions:](AVURLAssetItemProviderData, "itemProviderDataWithURL:assetInitializationOptions:", v7, self->_URLAsset->initializationOptions);
      v11 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v14);
      if (v11)
        v12 = v14 == 0;
      else
        v12 = 0;
      if (v12)
      {
        (*((void (**)(id, uint64_t))a4 + 2))(a4, v11);
        return 0;
      }
      if (!v14)
        goto LABEL_12;
      goto LABEL_13;
    }
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Writing to NSItemProviders is not supported for non file:/// scheme URLs: %@"), v7);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = -11838;
  }
  v14 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v9, v8);
  if (!v14)
LABEL_12:
    v14 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
LABEL_13:
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  return 0;
}

+ (int64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3
{
  return 0;
}

- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  NSURL *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = -[AVURLAsset URL](self, "URL");
  if (objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.avfoundation.urlasset")))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading file representations for the type identifier %@ is not supported by AVURLAsset."), a3, *MEMORY[0x1E0CB2938]);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = -11862;
  }
  else
  {
    if (-[NSURL isFileURL](v6, "isFileURL"))
    {
      (*((void (**)(id, NSURL *, uint64_t, _QWORD))a4 + 2))(a4, v6, 1, 0);
      return 0;
    }
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Writing to NSItemProviders is not supported for non file:/// scheme URLs: %@"), v6);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = -11838;
  }
  v9 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v8, v7);
  if (!v9)
    v9 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))a4 + 2))(a4, 0, 0, v9);
  return 0;
}

- (id)_serializableCreationOptions
{
  return -[AVAssetSerializableCreationOptions initWithCreationOptions:]([AVAssetSerializableCreationOptions alloc], "initWithCreationOptions:", -[AVURLAsset creationOptions](self, "creationOptions"));
}

+ (id)assetForNSURLSessionWithURL:(id)a3 propertyList:(id)a4
{
  uint64_t v6;
  void *v7;
  AVURLAsset *v8;
  id v9;

  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("figAssetCreationOptions"));
    FigAssetCreateOptionsDictFromPList();
    v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("figAssetCreationFlags"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v7, "unsignedLongLongValue");
    else
      v6 = 0;
  }
  v8 = [AVURLAsset alloc];
  v9 = 0;
  return -[AVURLAsset initWithFigCreationOptions:options:figAssetCreationOptions:figAssetCreationFlags:](v8, "initWithFigCreationOptions:options:figAssetCreationOptions:figAssetCreationFlags:", a3, MEMORY[0x1E0C9AA70], v9, v6);
}

- (id)propertyListForNSURLSessionAssetReturningError:(id *)a3
{
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v6;
  signed int PListFromOptionsDict;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD, uint64_t, CFNumberRef *);
  void *v10;
  signed int v11;
  uint64_t valuePtr;
  CFNumberRef number;
  CFTypeRef cf;
  CFTypeRef v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v16 = 0;
  valuePtr = 0;
  number = 0;
  if (-[AVAsset _figAsset](self, "_figAsset"))
  {
    CMBaseObject = FigAssetGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v5)
      goto LABEL_10;
    v6 = *MEMORY[0x1E0C9AE00];
    PListFromOptionsDict = v5(CMBaseObject, *MEMORY[0x1E0CC3990], *MEMORY[0x1E0C9AE00], &v16);
    if (PListFromOptionsDict)
      goto LABEL_22;
    if (v16)
    {
      PListFromOptionsDict = FigAssetCreatePListFromOptionsDict();
      if (PListFromOptionsDict)
        goto LABEL_22;
      v8 = FigAssetGetCMBaseObject();
      v9 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
      if (v9)
      {
        PListFromOptionsDict = v9(v8, *MEMORY[0x1E0CC3988], v6, &number);
        if (!PListFromOptionsDict)
        {
          if (number)
          {
            CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
            v18[0] = cf;
            v17[0] = CFSTR("figAssetCreationOptions");
            v17[1] = CFSTR("figAssetCreationFlags");
            v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", valuePtr);
            v17[2] = CFSTR("figAssetCreationVersion");
            v18[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
            v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
            v11 = 0;
            goto LABEL_11;
          }
          goto LABEL_21;
        }
LABEL_22:
        v11 = PListFromOptionsDict;
        goto LABEL_23;
      }
LABEL_10:
      v10 = 0;
      v11 = -12782;
      goto LABEL_11;
    }
  }
LABEL_21:
  v11 = 0;
LABEL_23:
  v10 = 0;
LABEL_11:
  if (cf)
    CFRelease(cf);
  if (v16)
    CFRelease(v16);
  if (number)
    CFRelease(number);
  if (a3 && v11)
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
  return v10;
}

@end
