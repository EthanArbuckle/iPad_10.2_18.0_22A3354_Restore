@implementation VCPBlastdoorVideoProcessor

- (VCPBlastdoorVideoProcessor)initWithURL:(id)a3
{
  id v5;
  VCPBlastdoorVideoProcessor *v6;
  VCPBlastdoorVideoProcessor *v7;
  uint64_t v8;
  NSMutableArray *frameProcessors;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPBlastdoorVideoProcessor;
  v6 = -[VCPBlastdoorVideoProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    frameProcessors = v7->_frameProcessors;
    v7->_frameProcessors = (NSMutableArray *)v8;

    atomic_store(0, (unsigned __int8 *)&v7->_canceled);
  }

  return v7;
}

- (BOOL)processConfiguration:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (id)objc_opt_class();
      objc_msgSend(v5, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Unsupported configuration keys: %@", buf, 0x16u);

    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported configuration keys"), *MEMORY[0x1E0CB2D50]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6 == 0;
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  NSMutableArray *frameProcessors;
  void *v11;

  v8 = a3;
  v9 = -[VCPBlastdoorVideoProcessor processConfiguration:withError:](self, "processConfiguration:withError:", a4, a5);
  if (v9)
  {
    frameProcessors = self->_frameProcessors;
    v11 = _Block_copy(v8);
    -[NSMutableArray addObject:](frameProcessors, "addObject:", v11);

  }
  return v9;
}

- (BOOL)analyzeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void (**progressHandler)(double);
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  unsigned __int8 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  id v33;
  void (**v34)(double);
  uint64_t v36;
  id v37;
  _QWORD aBlock[4];
  NSObject *v40;
  VCPBlastdoorVideoProcessor *v41;
  __int128 *p_buf;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_frameProcessors, "count"))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2050000000;
    v4 = (void *)getIMMessagesBlastDoorInterfaceClass(void)::softClass;
    v48 = getIMMessagesBlastDoorInterfaceClass(void)::softClass;
    v5 = MEMORY[0x1E0C809B0];
    if (!getIMMessagesBlastDoorInterfaceClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v52 = (uint64_t)___ZL36getIMMessagesBlastDoorInterfaceClassv_block_invoke;
      v53 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B15540;
      v54 = (void (*)(uint64_t))&v45;
      ___ZL36getIMMessagesBlastDoorInterfaceClassv_block_invoke((uint64_t)&buf);
      v4 = (void *)v46[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v45, 8);
    v37 = objc_alloc_init(v6);
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", CFSTR("FrameLimit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (!v8 && (int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      v10 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] No frame limit, progress may be inaccurate", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__35;
    v54 = __Block_byref_object_dispose__35;
    v55 = 0;
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __47__VCPBlastdoorVideoProcessor_analyzeWithError___block_invoke;
    aBlock[3] = &unk_1E6B199A8;
    p_buf = &buf;
    v11 = dispatch_semaphore_create(0);
    v40 = v11;
    v41 = self;
    v43 = &v45;
    v44 = v8;
    v12 = _Block_copy(aBlock);
    progressHandler = (void (**)(double))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](0.0);
    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    if (!v15)
      v15 = 299;
    if (v17)
      v18 = v17;
    else
      v18 = 299;
    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", CFSTR("UniformSampling"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AEC0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    -[NSDictionary objectForKeyedSubscript:](self->_decoderSettings, "objectForKeyedSubscript:", CFSTR("AppliesPreferredTrackTransform"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    LOBYTE(v36) = v24;
    objc_msgSend(v37, "generateMovieFramesForAttachmentWithFileURL:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:", self->_url, v15, v18, v8, v20, v22, v36, v12);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    if (a3)
    {
      v25 = atomic_load((unsigned __int8 *)&self->_canceled);
      v26 = *((_QWORD *)&buf + 1);
      if ((v25 & 1) != 0 && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v49 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cancelled"), objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v30;

        v26 = *((_QWORD *)&buf + 1);
      }
      *a3 = (id)objc_msgSend(*(id *)(v26 + 40), "copy");
    }
    v32 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v45, 8);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v33 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] No frame processing request, analysis complete", (uint8_t *)&buf, 0xCu);

    }
    v34 = (void (**)(double))self->_progressHandler;
    if (v34)
    {
      v34[2](0.0);
      (*((void (**)(double))self->_progressHandler + 2))(1.0);
    }
    return 1;
  }
  return v32;
}

