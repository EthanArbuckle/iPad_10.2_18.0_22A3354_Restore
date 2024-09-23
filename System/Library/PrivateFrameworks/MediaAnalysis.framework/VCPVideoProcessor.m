@implementation VCPVideoProcessor

- (NSDictionary)decoderSettings
{
  return self->_decoderSettings;
}

- (void)setDecoderSettings:(id)a3
{
  NSDictionary *v4;
  NSDictionary *decoderSettings;
  id v6;

  v6 = a3;
  v4 = (NSDictionary *)objc_msgSend(v6, "count");
  if (v4)
    v4 = (NSDictionary *)v6;
  decoderSettings = self->_decoderSettings;
  self->_decoderSettings = v4;

}

- (VCPVideoProcessor)initWithURL:(id)a3
{
  id v5;
  VCPVideoProcessor *v6;
  VCPVideoProcessor *v7;
  VCPVideoProcessorSession *v8;
  VCPVideoProcessorSession *session;
  uint64_t v10;
  NSDictionary *decoderSettings;
  void *v12;
  void *v13;
  CMTime v15;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoProcessor;
  v6 = -[VCPVideoProcessor init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = objc_alloc_init(VCPVideoProcessorSession);
    session = v7->_session;
    v7->_session = v8;

    v17 = *MEMORY[0x1E0CA9040];
    v18[0] = &unk_1E6B746C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    decoderSettings = v7->_decoderSettings;
    v7->_decoderSettings = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v7->_url);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "duration");
    else
      memset(&v15, 0, sizeof(v15));
    v7->_videoDuration = CMTimeGetSeconds(&v15);

  }
  return v7;
}

- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  return -[VCPVideoProcessorSession addRequest:withConfiguration:error:](self->_session, "addRequest:withConfiguration:error:", a3, a4, a5);
}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  return -[VCPVideoProcessorSession removeRequest:error:](self->_session, "removeRequest:error:", a3, a4);
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  return -[VCPVideoProcessorSession addFrameProcessingRequest:withConfiguration:error:](self->_session, "addFrameProcessingRequest:withConfiguration:error:", a3, a4, a5);
}

