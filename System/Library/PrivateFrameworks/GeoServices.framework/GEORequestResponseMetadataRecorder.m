@implementation GEORequestResponseMetadataRecorder

+ (void)_populateSessionStateInRRData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__GEORequestResponseMetadataRecorder__populateSessionStateInRRData___block_invoke;
  v6[3] = &unk_1E1C04548;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "shortSessionValues:", v6);

}

uint64_t __68__GEORequestResponseMetadataRecorder__populateSessionStateInRRData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  GEOLogMsgStateUserSession *v14;
  void *v15;
  void *v16;
  GEOLocalTime *v17;
  void *v18;
  void *v19;

  v14 = objc_alloc_init(GEOLogMsgStateUserSession);
  objc_msgSend(*(id *)(a1 + 32), "setStateUserSession:", v14);

  objc_msgSend(*(id *)(a1 + 32), "stateUserSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRelativeTimestamp:", a7);

  objc_msgSend(*(id *)(a1 + 32), "stateUserSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSessionId:", a2, a3);

  v17 = -[GEOLocalTime initWithCFAbsoluteTime:]([GEOLocalTime alloc], "initWithCFAbsoluteTime:", a5);
  objc_msgSend(*(id *)(a1 + 32), "stateUserSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEventTime:", v17);

  objc_msgSend(*(id *)(a1 + 32), "stateUserSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSequenceNumber:", a4);

  return objc_msgSend(*(id *)(a1 + 32), "setSessionBatchIdBits:", a6);
}

+ (void)_populateOfflineStateInRRData:(id)a3 forCohortId:(id)a4
{
  id v5;
  id v6;
  GEOLogMsgStateOffline *v7;
  void *v8;
  __int16 v9;
  int v10;
  _BOOL8 v11;
  __int16 v12;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  GEOOfflineVersionMetadata *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[4];
  GEOLogMsgStateOffline *v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    v7 = objc_alloc_init(GEOLogMsgStateOffline);
    +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentStateForCohortId:", v6);
    v10 = v9;
    if (v9 < 2u)
    {
      -[GEOLogMsgStateOffline setIsMapsInOfflineMode:](v7, "setIsMapsInOfflineMode:", 0);
      goto LABEL_4;
    }
    if (v9 == 2)
    {
      v12 = v9;
      -[GEOLogMsgStateOffline setIsMapsInOfflineMode:](v7, "setIsMapsInOfflineMode:", 1);
      if (HIBYTE(v12) < 3u)
      {
        v11 = (v12 & 0x700) == 512;
        goto LABEL_12;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
LABEL_4:
        v11 = 0;
LABEL_12:
        -[GEOLogMsgStateOffline setIsOnlyUseOffline:](v7, "setIsOnlyUseOffline:", v11);
        +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOLogMsgStateOffline setIsNetworkConnected:](v7, "setIsNetworkConnected:", objc_msgSend(v15, "isNetworkReachable"));

        if (objc_msgSend(v8, "subscriptionCount") <= 2)
          v16 = objc_msgSend(v8, "subscriptionCount");
        else
          v16 = 2;
        -[GEOLogMsgStateOffline setNumberOfDownloadedRegions:](v7, "setNumberOfDownloadedRegions:", v16);
        if (-[GEOLogMsgStateOffline isMapsInOfflineMode](v7, "isMapsInOfflineMode"))
        {
          +[GEOOfflineDataConfiguration sharedConfiguration](GEOOfflineDataConfiguration, "sharedConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[GEOOfflineVersionMetadata initWithDataConfiguration:]([GEOOfflineVersionMetadata alloc], "initWithDataConfiguration:", v17);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __80__GEORequestResponseMetadataRecorder__populateOfflineStateInRRData_forCohortId___block_invoke;
          v21[3] = &unk_1E1C15CC0;
          v22 = v7;
          -[GEOOfflineVersionMetadata enumerateLayerVersions:](v18, "enumerateLayerVersions:", v21);

        }
        objc_msgSend(v5, "setStateOffline:", v7);

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      v24 = HIBYTE(v12);
      v19 = MEMORY[0x1E0C81028];
      v20 = "Unreachable reached: invalid offline reason value %x";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v24 = v10;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
      -[GEOLogMsgStateOffline setIsMapsInOfflineMode:](v7, "setIsMapsInOfflineMode:", 0);
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      v11 = 0;
      if (!v14)
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      v24 = v10;
      v19 = MEMORY[0x1E0C81028];
      v20 = "Unreachable reached: invalid offline mode value %x";
    }
    _os_log_fault_impl(&dword_1885A9000, v19, OS_LOG_TYPE_FAULT, v20, buf, 8u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [GEOPlatform isRunningInGeod]", buf, 2u);
  }
LABEL_18:

}

uint64_t __80__GEORequestResponseMetadataRecorder__populateOfflineStateInRRData_forCohortId___block_invoke(uint64_t result, int a2)
{
  if (a2 == 7)
    return objc_msgSend(*(id *)(result + 32), "setSearchOdsVersion:");
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "setRoutingOdsVersion:");
  return result;
}

