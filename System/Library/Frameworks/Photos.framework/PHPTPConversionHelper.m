@implementation PHPTPConversionHelper

+ (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 withConversionManager:(id)a5 peerCapabilities:(id)a6
{
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  PHPTPConversionResult *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  _QWORD *v35;
  NSObject *v36;
  PHPTPConversionResult *v38;
  void *v39;
  uint8_t buf[4];
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  NSObject *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "conversionResultForPTPAsset:sourceHints:withPeerCapabilites:", v10, a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      v16 = "Failed to create a conversion request for ptpAsset %@";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_26:
    v28 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v11, "preflightConversionRequest:", v12);
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsProResVideoWithFormatEligibleForTranscoding");

  if (v14)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      v16 = "Never transcode ProRes ptpAsset: %@";
      v17 = v15;
      v18 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_1991EC000, v17, v18, v16, buf, 0xCu);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v12, "status") == 5)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    objc_msgSend(v12, "error");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v19;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to preflight conversion request: %@, ptpAsset: %@", buf, 0x16u);
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v12, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isVideo"))
  {
    objc_msgSend(v12, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "firstVideoTrackCodec");

  }
  else
  {
    v22 = 0;
  }

  v23 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(v12, "source");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fileType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "typeWithIdentifier:", v25);
  v15 = objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v12, "backwardsCompatibilityStatus");
  if (v26 == 2)
  {
    v38 = [PHPTPConversionResult alloc];
    objc_msgSend(v12, "outputPathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "uppercaseString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v12, "estimatedOutputFileLength");
    objc_msgSend(v12, "source");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isVideo"))
      v32 = 1635148593;
    else
      v32 = 0;
    objc_msgSend(v12, "source");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isVideo");
    v35 = (_QWORD *)MEMORY[0x1E0CEC5B0];
    if (!v34)
      v35 = (_QWORD *)MEMORY[0x1E0CEC530];
    v28 = -[PHPTPConversionResult initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:](v38, "initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:", 1, v29, v30, v22, v15, v32, *v35);

  }
  else
  {
    v27 = v26;
    if (v26 != 1)
    {
      PLPTPGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "error");
        v36 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v41 = v27;
        v42 = 2112;
        v43 = v36;
        v44 = 2112;
        v45 = v10;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Unexpected backwards compatibility status %ld: %@, ptpAsset: %@", buf, 0x20u);

      }
      goto LABEL_25;
    }
    v28 = -[PHPTPConversionResult initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:]([PHPTPConversionResult alloc], "initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:", 0, 0, 0, v22, v15, v22, v15);
  }
LABEL_27:

  return v28;
}

+ (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 withPeerCapabilites:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "originalFilename");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullDirectoryPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v10;
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isVideo");
  v16 = (void *)MEMORY[0x1E0D47C50];
  if (!v15)
  {
    objc_msgSend(v7, "imagePixSize");
    objc_msgSend(v16, "imageSourceForFileURL:dimensions:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLivePhoto"))
  {
    if ((objc_msgSend(v8, "isRender") & 1) != 0)
      goto LABEL_18;
    if (!objc_msgSend(v8, "livePhotoImageIsHEIC"))
    {
LABEL_15:
      v19 = v17;
      v20 = 0;
      v21 = 1635148593;
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  v18 = objc_msgSend(v7, "videoCodec");
  if ((_DWORD)v18)
  {
    if ((_DWORD)v18 != 1752589105)
    {
      if (objc_msgSend(MEMORY[0x1E0D75128], "videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:", v18))
      {
        v19 = v17;
        v20 = 1;
        v21 = 1752589105;
        v23 = 1;
LABEL_17:
        objc_msgSend(v19, "markContainsVideoEligibleForTranscodingAsCheckedWithValue:codec:isProRes:", v20, v21, v23);
        goto LABEL_18;
      }
      goto LABEL_15;
    }
LABEL_9:
    v19 = v17;
    v20 = 1;
    v21 = 1752589105;
LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  PLPTPGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Failed to get video codec for asset: %@", buf, 0xCu);
  }

LABEL_18:
  objc_msgSend(v17, "markLivePhotoPairingIdentifierAsCheckedWithValue:", v14);
  objc_msgSend(v17, "markIsHDRAsCheckedWithValue:", objc_msgSend(v7, "isHDR"));
  if (objc_msgSend(v8, "isVideo"))
    v24 = objc_msgSend(v8, "isLivePhoto") ^ 1;
  else
    v24 = 0;
  v34 = 0;
  v25 = v9;
  objc_msgSend(MEMORY[0x1E0D47C48], "requestForSource:destinationCapabilities:error:", v17, v9, &v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v34;
  if (v26)
  {
    objc_msgSend(v26, "setShouldPadOutputFileToEstimatedLength:", 1);
    objc_msgSend(v26, "setUseTransferBehaviorUserPreference:", 1);
    objc_msgSend(v7, "filename");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setOutputFilename:", v28);

    if (v24)
      objc_msgSend(v26, "enableSinglePassVideoEncodingWithUpdateHandler:", 0);
    v29 = v26;
  }
  else
  {
    PLPTPGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v27;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "Unable to create conversion request: %@, ptpAsset: %@", buf, 0x16u);
    }

  }
  return v26;
}

@end
