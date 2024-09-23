@implementation JFXDepthCompressor

+ (id)fakeXMPDataIfNotFound
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &kXMPDepthMetadataForiPhoneXR, 3180, 0);
}

- (JFXDepthCompressor)initWithDepthCodecType:(int)a3
{
  JFXDepthCompressor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXDepthCompressor;
  result = -[JFXDepthCompressor init](&v5, sel_init);
  if (result)
  {
    result->_depthCodecType = a3;
    result->_previousFormatDescription = 0;
  }
  return result;
}

- (void)dealloc
{
  JFXVideoEncoderInterface *videoEncoderInterface;
  objc_super v4;

  -[JFXVideoEncoderInterface closeEncoder](self->_videoEncoderInterface, "closeEncoder");
  videoEncoderInterface = self->_videoEncoderInterface;
  self->_videoEncoderInterface = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXDepthCompressor;
  -[JFXDepthCompressor dealloc](&v4, sel_dealloc);
}

- (id)depthOutputSettingsForDepthDimensions:(id)a3
{
  return 0;
}

- (opaqueCMFormatDescription)depthFormatDescriptionForDepthDimensions:(id)a3
{
  uint64_t var1;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  const __CFAllocator *v14;
  size_t var0;
  size_t v16;
  int depthCodecType;
  const __CFDictionary *v18;
  __int128 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFDictionary *v24;
  const opaqueCMFormatDescription *FormatDescription;
  NSObject *v26;
  opaqueCMFormatDescription *v27;
  NSObject *v28;
  NSObject *v30;
  const __CFDictionary *v31;
  void *v32;
  _OWORD v33[4];
  uint64_t v34;
  id v35;
  CVPixelBufferRef texture[2];
  _BYTE v37[32];
  __int128 v38;
  uint64_t v39;
  CVPixelBufferRef pixelBufferOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  var1 = a3.var1;
  pixelBufferOut = 0;
  formatDescriptionOut = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", var1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDC5668];
  v9 = MEMORY[0x24BDBD1B8];
  v10 = *MEMORY[0x24BDC5708];
  v44[0] = *MEMORY[0x24BDC5668];
  v44[1] = v10;
  v45[0] = MEMORY[0x24BDBD1B8];
  v45[1] = v6;
  v11 = *MEMORY[0x24BDC5650];
  v12 = *MEMORY[0x24BDC56B8];
  v44[2] = *MEMORY[0x24BDC5650];
  v44[3] = v12;
  v32 = (void *)v7;
  v45[2] = v7;
  v45[3] = &unk_24EE9BF48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  var0 = a3.var0;
  v16 = *(uint64_t *)&a3 >> 32;
  v31 = v13;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], var0, v16, 0x66646570u, v13, &pixelBufferOut);
  if (pixelBufferOut)
  {
    depthCodecType = self->_depthCodecType;
    if (depthCodecType == 1111970369)
    {
      v42[0] = v8;
      v42[1] = v10;
      v43[0] = v9;
      v23 = (void *)v6;
      v42[2] = v11;
      v42[3] = v12;
      v22 = v32;
      v43[1] = v6;
      v43[2] = v32;
      v43[3] = &unk_24EE9BF60;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
      v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      texture[0] = 0;
      CVPixelBufferCreate(v14, var0, v16, 0x42475241u, v18, texture);
      if (!texture[0])
      {
        JFXLog_DebugDepthCodec();
        v30 = objc_claimAutoreleasedReturnValue();
        v24 = v31;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.5();

        goto LABEL_24;
      }
      CMVideoFormatDescriptionCreateForImageBuffer(v14, pixelBufferOut, &formatDescriptionOut);
      CVPixelBufferRelease(texture[0]);
    }
    else
    {
      if (depthCodecType == 1212494384 || depthCodecType == 1212493921)
      {
        v18 = -[JFXDepthCompressor initWithDepthCodecType:]([JFXDepthCompressor alloc], "initWithDepthCodecType:", self->_depthCodecType);
        *(_QWORD *)v37 = *(_QWORD *)(MEMORY[0x24BDC0D30] + 16);
        v19 = *MEMORY[0x24BDC0D88];
        *(_QWORD *)&v37[24] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        *(_OWORD *)&v37[8] = v19;
        v38 = v19;
        v33[2] = *(_OWORD *)&v37[16];
        v33[3] = v19;
        *(_OWORD *)texture = *MEMORY[0x24BDC0D30];
        v39 = *(_QWORD *)&v37[24];
        v34 = *(_QWORD *)&v37[24];
        v35 = 0;
        v33[0] = *(_OWORD *)texture;
        v33[1] = *(_OWORD *)v37;
        -[__CFDictionary compressDepthMapCVPixelBuffer:timingInfo:error:](v18, "compressDepthMapCVPixelBuffer:timingInfo:error:", pixelBufferOut, v33, &v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v35;
        if (v20)
        {
          v22 = v32;
          v23 = (void *)v6;
          v24 = v31;
          if (objc_msgSend(v20, "sampleBufferRef"))
          {
            FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)objc_msgSend(v20, "sampleBufferRef"));
            formatDescriptionOut = FormatDescription;
            if (FormatDescription)
              CFRetain(FormatDescription);
            goto LABEL_23;
          }
          JFXLog_DebugDepthCodec();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.4();
        }
        else
        {
          JFXLog_DebugDepthCodec();
          v28 = objc_claimAutoreleasedReturnValue();
          v22 = v32;
          v23 = (void *)v6;
          v24 = v31;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.3();
        }

LABEL_23:
        goto LABEL_24;
      }
      JFXLog_DebugDepthCodec();
      v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.2();
      v22 = v32;
      v23 = (void *)v6;
    }
    v24 = v31;
LABEL_24:

    CVPixelBufferRelease(pixelBufferOut);
    v27 = formatDescriptionOut;
    goto LABEL_25;
  }
  JFXLog_DebugDepthCodec();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.1();

  v27 = 0;
  v22 = v32;
  v23 = (void *)v6;
  v24 = v31;
LABEL_25:

  return v27;
}

