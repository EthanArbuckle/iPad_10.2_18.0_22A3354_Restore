@implementation JFXDepthDecompressor

- (JFXDepthDecompressor)init
{
  JFXDepthDecompressor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXDepthDecompressor;
  result = -[JFXDepthDecompressor init](&v3, sel_init);
  if (result)
  {
    result->_depthCodecType = 0;
    result->_previousFormatDescription = 0;
  }
  return result;
}

- (void)dealloc
{
  JFXVideoDecoderInterface *videoDecoderInterface;
  objc_super v4;

  videoDecoderInterface = self->_videoDecoderInterface;
  self->_videoDecoderInterface = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXDepthDecompressor;
  -[JFXDepthDecompressor dealloc](&v4, sel_dealloc);
}

+ (int)bitDepthOf:(opaqueCMFormatDescription *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BYTE v9[18];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMFormatDescriptionGetExtension(a3, CFSTR("SampleDescriptionExtensionAtoms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hvcC"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "getBytes:length:", v9, 18);
      if ((v9[16] & 3) != 0)
        v7 = 0;
      else
        v7 = v9[17] & 7 | 8;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)decompressAVDepthData:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  CVImageBufferRef ImageBuffer;
  signed int MediaSubType;
  void *v10;

  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  if (a4)
    *a4 = 0;
  if (MediaSubType != 1111970369)
  {
    if (ImageBuffer)
    {
LABEL_6:
      v10 = 0;
      self->_depthCodecType = 0;
      return v10;
    }
    if (MediaSubType > 1280994656)
    {
      if (MediaSubType != 1280994657 && MediaSubType != 1280997986)
      {
        if (MediaSubType == 1752589105
          && objc_msgSend((id)objc_opt_class(), "bitDepthOf:", FormatDescription) == 10)
        {
          self->_depthCodecType = 1212493921;
          -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:](self, "decompressAVDepthData_HEVC10:error:", a3, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          return v10;
        }
        goto LABEL_6;
      }
    }
    else if ((MediaSubType - 1280992882) >= 2)
    {
      if (MediaSubType == 1212494384)
      {
        self->_depthCodecType = 1212494384;
        -[JFXDepthDecompressor decompressAVDepthData_Photo:error:](self, "decompressAVDepthData_Photo:error:", a3, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        return v10;
      }
      goto LABEL_6;
    }
    self->_depthCodecType = MediaSubType;
    -[JFXDepthDecompressor decompressAVDepthData_LZ:error:](self, "decompressAVDepthData_LZ:error:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  self->_depthCodecType = 1111970369;
  -[JFXDepthDecompressor decompressAVDepthData_BGRA:error:](self, "decompressAVDepthData_BGRA:error:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

+ (id)dataWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  OpaqueCMBlockBuffer *DataBuffer;
  OpaqueCMBlockBuffer *v4;
  size_t DataLength;
  OSStatus v6;
  size_t v9;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;

  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  v4 = DataBuffer;
  if (DataBuffer)
  {
    DataLength = CMBlockBufferGetDataLength(DataBuffer);
    blockBufferOut = 0;
    v6 = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, DataLength, 2u, &blockBufferOut);
    v4 = 0;
    if (!v6 && blockBufferOut != 0)
    {
      lengthAtOffsetOut = 0;
      dataPointerOut = 0;
      v9 = 0;
      v4 = 0;
      if (!CMBlockBufferGetDataPointer(blockBufferOut, 0, &lengthAtOffsetOut, &v9, &dataPointerOut) && dataPointerOut)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
        v4 = (OpaqueCMBlockBuffer *)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(blockBufferOut);
    }
  }
  return v4;
}

+ (id)NSDataWithCMBlockBuffer:(OpaqueCMBlockBuffer *)a3 range:(_NSRange)a4
{
  size_t length;
  size_t location;
  size_t DataLength;
  void *v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  DataLength = CMBlockBufferGetDataLength(a3);
  v8 = 0;
  if (location < DataLength && location + length <= DataLength)
  {
    v8 = malloc_type_malloc(length, 0xB27FD07DuLL);
    if (v8)
    {
      v9 = v8;
      if (CMBlockBufferCopyDataBytes(a3, location, length, v8))
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, DataLength, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v8;
}

- (id)incompleteImageSourceAuxDataInfoDict:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v5;
  const opaqueCMFormatDescription *FormatDescription;
  const opaqueCMFormatDescription *v7;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFData *v13;
  uint64_t v14;
  const __CFData *v15;
  CGImageMetadataRef v16;
  unint64_t Dimensions;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  size_t parameterSetSizeOut;
  uint8_t *parameterSetPointerOut;
  int NALUnitHeaderLengthOut;
  size_t parameterSetCountOut;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "com.apple.Clips", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  parameterSetCountOut = 0;
  NALUnitHeaderLengthOut = 0;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  v7 = FormatDescription;
  if (!FormatDescription
    || CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| parameterSetCountOut < 4|| (parameterSetSizeOut = 0, parameterSetPointerOut = 0, CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v7, 3uLL, (const uint8_t **)&parameterSetPointerOut, &parameterSetSizeOut, &parameterSetCountOut, 0))|| (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", parameterSetPointerOut, parameterSetSizeOut), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    DataLength = CMBlockBufferGetDataLength(DataBuffer);
    objc_msgSend((id)objc_opt_class(), "NSDataWithCMBlockBuffer:range:", DataBuffer, 0, DataLength);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v10, "rangeOfData:options:range:", v5, 1, 0, objc_msgSend(v10, "length"));
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    JFXLog_DebugDepthCodec();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:].cold.2();

    +[JFXDepthCompressor fakeXMPDataIfNotFound](JFXDepthCompressor, "fakeXMPDataIfNotFound");
    v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_msgSend(v5, "length") + v11;
    objc_msgSend(v10, "subdataWithRange:", v14, objc_msgSend(v10, "length") + ~v14);
    v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;
  v16 = CGImageMetadataCreateFromXMPData(v13);
  if (v7)
  {
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v7);
    v18 = HIDWORD(Dimensions);
    v19 = (4 * Dimensions);
    v35[0] = CFSTR("Width");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    v35[1] = CFSTR("Height");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v21;
    v35[2] = CFSTR("PixelFormat");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1717855600);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v22;
    v35[3] = CFSTR("BytesPerRow");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *MEMORY[0x24BDD91D0];
    v33[0] = *MEMORY[0x24BDD91C8];
    v33[1] = v25;
    v34[0] = v24;
    v34[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    JFXLog_DebugDepthCodec();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:].cold.1();

    if (v16)
      CFRelease(v16);
    v26 = 0;
  }

  return v26;
}

- (id)decompressAVDepthData_LZ:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  int depthCodecType;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;

  depthCodecType = self->_depthCodecType;
  switch(depthCodecType)
  {
    case 1280992882:
      v8 = 1;
      break;
    case 1280992883:
      v8 = 0;
      break;
    case 1280994657:
      v8 = 2;
      break;
    default:
      v8 = 3;
      break;
  }
  objc_msgSend((id)objc_opt_class(), "dataWithCMSampleBuffer:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v25 = 0;
    objc_msgSend(v9, "decompressedDataUsingAlgorithm:error:", v8, &v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    v13 = v12;
    if (!v11 || v12)
    {
      JFXLog_DebugDepthCodec();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.4();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_38;
    }
    -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:](self, "incompleteImageSourceAuxDataInfoDict:error:", a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      JFXLog_DebugDepthCodec();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.2();

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
        v17 = 0;
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
        v13 = 0;
      }
      goto LABEL_37;
    }
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD91C0]);
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v16, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    if (!v17)
    {
      JFXLog_DebugDepthCodec();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.3();

      if (v13)
      {
        if (a4)
        {
          v19 = objc_retainAutorelease(v13);
LABEL_35:
          *a4 = v19;
        }
      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  JFXLog_DebugDepthCodec();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.1();

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
    v17 = 0;
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v13 = 0;
  }
LABEL_39:

  return v17;
}

