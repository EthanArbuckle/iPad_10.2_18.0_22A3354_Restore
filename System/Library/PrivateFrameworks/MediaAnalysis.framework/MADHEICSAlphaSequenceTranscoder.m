@implementation MADHEICSAlphaSequenceTranscoder

- (MADHEICSAlphaSequenceTranscoder)initWithSequenceData:(id)a3 maxDimension:(unint64_t)a4 qualityValue:(double)a5
{
  id v9;
  MADHEICSAlphaSequenceTranscoder *v10;
  MADHEICSAlphaSequenceTranscoder *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADHEICSAlphaSequenceTranscoder;
  v10 = -[MADHEICSAlphaSequenceTranscoder init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceData, a3);
    v11->_maxDimension = a4;
    v11->_qualityValue = a5;
  }

  return v11;
}

- (int)_setupTranscode
{
  CMPhotoDecompressionSession *value;
  CF<CMPhotoDecompressionSession *> *p_source;
  int Container;
  CMPhotoDecompressionContainer *v6;
  CMPhotoDecompressionContainer *v7;
  CMPhotoCompressionSession *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *frameProperties;
  OS_dispatch_group *v13;
  OS_dispatch_group *encodeGroup;
  NSObject *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *encodeQueue;
  OS_dispatch_semaphore *v18;
  OS_dispatch_semaphore *encodeSemaphore;
  CFDictionaryRef theDict;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  p_source = &self->_source;
  value = self->_source.value_;
  if (value)
  {
    CFRelease(value);
    p_source->value_ = 0;
  }
  Container = CMPhotoDecompressionSessionCreate();
  if (!Container)
  {
    v6 = self->_sourceContainer.value_;
    if (v6)
    {
      CFRelease(v6);
      self->_sourceContainer.value_ = 0;
    }
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      v7 = self->_sequenceContainer.value_;
      if (v7)
      {
        CFRelease(v7);
        self->_sequenceContainer.value_ = 0;
      }
      Container = CMPhotoDecompressionContainerCreateSequenceContainer();
      if (!Container)
      {
        v8 = self->_compressionSession.value_;
        if (v8)
        {
          CFRelease(v8);
          self->_compressionSession.value_ = 0;
        }
        Container = CMPhotoCompressionSessionCreate();
        if (!Container)
        {
          v9 = *MEMORY[0x1E0D09308];
          v22[0] = *MEMORY[0x1E0D09318];
          v22[1] = v9;
          v23[0] = &unk_1E6B72CE0;
          v23[1] = &unk_1E6B72CF8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          Container = CMPhotoCompressionSessionOpenEmptyContainer();
          if (!Container)
          {
            Container = CMPhotoCompressionSessionStartImageSequence();
            if (!Container)
            {
              Container = CMPhotoDecompressionContainerGetImageCount();
              if (!Container)
              {
                theDict = 0;
                Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
                if (!Container)
                {
                  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0D09518]);
                  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
                  frameProperties = self->_frameProperties;
                  self->_frameProperties = v11;

                  if (self->_frameProperties)
                  {
                    v13 = (OS_dispatch_group *)dispatch_group_create();
                    encodeGroup = self->_encodeGroup;
                    self->_encodeGroup = v13;

                    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v15 = objc_claimAutoreleasedReturnValue();
                    v16 = (OS_dispatch_queue *)dispatch_queue_create("heics.encode", v15);
                    encodeQueue = self->_encodeQueue;
                    self->_encodeQueue = v16;

                    v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(2);
                    encodeSemaphore = self->_encodeSemaphore;
                    self->_encodeSemaphore = v18;

                    Container = 0;
                  }
                  else
                  {
                    Container = -18;
                  }
                }
                CF<opaqueCMSampleBuffer *>::~CF((const void **)&theDict);
              }
            }
          }

        }
      }
    }
  }
  return Container;
}