- (id)compressAVDepthData:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  id v8;
  int depthCodecType;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int64_t var3;

  v8 = a3;
  depthCodecType = self->_depthCodecType;
  if (depthCodecType <= 1280992881)
  {
    if (depthCodecType == 1111970369)
    {
      v17 = *(_OWORD *)&a4->var2.var0;
      v25 = *(_OWORD *)&a4->var1.var1;
      v26 = v17;
      var3 = a4->var2.var3;
      v18 = *(_OWORD *)&a4->var0.var3;
      v23 = *(_OWORD *)&a4->var0.var0;
      v24 = v18;
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:](self, "compressAVDepthData_BGRA:timingInfo:error:", v8, &v23, a5);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (depthCodecType != 1212494384)
      {
LABEL_15:
        v19 = *(_OWORD *)&a4->var2.var0;
        v25 = *(_OWORD *)&a4->var1.var1;
        v26 = v19;
        var3 = a4->var2.var3;
        v20 = *(_OWORD *)&a4->var0.var3;
        v23 = *(_OWORD *)&a4->var0.var0;
        v24 = v20;
        -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:](self, "compressAVDepthData_HEVC10:timingInfo:error:", v8, &v23, a5);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v15 = *(_OWORD *)&a4->var2.var0;
      v25 = *(_OWORD *)&a4->var1.var1;
      v26 = v15;
      var3 = a4->var2.var3;
      v16 = *(_OWORD *)&a4->var0.var3;
      v23 = *(_OWORD *)&a4->var0.var0;
      v24 = v16;
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:](self, "compressAVDepthData_Photo:timingInfo:error:", v8, &v23, a5);
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if ((depthCodecType - 1280992882) >= 2
      && depthCodecType != 1280994657
      && depthCodecType != 1280997986)
    {
      goto LABEL_15;
    }
    v12 = *(_OWORD *)&a4->var2.var0;
    v25 = *(_OWORD *)&a4->var1.var1;
    v26 = v12;
    var3 = a4->var2.var3;
    v13 = *(_OWORD *)&a4->var0.var3;
    v23 = *(_OWORD *)&a4->var0.var0;
    v24 = v13;
    -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:](self, "compressAVDepthData_LZ:timingInfo:error:", v8, &v23, a5);
    v14 = objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  v21 = (void *)v14;

  return v21;
}

+ (id)encapsulatePayload:(id)a3
{
  id v3;
  size_t v4;
  id v5;
  unsigned __int8 *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = malloc_type_malloc(v4, 0xD19E75F9uLL);
  v8 = v7;
  if (v4)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v12 = *v6++;
      v11 = v12;
      if (v9 == 2)
      {
        v9 = 0;
        if (v11 <= 3)
          *((_BYTE *)v7 + v10++) = 3;
      }
      if (v11)
        v9 = 0;
      else
        ++v9;
      *((_BYTE *)v7 + v10++) = v11;
      --v4;
    }
    while (v4);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);

  return v13;
}

+ (id)decapsulatePayload:(id)a3
{
  id v3;
  size_t v4;
  id v5;
  unsigned __int8 *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = malloc_type_malloc(v4, 0xE3BAEA83uLL);
  v8 = v7;
  if (v4)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v12 = *v6++;
      v11 = v12;
      if (v9 == 2 && v11 == 3)
      {
        v9 = 0;
      }
      else
      {
        if (v11)
          v9 = 0;
        else
          ++v9;
        *((_BYTE *)v7 + v10++) = v11;
      }
      --v4;
    }
    while (v4);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);

  return v13;
}

- (unsigned)getPayloadTypeOrSize:(id)a3 offsetPointer:(unint64_t *)a4
{
  id v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned int v12;
  unsigned __int8 v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (a4)
  {
    v7 = *a4;
    v14 = 0;
    v8 = v6;
    if (v6)
    {
      objc_msgSend(v5, "getBytes:range:", &v14, v7, 1);
      v9 = 0;
      v10 = v14;
      if (v14 == 255 && v7 < v8)
      {
        v9 = 0;
        do
        {
          v9 += 255;
          objc_msgSend(v5, "getBytes:range:", &v14, v7++, 1);
          v10 = v14;
        }
        while (v14 == 255 && v7 < v8);
      }
      v12 = v9 + v10;
    }
    else
    {
      v12 = 0;
    }
    *a4 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)hevcSEIPayload:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  _BYTE v15[2];
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 - 4;
  if (v5 < 4)
    goto LABEL_20;
  objc_msgSend(v4, "getBytes:range:", &v16, 0, 4);
  v7 = bswap32(v16);
  v16 = v7;
  if (v7 > v5)
  {
    JFXLog_DebugDepthCodec();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor hevcSEIPayload:].cold.2((int *)&v16, v4, v8);

    v16 = v6;
    v7 = v6;
  }
  if (v7 < 6)
    goto LABEL_20;
  objc_msgSend(v4, "getBytes:range:", v15, 4, 1);
  if (((v15[0] >> 1) & 0x3Fu) - 39 > 1)
    goto LABEL_20;
  objc_msgSend((id)objc_opt_class(), "decapsulatePayload:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "length");
  if (!v16)
    goto LABEL_19;
  v14 = 0;
  if (-[JFXDepthCompressor getPayloadTypeOrSize:offsetPointer:](self, "getPayloadTypeOrSize:offsetPointer:", v9, &v14) != 4)
  {
    JFXLog_DebugDepthCodec();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor hevcSEIPayload:].cold.1();

    goto LABEL_19;
  }
  -[JFXDepthCompressor getPayloadTypeOrSize:offsetPointer:](self, "getPayloadTypeOrSize:offsetPointer:", v9, &v14);
  v17 = 0;
  v18 = 0;
  objc_msgSend(v4, "getBytes:range:", &v17, v14, 16);
  if (v17 != 0x6C7070612E6D6F63 || v18 != 0x7370696C432E65)
  {
LABEL_19:

LABEL_20:
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v14 += 16;
  objc_msgSend(v9, "subdataWithRange:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v11;
}

- (id)hevcSEIPayloadHeaderForPayloadType:(int)a3 payloadSize:(unint64_t)a4
{
  int v4;
  void *v6;
  int v7;
  int v8;
  char v10;
  char v11;
  char v12;

  v4 = a4;
  v12 = -1;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 255)
  {
    v7 = a3 / 255;
    do
    {
      objc_msgSend(v6, "appendBytes:length:", &v12, 1);
      --v7;
    }
    while (v7);
  }
  v11 = a3 + a3 / 255;
  objc_msgSend(v6, "appendBytes:length:", &v11, 1);
  if (v4 >= 255)
  {
    v8 = v4 / 255;
    do
    {
      objc_msgSend(v6, "appendBytes:length:", &v12, 1);
      --v8;
    }
    while (v8);
  }
  v10 = v4 + v4 / 255;
  objc_msgSend(v6, "appendBytes:length:", &v10, 1);
  return v6;
}