- (id)decompressAVDepthData_BGRA:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  __CVBuffer *ImageBuffer;
  __CVBuffer *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    v6 = copyBGRAToFloatDepthBuffer(ImageBuffer, 0);
    +[JFXDepthCompressor fakeAuxDepthInfoDictionaryForCVPixelBuffer:](JFXDepthCompressor, "fakeAuxDepthInfoDictionaryForCVPixelBuffer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "depthDataByReplacingDepthDataMapWithPixelBuffer:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v6);

  }
  else
  {
    JFXLog_DebugDepthCodec();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor decompressAVDepthData_BGRA:error:].cold.1();

    v9 = 0;
  }
  return v9;
}

- (id)decompressAVDepthData_HEVC10:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  const uint8_t **v8;
  size_t *v9;
  uint64_t v10;
  size_t i;
  size_t v12;
  const __CFAllocator *v13;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMSampleBufferRef v24;
  const opaqueCMFormatDescription *v25;
  int v26;
  JFXVideoDecoderInterface *videoDecoderInterface;
  JFXVideoDecoderInterface *v28;
  JFXVideoDecoderInterface *v29;
  opaqueCMFormatDescription *previousFormatDescription;
  __CVBuffer *v31;
  __CVBuffer *v32;
  CVPixelBufferRef v33;
  __CVBuffer *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  __CVBuffer *v45;
  id v46;
  size_t sampleSizeArray;
  CMSampleTimingInfo timingInfoOut;
  CMFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v50;
  int NALUnitHeaderLengthOut;
  size_t parameterSetCountOut;

  parameterSetCountOut = 0;
  NALUnitHeaderLengthOut = 0;
  v50 = 0;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut)
  {
    goto LABEL_13;
  }
  v8 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut, 0x10040436913F5uLL);
  v9 = (size_t *)malloc_type_malloc(8 * parameterSetCountOut, 0x100004000313F17uLL);
  if (parameterSetCountOut)
  {
    v10 = 0;
    for (i = 0; i < parameterSetCountOut; ++i)
    {
      CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, i, &v8[v10], &v9[v10], &parameterSetCountOut, 0);
      v12 = parameterSetCountOut;
      ++v10;
    }
    if (parameterSetCountOut > 3)
    {
      formatDescriptionOut = 0;
      --parameterSetCountOut;
      v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (!CMVideoFormatDescriptionCreateFromHEVCParameterSets((CFAllocatorRef)*MEMORY[0x24BDBD240], v12 - 1, v8, v9, NALUnitHeaderLengthOut, 0, &formatDescriptionOut))
      {
        memset(&timingInfoOut, 0, sizeof(timingInfoOut));
        CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut);
        sampleSizeArray = CMSampleBufferGetSampleSize(a3, 0);
        DataBuffer = CMSampleBufferGetDataBuffer(a3);
        v15 = CMSampleBufferCreate(v13, DataBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &timingInfoOut, 1, &sampleSizeArray, &v50);
        if ((_DWORD)v15)
        {
          v16 = v15;
          JFXLog_DebugDepthCodec();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.6(v16, v17, v18, v19, v20, v21, v22, v23);

        }
      }
    }
  }
  free(v8);
  free(v9);
  v24 = v50;
  if (!v50)
  {
LABEL_13:
    v50 = a3;
    v24 = a3;
  }
  v25 = CMSampleBufferGetFormatDescription(v24);
  v26 = CMFormatDescriptionEqual(self->_previousFormatDescription, v25);
  videoDecoderInterface = self->_videoDecoderInterface;
  if (!videoDecoderInterface || !v26)
  {
    v28 = -[JFXVideoDecoderInterface initWithFormatDescription:]([JFXVideoDecoderInterface alloc], "initWithFormatDescription:", v25);
    v29 = self->_videoDecoderInterface;
    self->_videoDecoderInterface = v28;

    previousFormatDescription = self->_previousFormatDescription;
    if (previousFormatDescription)
      CFRelease(previousFormatDescription);
    self->_previousFormatDescription = (opaqueCMFormatDescription *)CFRetain(v25);
    videoDecoderInterface = self->_videoDecoderInterface;
  }
  v31 = -[JFXVideoDecoderInterface decodeFrame:](videoDecoderInterface, "decodeFrame:", v50);
  if (v31)
  {
    v32 = v31;
    v33 = copyL010ToFloatDepthBuffer(v31, 0);
    if (!v33)
    {
      JFXLog_DebugDepthCodec();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.2();
      v37 = 0;
      goto LABEL_43;
    }
    v34 = v33;
    -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:](self, "incompleteImageSourceAuxDataInfoDict:error:", a3, a4);
    v35 = objc_claimAutoreleasedReturnValue();
    if (a4 && *a4)
    {
      JFXLog_DebugDepthCodec();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.5();
      v37 = 0;
      goto LABEL_42;
    }
    +[JFXDepthCompressor NSDataFromFloatDepth32:](JFXDepthCompressor, "NSDataFromFloatDepth32:", v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[NSObject mutableCopy](v35, "mutableCopy");
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BDD91C0]);
    v46 = 0;
    objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v41, &v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v46;
    v36 = v42;
    if (v42)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v42);
      JFXLog_DebugDepthCodec();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.3();
    }
    else
    {
      v44 = objc_msgSend(objc_retainAutorelease(v37), "depthDataMap");
      if (!v44)
      {
LABEL_41:

LABEL_42:
        CVPixelBufferRelease(v34);
LABEL_43:

        CVPixelBufferRelease(v32);
        return v37;
      }
      v45 = (__CVBuffer *)v44;
      JFXLog_DebugDepthCodec();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.3(v45, v43);
    }

    goto LABEL_41;
  }
  JFXLog_DebugDepthCodec();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.1();

  return 0;
}

