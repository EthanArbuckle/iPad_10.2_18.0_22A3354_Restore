@implementation HMIFeedbackVisionProcessor

+ (BOOL)reencodeAssetURL:(id)a3 outputURL:(id)a4 bitRate:(int64_t)a5 duration:(id *)a6 analysisFPS:(float)a7 sampleFrameHandler:(id)a8 dropFrameHandler:(id)a9
{
  id v15;
  HMIVideoFragment *v16;
  HMIMemoryAVAsset *v17;
  void *v18;
  uint64_t v19;
  HMIVideoAssetReader *v20;
  void *v21;
  uint64_t v22;
  HMIVideoEncoder *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  HMIVideoFrameIntervalSampler *v26;
  double v27;
  HMIVideoFrameIntervalSampler *v28;
  void *v29;
  HMIVideoEncoder *v30;
  HMIVideoEncoder *v31;
  HMIVideoDecoder *v32;
  void *v33;
  HMIVideoFrameIntervalSampler *v34;
  opaqueCMSampleBuffer *v35;
  opaqueCMSampleBuffer *v36;
  id v37;
  NSObject *v38;
  id v39;
  Float64 Seconds;
  Float64 v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *context;
  id v54;
  void *v55;
  HMIVideoFragment *v56;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  CMTime time2;
  CMTime v65;
  _QWORD v66[4];
  HMIVideoFrameIntervalSampler *v67;
  _QWORD v68[4];
  HMIVideoEncoder *v69;
  id v70;
  _QWORD v71[4];
  HMIVideoEncoder *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  _BYTE *v76;
  _QWORD v77[5];
  _QWORD v78[5];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  CMTime time1;
  Float64 v86;
  _BYTE buf[24];
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v59 = a4;
  v61 = a8;
  v62 = a9;
  v58 = v15;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v15, 1, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v16 = -[HMIVideoFragment initWithData:]([HMIVideoFragment alloc], "initWithData:", v63);
    v17 = [HMIMemoryAVAsset alloc];
    v56 = v16;
    -[HMIVideoFragment data](v16, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMIMemoryAVAsset initWithData:](v17, "initWithData:", v18);

    v55 = (void *)v19;
    v20 = -[HMIVideoAssetReader initWithAsset:]([HMIVideoAssetReader alloc], "initWithAsset:", v19);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v88 = __Block_byref_object_copy__8;
    v89 = __Block_byref_object_dispose__8;
    v90 = 0;
    v21 = (void *)objc_opt_new();
    v79 = 0;
    v80 = &v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__8;
    v83 = __Block_byref_object_dispose__8;
    v22 = MEMORY[0x24BDAC760];
    v84 = 0;
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke;
    v78[3] = &unk_24DBED6F0;
    v78[4] = &v79;
    objc_msgSend(v21, "setAssetWriterDidOutputInitializationSegment:", v78);
    v77[0] = v22;
    v77[1] = 3221225472;
    v77[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_2;
    v77[3] = &unk_24DBED718;
    v77[4] = &v79;
    objc_msgSend(v21, "setAssetWriterDidOutputSeparableSegment:", v77);
    v23 = -[HMIVideoEncoder initWithDimensions:codecType:useHardwareAcceleration:error:]([HMIVideoEncoder alloc], "initWithDimensions:codecType:useHardwareAcceleration:error:", CMVideoFormatDescriptionGetDimensions(-[HMIVideoFragment videoFormatDescription](v56, "videoFormatDescription")), 1635148593, 1, 0);
    -[HMIVideoEncoder setAverageBitRate:](v23, "setAverageBitRate:", a5);
    v60 = (void *)objc_opt_new();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("Encoder Queue", v24);
    -[HMIVideoEncoder setDelegate:queue:](v23, "setDelegate:queue:", v60, v25);

    v74[0] = v22;
    v74[1] = 3221225472;
    v74[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_3;
    v74[3] = &unk_24DBED740;
    v76 = buf;
    v54 = v21;
    v75 = v54;
    objc_msgSend(v60, "setEncoderDidEncodeSampleBuffer:", v74);
    v26 = [HMIVideoFrameIntervalSampler alloc];
    *(float *)&v27 = a7;
    v28 = -[HMIVideoFrameIntervalSampler initWithFrameRate:](v26, "initWithFrameRate:", v27);
    v29 = (void *)objc_opt_new();
    -[HMIVideoFrameSampler setDelegate:](v28, "setDelegate:", v29);
    v71[0] = v22;
    v71[1] = 3221225472;
    v71[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_4;
    v71[3] = &unk_24DBED768;
    v73 = v61;
    v30 = v23;
    v72 = v30;
    objc_msgSend(v29, "setFrameSamplerDidSampleFrame:", v71);
    v68[0] = v22;
    v68[1] = 3221225472;
    v68[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_5;
    v68[3] = &unk_24DBED768;
    v70 = v62;
    v31 = v30;
    v69 = v31;
    objc_msgSend(v29, "setFrameSamplerDidDropFrame:", v68);
    v32 = objc_alloc_init(HMIVideoDecoder);
    v33 = (void *)objc_opt_new();
    -[HMIVideoDecoder setDelegate:](v32, "setDelegate:", v33);
    v66[0] = v22;
    v66[1] = 3221225472;
    v66[2] = __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_6;
    v66[3] = &unk_24DBED790;
    v34 = v28;
    v67 = v34;
    objc_msgSend(v33, "setDecoderDidDecodeSampleBuffer:", v66);
    while (1)
    {
      v35 = -[HMIVideoAssetReader copyNextSampleBuffer](v20, "copyNextSampleBuffer");
      v36 = v35;
      if (!v35)
        break;
      if (HMICMSampleBufferIsVideo(v35))
        -[HMIVideoDecoder handleSampleBuffer:outputFrame:](v32, "handleSampleBuffer:outputFrame:", v36, 1);
      memset(&v65, 0, sizeof(v65));
      CMSampleBufferGetPresentationTimeStamp(&v65, v36);
      CFRelease(v36);
      time1 = v65;
      time2 = (CMTime)*a6;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        context = (void *)MEMORY[0x220735570]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          time2 = v65;
          Seconds = CMTimeGetSeconds(&time2);
          time2 = (CMTime)*a6;
          v41 = CMTimeGetSeconds(&time2);
          LODWORD(time1.value) = 138543874;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v39;
          LOWORD(time1.flags) = 2048;
          *(Float64 *)((char *)&time1.flags + 2) = Seconds;
          HIWORD(time1.epoch) = 2048;
          v86 = v41;
          _os_log_impl(&dword_219D45000, v38, OS_LOG_TYPE_INFO, "%{public}@Finish re-encoding %.3f > %.3f", (uint8_t *)&time1, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        break;
      }
    }
    -[HMIVideoDecoder flush](v32, "flush");
    -[HMIVideoEncoder flush](v31, "flush");
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "flush");
    v42 = (void *)v80[5];
    if (v42)
    {
      v43 = objc_msgSend(v42, "writeToURL:atomically:", v59, 1);
    }
    else
    {
      v48 = (void *)MEMORY[0x220735570]();
      v49 = a1;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time1.value) = 138543618;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v51;
        LOWORD(time1.flags) = 2112;
        *(_QWORD *)((char *)&time1.flags + 2) = v58;
        _os_log_impl(&dword_219D45000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unable to get fragment %@ from AssetWriter", (uint8_t *)&time1, 0x16u);

      }
      objc_autoreleasePoolPop(v48);
      v43 = 0;
    }

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v44 = (void *)MEMORY[0x220735570]();
    v45 = a1;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_219D45000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the asset %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    v43 = 0;
  }

  return v43;
}

void __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v4 = objc_msgSend(a3, "mutableCopy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendData:");
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_3(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  void *v5;
  HMIVideoAssetWriter *v6;
  CMFormatDescriptionRef FormatDescription;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v6 = [HMIVideoAssetWriter alloc];
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    v12 = *MEMORY[0x24BDC0D30];
    v13 = *(_QWORD *)(MEMORY[0x24BDC0D30] + 16);
    v8 = -[HMIVideoAssetWriter initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:](v6, "initWithVideoFormat:audioFormat:initialFragmentSequenceNumber:preferredOutputSegmentInterval:", FormatDescription, 0, 1, &v12);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return objc_msgSend(v5, "handleSampleBuffer:", a3);
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t __122__HMIFeedbackVisionProcessor_reencodeAssetURL_outputURL_bitRate_duration_analysisFPS_sampleFrameHandler_dropFrameHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSampleBuffer:");
}

- (BOOL)blurFacesFromAssetURL:(id)a3 outputURL:(id)a4 duration:(id *)a5 analysisFPS:(float)a6 windowSize:(unint64_t)a7 faceDetected:(BOOL *)a8
{
  id v14;
  id v15;
  void *v16;
  HMICameraVideoFrameAnalyzerSignificantActivity *v17;
  void *v18;
  void *v19;
  HMIVideoAnalyzerConfiguration *v20;
  HMICameraVideoFrameAnalyzerSignificantActivity *v21;
  id v22;
  uint64_t v23;
  void *v24;
  HMIFeedbackVisionProcessor *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  HMIFeedbackVisionProcessor *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  unint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  HMICameraVideoFrameAnalyzerSignificantActivity *v46;
  HMIFeedbackVisionProcessor *v47;
  id v48;
  uint64_t v49;
  BOOL *v50;
  id v51;
  _BYTE buf[24];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v14, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v40 = a7;
    v42 = v15;
    v17 = [HMICameraVideoFrameAnalyzerSignificantActivity alloc];
    +[HMIVideoAnalyzerEvent defaultConfidenceThresholdsFeedback](HMIVideoAnalyzerEvent, "defaultConfidenceThresholdsFeedback");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIVideoAnalyzerEvent defaultConfidenceThresholdsFeedback](HMIVideoAnalyzerEvent, "defaultConfidenceThresholdsFeedback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(HMIVideoAnalyzerConfiguration);
    v51 = 0;
    v21 = -[HMICameraVideoFrameAnalyzerSignificantActivity initWithMediumConfidenceThresholds:highConfidenceThresholds:analyzerConfiguration:error:](v17, "initWithMediumConfidenceThresholds:highConfidenceThresholds:analyzerConfiguration:error:", v18, v19, v20, &v51);
    v22 = v51;

    if (v22)
    {
      v24 = (void *)MEMORY[0x220735570](v23);
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_219D45000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to init face detector %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      v28 = 0;
      v15 = v42;
    }
    else
    {
      if (a8)
        *a8 = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array", v40);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke;
      v45[3] = &unk_24DBED7B8;
      v46 = v21;
      v47 = self;
      v35 = v33;
      v48 = v35;
      v49 = v41;
      v50 = a8;
      v36 = (void *)MEMORY[0x220735744](v45);
      v43[0] = v34;
      v43[1] = 3221225472;
      v43[2] = __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke_22;
      v43[3] = &unk_24DBED7E0;
      v43[4] = self;
      v44 = v35;
      v37 = v35;
      v38 = (void *)MEMORY[0x220735744](v43);
      *(_OWORD *)buf = *(_OWORD *)&a5->var0;
      *(_QWORD *)&buf[16] = a5->var3;
      v15 = v42;
      v28 = +[HMIFeedbackVisionProcessor reencodeAssetURL:outputURL:bitRate:duration:analysisFPS:sampleFrameHandler:dropFrameHandler:](HMIFeedbackVisionProcessor, "reencodeAssetURL:outputURL:bitRate:duration:analysisFPS:sampleFrameHandler:dropFrameHandler:", v14, v42, 2000000, buf, v36, v38, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], LODWORD(a6))));

    }
  }
  else
  {
    v29 = (void *)MEMORY[0x220735570]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the asset %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v28 = 0;
  }

  return v28;
}