- (id)hevcSEIMessageDataWithDepthXMPMetadata:(id)a3 isPrefixSEI:(BOOL)a4 nuh_layer_id:(int)a5 nuh_temporal_id_plus1:(int)a6
{
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE v15[2];

  if (a4)
    v7 = 78;
  else
    v7 = 80;
  v15[0] = v7 & 0xFE | ((a5 & 0x20) != 0);
  v15[1] = a6 | (8 * a5);
  v8 = (void *)MEMORY[0x24BDBCEC8];
  v9 = a3;
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendBytes:length:", v15, 2);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendBytes:length:", "com.apple.Clips", 16);
  objc_msgSend(v11, "appendData:", v9);

  -[JFXDepthCompressor hevcSEIPayloadHeaderForPayloadType:payloadSize:](self, "hevcSEIPayloadHeaderForPayloadType:payloadSize:", 4, objc_msgSend(v11, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendData:", v12);
  objc_msgSend(v10, "appendData:", v11);
  objc_msgSend(v10, "appendBytes:length:", &trailingByte, 1);
  objc_msgSend((id)objc_opt_class(), "encapsulatePayload:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)depthSampleBufferAppendingDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4
{
  id v5;
  OpaqueCMBlockBuffer *DataBuffer;
  const opaqueCMFormatDescription *FormatDescription;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  OpaqueCMBlockBuffer *v13;
  size_t DataLength;
  NSObject *v15;
  OpaqueCMBlockBuffer *v16;
  size_t v17;
  OSStatus appended;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  void *v23;
  size_t sampleSizeArray;
  CMBlockBufferRef v25;
  unsigned int v26;
  CMBlockBufferRef theBuffer;
  CMSampleTimingInfo timingInfoOut;
  CMSampleBufferRef v29;

  v29 = 0;
  *(_OWORD *)&timingInfoOut.duration.value = *MEMORY[0x24BDC0D40];
  timingInfoOut.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  timingInfoOut.presentationTimeStamp = timingInfoOut.duration;
  timingInfoOut.decodeTimeStamp = timingInfoOut.duration;
  v5 = a3;
  CMSampleBufferGetSampleTimingInfo(a4, 0, &timingInfoOut);
  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  theBuffer = 0;
  LODWORD(a4) = createReadonlyCMBlockBufferFromNSData(&theBuffer, v5);

  if ((_DWORD)a4)
  {
    JFXLog_DebugDepthCodec();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.7();

  }
  else
  {
    v26 = bswap32(CMBlockBufferGetDataLength(theBuffer));
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v26, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (createReadonlyCMBlockBufferFromNSData(&v25, v11))
    {
      JFXLog_DebugDepthCodec();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.6();

    }
    else
    {
      v13 = v25;
      DataLength = CMBlockBufferGetDataLength(v25);
      if (CMBlockBufferAppendBufferReference(DataBuffer, v13, 0, DataLength, 1u))
      {
        JFXLog_DebugDepthCodec();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.5();

      }
      else
      {
        v16 = theBuffer;
        v17 = CMBlockBufferGetDataLength(theBuffer);
        appended = CMBlockBufferAppendBufferReference(DataBuffer, v16, 0, v17, 1u);
        JFXLog_DebugDepthCodec();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (appended)
        {
          if (v20)
            -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.4();

        }
        else
        {
          if (v20)
            -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.3(DataBuffer, v19);

          sampleSizeArray = CMBlockBufferGetDataLength(DataBuffer);
          if (CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], DataBuffer, 1u, 0, 0, FormatDescription, 1, 1, &timingInfoOut, 1, &sampleSizeArray, &v29))
          {
            JFXLog_DebugDepthCodec();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.2();

          }
        }
      }
      CFRelease(v25);
    }
    CFRelease(theBuffer);

    if (v29)
    {
      v22 = objc_alloc(MEMORY[0x24BE78FF0]);
      v23 = (void *)objc_msgSend(v22, "initWithSampleBuffer:", v29);
      CFRelease(v29);
      return v23;
    }
  }
  JFXLog_depthCodec();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.1();

  return 0;
}

- (id)depthSampleBufferWithNewHVCCWithDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4
{
  id v5;
  OpaqueCMBlockBuffer *DataBuffer;
  const opaqueCMFormatDescription *FormatDescription;
  const uint8_t **v8;
  size_t v9;
  const uint8_t **v10;
  size_t *v11;
  size_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  _BYTE *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  char *v49;
  char v50;
  unint64_t v51;
  unsigned int v52;
  size_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  int v59;
  unint64_t v60;
  char v61;
  char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  const __CFAllocator *v69;
  NSObject *v70;
  OSStatus v71;
  id v72;
  void *v73;
  NSObject *v74;
  id v76;
  size_t v77;
  OpaqueCMBlockBuffer *v78;
  NSObject *v79;
  id v80;
  _BYTE *v81;
  const uint8_t **v82;
  size_t *parameterSetSizeOut;
  int NALUnitHeaderLengthOut;
  size_t parameterSetCountOut;
  CMSampleTimingInfo timingInfoOut;
  CMFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v88;
  uint8_t buf[8];
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  unint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  formatDescriptionOut = 0;
  v88 = 0;
  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  *(_OWORD *)&timingInfoOut.duration.value = *MEMORY[0x24BDC0D40];
  timingInfoOut.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  timingInfoOut.presentationTimeStamp = timingInfoOut.duration;
  timingInfoOut.decodeTimeStamp = timingInfoOut.duration;
  CMSampleBufferGetSampleTimingInfo(a4, 0, &timingInfoOut);
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  parameterSetCountOut = 0;
  NALUnitHeaderLengthOut = 0;
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut)
  {
    JFXLog_DebugDepthCodec();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.12();
    goto LABEL_61;
  }
  v8 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut + 8, 0x10040436913F5uLL);
  parameterSetSizeOut = (size_t *)malloc_type_malloc(8 * parameterSetCountOut + 8, 0x100004000313F17uLL);
  if (parameterSetCountOut)
  {
    v9 = -1;
    v10 = v8;
    v11 = parameterSetSizeOut;
    while (!CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, v9 + 1, v10, v11, &parameterSetCountOut, 0))
    {
      v12 = v9 + 2;
      ++v11;
      ++v10;
      ++v9;
      if (v12 >= parameterSetCountOut)
        goto LABEL_13;
    }
    JFXLog_DebugDepthCodec();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.11();

    parameterSetCountOut = v9;
  }