- (id)decompressAVDepthData_Photo:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  const __CFData *v5;
  const __CFData *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  size_t PrimaryImageIndex;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;

  objc_msgSend((id)objc_opt_class(), "dataWithCMSampleBuffer:", a3);
  v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:].cold.1();
    goto LABEL_15;
  }
  v7 = CGImageSourceCreateWithData(v5, 0);
  if (!v7)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:].cold.2();
LABEL_15:

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_24;
  }
  v8 = v7;
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v7);
  v10 = CGImageSourceCopyPropertiesAtIndex(v8, PrimaryImageIndex, 0);
  if (v10)
  {
    v11 = v10;
    v12 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(v8, PrimaryImageIndex, (CFStringRef)*MEMORY[0x24BDD91D8]);
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v12, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    v15 = v14;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      JFXLog_DebugDepthCodec();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.3();

    }
  }
  else
  {
    JFXLog_DebugDepthCodec();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:].cold.3(PrimaryImageIndex, v18, v19, v20, v21, v22, v23, v24);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  CFRelease(v8);
LABEL_24:

  return v13;
}

+ (id)trackOptionsForDepthCodecType:(int)a3 error:(id *)a4
{
  int v5;
  void *v6;

  if (a3 <= 1280994656)
  {
    if (a3 > 1280992881)
    {
      if ((a3 - 1280992882) < 2)
        goto LABEL_15;
      goto LABEL_18;
    }
    if (a3 != 1111970369 && a3 != 1212493921)
    {
      v5 = 1212494384;
      goto LABEL_14;
    }
LABEL_15:
    v6 = 0;
    if (a4)
      *a4 = 0;
    return v6;
  }
  if (a3 <= 1499082807)
  {
    if (a3 == 1280994657)
      goto LABEL_15;
    v5 = 1280997986;
  }
  else
  {
    if (a3 == 1499082808 || a3 == 1499083056)
      goto LABEL_15;
    v5 = 1499082849;
  }
LABEL_14:
  if (a3 == v5)
    goto LABEL_15;
LABEL_18:
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (int)depthCodecType
{
  return self->_depthCodecType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoDecoderInterface, 0);
}

