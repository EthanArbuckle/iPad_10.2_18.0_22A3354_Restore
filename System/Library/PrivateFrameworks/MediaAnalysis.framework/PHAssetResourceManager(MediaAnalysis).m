@implementation PHAssetResourceManager(MediaAnalysis)

+ (void)vcp_reportDownload:()MediaAnalysis withTaskID:
{
  void *v6;
  qos_class_t v7;
  void *v8;
  void *v9;
  void *v10;
  qos_class_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    VCPTaskIDDescription(a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = qos_class_self();
    VCPMAQoSDescription(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = CFSTR("com.apple.mediaanalysisd.das.dutycycle.task");
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);

  }
  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  VCPTaskIDDescription(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = qos_class_self();
  VCPMAQoSDescription(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, CFSTR("taskName"), CFSTR("QoS"), CFSTR("DownloadAssetCount"), CFSTR("DownloadBytes"), v10, v12, &unk_1E6B74F48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.das.dutycycle.task"), v14);

}

+ (uint64_t)vcp_inMemoryDownload:()MediaAnalysis withTaskID:toData:cancel:
{
  id v9;
  unsigned int (**v10)(_QWORD);
  id v11;
  uint64_t v12;
  id v13;
  dispatch_semaphore_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  dispatch_time_t v23;
  void *v24;
  uint64_t v25;
  dispatch_time_t v26;
  void *v27;
  id v30;
  void *v31;
  id obj;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  _QWORD aBlock[4];
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  obj = a1;
  objc_sync_enter(obj);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Attempt to download resource: %@", buf, 0xCu);
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CD1468]);
  objc_msgSend(v11, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v11, "setDownloadIsTransient:", 1);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke;
  aBlock[3] = &unk_1E6B1B5D0;
  v30 = v9;
  v41 = v30;
  v31 = _Block_copy(aBlock);
  objc_msgSend(v11, "setProgressHandler:", v31);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v14 = dispatch_semaphore_create(0);
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_133;
  v35[3] = &unk_1E6B1B5F8;
  v38 = obj;
  v15 = v13;
  v36 = v15;
  v39 = a4;
  v16 = v14;
  v37 = v16;
  v17 = _Block_copy(v35);
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_135;
  v33[3] = &unk_1E6B1B620;
  v18 = v15;
  v34 = v18;
  v19 = _Block_copy(v33);
  objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v30, v11, v19, v17);

  if ((_DWORD)v21)
  {
    if (v10)
    {
      v22 = -100000000;
      while (1)
      {
        v23 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v16, v23))
          goto LABEL_23;
        v22 += 100000000;
        if (v22 >= 0xDF2517701)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v43) = v21;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Download resource timed-out (ID:%d)", buf, 8u);
          }
          goto LABEL_28;
        }
        if (v10[2](v10))
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v43) = v21;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelling download (ID:%d)", buf, 8u);
          }
          objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", a5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cancelDataRequest:", v21);

          dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
          v25 = 4294967168;
          goto LABEL_29;
        }
      }
    }
    v26 = dispatch_time(0, 60000000000);
    if (!dispatch_semaphore_wait(v16, v26))
    {
LABEL_23:
      v25 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      goto LABEL_29;
    }
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Download resource timed-out (ID:%d)", buf, 8u);
    }
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cancelDataRequest:", v21);

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    v25 = 4294966371;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to issue resource request", buf, 2u);
    }
    v25 = 4294967278;
  }
LABEL_29:

  objc_sync_exit(obj);
  return v25;
}