LABEL_13:
  v15 = objc_msgSend((id)CMFormatDescriptionGetExtension(FormatDescription, CFSTR("SampleDescriptionExtensionAtoms")), "mutableCopy");
  v13 = v15;
  if (!v15)
  {
    JFXLog_DebugDepthCodec();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.1();
    goto LABEL_60;
  }
  -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("hvcC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "mutableCopy");

  if (v17)
  {
    v18 = v5;
    v19 = -[NSObject length](v17, "length");
    v76 = v18;
    v77 = v19 + objc_msgSend(v18, "length") + 5;
    v20 = malloc_type_malloc(v77, 0x28ABFEC5uLL);
    -[NSObject getBytes:length:](v17, "getBytes:length:", v20, -[NSObject length](v17, "length"));
    JFXLog_DebugDepthCodec();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.10((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

    JFXLog_DebugDepthCodec();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.9((uint64_t)v20, v28, v29, v30, v31, v32, v33, v34);

    JFXLog_DebugDepthCodec();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.8((uint64_t)v20, v35, v36, v37, v38, v39, v40, v41);

    v81 = v20;
    v42 = v20[22];
    JFXLog_DebugDepthCodec();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.7(v42, (uint64_t *)&parameterSetCountOut, v43);
    v78 = DataBuffer;
    v79 = v13;
    v82 = v8;
    v80 = v5;

    if ((_DWORD)v42)
    {
      v44 = 0;
      v45 = 23;
      while (__rev16(*(unsigned __int16 *)&v20[v45 + 1]) == 1)
      {
        v46 = v45;
        v47 = v45 + 5;
        if (-[NSObject length](v17, "length") <= (unint64_t)v47)
        {
          JFXLog_DebugDepthCodec();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.5();
          goto LABEL_42;
        }
        v48 = v17;
        v49 = &v20[v46];
        v50 = v20[v46];
        v51 = v82[v44][1];
        v52 = *(unsigned __int16 *)(v49 + 3);
        v53 = parameterSetSizeOut[v44];
        JFXLog_DebugDepthCodec();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v44;
          v90 = 2048;
          v91 = v50 & 0x1F;
          v92 = 2048;
          v93 = v51 >> 3;
          _os_log_debug_impl(&dword_2269A9000, v54, OS_LOG_TYPE_DEBUG, "param_set[%d] nal_unit_type=%lu (expect nal_unit_type=%lu)", buf, 0x1Cu);
        }
        v55 = __rev16(v52);

        JFXLog_DebugDepthCodec();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v44;
          v90 = 2048;
          v91 = v55;
          v92 = 2048;
          v93 = v53;
          _os_log_debug_impl(&dword_2269A9000, v56, OS_LOG_TYPE_DEBUG, "param_set[%d] nal_unit_length=%lu (expect nal_unit_length=%lu)", buf, 0x1Cu);
        }

        v45 = v47 + v55;
        v17 = v48;
        if (-[NSObject length](v48, "length") <= (unint64_t)v45)
        {
          JFXLog_DebugDepthCodec();
          v57 = objc_claimAutoreleasedReturnValue();
          v20 = v81;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.4();
          goto LABEL_42;
        }
        ++v44;
        v20 = v81;
        if (v42 == v44)
          goto LABEL_43;
      }
      JFXLog_DebugDepthCodec();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.6();
LABEL_42:

    }
LABEL_43:
    ++v20[22];
    v58 = objc_retainAutorelease(v76);
    v59 = (*(unsigned __int8 *)objc_msgSend(v58, "bytes") >> 1) & 0x3F | 0x80;
    v60 = (unint64_t)objc_msgSend(v58, "length") >> 8;
    v61 = objc_msgSend(v58, "length");
    v62 = &v20[-[NSObject length](v17, "length")];
    v63 = -[NSObject length](v17, "length");
    *v62 = v59;
    *(_WORD *)(v62 + 1) = 256;
    v62[3] = v60;
    v62[4] = v61;
    objc_msgSend(v58, "getBytes:length:", &v20[v63 + 5], objc_msgSend(v58, "length"));
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v20, v77, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v79;
    -[NSObject setObject:forKeyedSubscript:](v79, "setObject:forKeyedSubscript:", v64, CFSTR("hvcC"));

    v5 = v80;
    v8 = v82;
    DataBuffer = v78;
  }
  CMFormatDescriptionGetExtensions(FormatDescription);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    v67 = (void *)objc_msgSend(v65, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = v67;
  objc_msgSend(v67, "setObject:forKeyedSubscript:", v13, CFSTR("SampleDescriptionExtensionAtoms"));
  v69 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CMVideoFormatDescriptionCreateFromHEVCParameterSets((CFAllocatorRef)*MEMORY[0x24BDBD240], parameterSetCountOut, v8, parameterSetSizeOut, NALUnitHeaderLengthOut, (CFDictionaryRef)v68, &formatDescriptionOut))
  {
    JFXLog_DebugDepthCodec();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.3();

LABEL_59:
LABEL_60:

    free(v8);
    free(parameterSetSizeOut);
LABEL_61:
    v73 = 0;
    goto LABEL_62;
  }
  *(_QWORD *)buf = CMBlockBufferGetDataLength(DataBuffer);
  v71 = CMSampleBufferCreate(v69, DataBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &timingInfoOut, 1, (const size_t *)buf, &v88);
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    formatDescriptionOut = 0;
  }
  if (v71 || !v88)
  {
    JFXLog_DebugDepthCodec();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.2();

    goto LABEL_59;
  }
  v72 = objc_alloc(MEMORY[0x24BE78FF0]);
  v73 = (void *)objc_msgSend(v72, "initWithSampleBuffer:", v88);
  free(v8);
  free(parameterSetSizeOut);
  CFRelease(v88);

LABEL_62:
  return v73;
}

- (id)compressAVDepthData_HEVC10:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  id v8;
  __CVBuffer *v9;
  size_t Width;
  size_t Height;
  size_t v12;
  JFXVideoEncoderInterface *v13;
  JFXVideoEncoderInterface *videoEncoderInterface;
  CVPixelBufferRef v15;
  __CVBuffer *v16;
  void *v17;
  JFXVideoEncoderInterface *v18;
  opaqueCMSampleBuffer *v19;
  const opaqueCMFormatDescription *FormatDescription;
  const uint8_t **v21;
  size_t v22;
  const uint8_t **v23;
  size_t *v24;
  size_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  OpaqueCMBlockBuffer *DataBuffer;
  NSObject *v38;
  void *v40;
  size_t *parameterSetSizeOut;
  int NALUnitHeaderLengthOut;
  size_t parameterSetCountOut[2];
  int64_t var3;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v8 = objc_retainAutorelease(a3);
  v9 = (__CVBuffer *)objc_msgSend(v8, "depthDataMap");
  Width = CVPixelBufferGetWidth(v9);
  Height = CVPixelBufferGetHeight(v9);
  if (!self->_videoEncoderInterface)
  {
    v12 = Height;
    v13 = -[JFXVideoEncoderInterface initWithExpectedFrameRate:]([JFXVideoEncoderInterface alloc], "initWithExpectedFrameRate:", 30.0);
    videoEncoderInterface = self->_videoEncoderInterface;
    self->_videoEncoderInterface = v13;

    -[JFXVideoEncoderInterface setupEncoderWithWidth:andHeight:imageFormat:andFramerate:](self->_videoEncoderInterface, "setupEncoderWithWidth:andHeight:imageFormat:andFramerate:", Width, v12, 9, 30.0);
    if (!self->_videoEncoderInterface)
    {
      JFXLog_DebugDepthCodec();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.1();
LABEL_24:

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
        v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
LABEL_26:
      v29 = 0;
      goto LABEL_33;
    }
  }
  v15 = copyFloatDepthBufferToL010(v9, 0);
  if (!v15)
  {
    JFXLog_DebugDepthCodec();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.2();
    goto LABEL_24;
  }
  v16 = v15;
  v45 = *MEMORY[0x24BDF9578];
  v46[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_videoEncoderInterface;
  *(_OWORD *)parameterSetCountOut = *(_OWORD *)&a4->var1.var0;
  var3 = a4->var1.var3;
  v19 = -[JFXVideoEncoderInterface encodeFrame:presentationTime:frameProperties:](v18, "encodeFrame:presentationTime:frameProperties:", v16, parameterSetCountOut, v17);
  CVPixelBufferRelease(v16);
  if (!v19)
  {
    JFXLog_DebugDepthCodec();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.3();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_21;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(v19);
  parameterSetCountOut[0] = 0;
  NALUnitHeaderLengthOut = 0;
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut[0])
  {
    CFRelease(v19);
    JFXLog_DebugDepthCodec();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.6();

LABEL_21:
    goto LABEL_26;
  }
  v40 = v17;
  v21 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut[0] + 8, 0x10040436913F5uLL);
  parameterSetSizeOut = (size_t *)malloc_type_malloc(8 * parameterSetCountOut[0] + 8, 0x100004000313F17uLL);
  if (parameterSetCountOut[0])
  {
    v22 = -1;
    v23 = v21;
    v24 = parameterSetSizeOut;
    while (!CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, v22 + 1, v23, v24, parameterSetCountOut, 0))
    {
      v25 = v22 + 2;
      ++v24;
      ++v23;
      ++v22;
      if (v25 >= parameterSetCountOut[0])
        goto LABEL_30;
    }
    JFXLog_DebugDepthCodec();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.11();

    parameterSetCountOut[0] = v22;
  }