- (int)_decodeFrameIndex:(unint64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6
{
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  int ImageForIndex;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  CMTime buf;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MADHEICSTranscode_DecodeFrame", ", (uint8_t *)&buf, 2u);
  }

  -[NSArray objectAtIndexedSubscript:](self->_frameProperties, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D09528]);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    CMTimeMakeFromDictionary(&buf, v14);
    *(CMTime *)a6 = buf;
    v16 = (void *)MEMORY[0x1E0C99E08];
    v17 = *MEMORY[0x1E0D09570];
    v42 = *MEMORY[0x1E0D09570];
    v43[0] = &unk_1E6B72D10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithDictionary:", v18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADHEICSTranscode_DecodeBaseImage", ", (uint8_t *)&buf, 2u);
    }

    ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex();
    if (!ImageForIndex)
    {
      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(buf.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_END, v20, "MADHEICSTranscode_DecodeBaseImage", ", (uint8_t *)&buf, 2u);
      }

      v26 = (void *)MEMORY[0x1E0C99E08];
      v40 = v17;
      v41 = &unk_1E6B72D28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dictionaryWithDictionary:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      VCPSignPostLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_signpost_id_generate(v29);

      VCPSignPostLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(buf.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MADHEICSTranscode_DecodeAlphaImage", ", (uint8_t *)&buf, 2u);
      }

      ImageForIndex = CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex();
      if (!ImageForIndex)
      {
        VCPSignPostLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(buf.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_END, v30, "MADHEICSTranscode_DecodeAlphaImage", ", (uint8_t *)&buf, 2u);
        }

        VCPSignPostLog();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          LOWORD(buf.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v36, OS_SIGNPOST_INTERVAL_END, v10, "MADHEICSTranscode_DecodeFrame", ", (uint8_t *)&buf, 2u);
        }

      }
    }

  }
  else
  {
    ImageForIndex = -18;
  }

  return ImageForIndex;
}

- (int)_addFrameToSequence:(int64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t spid;
  uint8_t v38[16];
  uint8_t v39[16];
  __int128 v40;
  int64_t var3;
  uint8_t buf[16];
  uint64_t v43;
  void *v44;
  _QWORD v45[6];
  _QWORD v46[8];

  v46[6] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADHEICSTranscode_EncodeFrame", ", buf, 2u);
  }

  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = *MEMORY[0x1E0D09418];
  v45[0] = *MEMORY[0x1E0D09378];
  v45[1] = v12;
  v46[0] = &unk_1E6B72D40;
  v46[1] = &unk_1E6B72D58;
  v45[2] = *MEMORY[0x1E0D09410];
  v43 = *MEMORY[0x1E0D09618];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_qualityValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v14;
  v45[3] = *MEMORY[0x1E0D093E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxDimension);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D09450];
  v46[3] = v15;
  v46[4] = MEMORY[0x1E0C9AAB0];
  v17 = *MEMORY[0x1E0D09348];
  v45[4] = v16;
  v45[5] = v17;
  v46[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E6B72D70, *MEMORY[0x1E0D093B8]);
  VCPSignPostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_generate(v21);

  VCPSignPostLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MADHEICSTranscode_EncodeBaseImage", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v40 = *(_OWORD *)&a6->var0;
  var3 = a6->var3;
  v25 = CMPhotoCompressionSessionAddImageToSequence();
  if (!v25)
  {
    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v22, "MADHEICSTranscode_EncodeBaseImage", ", v39, 2u);
    }

    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_id_generate(v28);

    VCPSignPostLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MADHEICSTranscode_EncodeAlphaImage", ", v39, 2u);
    }

    *(_QWORD *)v39 = 0;
    v25 = CMPhotoCompressionSessionAddAuxiliaryImage();
    if (!v25)
    {
      VCPSignPostLog();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_END, v29, "MADHEICSTranscode_EncodeAlphaImage", ", v38, 2u);
      }

      VCPSignPostLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, spid, "MADHEICSTranscode_EncodeFrame", ", v38, 2u);
      }

    }
  }

  return v25;
}