void __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke(uint64_t a1, void *a2, void *a3, opaqueCMSampleBuffer *a4)
{
  id v7;
  id v8;
  CVImageBufferRef ImageBuffer;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  Float64 Seconds;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  Float64 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  v10 = *(void **)(a1 + 32);
  v24 = 0;
  objc_msgSend(v10, "analyzePixelBuffer:regionOfInterest:error:", ImageBuffer, &v24, 0.0, 0.0, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  if (v12)
  {
    v13 = (void *)MEMORY[0x220735570]();
    v14 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CMSampleBufferGetPresentationTimeStamp(&v23, a4);
      Seconds = CMTimeGetSeconds(&v23);
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2048;
      v28 = Seconds;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skip the frame @ %.3fs due to analyzer failure", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    while ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 48), "hmf_removeFirstObject");
    v18 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_addEventsToEventQueue:events:", v19, v20);

    if (*(_QWORD *)(a1 + 64))
      **(_BYTE **)(a1 + 64) |= objc_msgSend(v11, "count") != 0;
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "na_arrayByFlattening");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_blurSampleBufferWithEncoder:sampleBuffer:events:", v8, a4, v22);

  }
}

void __107__HMIFeedbackVisionProcessor_blurFacesFromAssetURL_outputURL_duration_analysisFPS_windowSize_faceDetected___block_invoke_22(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "na_arrayByFlattening");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_blurSampleBufferWithEncoder:sampleBuffer:events:", v7, a4, v8);

}

