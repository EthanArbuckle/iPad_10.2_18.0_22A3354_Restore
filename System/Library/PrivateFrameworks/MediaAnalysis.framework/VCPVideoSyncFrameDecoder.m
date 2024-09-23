@implementation VCPVideoSyncFrameDecoder

- (VCPVideoSyncFrameDecoder)initWithDecoderSettings:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 rotationAngle:(int)a5
{
  id v8;
  VCPVideoSyncFrameDecoder *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  OpaqueVTDecompressionSession *value;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  Rotator *v34;
  Rotator *v35;
  NSObject *v36;
  NSObject *v37;
  VCPVideoSyncFrameDecoder *v38;
  void *v39;
  id v40;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)VCPVideoSyncFrameDecoder;
  v9 = -[VCPVideoSyncFrameDecoder init](&v42, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CA90E0];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);

    v13 = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v13);

    v15 = *MEMORY[0x1E0CA9040];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v15);

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v44 = v17;
      v45 = 2112;
      v46 = v10;
      v18 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Creating VTDecompressionSession with pixelBufferAttributes %@", buf, 0x16u);

    }
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VTDecompressionSession_Create", ", buf, 2u);
    }

    value = v9->_decompressionSession.value_;
    if (value)
    {
      CFRelease(value);
      v9->_decompressionSession.value_ = 0;
    }
    if (VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 0, (CFDictionaryRef)v10, 0, &v9->_decompressionSession.value_))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v44 = v24;
        v25 = v24;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create VTDecompressionSession", buf, 0xCu);

      }
LABEL_34:

      v38 = 0;
      goto LABEL_35;
    }
    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v20, "VTDecompressionSession_Create", ", buf, 2u);
    }

    v9->_requiresRotation = a5 != 0;
    if (a5)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v44 = v28;
        v45 = 1024;
        LODWORD(v46) = a5;
        v29 = v28;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Creating ma::Rotator with rotation angle %d", buf, 0x12u);

      }
      VCPSignPostLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_signpost_id_generate(v30);

      VCPSignPostLog();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "MARotator_Create", ", buf, 2u);
      }

      v34 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
      if (!v34)
      {
        v9->_rotator = 0;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v44 = v39;
          v40 = v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to create ma::Rotator", buf, 0xCu);

        }
        goto LABEL_34;
      }
      v35 = v34;
      ma::Rotator::Rotator((uint64_t)v34, a5);
      v9->_rotator = v35;
      VCPSignPostLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v31, "MARotator_Create", ", buf, 2u);
      }

    }
  }
  v38 = v9;
LABEL_35:

  return v38;
}

- (void)dealloc
{
  Rotator *rotator;
  objc_super v4;

  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1BCCA12BC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoSyncFrameDecoder;
  -[VCPVideoSyncFrameDecoder dealloc](&v4, sel_dealloc);
}

+ (BOOL)readBigEndianInt:(int *)a3 fromBlockBuffer:(OpaqueCMBlockBuffer *)a4 forNumBytes:(int)a5 atOffset:(unint64_t)a6
{
  _BOOL4 v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char *dataPointerOut;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  totalLengthOut = 0;
  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  if (CMBlockBufferGetDataPointer(a4, a6, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut))
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
LABEL_19:
      LOBYTE(v9) = 0;
      return v9;
    }
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      v11 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to obtain raw data pointer from the given block buffer", buf, 0xCu);

      goto LABEL_19;
    }
  }
  else
  {
    if (lengthAtOffsetOut + a6 == totalLengthOut)
    {
      switch(a5)
      {
        case 4:
          v12 = bswap32(*(_DWORD *)dataPointerOut);
          break;
        case 2:
          v12 = bswap32(*(unsigned __int16 *)dataPointerOut) >> 16;
          break;
        case 1:
          v12 = *dataPointerOut;
          break;
        default:
          if ((int)MediaAnalysisLogLevel() < 3)
            goto LABEL_19;
          v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v22 = v15;
            v23 = 1024;
            v24 = a5;
            v16 = v15;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Invalid parameter for numBytes: %d", buf, 0x12u);

            goto LABEL_19;
          }
          return v9;
      }
      *a3 = v12;
      LOBYTE(v9) = 1;
      return v9;
    }
    if ((int)MediaAnalysisLogLevel() < 3)
      goto LABEL_19;
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v14 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] The input block buffer is not contiguous", buf, 0xCu);

      goto LABEL_19;
    }
  }
  return v9;
}