LABEL_30:
  v31 = -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:](self, "mutableCopyExtensionsDictionaryCopyFromAVDepthData:", v8);
  v32 = (*v21)[1];
  v33 = (v32 >> 3) & 0xFFFFFFDF | (32 * (**v21 & 1));
  v34 = v32 & 7;
  free(v21);
  free(parameterSetSizeOut);
  objc_msgSend(v31, "objectForKeyedSubscript:", kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXDepthCompressor hevcSEIMessageDataWithDepthXMPMetadata:isPrefixSEI:nuh_layer_id:nuh_temporal_id_plus1:](self, "hevcSEIMessageDataWithDepthXMPMetadata:isPrefixSEI:nuh_layer_id:nuh_temporal_id_plus1:", v35, 0, v33, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  DataBuffer = CMSampleBufferGetDataBuffer(v19);
  JFXLog_DebugDepthCodec();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.4(DataBuffer, v38);

  -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:](self, "depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:", v36, v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v19);

LABEL_33:
  return v29;
}

- (__CVBuffer)copyDepthBufferAsBGRA:(__CVBuffer *)a3
{
  const __CFAllocator *v4;
  size_t Width;
  size_t Height;
  BOOL v7;
  size_t v8;
  size_t v9;
  size_t BytesPerRow;
  size_t v11;
  char *BaseAddress;
  char *v13;
  char *v14;
  size_t v15;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  if (a3)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v7 = CVPixelBufferCreate(v4, Width, Height, 0x42475241u, 0, &pixelBufferOut) || pixelBufferOut == 0;
    if (!v7 && CVPixelBufferGetPixelFormatType(pixelBufferOut) == 1111970369)
    {
      v8 = CVPixelBufferGetWidth(a3);
      v9 = CVPixelBufferGetHeight(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v11 = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      v13 = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
      if (v9)
      {
        v14 = v13;
        v15 = 4 * v8;
        do
        {
          memcpy(v14, BaseAddress, v15);
          BaseAddress += BytesPerRow;
          v14 += v11;
          --v9;
        }
        while (v9);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    }
  }
  return pixelBufferOut;
}

- (id)compressAVDepthData_BGRA:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  CVPixelBufferRef Float32DepthImageForAVDepthData;
  __CVBuffer *v9;
  __CVBuffer *v10;
  const __CFAllocator *v11;
  NSObject *v12;
  unint64_t Dimensions;
  int32_t v14;
  unint64_t v15;
  FourCharCode MediaSubType;
  id v17;
  void *v18;
  NSObject *v19;
  CMSampleBufferRef sampleBufferOut;
  CMVideoFormatDescriptionRef formatDescription;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  Float32DepthImageForAVDepthData = createFloat32DepthImageForAVDepthData(a3);
  if (!Float32DepthImageForAVDepthData)
  {
    CVPixelBufferRelease(0);
    JFXLog_DebugDepthCodec();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:].cold.1();
    goto LABEL_14;
  }
  v9 = Float32DepthImageForAVDepthData;
  v10 = -[JFXDepthCompressor copyDepthBufferAsBGRA:](self, "copyDepthBufferAsBGRA:", Float32DepthImageForAVDepthData);
  CVPixelBufferRelease(v9);
  if (!v10)
  {
LABEL_15:
    v18 = 0;
    return v18;
  }
  formatDescriptionOut = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, &formatDescriptionOut);
  v12 = objc_opt_new();
  -[NSObject addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", CMFormatDescriptionGetExtensions(formatDescriptionOut));
  formatDescription = 0;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(formatDescriptionOut);
  v14 = Dimensions;
  v15 = HIDWORD(Dimensions);
  MediaSubType = CMFormatDescriptionGetMediaSubType(formatDescriptionOut);
  CMVideoFormatDescriptionCreate(v11, MediaSubType, v14, v15, (CFDictionaryRef)v12, &formatDescription);
  if (!formatDescription)
  {
    JFXLog_DebugDepthCodec();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:].cold.2();
    goto LABEL_12;
  }
  sampleBufferOut = 0;
  CMSampleBufferCreateReadyWithImageBuffer(v11, v10, formatDescription, (const CMSampleTimingInfo *)a4, &sampleBufferOut);
  if (!sampleBufferOut)
  {
    CVPixelBufferRelease(v10);
    CFRelease(formatDescriptionOut);
    CFRelease(formatDescription);
    JFXLog_DebugDepthCodec();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:].cold.3();
LABEL_12:

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:

    goto LABEL_15;
  }
  v17 = objc_alloc(MEMORY[0x24BE78FF0]);
  v18 = (void *)objc_msgSend(v17, "initWithSampleBuffer:", sampleBufferOut);
  CFRelease(sampleBufferOut);
  CVPixelBufferRelease(v10);
  CFRelease(formatDescriptionOut);
  CFRelease(formatDescription);

  return v18;
}

- (id)compressAVDepthData_Photo:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  id v8;
  __CVBuffer *ContiguousFloat32DepthImageForAVDepthData;
  void *v10;
  void *v11;
  const __CFData *v12;
  const __CFData *v13;
  CGDataProviderRef v14;
  CGDataProvider *v15;
  CGColorSpace *DeviceRGB;
  CGImage *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  size_t BytesPerRow;
  size_t Height;
  size_t v23;
  size_t v24;
  __CFData *Mutable;
  __CFData *v26;
  CGImageDestination *v27;
  CGImageDestination *v28;
  __CFData *v29;
  CGImageDestination *v30;
  NSObject *v31;
  __CFData *v32;
  void *v33;
  id v34;
  const __CFDictionary *v35;
  __int128 v36;
  __int128 v37;
  __CFData *v38;
  const __CFAllocator *v39;
  int ReadonlyCMBlockBufferFromNSData;
  CMSampleBufferRef v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  CGImageDestination *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int32_t width;
  const __CFDictionary *v66;
  CGImageDestination *v67;
  const __CFDictionary *v68;
  __CFString *v69;
  const __CFDictionary *properties;
  CMSampleTimingInfo sampleTimingArray;
  id v72;
  size_t sampleSizeArray;
  CFTypeRef cf;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sampleBufferOut;
  _QWORD v77[3];
  _QWORD v78[5];

  v78[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  ContiguousFloat32DepthImageForAVDepthData = createContiguousFloat32DepthImageForAVDepthData(v8);
  if (!ContiguousFloat32DepthImageForAVDepthData)
  {
    JFXLog_DebugDepthCodec();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:].cold.1();
    goto LABEL_38;
  }
  v10 = malloc_type_malloc(0x40000uLL, 0x1817421BuLL);
  if (!v10)
  {
LABEL_36:
    JFXLog_DebugDepthCodec();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.2();
LABEL_38:

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_68;
  }
  v11 = v10;
  memset(v10, 128, 0x40000uLL);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v11, 0x40000);
  v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = CGDataProviderCreateWithCFData(v12);
    if (v14)
    {
      v15 = v14;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v17 = CGImageCreate(0x100uLL, 0x100uLL, 8uLL, 0x20uLL, 0x400uLL, DeviceRGB, 0x2004u, v15, 0, 0, kCGRenderingIntentDefault);
      CGDataProviderRelease(v15);
      CGColorSpaceRelease(DeviceRGB);
      goto LABEL_13;
    }
    JFXLog_DebugDepthCodec();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.15();
  }
  else
  {
    JFXLog_DebugDepthCodec();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.14();
  }

  v17 = 0;