- (void)incompleteImageSourceAuxDataInfoDict:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: format description not found in cmsamplebuffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)incompleteImageSourceAuxDataInfoDict:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: SEI UUID not found.  Falling back to hard-coded XMP data. This should only be used in unit tests.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_LZ:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthLZNSData is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_LZ:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: failed to create depth data dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_LZ:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: -[AVDepthData depthDataFromDictionaryRepresentation: error:] failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_LZ:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: failed to decompress depthLZNSData.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_BGRA:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthImageBGRA is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_HEVC10:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthL010Decompressed is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_HEVC10:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthImageDecompressed is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_HEVC10:(__CVBuffer *)a1 error:(NSObject *)a2 .cold.3(__CVBuffer *a1, NSObject *a2)
{
  _DWORD v4[2];
  __int16 v5;
  int Height;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109376;
  v4[1] = CVPixelBufferGetWidth(a1);
  v5 = 1024;
  Height = CVPixelBufferGetHeight(a1);
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "depthImage w=%d h=%d", (uint8_t *)v4, 0xEu);
}

- (void)decompressAVDepthData_HEVC10:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: incompleteImageSourceAuxDataInfoDict returned an error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_HEVC10:(uint64_t)a3 error:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "Error %ld in CMSampleBufferCreate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)decompressAVDepthData_Photo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: dataWithCMSampleBuffer failed, depthNSData is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_Photo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CGImageSourceCreateWithData() failed, imageSource is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)decompressAVDepthData_Photo:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, a2, a3, "Error: CGImageSourceCopyPropertiesAtIndex(%d) returned NULL imageProperties.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