+ (BOOL)isSyncFrameForCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const opaqueCMFormatDescription *FormatDescription;
  const opaqueCMFormatDescription *v5;
  FourCharCode MediaSubType;
  FourCharCode v7;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  size_t DataLength;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  unsigned int v37;
  int v38;
  int NALUnitHeaderLengthOut;
  CMBlockBufferRef blockBufferOut;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  _WORD v44[17];

  *(_QWORD *)&v44[13] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (id)objc_opt_class();
      v13 = v42;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Requested CMSampleBuffer is NULL", buf, 0xCu);

    }
    return 0;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!FormatDescription)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (id)objc_opt_class();
      v14 = v42;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] No format description in the requested CMSampleBuffer", buf, 0xCu);

    }
    return 0;
  }
  v5 = FormatDescription;
  MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  v7 = MediaSubType;
  if (MediaSubType != 1635148593 && MediaSubType != 1752589105)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = (id)objc_opt_class();
      v43 = 1024;
      *(_DWORD *)v44 = v7;
      v15 = v42;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Unsupported codec type: %d", buf, 0x12u);

    }
    return 0;
  }
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!DataBuffer)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (id)objc_opt_class();
      v16 = v42;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] No block buffer in the requested CMSampleBuffer", buf, 0xCu);

    }
    return 0;
  }
  blockBufferOut = 0;
  CMBlockBufferCreateContiguous(0, DataBuffer, 0, 0, 0, 0, 0, &blockBufferOut);
  if (v7 == 1752589105)
  {
    NALUnitHeaderLengthOut = 0;
    if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v5, 0, 0, 0, 0, &NALUnitHeaderLengthOut)
      || !NALUnitHeaderLengthOut)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v42 = v23;
        v24 = v23;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Failed to get NAL Unit header length", buf, 0xCu);

      }
    }
    else
    {
      DataLength = CMBlockBufferGetDataLength(blockBufferOut);
      if (DataLength > NALUnitHeaderLengthOut + 2)
      {
        v19 = 0;
        do
        {
          v38 = 0;
          if ((objc_msgSend((id)objc_opt_class(), "readBigEndianInt:fromBlockBuffer:forNumBytes:atOffset:", &v38, blockBufferOut, NALUnitHeaderLengthOut, v19) & 1) == 0)break;
          if (v38 <= 1)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v27 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v42 = v27;
              v43 = 1024;
              *(_DWORD *)v44 = v38;
              v28 = v27;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Invalid NAL Unit length %d", buf, 0x12u);

            }
            break;
          }
          if (DataLength < (unint64_t)v38 + 4)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v31 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v42 = v31;
              v43 = 1024;
              *(_DWORD *)v44 = v38;
              v44[2] = 2048;
              *(_QWORD *)&v44[3] = DataLength;
              v32 = v31;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Attempting to read past end of block buffer (NAL Unit length %d, remaining block buffer length %zu)", buf, 0x1Cu);

            }
            break;
          }
          v37 = 0;
          v11 = objc_msgSend((id)objc_opt_class(), "readBigEndianInt:fromBlockBuffer:forNumBytes:atOffset:", &v37, blockBufferOut, 2, v19 + NALUnitHeaderLengthOut);
          if ((v11 & 1) == 0)
            goto LABEL_55;
          if ((v37 & 0x8000) != 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v35 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v42 = v35;
              v43 = 2048;
              *(_QWORD *)v44 = 1;
              v36 = v35;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Invalid forbidden zero bit value %zu", buf, 0x16u);

            }
            break;
          }
          if ((v37 & 0x1F8) == 0 && ((v37 >> 9) & 0x3E) - 16 < 6)
            goto LABEL_55;
          v20 = v38 + (uint64_t)NALUnitHeaderLengthOut;
          v19 += v20;
          DataLength -= v20;
        }
        while (DataLength > NALUnitHeaderLengthOut + 2);
      }
    }
  }
  else if (v7 == 1635148593)
  {
    NALUnitHeaderLengthOut = 0;
    if (CMVideoFormatDescriptionGetH264ParameterSetAtIndex(v5, 0, 0, 0, 0, &NALUnitHeaderLengthOut)
      || !NALUnitHeaderLengthOut)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v42 = v21;
        v22 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][H264] Failed to get NAL Unit header length", buf, 0xCu);

      }
    }
    else
    {
      v9 = CMBlockBufferGetDataLength(blockBufferOut);
      if (v9 > NALUnitHeaderLengthOut + 1)
      {
        v10 = 0;
        do
        {
          v38 = 0;
          if ((objc_msgSend((id)objc_opt_class(), "readBigEndianInt:fromBlockBuffer:forNumBytes:atOffset:", &v38, blockBufferOut, NALUnitHeaderLengthOut, v10) & 1) == 0)break;
          if (v38 <= 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v42 = v25;
              v43 = 1024;
              *(_DWORD *)v44 = v38;
              v26 = v25;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][H264] Invalid NAL Unit length %d", buf, 0x12u);

            }
            break;
          }
          if (v9 < (unint64_t)v38 + 4)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v29 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v42 = v29;
              v43 = 1024;
              *(_DWORD *)v44 = v38;
              v44[2] = 2048;
              *(_QWORD *)&v44[3] = v9;
              v30 = v29;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][H264] Attempting to read past end of block buffer (NAL Unit length %d, remaining block buffer length %zu)", buf, 0x1Cu);

            }
            break;
          }
          v37 = 0;
          v11 = objc_msgSend((id)objc_opt_class(), "readBigEndianInt:fromBlockBuffer:forNumBytes:atOffset:", &v37, blockBufferOut, 1, v10 + NALUnitHeaderLengthOut);
          if ((v11 & 1) == 0)
            goto LABEL_55;
          if ((v37 & 0x80) != 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v33 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v42 = v33;
              v43 = 2048;
              *(_QWORD *)v44 = 1;
              v34 = v33;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][H264] Invalid forbidden zero bit value %zu", buf, 0x16u);

            }
            break;
          }
          if ((v37 & 0x60) != 0 && (v37 & 0x1F) == 5)
            goto LABEL_55;
          v12 = v38 + (uint64_t)NALUnitHeaderLengthOut;
          v10 += v12;
          v9 -= v12;
        }
        while (v9 > NALUnitHeaderLengthOut + 1);
      }
    }
  }
  v11 = 0;
