@implementation MADUserSafetyVideoQRCodeDetector

+ (int)generateDecoderSettings:(id)a3 decoderConfig:(id)a4 withRequest:(id)a5 videoDuration:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  double v28;
  CFDictionaryRef v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  CMTime v35;
  CMTime buf;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6B72F38, *MEMORY[0x1E0CA9040]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6B72F50, *MEMORY[0x1E0CA90E0]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6B72F50, *MEMORY[0x1E0CA8FD8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "appliesPreferredTrackTransform"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("AppliesPreferredTrackTransform"));

    objc_msgSend(v11, "sampling");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "sampling");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "framesPerSync");

    }
    else
    {
      v15 = 1;
    }

    objc_msgSend(v11, "sampling");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "sampling");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "uniformSampling");

    }
    else
    {
      v19 = 1;
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D478A0]), "initWithFramesPerSync:frameLimit:uniformSampling:", v15, 1, v19);
    if (objc_msgSend(v11, "requiresBlastdoor"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "framesPerSync"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C8AEC0]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "frameLimit"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("FrameLimit"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "uniformSampling"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("UniformSampling"));

    }
    else
    {
      if (!objc_msgSend(v20, "frameLimit")
        && objc_msgSend(v20, "uniformSampling")
        && (int)MediaAnalysisLogLevel() >= 4
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = objc_opt_class();
        v25 = *(id *)((char *)&buf.value + 4);
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Unexpected uniformSampling specified when frameLimit is 0,ignoring uniformSampling", (uint8_t *)&buf, 0xCu);

      }
      if (objc_msgSend(v20, "framesPerSync"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "framesPerSync"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0C8AEC0]);

        if (objc_msgSend(v20, "frameLimit"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "frameLimit"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("FrameLimit"));

          if (objc_msgSend(v20, "uniformSampling"))
          {
            v28 = a6 / ((double)(unint64_t)(objc_msgSend(v20, "frameLimit") - 1) + 0.1);
            if (v28 <= 0.0)
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                v32 = (void *)objc_opt_class();
                v33 = *MEMORY[0x1E0C8AE28];
                LODWORD(buf.value) = 138412802;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v32;
                LOWORD(buf.flags) = 2112;
                *(_QWORD *)((char *)&buf.flags + 2) = v33;
                HIWORD(buf.epoch) = 2048;
                v37 = v28;
                v34 = v32;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Invalid decoder configuration value (%@ = %f), ignoring", (uint8_t *)&buf, 0x20u);

              }
            }
            else
            {
              memset(&buf, 0, sizeof(buf));
              CMTimeMakeWithSeconds(&buf, v28, 1000);
              v35 = buf;
              v29 = CMTimeCopyAsDictionary(&v35, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0C8AE28]);

            }
          }
        }
      }
      else if (objc_msgSend(v20, "frameLimit"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "frameLimit"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("FrameLimit"));

        if (objc_msgSend(v20, "uniformSampling"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v20, "frameLimit") / a6);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, CFSTR("FramesPerSecond"));

        }
      }
    }

    v16 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "generateDecoderSettings:decoderConfig:withRequest:videoDuration: failed, nil inputs", (uint8_t *)&buf, 2u);
    }
    v16 = -50;
  }

  return v16;
}

- (id)sensitivityFromQRCodeInVideo:(id)a3 request:(id)a4 signpostPayload:(id)a5 progressHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  VCPBlastdoorVideoProcessor *v25;
  double v26;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  double v33;
  id v34;
  int v35;
  const __CFString *v36;
  void *v37;
  id v38;
  int v39;
  const __CFString *v40;
  BOOL v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  BOOL v45;
  NSObject *v46;
  NSObject *v47;
  __CFString *v48;
  uint64_t v49;
  __CFString *v50;
  os_signpost_id_t v52;
  id v53;
  id v54;
  id v55;
  void *type;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  _QWORD aBlock[5];
  id v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = (id)objc_opt_class();
    v14 = v66;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);

  }
  -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    v20 = (void *)MEMORY[0x1BCCA1B2C]();
    objc_msgSend(v11, "sensitiveFrameCountThreshold");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v11, "sensitiveFrameCountThreshold");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue") == 0;

      if (v23)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v37 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v66 = v37;
          v38 = v37;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0", buf, 0xCu);

        }
        -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v30 = 1;