+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:toResourceURL:cancel:
{
  id v10;
  unsigned int (**v11)(_QWORD);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  NSObject *v33;
  dispatch_time_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  id v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  _QWORD aBlock[4];
  id v56;
  uint8_t v57[4];
  void *v58;
  __int16 v59;
  int v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  dispatch_semaphore_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "assetLocalIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FileBasedDownload][%@] Attempt to download resource: %@", buf, 0x16u);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0CD1468]);
  objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v13, "setDownloadPriority:", 0);
  objc_msgSend(v13, "setDownloadIntent:", 6);
  objc_msgSend(v13, "setPruneAfterAvailableOnLowDisk:", 1);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke;
  aBlock[3] = &unk_1E6B1B5D0;
  v15 = v10;
  v56 = v15;
  v16 = _Block_copy(aBlock);
  objc_msgSend(v13, "setProgressHandler:", v16);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v62 = __Block_byref_object_copy__58;
  v63 = __Block_byref_object_dispose__58;
  v64 = dispatch_semaphore_create(0);
  v52[0] = v14;
  v52[1] = 3221225472;
  v52[2] = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_138;
  v52[3] = &unk_1E6B1B648;
  v17 = v15;
  v53 = v17;
  v54 = a5;
  v43 = _Block_copy(v52);
  v44 = v14;
  v45 = 3221225472;
  v46 = __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_140;
  v47 = &unk_1E6B1B670;
  v18 = v17;
  v50 = a1;
  v51 = a4;
  v48 = v18;
  v49 = buf;
  v19 = _Block_copy(&v44);
  objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "requestFileURLForAssetResource:options:urlReceivedHandler:completionHandler:", v18, v13, v43, v19);

  if ((_DWORD)v21)
  {
    if (v11)
    {
      v22 = -100000000;
      while (1)
      {
        v23 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        v24 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v23, v24))
        {
          v29 = 0;
          goto LABEL_33;
        }
        v22 += 100000000;
        if (v22 >= 0xDF2517701)
          break;
        if (v11[2](v11))
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v25 = MEMORY[0x1E0C81028];
            v26 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v18, "assetLocalIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v57 = 138412546;
              v58 = v27;
              v59 = 1024;
              v60 = v21;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Cancelling download (ID:%d)", v57, 0x12u);

            }
          }
          objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", v43, v44, v45, v46, v47);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cancelDataRequest:", v21);

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
          v29 = 4294967168;
          goto LABEL_33;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v38 = MEMORY[0x1E0C81028];
        v39 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "assetLocalIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v57 = 138412546;
          v58 = v40;
          v59 = 1024;
          v60 = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FileBasedDownload][%@] Download resource timed-out (ID:%d)", v57, 0x12u);

        }
      }
    }
    else
    {
      v33 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
      v34 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(v33, v34))
      {
        v29 = 0;
        goto LABEL_33;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v35 = MEMORY[0x1E0C81028];
        v36 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "assetLocalIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v57 = 138412546;
          v58 = v37;
          v59 = 1024;
          v60 = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FileBasedDownload][%@] Download resource timed-out (ID:%d)", v57, 0x12u);

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", v43, v44, v45, v46, v47);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cancelDataRequest:", v21);

    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
    v29 = 4294966371;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v30 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "assetLocalIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v57 = 138412290;
        v58 = v32;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FileBasedDownload][%@] Failed to issue resource request", v57, 0xCu);

      }
    }
    v29 = 4294967278;
  }
LABEL_33:

  _Block_object_dispose(buf, 8);
  return v29;
}

+ (uint64_t)vcp_requestFileURLForAssetResource:()MediaAnalysis withTaskID:timeoutHandler:urlHandler:andCompletionHandler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  os_signpost_id_t v44;
  uint64_t v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "assetLocalIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v15;
    v51 = 2112;
    v52 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Downloading %@", buf, 0x16u);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0CD1468]);
  objc_msgSend(v16, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v16, "setDownloadPriority:", 0);
  objc_msgSend(v16, "setDownloadIntent:", 6);
  objc_msgSend(v16, "setPruneAfterAvailableOnLowDisk:", 1);
  VCPSignPostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);

  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VCPDownloadResource", ", buf, 2u);
  }

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6B1B698;
  v22 = v11;
  v47 = v22;
  v48 = v12;
  v23 = v12;
  v24 = _Block_copy(aBlock);
  objc_msgSend(v16, "setProgressHandler:", v24);
  v41[0] = v21;
  v41[1] = 3221225472;
  v41[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_141;
  v41[3] = &unk_1E6B1B6C0;
  v25 = v22;
  v44 = v18;
  v45 = 0;
  v42 = v25;
  v43 = v13;
  v26 = v13;
  v27 = _Block_copy(v41);
  v36[0] = v21;
  v36[1] = 3221225472;
  v36[2] = __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_143;
  v36[3] = &unk_1E6B1B6E8;
  v28 = v25;
  v39 = a1;
  v40 = a4;
  v37 = v28;
  v38 = v14;
  v29 = v14;
  v30 = _Block_copy(v36);
  objc_msgSend(a1, "defaultManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "requestFileURLForAssetResource:options:urlReceivedHandler:completionHandler:", v28, v16, v27, v30);

  if (!(_DWORD)v32 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v28, "assetLocalIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v35;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FileBasedDownload][%@] Failed to issue resource request", buf, 0xCu);

  }
  return v32;
}

@end