LABEL_55:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&blockBufferOut);
  return v11;
}

- (BOOL)decodeCMSampleBuffer:(opaqueCMSampleBuffer *)a3 toCMSampleBuffer:(opaqueCMSampleBuffer *)a4 error:(id *)a5
{
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  OSStatus v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  Rotator *rotator;
  __CVBuffer *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  __CVBuffer *v46;
  OSStatus v47;
  NSObject *v48;
  const char *v49;
  uint8_t *p_buf;
  void *v51;
  void *v52;
  void *v53;
  CMTime v54;
  CMTime v55;
  _QWORD aBlock[5];
  uint64_t v57;
  const void **v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  const void **(*v61)(uint64_t);
  void *v62;
  const void *v63;
  uint8_t v64[2];
  CMSampleTimingInfo buf;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v79 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] No CMSampleBuffer"), objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  if (!self->_decompressionSession.value_)
  {
    if (a5)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v77 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] No VTDecompressionSession"), objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v57 = 0;
  v58 = (const void **)&v57;
  v59 = 0x3812000000;
  v60 = __Block_byref_object_copy__21;
  v61 = __Block_byref_object_dispose__21;
  v62 = &unk_1B706A4DA;
  v63 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__VCPVideoSyncFrameDecoder_decodeCMSampleBuffer_toCMSampleBuffer_error___block_invoke;
  aBlock[3] = &unk_1E6B179D8;
  aBlock[4] = &v57;
  v9 = _Block_copy(aBlock);
  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf.duration.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VTDecompressionSession_Decode", ", (uint8_t *)&buf, 2u);
  }

  v14 = VTDecompressionSessionDecodeFrameWithOutputHandler(self->_decompressionSession.value_, a3, 0, 0, v9);
  if (!v14)
  {
    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v11, "VTDecompressionSession_Decode", ", (uint8_t *)&buf, 2u);
    }

    if (!v58[6])
    {
      if (a5)
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v73 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to decode sync frame"), objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v40);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_9;
    }
    if (self->_requiresRotation)
    {
      if (!self->_rotator)
      {
        if (a5)
        {
          v41 = (void *)MEMORY[0x1E0CB35C8];
          v71 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] No ma::Rotator"), objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v43);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_9;
      }
      buf.duration.value = 0;
      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_signpost_id_generate(v28);

      VCPSignPostLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v55.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MARotator_Rotate", ", (uint8_t *)&v55, 2u);
      }

      rotator = self->_rotator;
      v33 = (__CVBuffer *)v58[6];
      if (buf.duration.value)
      {
        CFRelease((CFTypeRef)buf.duration.value);
        buf.duration.value = 0;
      }
      v34 = ma::Rotator::Rotate((ma::Rotator *)rotator, v33, (CFTypeRef *)&buf);
      if (v34)
      {
        if (a5)
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          v69 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to perform rotation"), objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v34, v37);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        goto LABEL_9;
      }
      VCPSignPostLog();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        LOWORD(v55.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v45, OS_SIGNPOST_INTERVAL_END, v29, "MARotator_Rotate", ", (uint8_t *)&v55, 2u);
      }

      CF<__CVBuffer *>::operator=(v58 + 6, (const void **)&buf);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
    }
    memset(&v55, 0, sizeof(v55));
    CMSampleBufferGetPresentationTimeStamp(&v55, a3);
    v46 = (__CVBuffer *)v58[6];
    v54 = v55;
    formatDescriptionOut = 0;
    v47 = CMVideoFormatDescriptionCreateForImageBuffer(0, v46, &formatDescriptionOut);
    if (v47)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        v48 = MEMORY[0x1E0C81028];
        v49 = "[CVPixelBuffer->CMSampleBuffer] Failed to create format description";
        p_buf = (uint8_t *)&buf;