LABEL_13:
  free(v11);

  if (!v17)
    goto LABEL_36;
  v20 = *MEMORY[0x24BDD9250];
  v77[0] = *MEMORY[0x24BDD9220];
  v77[1] = v20;
  v78[0] = &unk_24EE9C170;
  v78[1] = MEMORY[0x24BDBD1C8];
  v77[2] = *MEMORY[0x24BDD9258];
  v78[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BytesPerRow = CVPixelBufferGetBytesPerRow(ContiguousFloat32DepthImageForAVDepthData);
  Height = CVPixelBufferGetHeight(ContiguousFloat32DepthImageForAVDepthData);
  v23 = CGImageGetBytesPerRow(v17);
  v24 = CGImageGetHeight(v17);
  Mutable = CFDataCreateMutable(0, Height * BytesPerRow + 2 * v23 * v24);
  if (!Mutable)
  {
    JFXLog_DebugDepthCodec();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.3();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_67;
  }
  v26 = Mutable;
  v27 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x24BDB1C18], 1uLL, 0);
  if (!v27)
  {
    JFXLog_DebugDepthCodec();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.4();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_66;
  }
  v28 = v27;
  CGImageDestinationAddImage(v27, v17, properties);
  v72 = 0;
  objc_msgSend(v8, "dictionaryRepresentationForAuxiliaryDataType:", &v72);
  v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v69 = (__CFString *)v72;
  if ((-[__CFString isEqualToString:](v69, "isEqualToString:", *MEMORY[0x24BDD91D8]) & 1) == 0)
  {
    v29 = v26;
    v30 = v28;
    JFXLog_DebugDepthCodec();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.13();

    v28 = v30;
    v26 = v29;
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  CGImageDestinationAddAuxiliaryDataInfo(v28, v69, v68);
  v67 = v28;
  if (!CGImageDestinationFinalize(v28))
  {
    JFXLog_DebugDepthCodec();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.12();

    v47 = v67;
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_65;
  }
  width = CVPixelBufferGetWidth(ContiguousFloat32DepthImageForAVDepthData);
  v32 = v26;
  v33 = (void *)MEMORY[0x24BDBCE70];
  v34 = -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:](self, "mutableCopyExtensionsDictionaryCopyFromAVDepthData:", v8);
  objc_msgSend(v33, "dictionaryWithDictionary:", v34);
  v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v66 = v35;
  if (!v35)
  {
    JFXLog_DebugDepthCodec();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.5();
    goto LABEL_54;
  }
  v36 = *(_OWORD *)&a4->var2.var0;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v36;
  sampleTimingArray.decodeTimeStamp.epoch = a4->var2.var3;
  v37 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&sampleTimingArray.duration.epoch = v37;
  v38 = v32;
  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v39 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  ReadonlyCMBlockBufferFromNSData = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x48453230u, width, Height, v35, &formatDescriptionOut);
  if (ReadonlyCMBlockBufferFromNSData || !formatDescriptionOut)
  {
    JFXLog_DebugDepthCodec();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.11();

    goto LABEL_59;
  }
  cf = 0;
  ReadonlyCMBlockBufferFromNSData = createReadonlyCMBlockBufferFromNSData((CMBlockBufferRef *)&cf, v38);
  if (ReadonlyCMBlockBufferFromNSData || !cf)
  {
    JFXLog_DebugDepthCodec();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.10();

    v41 = 0;
  }
  else
  {
    sampleSizeArray = -[__CFData length](v38, "length");
    ReadonlyCMBlockBufferFromNSData = CMSampleBufferCreateReady(v39, (CMBlockBufferRef)cf, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &sampleBufferOut);
    v41 = sampleBufferOut;
    if (!sampleBufferOut)
    {
      JFXLog_DebugDepthCodec();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.9();

    }
    if (ReadonlyCMBlockBufferFromNSData)
    {
      JFXLog_DebugDepthCodec();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.8();

    }
    CFRelease(cf);
  }
  CFRelease(formatDescriptionOut);

  if (!v41 || ReadonlyCMBlockBufferFromNSData)
  {
LABEL_59:
    JFXLog_DebugDepthCodec();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.7();

    v47 = v67;
    if (!a5)
      goto LABEL_64;
    v49 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD1100];
    v51 = ReadonlyCMBlockBufferFromNSData;
    goto LABEL_63;
  }
  v57 = objc_msgSend(objc_alloc(MEMORY[0x24BE78FF0]), "initWithSampleBuffer:", v41);
  if (v57)
  {
    v54 = (void *)v57;
    CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
    CGImageRelease(v17);
    CFRelease(v38);
    CFRelease(v67);
    CFRelease(v41);

    goto LABEL_69;
  }
  JFXLog_DebugDepthCodec();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.6(v48, v58, v59, v60, v61, v62, v63, v64);
LABEL_54:

  v47 = v67;
  if (a5)
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD1100];
    v51 = -50;
LABEL_63:
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, v51, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_64:

LABEL_65:
  CFRelease(v47);

LABEL_66:
  CFRelease(v26);
LABEL_67:
  CGImageRelease(v17);

LABEL_68:
  CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
  v54 = 0;
LABEL_69:

  return v54;
}

+ (id)NSDataFromFloatDepth32:(__CVBuffer *)a3
{
  size_t DataSize;
  size_t Width;
  void *BaseAddress;
  void *v7;
  NSObject *v8;

  if (!a3)
  {
LABEL_8:
    v7 = 0;
    return v7;
  }
  DataSize = CVPixelBufferGetDataSize(a3);
  Width = CVPixelBufferGetWidth(a3);
  if (DataSize != 4 * Width * CVPixelBufferGetHeight(a3))
  {
    JFXLog_DebugDepthCodec();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[JFXDepthCompressor NSDataFromFloatDepth32:].cold.1();

    goto LABEL_8;
  }
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  if (BaseAddress)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", BaseAddress, DataSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v7;
}