void __47__VCPBlastdoorVideoProcessor_analyzeWithError___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  __CVBuffer *v13;
  Float64 v14;
  NSObject *v15;
  const char *v16;
  uint8_t *p_buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CMTimeEpoch v22;
  char v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  CMSampleBufferRef sampleBufferOut;
  uint8_t v44[2];
  CMVideoFormatDescriptionRef formatDescriptionOut;
  _BYTE v46[128];
  CMSampleTimingInfo buf;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v7)
  {
    v9 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40));
    if ((v9 & 1) != 0 || (v10 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 41)), (v10 & 1) != 0))
    {
      if (a4)
      {
LABEL_10:
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
        if (v18)
          (*(void (**)(double))(v18 + 16))(1.0);
LABEL_16:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      }
    }
    else
    {
      v11 = v7;
      objc_msgSend(v11, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (__CVBuffer *)objc_msgSend(v12, "pixelBuffer");

      if (v13)
      {
        sampleBufferOut = 0;
        v37 = v8;
        objc_msgSend(v11, "timestamp");
        CMTimeMakeWithSeconds(&v42, v14, 1000);
        formatDescriptionOut = 0;
        if (CMVideoFormatDescriptionCreateForImageBuffer(0, v13, &formatDescriptionOut))
        {
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          LOWORD(buf.duration.value) = 0;
          v15 = MEMORY[0x1E0C81028];
          v16 = "[CVPixelBuffer->CMSampleBuffer] Failed to create format description";
          p_buf = (uint8_t *)&buf;
        }
        else
        {
          *(_OWORD *)&buf.duration.value = *MEMORY[0x1E0CA2E18];
          v22 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          buf.presentationTimeStamp = v42;
          buf.duration.epoch = v22;
          *(_OWORD *)&buf.decodeTimeStamp.value = *(_OWORD *)&buf.duration.value;
          buf.decodeTimeStamp.epoch = v22;
          if (!CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, formatDescriptionOut, &buf, &sampleBufferOut))
          {
            CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v25 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
            v36 = v11;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v39;
              v28 = 1;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v39 != v27)
                    objc_enumerationMutation(v25);
                  v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                  v31 = (void *)MEMORY[0x1BCCA1B2C]();
                  LOBYTE(buf.duration.value) = 0;
                  (*(void (**)(uint64_t, CMSampleBufferRef, CMSampleTimingInfo *))(v30 + 16))(v30, sampleBufferOut, &buf);
                  LODWORD(v30) = LOBYTE(buf.duration.value);
                  objc_autoreleasePoolPop(v31);
                  v28 &= (_DWORD)v30 != 0;
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              }
              while (v26);
            }
            else
            {
              v28 = 1;
            }

            atomic_store(v28, (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 41));
            v32 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            if (*(_QWORD *)(a1 + 64))
              v33 = *(_QWORD *)(a1 + 64);
            else
              v33 = v32 + 1;
            v11 = v36;
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              v34 = objc_msgSend(v36, "frame");
              LODWORD(buf.duration.value) = 67109376;
              HIDWORD(buf.duration.value) = v34;
              LOWORD(buf.duration.timescale) = 2048;
              *(double *)((char *)&buf.duration.timescale + 2) = (double)v32 / (double)v33 * 100.0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Processed frame %d, progress %.2f%%", (uint8_t *)&buf, 0x12u);
            }
            v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
            if (v35)
              (*(void (**)(double))(v35 + 16))((double)v32 / (double)v33);
            v23 = 0;
LABEL_34:
            CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);

            v24 = v23 | a4 ^ 1;
            v8 = v37;
            if ((v24 & 1) != 0)
              goto LABEL_17;
            goto LABEL_10;
          }
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
LABEL_30:
            CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.duration.value) = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to convert CVPixelBuffer to CMSampleBuffer", (uint8_t *)&buf, 2u);
            }
            v23 = 1;
            goto LABEL_34;
          }
          *(_WORD *)v44 = 0;
          v15 = MEMORY[0x1E0C81028];
          v16 = "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer";
          p_buf = v44;
        }
        _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_ERROR, v16, p_buf, 2u);
        goto LABEL_30;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No CVPixelBuffer from BlastDoorVideoPreview", (uint8_t *)&buf, 2u);
      }

    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.duration.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor: %@", (uint8_t *)&buf, 0xCu);
    }
    v19 = objc_msgSend(v8, "copy");
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    if (a4)
      goto LABEL_16;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.duration.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain decoded frame from Blastdoor but decoding not finished yet", (uint8_t *)&buf, 2u);
    }
  }
LABEL_17:

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (NSDictionary)decoderSettings
{
  return self->_decoderSettings;
}

- (void)setDecoderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_decoderSettings, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_frameProcessors, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