- (BOOL)_analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const opaqueCMFormatDescription *v14;
  uint64_t MediaSubType;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void (**progressHandler)(double);
  id v22;
  unsigned __int8 v23;
  unsigned int v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  VCPVideoSyncFrameDecoder *syncFrameDecoder;
  VCPVideoSyncFrameDecoder *v32;
  VCPVideoSyncFrameDecoder *v33;
  VCPVideoSyncFrameDecoder *v34;
  unsigned __int8 v35;
  void (**v36)(double);
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  VCPVideoProcessorSession *session;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  unsigned int v65;
  void *v66;
  CMTimeRange v67;
  CMTime v68;
  CMSampleBufferRef sbuf;
  _QWORD v70[5];
  id v71;
  uint64_t *v72;
  CMTime buf[2];
  uint64_t v74;
  CMTime *v75;
  uint64_t v76;
  __n128 (*v77)(__n128 *, __n128 *);
  uint64_t (*v78)();
  void *v79;
  CMTime v80;
  CMTimeRange v81;
  CMTimeRange otherRange;
  CMTime duration;
  CMTime start;
  CMTimeRange range;
  CMTimeRange v86;
  _OWORD v87[3];
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", self->_url);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v37 = 0;
LABEL_80:

      goto LABEL_81;
    }
    objc_msgSend(v9, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (!self->_requiresSyncFrameDetectionFromNalUnit)
        goto LABEL_9;
      objc_msgSend(v11, "formatDescriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v13;
      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue();
        MediaSubType = CMFormatDescriptionGetMediaSubType(v14);

        if ((_DWORD)MediaSubType == 1635148593 || (_DWORD)MediaSubType == 1752589105)
        {

LABEL_9:
          -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", CFSTR("AppliesPreferredTrackTransform"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          v66 = (void *)-[NSDictionary mutableCopy](self->_decoderSettings, "mutableCopy");
          objc_msgSend(v66, "removeObjectForKey:", CFSTR("AppliesPreferredTrackTransform"));
          objc_msgSend(v12, "preferredTransform");
          v64 = angleForTransform(v87);
          if (self->_requiresSyncFrameDetectionFromNalUnit)
            v18 = 0;
          else
            v18 = v66;
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v12, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            if (v17 && !self->_requiresSyncFrameDetectionFromNalUnit)
              objc_msgSend(v19, "setAppliesPreferredTrackTransform:", 1);
            start = (CMTime)*a3;
            duration = (CMTime)*a4;
            CMTimeRangeMake(&range, &start, &duration);
            objc_msgSend(v12, "timeRange");
            CMTimeRangeGetIntersection(&v86, &range, &otherRange);
            v81 = v86;
            objc_msgSend(v10, "setTimeRange:", &v81);
            objc_msgSend(v10, "addOutput:", v20);
            if ((objc_msgSend(v10, "startReading") & 1) != 0)
            {
              -[VCPVideoProcessorSession setOrientation:](self->_session, "setOrientation:", objc_msgSend(v12, "vcp_imageOrientation"));
              progressHandler = (void (**)(double))self->_progressHandler;
              if (progressHandler)
                progressHandler[2](0.0);
              v74 = 0;
              v75 = (CMTime *)&v74;
              v76 = 0x4812000000;
              v77 = __Block_byref_object_copy__34;
              v78 = __Block_byref_object_dispose__34;
              v79 = &unk_1B706A4DA;
              memset(&v80, 0, sizeof(v80));
              objc_msgSend(v10, "timeRange");
              v80 = buf[0];
              v70[0] = MEMORY[0x1E0C809B0];
              v70[1] = 3221225472;
              v70[2] = __57__VCPVideoProcessor__analyzeWithStart_andDuration_error___block_invoke;
              v70[3] = &unk_1E6B192F8;
              v70[4] = self;
              v72 = &v74;
              v22 = v10;
              v71 = v22;
              +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:](VCPTimer, "timerWithIntervalSeconds:isOneShot:andBlock:", 1, 0, v70);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = atomic_load((unsigned __int8 *)&self->_canceled);
              if ((v23 & 1) == 0)
              {
                if (v17)
                  v24 = v64;
                else
                  v24 = 0;
                v65 = v24;
                do
                {
                  if (-[VCPVideoProcessorSession allRequestsFinished](self->_session, "allRequestsFinished"))
                    break;
                  VCPSignPostLog();
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = os_signpost_id_generate(v25);

                  VCPSignPostLog();
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = v27;
                  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
                  {
                    LOWORD(buf[0].value) = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "AVAssetReaderTrackOutput_copyNextSampleBuffer", ", (uint8_t *)buf, 2u);
                  }

                  sbuf = (CMSampleBufferRef)objc_msgSend(v20, "copyNextSampleBuffer");
                  VCPSignPostLog();
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = v29;
                  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
                  {
                    LOWORD(buf[0].value) = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v26, "AVAssetReaderTrackOutput_copyNextSampleBuffer", ", (uint8_t *)buf, 2u);
                  }

                  if (!sbuf)
                  {
                    CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                    goto LABEL_42;
                  }
                  if (self->_requiresSyncFrameDetectionFromNalUnit)
                  {
                    if (!+[VCPVideoSyncFrameDecoder isSyncFrameForCMSampleBuffer:](VCPVideoSyncFrameDecoder, "isSyncFrameForCMSampleBuffer:"))goto LABEL_40;
                    syncFrameDecoder = self->_syncFrameDecoder;
                    if (!syncFrameDecoder)
                    {
                      v32 = [VCPVideoSyncFrameDecoder alloc];
                      v33 = -[VCPVideoSyncFrameDecoder initWithDecoderSettings:formatDescription:rotationAngle:](v32, "initWithDecoderSettings:formatDescription:rotationAngle:", self->_decoderSettings, CMSampleBufferGetFormatDescription(sbuf), v65);
                      v34 = self->_syncFrameDecoder;
                      self->_syncFrameDecoder = v33;

                      syncFrameDecoder = self->_syncFrameDecoder;
                      if (!syncFrameDecoder)
                      {
                        if (a5)
                        {
                          v60 = (void *)MEMORY[0x1E0CB35C8];
                          v92 = *MEMORY[0x1E0CB2D50];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create VCPVideoSyncFrameDecoder"));
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          v93 = v61;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v60, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v62);
                          *a5 = (id)objc_claimAutoreleasedReturnValue();

                        }
                        goto LABEL_74;
                      }
                    }
                    buf[0].value = 0;
                    if (!-[VCPVideoSyncFrameDecoder decodeCMSampleBuffer:toCMSampleBuffer:error:](syncFrameDecoder, "decodeCMSampleBuffer:toCMSampleBuffer:error:", sbuf, buf, a5))
                    {
                      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
LABEL_74:
                      CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                      goto LABEL_75;
                    }
                    CF<__CVBuffer *>::operator=((const void **)&sbuf, (const void **)buf);
                    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
                  }
                  if (!-[VCPVideoProcessorSession processSampleBuffer:error:](self->_session, "processSampleBuffer:error:"))goto LABEL_74;
                  CMSampleBufferGetPresentationTimeStamp(buf, sbuf);
                  v75[2] = buf[0];
LABEL_40:
                  CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                  v35 = atomic_load((unsigned __int8 *)&self->_canceled);
                }
                while ((v35 & 1) == 0);
              }
              objc_msgSend(v22, "cancelReading");
LABEL_42:
              if (-[VCPVideoProcessorSession allRequestsFinished](self->_session, "allRequestsFinished"))
                goto LABEL_43;
              if (objc_msgSend(v22, "status") == 4)
              {
                if (a5)
                {
                  v50 = (void *)MEMORY[0x1E0CB35C8];
                  v90 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video processor cancelled"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = v51;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v52);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                }
              }
              else if (objc_msgSend(v22, "status") == 2)
              {
                session = self->_session;
                objc_msgSend(v22, "timeRange");
                CMTimeRangeGetEnd(&v68, &v67);
                if (-[VCPVideoProcessorSession flushWithEndTime:error:](session, "flushWithEndTime:error:", &v68, a5))
                {
LABEL_43:
                  objc_msgSend(v63, "destroy");
                  v36 = (void (**)(double))self->_progressHandler;
                  if (v36)
                    v36[2](1.0);
                  v37 = 1;
                  goto LABEL_76;
                }
              }
              else if (a5)
              {
                v54 = (void *)MEMORY[0x1E0CB35C8];
                v88 = *MEMORY[0x1E0CB2D50];
                v55 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v22, "error");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "stringWithFormat:", CFSTR("Failed to complete video decoding: %@"), v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = v57;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v58);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
LABEL_75:
              v37 = 0;
LABEL_76:

              _Block_object_dispose(&v74, 8);
              goto LABEL_77;
            }
            if (a5)
            {
              v46 = (void *)MEMORY[0x1E0CB35C8];
              v94 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to start decoding video track"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = v47;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -19, v48);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else if (a5)
          {
            v43 = (void *)MEMORY[0x1E0CB35C8];
            v96 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create video track output"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v44;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v45);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_62;
        }
        if (a5)
        {
          v49 = (void *)MEMORY[0x1E0CB35C8];
          v98 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported codec type: %d"), MediaSubType);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_61;
        }
      }
      else if (a5)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v100 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video track contains %d (expecting 1) format description(s)"), objc_msgSend(v13, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:
        *a5 = v42;

LABEL_62:
        v37 = 0;
        goto LABEL_77;
      }
      v37 = 0;