+ (id)NSDataFromDepthMapInsideAVDepthData:(id)a3
{
  __CVBuffer *ContiguousFloat32DepthImageForAVDepthData;
  void *v4;

  ContiguousFloat32DepthImageForAVDepthData = createContiguousFloat32DepthImageForAVDepthData(a3);
  objc_msgSend((id)objc_opt_class(), "NSDataFromFloatDepth32:", ContiguousFloat32DepthImageForAVDepthData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
  return v4;
}

- (id)mutableCopyExtensionsDictionaryCopyFromAVDepthData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGImageMetadata *MutableCopy;
  const CGImageMetadata *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  CFDataRef XMPData;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[5];
  CFErrorRef err;
  _QWORD v29[7];
  _QWORD v30[8];

  v30[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "depthDataByConvertingToDepthDataType:", 1717855600);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentationForAuxiliaryDataType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = *MEMORY[0x24BDD91D0];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD91D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    MutableCopy = CGImageMetadataCreateMutableCopy((CGImageMetadataRef)v7);
  else
    MutableCopy = CGImageMetadataCreateMutable();
  v9 = MutableCopy;
  if (MutableCopy)
  {
    err = 0;
    if (CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, CFSTR("http://ns.apple.com/pixeldatainfo/1.0/"), CFSTR("apdi"), &err))
    {
      v10 = objc_msgSend(v3, "depthDataType");
      v11 = v10;
      v12 = (_DWORD)v10 == 1751410032 || (_DWORD)v10 == 1717855600;
      v13 = CFSTR("disparity");
      if (v12)
        v13 = CFSTR("depth");
      v30[0] = v13;
      v29[0] = CFSTR("AuxiliaryImageType");
      v29[1] = CFSTR("NativeFormat");
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = v13;
      objc_msgSend(v14, "numberWithUnsignedInt:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v16;
      v30[2] = &unk_24EE9C588;
      v29[2] = CFSTR("FloatMinValue");
      v29[3] = CFSTR("FloatMaxValue");
      v30[3] = &unk_24EE9C598;
      v30[4] = &unk_24EE9BF78;
      v29[4] = CFSTR("StoredFormat");
      v29[5] = CFSTR("IntMinValue");
      v29[6] = CFSTR("IntMaxValue");
      v30[5] = &unk_24EE9BF90;
      v30[6] = &unk_24EE9BFA8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
      v17 = objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke;
      v27[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v27[4] = v9;
      -[NSObject enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v27);
      XMPData = CGImageMetadataCreateXMPData(v9, 0);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", XMPData, kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey);

      objc_msgSend(v5, "removeObjectForKey:", v6);
      objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BDD91C0]);

    }
    else
    {
      JFXLog_DebugDepthCodec();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:].cold.2((uint64_t)&err, v17, v20, v21, v22, v23, v24, v25);
    }

    CFRelease(v9);
  }
  else
  {
    JFXLog_DebugDepthCodec();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:].cold.1();

  }
  return v5;
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke(uint64_t a1, void *a2, const void *a3)
{
  __CFString *v5;
  CGImageMetadataTagRef v6;
  CGImageMetadataTagRef v7;
  __CFString *v8;
  NSObject *v9;

  v5 = a2;
  v6 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/pixeldatainfo/1.0/"), CFSTR("apdi"), v5, kCGImageMetadataTypeDefault, a3);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("apdi"), v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (CGImageMetadataSetTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 32), 0, v8, v7))
      {
LABEL_11:
        CFRelease(v7);
        goto LABEL_12;
      }
      JFXLog_DebugDepthCodec();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_3();
    }
    else
    {
      JFXLog_DebugDepthCodec();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_2();
    }

    goto LABEL_11;
  }
  JFXLog_DebugDepthCodec();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_1();
LABEL_12:

}

- (id)compressAVDepthData_LZ:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  CMVideoCodecType depthCodecType;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CFDataRef XMPData;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __CVBuffer *v20;
  const __CFAllocator *v21;
  int32_t Width;
  int32_t Height;
  OSStatus v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  CMSampleTimingInfo *sampleTimingArray;
  id *v37;
  CMSampleBufferRef sampleBufferOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  size_t sampleSizeArray;
  CMBlockBufferRef theBuffer;
  id v42;

  depthCodecType = self->_depthCodecType;
  switch(depthCodecType)
  {
    case 0x4C5A6672u:
      v8 = 1;
      break;
    case 0x4C5A6673u:
      v8 = 0;
      break;
    case 0x4C5A6D61u:
      v8 = 2;
      break;
    default:
      v8 = 3;
      break;
  }
  objc_msgSend(a3, "depthDataByConvertingToDepthDataType:", 1717855600);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentationForAuxiliaryDataType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = *MEMORY[0x24BDD91D0];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD91D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v13, 0);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", XMPData, kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey);
  objc_msgSend((id)objc_opt_class(), "NSDataFromDepthMapInsideAVDepthData:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    JFXLog_DebugDepthCodec();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.1();

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
LABEL_48:
    v27 = 0;
    goto LABEL_49;
  }
  v42 = 0;
  objc_msgSend(v15, "compressedDataUsingAlgorithm:error:", v8, &v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v42;
  v19 = v18;
  if (!v17 || v18)
  {
    JFXLog_DebugDepthCodec();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.2();

    if (v19)
    {
      if (a5)
      {
        v30 = objc_retainAutorelease(v19);
LABEL_32:
        *a5 = v30;
      }
LABEL_47:

      goto LABEL_48;
    }
LABEL_30:
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    goto LABEL_47;
  }
  theBuffer = 0;
  createReadonlyCMBlockBufferFromNSData(&theBuffer, v17);
  if (!theBuffer)
  {
    JFXLog_DebugDepthCodec();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.3();

    goto LABEL_30;
  }
  sampleTimingArray = (CMSampleTimingInfo *)a4;
  v37 = a5;
  formatDescriptionOut = 0;
  sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
  objc_msgSend(v11, "removeObjectForKey:", v12);
  objc_msgSend(v11, "removeObjectForKey:", *MEMORY[0x24BDD91C0]);
  v20 = (__CVBuffer *)objc_msgSend(objc_retainAutorelease(v9), "depthDataMap");
  v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Width = CVPixelBufferGetWidth(v20);
  Height = CVPixelBufferGetHeight(v20);
  if (CMVideoFormatDescriptionCreate(v21, depthCodecType, Width, Height, (CFDictionaryRef)v11, &formatDescriptionOut)
    || !formatDescriptionOut)
  {
    JFXLog_DebugDepthCodec();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.6();

    goto LABEL_46;
  }
  sampleBufferOut = 0;
  v24 = CMSampleBufferCreateReady(v21, theBuffer, formatDescriptionOut, 1, 1, sampleTimingArray, 1, &sampleSizeArray, &sampleBufferOut);
  if (v24 || !sampleBufferOut)
  {
    JFXLog_DebugDepthCodec();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.5();

    if (v37)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v24, 0);
      *v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_45;
  }
  v25 = objc_alloc(MEMORY[0x24BE78FF0]);
  v26 = objc_msgSend(v25, "initWithSampleBuffer:", sampleBufferOut);
  if (!v26)
  {
    JFXLog_DebugDepthCodec();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.4();

    if (v37)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], 0, 0);
      *v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(sampleBufferOut);