LABEL_48:
        _os_log_impl(&dword_1B6C4A000, v48, OS_LOG_TYPE_ERROR, v49, p_buf, 2u);
      }
    }
    else
    {
      *(_OWORD *)&buf.duration.value = *MEMORY[0x1E0CA2E18];
      buf.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      buf.presentationTimeStamp = v54;
      buf.decodeTimeStamp = buf.duration;
      v47 = CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v46, formatDescriptionOut, &buf, a4);
      if (v47 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v64 = 0;
        v48 = MEMORY[0x1E0C81028];
        v49 = "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer";
        p_buf = v64;
        goto LABEL_48;
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
    v18 = v47 == 0;
    if (a5 && v47)
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to perform CMSampleBuffer_CreateWithCVPixelBuffer"), objc_opt_class());
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v47, v53);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v75 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to perform VTDecompressionSessionDecodeFrameWithOutputHandler"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:
  v18 = 0;
LABEL_10:

  _Block_object_dispose(&v57, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v63);
  return v18;
}

void __72__VCPVideoSyncFrameDecoder_decodeCMSampleBuffer_toCMSampleBuffer_error___block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (cf)
  {
    v6[0] = CFRetain(cf);
    CF<__CVBuffer *>::operator=((const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), v6);
    CF<opaqueCMSampleBuffer *>::~CF(v6);
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(v6[0]) = 67109120;
    HIDWORD(v6[0]) = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to decode CMSampleBuffer via VTDecompressionSession (%d)", (uint8_t *)v6, 8u);
  }
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_decompressionSession.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