LABEL_78:

      goto LABEL_79;
    }
    if (a5)
    {
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v102 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset contains no video tracks"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v20);
      v37 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:

      goto LABEL_78;
    }
    v37 = 0;
LABEL_79:

    goto LABEL_80;
  }
  if (a5)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v104 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load asset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v12);
    v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_79;
  }
  v37 = 0;
LABEL_81:

  return v37;
}

void __57__VCPVideoProcessor__analyzeWithStart_andDuration_error___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, double);
  void *v3;
  CMTime *v4;
  double Seconds;
  void *v6;
  Float64 v7;
  CMTime v8;
  __int128 v9;
  _OWORD v10[2];
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(CMTime **)(*(_QWORD *)(a1 + 48) + 8);
    if (v3)
    {
      objc_msgSend(v3, "timeRange");
    }
    else
    {
      memset(v10, 0, sizeof(v10));
      v9 = 0u;
    }
    lhs = v4[2];
    *(_OWORD *)&rhs.value = v9;
    rhs.epoch = *(_QWORD *)&v10[0];
    CMTimeSubtract(&time, &lhs, &rhs);
    Seconds = CMTimeGetSeconds(&time);
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      objc_msgSend(v6, "timeRange");
    }
    else
    {
      memset(v10, 0, sizeof(v10));
      v9 = 0u;
    }
    v8 = *(CMTime *)((char *)v10 + 8);
    v7 = CMTimeGetSeconds(&v8);
    v2[2](v2, Seconds / v7);
  }

}

- (BOOL)analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5
{
  void *v9;
  BOOL v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  id v16;
  __int128 v17;
  int64_t v18;
  __int128 v19;
  int64_t var3;
  uint8_t buf[8];
  id v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v24;

  v9 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v24 = *a3;
  v23 = *a4;
  v22 = 0;
  v10 = -[VCPVideoProcessor _analyzeWithStart:andDuration:error:](self, "_analyzeWithStart:andDuration:error:", &v24, &v23, &v22);
  v11 = v22;
  if (v10)
  {
    v12 = 1;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AEC0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Attempting second pass decoding via VTDecompressionSession", buf, 2u);
      }
      self->_requiresSyncFrameDetectionFromNalUnit = 1;
      v19 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v17 = *(_OWORD *)&a4->var0;
      v18 = a4->var3;
      v16 = v11;
      v12 = -[VCPVideoProcessor _analyzeWithStart:andDuration:error:](self, "_analyzeWithStart:andDuration:error:", &v19, &v17, &v16);
      v14 = v16;

      v11 = v14;
    }
    else
    {
      v12 = 0;
    }
  }
  objc_autoreleasePoolPop(v9);
  if (a5 && v11)
    *a5 = (id)objc_msgSend(v11, "copy");

  return v12;
}

- (BOOL)analyzeWithError:(id *)a3
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v4 = *MEMORY[0x1E0CA2E30];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  return -[VCPVideoProcessor analyzeWithStart:andDuration:error:](self, "analyzeWithStart:andDuration:error:", &v6, &v4, a3);
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_syncFrameDecoder, 0);
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