LABEL_45:
    CFRelease(formatDescriptionOut);
LABEL_46:
    CFRelease(theBuffer);
    goto LABEL_47;
  }
  v27 = (void *)v26;
  CFRelease(sampleBufferOut);
  CFRelease(formatDescriptionOut);
  CFRelease(theBuffer);

LABEL_49:
  return v27;
}

+ (id)fakeAuxDepthInfoDictionaryForCVPixelBuffer:(__CVBuffer *)a3
{
  const __CFData *v4;
  CGImageMetadataRef v5;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  uint64_t PixelFormatType;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *BaseAddress;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  +[JFXDepthCompressor fakeXMPDataIfNotFound](JFXDepthCompressor, "fakeXMPDataIfNotFound");
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageMetadataCreateFromXMPData(v4);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v23[0] = CFSTR("Width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v23[1] = CFSTR("Height");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  v23[2] = CFSTR("PixelFormat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", PixelFormatType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  v23[3] = CFSTR("BytesPerRow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", BytesPerRow);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  v15 = (void *)MEMORY[0x24BDBCE50];
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  objc_msgSend(v15, "dataWithBytes:length:", BaseAddress, CVPixelBufferGetDataSize(a3));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD91C8];
  v21[0] = *MEMORY[0x24BDD91C0];
  v21[1] = v18;
  v22[0] = v17;
  v22[1] = v14;
  v21[2] = *MEMORY[0x24BDD91D0];
  v22[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v19;
}

- (id)compressDepthMapCVPixelBuffer:(__CVBuffer *)a3 timingInfo:(id *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v17[4];
  int64_t var3;

  +[JFXDepthCompressor fakeAuxDepthInfoDictionaryForCVPixelBuffer:](JFXDepthCompressor, "fakeAuxDepthInfoDictionaryForCVPixelBuffer:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "depthDataByReplacingDepthDataMapWithPixelBuffer:error:", a3, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a4->var2.var0;
    v17[2] = *(_OWORD *)&a4->var1.var1;
    v17[3] = v13;
    var3 = a4->var2.var3;
    v14 = *(_OWORD *)&a4->var0.var3;
    v17[0] = *(_OWORD *)&a4->var0.var0;
    v17[1] = v14;
    -[JFXDepthCompressor compressAVDepthData:timingInfo:error:](self, "compressAVDepthData:timingInfo:error:", v12, v17, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int)depthCodecType
{
  return self->_depthCodecType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEncoderInterface, 0);
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: fakeDepthMap is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: FIXME: depthFormatDescriptionForDepthDimensions returning NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "Error: compressDepthMapCVPixelBuffer returned null PVCMSampleBuffer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: compressDepthMapCVPixelBuffer returned null inner CMSampleBufferRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: imageBGRA is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hevcSEIPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: unknown SEI found (payloadType=%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hevcSEIPayload:(NSObject *)a3 .cold.2(int *a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v6[0] = 67109376;
  v6[1] = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_10(&dword_2269A9000, a3, v5, "Error: invalid length field %u > %lu", (uint8_t *)v6);
  OUTLINED_FUNCTION_3();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2269A9000, v0, OS_LOG_TYPE_ERROR, "Error: depthSampleBuffer is nil", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMSampleBufferCreate failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferAppendingDepthMetadata:(OpaqueCMBlockBuffer *)a1 depthSampleBufferFromCodec:(NSObject *)a2 .cold.3(OpaqueCMBlockBuffer *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  CMBlockBufferGetDataLength(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, a2, v3, "data length after: %lu bytes", v4);
  OUTLINED_FUNCTION_3();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMBlockBufferAppendBufferReference(seiMessageBBuf) failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMBlockBufferAppendBufferReference(seiNalUnitLengthBBuf) failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData(seiNalUnitLengthData) failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData(seiMessage) failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: sampleDescriptionExtensionAtoms is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMVideoFormatDescriptionCreateFromHEVCParameterSets failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "avoiding buffer overflow 2", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "avoiding buffer overflow", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "numNalus!=1 not handled yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(NSObject *)a3 depthSampleBufferFromCodec:.cold.7(unsigned __int8 a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 2048;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_2269A9000, a3, (uint64_t)a3, "numOfArrays=%d (should be same as paramSetCount %lu)", (uint8_t *)v4);
  OUTLINED_FUNCTION_4();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, a2, a3, "general_level_idc=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, a2, a3, "general_profile_idc=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, a2, a3, "NALUnitHeaderLength=%d (should be 4)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMVideoFormatDescriptionGetHEVCParameterSetAtIndex returned error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CMVideoFormatDescriptionGetHEVCParameterSetAtIndex failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: _videoEncoderInterface is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthL010 is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthSampleBufferFromCodec is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_HEVC10:(OpaqueCMBlockBuffer *)a1 timingInfo:(NSObject *)a2 error:.cold.4(OpaqueCMBlockBuffer *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  CMBlockBufferGetDataLength(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, a2, v3, "data length before: %lu bytes", v4);
  OUTLINED_FUNCTION_3();
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: HEVCFormatDesc didn't have parameter sets error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthImage is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: formatDesc is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depthSampleBuffer is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CGImageCreate failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CFDataCreateMutable failed, destData is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: destCGData is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: format extensions is null.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:(uint64_t)a3 timingInfo:(uint64_t)a4 error:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, a1, a3, "Error: createCMSampleBufferForNSData returned %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: [[PVCMSampleBuffer alloc] initWithSampleBuffer:] returned NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_3(&dword_2269A9000, v0, v1, "Error: CMSampleBufferCreateReady() returned error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CMSampleBufferCreateReady() failed, depthSampleBuffer is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData() failed, dataBuffer is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CMVideoFormatDescriptionCreate() failed, dataBuffer is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: depth image not written to imageDest (which writes to destData).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "Error: got unexpected auxDataType %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: imageData = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: dataProvider = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)NSDataFromFloatDepth32:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Error: CVPixelBuffer padding detected.  FIXME: Need to handle this.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mutableCopyExtensionsDictionaryCopyFromAVDepthData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: mutableAuxMetadata is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mutableCopyExtensionsDictionaryCopyFromAVDepthData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "Warning: CGImageMetadataRegisterNamespaceForPrefix failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "Warning: CGImageMetadataTagCreate failed for key %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Warning: path is nil, so not setting metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "Warning: CGImageMetadataSetValueWithPath failed for path %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "srcData is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "failed to compress depth using LZ lossless dictionary codec - got nserror", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "createReadonlyBlockBuffer failed, blockBuffer = nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "SampleBufferRef is null or error detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "depthSampleBuffer is NULL or CMSampleBufferCreateReady returned error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "formatDesc is null or error detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