+ (void)recordDirectionsRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__GEORequestResponseMetadataRecorder_recordDirectionsRequestResponseAnalyticsData_forCohortId___block_invoke;
  v11[3] = &unk_1E1C15CE8;
  v13 = v6;
  v14 = a1;
  v12 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "referenceTimeResult:", v11);

}

void __95__GEORequestResponseMetadataRecorder_recordDirectionsRequestResponseAnalyticsData_forCohortId___block_invoke(uint64_t a1, char a2, double a3)
{
  GEORequestResponseMetadata *v5;
  NSObject *v6;
  GEOLogMsgEventServiceMetadata *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v5 = objc_alloc_init(GEORequestResponseMetadata);
    objc_msgSend(*(id *)(a1 + 48), "_populateSessionStateInRRData:", v5);
    objc_msgSend(*(id *)(a1 + 48), "_populateOfflineStateInRRData:forCohortId:", v5, *(_QWORD *)(a1 + 32));
    GEOGetRRMetadataRecorderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 67174657;
      v14[1] = -[GEORequestResponseMetadata sessionBatchIdBits](v5, "sessionBatchIdBits");
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "saving directions request metadata (%{private}u)", (uint8_t *)v14, 8u);
    }

    v7 = objc_alloc_init(GEOLogMsgEventServiceMetadata);
    -[GEORequestResponseMetadata setEventMetadata:](v5, "setEventMetadata:", v7);

    -[GEORequestResponseMetadata eventMetadata](v5, "eventMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setServiceMetadataType:", 1);

    v9 = *(_QWORD *)(a1 + 40);
    -[GEORequestResponseMetadata eventMetadata](v5, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDirectionsMetadata:", v9);

    -[GEORequestResponseMetadata setCollectionTime:](v5, "setCollectionTime:", a3);
    v11 = -[GEORequestResponseMetadata sessionBatchIdBits](v5, "sessionBatchIdBits");
    v12 = v11 | ((unint64_t)(unsigned __int16)geo_userActionAndMetadataSessionType << 32) | ((unint64_t)geo_userActionAndMetadataUploadType << 48);
    +[GEORequestResponseMetadataFileManager sharedManager](GEORequestResponseMetadataFileManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveRequestResponseMetadata:batchID:", v5, v12);

  }
  else
  {
    GEOGetRRMetadataRecorderLog();
    v5 = (GEORequestResponseMetadata *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1885A9000, &v5->super.super, OS_LOG_TYPE_DEBUG, "no time sync; not saving directions request metadata",
        (uint8_t *)v14,
        2u);
    }
  }

}

+ (void)recordPlacesRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__GEORequestResponseMetadataRecorder_recordPlacesRequestResponseAnalyticsData_forCohortId___block_invoke;
  v11[3] = &unk_1E1C15CE8;
  v13 = v6;
  v14 = a1;
  v12 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "referenceTimeResult:", v11);

}

void __91__GEORequestResponseMetadataRecorder_recordPlacesRequestResponseAnalyticsData_forCohortId___block_invoke(uint64_t a1, char a2, double a3)
{
  GEORequestResponseMetadata *v5;
  NSObject *v6;
  GEOLogMsgEventServiceMetadata *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v5 = objc_alloc_init(GEORequestResponseMetadata);
    objc_msgSend(*(id *)(a1 + 48), "_populateSessionStateInRRData:", v5);
    objc_msgSend(*(id *)(a1 + 48), "_populateOfflineStateInRRData:forCohortId:", v5, *(_QWORD *)(a1 + 32));
    GEOGetRRMetadataRecorderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 67174657;
      v14[1] = -[GEORequestResponseMetadata sessionBatchIdBits](v5, "sessionBatchIdBits");
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "saving place request metadata (%{private}u)", (uint8_t *)v14, 8u);
    }

    v7 = objc_alloc_init(GEOLogMsgEventServiceMetadata);
    -[GEORequestResponseMetadata setEventMetadata:](v5, "setEventMetadata:", v7);

    -[GEORequestResponseMetadata eventMetadata](v5, "eventMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setServiceMetadataType:", 2);

    v9 = *(_QWORD *)(a1 + 40);
    -[GEORequestResponseMetadata eventMetadata](v5, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlacesMetadata:", v9);

    -[GEORequestResponseMetadata setCollectionTime:](v5, "setCollectionTime:", a3);
    v11 = -[GEORequestResponseMetadata sessionBatchIdBits](v5, "sessionBatchIdBits");
    v12 = v11 | ((unint64_t)(unsigned __int16)geo_userActionAndMetadataSessionType << 32) | ((unint64_t)geo_userActionAndMetadataUploadType << 48);
    +[GEORequestResponseMetadataFileManager sharedManager](GEORequestResponseMetadataFileManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveRequestResponseMetadata:batchID:", v5, v12);

  }
  else
  {
    GEOGetRRMetadataRecorderLog();
    v5 = (GEORequestResponseMetadata *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1885A9000, &v5->super.super, OS_LOG_TYPE_DEBUG, "no time sync; not saving place request metadata",
        (uint8_t *)v14,
        2u);
    }
  }

}

@end