- (int)_transcode
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  void *v9;
  char v10;
  NSObject *encodeGroup;
  NSObject *encodeQueue;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[6];
  CFTypeRef v17;
  CFTypeRef v18;
  __int128 v19;
  uint64_t v20;
  CFTypeRef v21;
  CFTypeRef cf;
  uint8_t v23[16];
  uint64_t v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  int v28;

  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADHEICSTranscode_Transcode", ", buf, 2u);
  }

  v7 = -[MADHEICSAlphaSequenceTranscoder _setupTranscode](self, "_setupTranscode");
  if (v7)
    return v7;
  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x2020000000;
  v28 = 0;
  if (self->_frameCount <= 0)
  {
    dispatch_group_wait((dispatch_group_t)self->_encodeGroup, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_22;
  }
  v8 = 0;
  do
  {
    v9 = (void *)MEMORY[0x1BCCA1B2C]();
    v21 = 0;
    cf = 0;
    v7 = -[MADHEICSAlphaSequenceTranscoder _decodeFrameIndex:basePixelBuffer:alphaPixelBuffer:pts:](self, "_decodeFrameIndex:basePixelBuffer:alphaPixelBuffer:pts:", v8, &cf, &v21, v23);
    if (v7)
      goto LABEL_10;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_encodeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v26 + 6))
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_encodeSemaphore);
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    encodeGroup = self->_encodeGroup;
    encodeQueue = self->_encodeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = __45__MADHEICSAlphaSequenceTranscoder__transcode__block_invoke;
    block[3] = &unk_1E6B145E8;
    block[4] = self;
    block[5] = buf;
    v17 = cf;
    if (cf)
      CFRetain(cf);
    v18 = v21;
    if (v21)
      CFRetain(v21);
    v19 = *(_OWORD *)v23;
    v20 = v24;
    dispatch_group_async(encodeGroup, encodeQueue, block);
    CF<opaqueCMSampleBuffer *>::~CF(&v18);
    CF<opaqueCMSampleBuffer *>::~CF(&v17);
    v10 = 1;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v21);
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    objc_autoreleasePoolPop(v9);
    if ((v10 & 1) == 0)
      break;
    ++v8;
  }
  while (v8 < self->_frameCount);
  dispatch_group_wait((dispatch_group_t)self->_encodeGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!v7)
  {
LABEL_22:
    v7 = *((_DWORD *)v26 + 6);
    if (!v7)
    {
      v7 = CMPhotoCompressionSessionEndImageSequence();
      if (!v7)
      {
        VCPSignPostLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          *(_WORD *)v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_END, v4, "MADHEICSTranscode_Transcode", ", v23, 2u);
        }

      }
    }
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

intptr_t __45__MADHEICSAlphaSequenceTranscoder__transcode__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = v2[9];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_addFrameToSequence:basePixelBuffer:alphaPixelBuffer:pts:", v3, v4, v5, &v7);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 104));
}

- (id)run
{
  uint8_t v3[8];
  CFTypeRef cf;
  uint8_t buf[16];

  if (-[MADHEICSAlphaSequenceTranscoder _transcode](self, "_transcode"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to transcode HEIC sequence", buf, 2u);
    }
    return 0;
  }
  else
  {
    cf = 0;
    if (CMPhotoCompressionSessionCloseContainerAndCopyBacking()
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to copy HEIC sequence data", v3, 2u);
    }
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodeSemaphore, 0);
  objc_storeStrong((id *)&self->_encodeQueue, 0);
  objc_storeStrong((id *)&self->_encodeGroup, 0);
  objc_storeStrong((id *)&self->_frameProperties, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_compressionSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sequenceContainer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sourceContainer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_source.value_);
  objc_storeStrong((id *)&self->_sequenceData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