- (void)_addEventsToEventQueue:(id)a3 events:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  v8 = a3;
  v5 = a4;
  if ((objc_msgSend(v8, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(v8, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke;
    v13 = &unk_24DBED300;
    v14 = v5;
    objc_msgSend(v6, "na_filter:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeLastObject");
    objc_msgSend(v8, "addObject:", v7);

  }
  objc_msgSend(v8, "addObject:", v5, v8, v10, v11, v12, v13);

}

uint64_t __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke_2;
  v8[3] = &unk_24DBED300;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __60__HMIFeedbackVisionProcessor__addEventsToEventQueue_events___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "boundingBox");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  HMICGRectIntersectionOverMinArea(v5, v7, v9, v11, v13, v15, v17, v19);
  return v20 > 0.5;
}

- (void)_blurSampleBufferWithEncoder:(id)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 events:(id)a5
{
  id v8;
  id v9;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v11;
  __CVBuffer *v12;
  CMSampleBufferRef CopyWithPixelBuffer;
  void *v14;
  HMIFeedbackVisionProcessor *v15;
  NSObject *v16;
  void *v17;
  Float64 Seconds;
  CMTime v19;
  CMTime time;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetPresentationTimeStamp(&v19, a4);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (objc_msgSend(v9, "hmf_isEmpty"))
  {
    objc_msgSend(v8, "handleSampleBuffer:", a4);
  }
  else
  {
    v11 = -[HMIFeedbackVisionProcessor _createBlurredPixelBuffer:events:](self, "_createBlurredPixelBuffer:events:", ImageBuffer, v9);
    if (v11)
    {
      v12 = v11;
      CopyWithPixelBuffer = HMICMSampleBufferCreateCopyWithPixelBuffer(a4, v11);
      objc_msgSend(v8, "handleSampleBuffer:", CopyWithPixelBuffer);
      CFRelease(CopyWithPixelBuffer);
      CVPixelBufferRelease(v12);
    }
    else
    {
      v14 = (void *)MEMORY[0x220735570]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        time = v19;
        Seconds = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v17;
        LOWORD(time.flags) = 2048;
        *(Float64 *)((char *)&time.flags + 2) = Seconds;
        _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Skip the frame @ %.3fs due to blurring failure", (uint8_t *)&time, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

- (__CVBuffer)_createBlurredPixelBuffer:(__CVBuffer *)a3 events:(id)a4
{
  id v6;
  double Size;
  double v8;
  double v9;
  __CVBuffer *v10;
  id v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  uint32_t v14;
  vImage_Error v15;
  void *v16;
  HMIFeedbackVisionProcessor *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint8_t *p_dest;
  NSObject *v22;
  uint32_t v23;
  __CVBuffer *v24;
  uint64_t v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  size_t v47;
  vImage_Error v48;
  id v49;
  void *v50;
  HMIFeedbackVisionProcessor *v51;
  NSObject *v52;
  void *v53;
  id v54;
  vImage_Buffer v55;
  vImage_Buffer src;
  id v57;
  int v58;
  void *v59;
  __int16 v60;
  vImage_Error v61;
  vImage_Buffer v62;
  vImage_Buffer dest;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  Size = HMICVPixelBufferGetSize(a3);
  v9 = v8;
  v57 = 0;
  v10 = +[HMIVisionUtilities transferPixelBuffer:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:pixelFormat:options:error:", a3, 32, 4, &v57);
  v11 = v57;
  if (!v10)
  {
    v16 = (void *)MEMORY[0x220735570]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(dest.data) = 138543618;
      *(void **)((char *)&dest.data + 4) = v19;
      WORD2(dest.height) = 2112;
      *(vImagePixelCount *)((char *)&dest.height + 6) = (vImagePixelCount)v11;
      v20 = "%{public}@Failed to convert YCbCr to RGBA (%@)";
      p_dest = (uint8_t *)&dest;
      goto LABEL_8;
    }
LABEL_12:

    objc_autoreleasePoolPop(v16);
    v24 = 0;
    goto LABEL_13;
  }
  v12 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", CVPixelBufferGetPixelFormatType(v10), 0, Size, v9);
  if (!v12)
  {
    CVPixelBufferRelease(v10);
    v16 = (void *)MEMORY[0x220735570]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(dest.data) = 138543362;
      *(void **)((char *)&dest.data + 4) = v19;
      v20 = "%{public}@Failed to clone RGBA source image";
      p_dest = (uint8_t *)&dest;
      v22 = v18;
      v23 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v13 = v12;
  v14 = -[HMIFeedbackVisionProcessor _blurRadiusForEvents:imageSize:](self, "_blurRadiusForEvents:imageSize:", v6, Size, v9);
  CVPixelBufferLockBaseAddress(v13, 0);
  CVPixelBufferLockBaseAddress(v10, 1uLL);
  dest.data = CVPixelBufferGetBaseAddressOfPlane(v13, 0);
  dest.height = CVPixelBufferGetHeightOfPlane(v13, 0);
  dest.width = CVPixelBufferGetWidthOfPlane(v13, 0);
  dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(v13, 0);
  src.data = CVPixelBufferGetBaseAddressOfPlane(v10, 0);
  src.height = CVPixelBufferGetHeightOfPlane(v10, 0);
  src.width = CVPixelBufferGetWidthOfPlane(v10, 0);
  src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(v10, 0);
  v15 = vImageTentConvolve_ARGB8888(&src, &dest, 0, 0, 0, v14, v14, 0, 3u);
  CVPixelBufferUnlockBaseAddress(v13, 0);
  CVPixelBufferUnlockBaseAddress(v10, 1uLL);
  if (v15)
  {
    CVPixelBufferRelease(v13);
    CVPixelBufferRelease(v10);
    v16 = (void *)MEMORY[0x220735570]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v62.data) = 138543618;
      *(void **)((char *)&v62.data + 4) = v19;
      WORD2(v62.height) = 2048;
      *(vImagePixelCount *)((char *)&v62.height + 6) = v15;
      v20 = "%{public}@Failed to blur entire image (vImage_Error = %zd)";
      p_dest = (uint8_t *)&v62;
LABEL_8:
      v22 = v18;
      v23 = 22;
LABEL_11:
      _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_ERROR, v20, p_dest, v23);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "count"))
  {
    v26 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "boundingBox");
      HMICGRectPixelFromNormalized(v28, v29, v30, v31, Size, v9);
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;

      v40 = HMICGRectExpandWithinLimit(v33, v35, v37, v39, Size, v9, 1.2);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      CVPixelBufferLockBaseAddress(v13, 1uLL);
      CVPixelBufferLockBaseAddress(v10, 0);
      v47 = dest.rowBytes * (unint64_t)v42 + 4 * (unint64_t)v40;
      v62.width = (unint64_t)v44;
      v62.rowBytes = dest.rowBytes;
      v62.data = (char *)dest.data + v47;
      v62.height = (unint64_t)v46;
      v55.data = (char *)src.data + v47;
      v55.height = (unint64_t)v46;
      v55.width = (unint64_t)v44;
      v55.rowBytes = src.rowBytes;
      v48 = vImageCopyBuffer(&v62, &v55, 4uLL, 0);
      CVPixelBufferUnlockBaseAddress(v13, 1uLL);
      CVPixelBufferUnlockBaseAddress(v10, 0);
      if (v48)
        break;
      if (++v26 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_18;
    }
    CVPixelBufferRelease(v13);
    CVPixelBufferRelease(v10);
    v16 = (void *)MEMORY[0x220735570]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 138543618;
    v59 = v19;
    v60 = 2048;
    v61 = v48;
    v20 = "%{public}@Failed to copy blurred patch (vImage_Error = %zd)";
    p_dest = (uint8_t *)&v58;
    goto LABEL_8;
  }
LABEL_18:
  CVPixelBufferRelease(v13);
  v54 = v11;
  v24 = +[HMIVisionUtilities transferPixelBuffer:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:pixelFormat:options:error:", v10, CVPixelBufferGetPixelFormatType(a3), 4, &v54);
  v49 = v54;

  CVPixelBufferRelease(v10);
  if (!v24)
  {
    v50 = (void *)MEMORY[0x220735570]();
    v51 = self;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v62.data) = 138543618;
      *(void **)((char *)&v62.data + 4) = v53;
      WORD2(v62.height) = 2112;
      *(vImagePixelCount *)((char *)&v62.height + 6) = (vImagePixelCount)v49;
      _os_log_impl(&dword_219D45000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert RGBA to YCbCr (%@)", (uint8_t *)&v62, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v24 = 0;
  }
  v11 = v49;
LABEL_13:

  return v24;
}

- (unsigned)_blurRadiusForEvents:(id)a3 imageSize:(CGSize)a4
{
  void *v4;
  int v5;
  unsigned int v6;
  _QWORD v8[4];
  CGSize v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HMIFeedbackVisionProcessor__blurRadiusForEvents_imageSize___block_invoke;
  v8[3] = &__block_descriptor_48_e54___NSNumber_24__0__HMIVideoAnalyzerEvent_8__NSNumber_16l;
  v9 = a4;
  objc_msgSend(a3, "na_reduceWithInitialValue:reducer:", &unk_24DC14930, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "intValue") / 8;
  if (v5 >= 64)
    v5 = 64;
  if (v5 <= 8)
    v5 = 8;
  v6 = (2 * v5) | 1;

  return v6;
}

uint64_t __61__HMIFeedbackVisionProcessor__blurRadiusForEvents_imageSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  float v8;
  double v9;
  double v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  double v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "boundingBox");
  v8 = *(double *)(a1 + 32) * v7;
  objc_msgSend(v6, "boundingBox");
  v10 = v9;

  v11 = *(double *)(a1 + 40) * v10;
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "floatValue");
  v14 = v13;

  if (v8 >= v11)
    *(float *)&v15 = v8;
  else
    *(float *)&v15 = v11;
  if (v14 >= *(float *)&v15)
    *(float *)&v15 = v14;
  return objc_msgSend(v12, "numberWithFloat:", v15);
}

@end