LABEL_63:
        objc_autoreleasePoolPop(v20);
        if (v30)
          goto LABEL_64;
        goto LABEL_5;
      }
    }
    objc_msgSend(v10, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v66 = v31;
        v32 = v31;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to obtain video resource", buf, 0xCu);

      }
      -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 1;
      goto LABEL_62;
    }
    if (objc_msgSend(v11, "requiresBlastdoor"))
    {
      v25 = -[VCPBlastdoorVideoProcessor initWithURL:]([VCPBlastdoorVideoProcessor alloc], "initWithURL:", v24);
      v26 = 0.0;
      if (v25)
        goto LABEL_14;
    }
    else
    {
      v25 = -[VCPVideoProcessor initWithURL:]([VCPVideoProcessor alloc], "initWithURL:", v24);
      -[VCPBlastdoorVideoProcessor videoDuration](v25, "videoDuration");
      v26 = v33;
      if (v25)
      {
LABEL_14:
        if (v13)
          -[VCPBlastdoorVideoProcessor setProgressHandler:](v25, "setProgressHandler:", v13);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v27 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v27;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)objc_opt_class(), "generateDecoderSettings:decoderConfig:withRequest:videoDuration:", v27, v60, v11, v26))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v66 = v28;
            v29 = v28;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to generate settings and config for videoProcessor", buf, 0xCu);

          }
          -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v30 = 1;
          goto LABEL_60;
        }
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v57 = (id)objc_opt_class();
          v39 = objc_msgSend(v11, "requiresBlastdoor");
          v40 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          v66 = v57;
          v67 = 2112;
          if (v39)
            v40 = CFSTR("YES");
          v68 = v40;
          v69 = 2112;
          v70 = v27;
          v71 = 2112;
          v72 = v60;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] requiresBlastdoor: %@, decoder settings: %@, decoder configuration: %@", buf, 0x2Au);

        }
        -[VCPBlastdoorVideoProcessor setDecoderSettings:](v25, "setDecoderSettings:", v27);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __105__MADUserSafetyVideoQRCodeDetector_sensitivityFromQRCodeInVideo_request_signpostPayload_progressHandler___block_invoke;
        aBlock[3] = &unk_1E6B183A0;
        aBlock[4] = self;
        v53 = v12;
        v64 = v53;
        type = _Block_copy(aBlock);
        v62 = 0;
        v41 = -[VCPBlastdoorVideoProcessor addFrameProcessingRequest:withConfiguration:error:](v25, "addFrameProcessingRequest:withConfiguration:error:", type, v60, &v62);
        v58 = v62;
        if (v41)
        {
          VCPSignPostLog();
          v42 = objc_claimAutoreleasedReturnValue();
          v52 = os_signpost_id_generate(v42);

          VCPSignPostLog();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
          {
            *(_DWORD *)buf = 138412290;
            v66 = v53;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v52, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
          }

          v61 = v58;
          v45 = -[VCPBlastdoorVideoProcessor analyzeWithError:](v25, "analyzeWithError:", &v61);
          v19 = v61;

          v58 = v19;
          if (v45)
          {
            VCPSignPostLog();
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v53;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v47, OS_SIGNPOST_INTERVAL_END, v52, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
            }

            v30 = 0;
            goto LABEL_59;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v55 = (id)objc_opt_class();
            objc_msgSend(v19, "description");
            v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v66 = v55;
            v67 = 2112;
            v68 = v50;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to process video (%@)", buf, 0x16u);

          }
          -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
          v49 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v54 = (id)objc_opt_class();
            objc_msgSend(v58, "description");
            v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v66 = v54;
            v67 = 2112;
            v68 = v48;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to add request to video processor (%@)", buf, 0x16u);

          }
          -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
          v49 = objc_claimAutoreleasedReturnValue();
        }
        v19 = (id)v49;
        v30 = 1;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
        goto LABEL_63;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v34 = (id)objc_opt_class();
      v35 = objc_msgSend(v11, "requiresBlastdoor");
      v36 = CFSTR("NO");
      if (v35)
        v36 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v66 = v34;
      v67 = 2112;
      v68 = v36;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create video processor (requiresBlastdoor: %@)", buf, 0x16u);

    }
    -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 1;
    goto LABEL_61;
  }
LABEL_5:
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v66 = v17;
    v18 = v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);

  }
  -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:

  return v19;
}

void __105__MADUserSafetyVideoQRCodeDetector_sensitivityFromQRCodeInVideo_request_signpostPayload_progressHandler___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  char v8;
  CVImageBufferRef ImageBuffer;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(*(id *)(a1 + 32), "sensitivity"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    if (ImageBuffer)
    {
      objc_msgSend(*(id *)(a1 + 32), "processPixelBuffer:orientation:signpostPayload:", ImageBuffer, 1, *(_QWORD *)(a1 + 40));
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = (id)objc_opt_class();
      v10 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to acquire pixelBuffer", (uint8_t *)&v11, 0xCu);

    }
  }
  *a3 = 1;
}

@end
