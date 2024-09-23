@implementation CMIOExtensionSample

+ (id)sampleWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCMSampleBuffer:", a3);
}

- (CMIOExtensionSample)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMIOExtensionSample *v4;
  opaqueCMSampleBuffer *v5;
  const opaqueCMFormatDescription *FormatDescription;
  CMMediaType MediaType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionSample;
  v4 = -[CMIOExtensionSample init](&v9, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = (opaqueCMSampleBuffer *)CFRetain(a3);
      v4->_sampleBuffer = v5;
      FormatDescription = CMSampleBufferGetFormatDescription(v5);
      MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
    }
    else
    {
      MediaType = 0;
      v4->_sampleBuffer = 0;
    }
    v4->_mediaType = MediaType;
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *sampleBuffer;
  objc_super v4;

  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
    CFRelease(sampleBuffer);

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionSample;
  -[CMIOExtensionSample dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (id)description
{
  NSString *description;
  opaqueCMSampleBuffer *sampleBuffer;
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  description = self->_description;
  if (!description)
  {
    sampleBuffer = self->_sampleBuffer;
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (sampleBuffer)
      description = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("<sample: %p, %c%c%c%c>"), self->_sampleBuffer, HIBYTE(self->_mediaType), BYTE2(self->_mediaType), BYTE1(self->_mediaType), self->_mediaType);
    else
      description = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("<sample: NULL>"), v7, v8, v9, v10, v11);
    self->_description = description;
  }
  return description;
}

- (BOOL)isEqual:(id)a3
{
  opaqueCMSampleBuffer *sampleBuffer;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  sampleBuffer = self->_sampleBuffer;
  return sampleBuffer == (opaqueCMSampleBuffer *)objc_msgSend(a3, "sampleBuffer");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CMIOExtensionSample initWithCMSampleBuffer:](+[CMIOExtensionSample allocWithZone:](CMIOExtensionSample, "allocWithZone:", a3), "initWithCMSampleBuffer:", self->_sampleBuffer);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = -[CMIOExtensionSample copyXPCDictionary](self, "copyXPCDictionary");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("sampleBuffer"));
    xpc_release(v6);
  }
}

- (CMIOExtensionSample)initWithCoder:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("sampleBuffer"));
  if (v5)
    return -[CMIOExtensionSample initWithXPCDictionary:](self, "initWithXPCDictionary:", v5);
  else
    return -[CMIOExtensionSample initWithCMSampleBuffer:](self, "initWithCMSampleBuffer:");
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v5;
  CFTypeRef v6;
  const void *v7;
  CFTypeID v8;
  const __CFAllocator *v9;
  NSObject *v10;
  int IsRangeContiguous;
  OpaqueCMBlockBuffer *v12;
  xpc_object_t v13;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  NSObject *v16;
  NSObject *v18;
  NSObject *v19;
  CMBlockBufferRef v20;
  size_t totalLengthOut;
  char *dataPointerOut;
  CMBlockBufferRef theBuffer;

  if (!self->_sampleBuffer)
    return 0;
  dataPointerOut = 0;
  theBuffer = 0;
  totalLengthOut = 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_sampleBuffer);
  v5 = ImageBuffer;
  if (ImageBuffer)
  {
    v6 = CVBufferCopyAttachment(ImageBuffer, CFSTR("MetadataDictionary"), 0);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFDictionaryGetTypeID() && !CMGetAttachment(self->_sampleBuffer, CFSTR("MetadataDictionary"), 0))
        CMSetAttachment(self->_sampleBuffer, CFSTR("MetadataDictionary"), v7, 1u);
      CFRelease(v7);
    }
  }
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer())
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionSample copyXPCDictionary].cold.4();
  }
  else
  {
    IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
    v12 = theBuffer;
    if (!IsRangeContiguous)
    {
      v20 = 0;
      if (CMBlockBufferCreateContiguous(v9, theBuffer, v9, 0, 0, 0, 0, &v20))
      {
        v19 = CMIOLog();
        if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionSample copyXPCDictionary].cold.3();
        goto LABEL_25;
      }
      if (theBuffer)
        CFRelease(theBuffer);
      v12 = v20;
      theBuffer = v20;
    }
    if (CMBlockBufferGetDataPointer(v12, 0, 0, &totalLengthOut, &dataPointerOut))
    {
      v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSample copyXPCDictionary].cold.2();
    }
    else
    {
      v13 = xpc_data_create(dataPointerOut, totalLengthOut);
      xpc_dictionary_set_value(v3, "buffer", v13);
      xpc_release(v13);
      if (v5)
      {
        IOSurface = CVPixelBufferGetIOSurface(v5);
        if (IOSurface)
        {
          XPCObject = IOSurfaceCreateXPCObject(IOSurface);
          xpc_dictionary_set_value(v3, "iosurface", XPCObject);
          xpc_release(XPCObject);
        }
        else
        {
          v16 = CMIOLog();
          if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionSample copyXPCDictionary].cold.1();
        }
      }
    }
  }
LABEL_25:
  if (theBuffer)
    CFRelease(theBuffer);
  return v3;
}

- (CMIOExtensionSample)initWithXPCDictionary:(id)a3
{
  xpc_object_t value;
  void *v6;
  void *bytes_ptr;
  void *v8;
  size_t length;
  const __CFAllocator *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int SampleBufferFromSerializedAtomDataBlockBuffer;
  NSObject *v15;
  CMIOExtensionSample *v16;
  CFTypeRef v18;
  const void *v19;
  CFTypeID v20;
  xpc_object_t v21;
  __IOSurface *v22;
  __IOSurface *v23;
  CVReturn v24;
  NSObject *v25;
  CMSampleBufferRef v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo timingArrayOut;
  CMBlockBufferCustomBlockSource customBlockSource;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef v36;
  CMBlockBufferRef blockBufferOut;

  if (a3)
  {
    v36 = 0;
    blockBufferOut = 0;
    formatDescriptionOut = 0;
    pixelBufferOut = 0;
    value = xpc_dictionary_get_value(a3, "buffer");
    if (!value)
    {
      v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSample initWithXPCDictionary:].cold.1();
      goto LABEL_19;
    }
    v6 = value;
    bytes_ptr = (void *)xpc_data_get_bytes_ptr(value);
    if (!bytes_ptr)
    {
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSample initWithXPCDictionary:].cold.2();
      goto LABEL_19;
    }
    v8 = bytes_ptr;
    length = xpc_data_get_length(v6);
    HIDWORD(customBlockSource.AllocateBlock) = 0;
    *(_QWORD *)&customBlockSource.version = 0;
    customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))cmio_bbufUtilXPCObjectReleaser;
    customBlockSource.refCon = v6;
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, length, 0, &customBlockSource, 0, length, 0, &blockBufferOut))
    {
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSample initWithXPCDictionary:].cold.9();
    }
    else
    {
      xpc_retain(v6);
      SampleBufferFromSerializedAtomDataBlockBuffer = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
      CFRelease(blockBufferOut);
      blockBufferOut = 0;
      if (!SampleBufferFromSerializedAtomDataBlockBuffer)
      {
        v18 = CMGetAttachment(v36, CFSTR("MetadataDictionary"), 0);
        v19 = v18;
        if (v18)
        {
          v20 = CFGetTypeID(v18);
          if (v20 != CFDictionaryGetTypeID())
            v19 = 0;
        }
        v21 = xpc_dictionary_get_value(a3, "iosurface");
        if (v21)
        {
          v22 = IOSurfaceLookupFromXPCObject(v21);
          if (!v22)
          {
            v27 = CMIOLog();
            if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionSample initWithXPCDictionary:].cold.3();
            goto LABEL_19;
          }
          v23 = v22;
          v24 = CVPixelBufferCreateWithIOSurface(v10, v22, 0, &pixelBufferOut);
          CFRelease(v23);
          if (v24)
          {
            v25 = CMIOLog();
            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionSample initWithXPCDictionary:].cold.7();
            goto LABEL_19;
          }
          if (v19 && !CVBufferHasAttachment(pixelBufferOut, CFSTR("MetadataDictionary")))
            CVBufferSetAttachment(pixelBufferOut, CFSTR("MetadataDictionary"), v19, kCVAttachmentMode_ShouldPropagate);
          if (CMVideoFormatDescriptionCreateForImageBuffer(v10, pixelBufferOut, &formatDescriptionOut))
          {
            v28 = CMIOLog();
            if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionSample initWithXPCDictionary:].cold.6();
            goto LABEL_19;
          }
          memset(&timingArrayOut, 0, sizeof(timingArrayOut));
          if (CMSampleBufferGetSampleTimingInfoArray(v36, 1, &timingArrayOut, 0))
          {
            v29 = CMIOLog();
            if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionSample initWithXPCDictionary:].cold.5();
            goto LABEL_19;
          }
          sampleBufferOut = 0;
          if (CMSampleBufferCreateForImageBuffer(v10, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &timingArrayOut, &sampleBufferOut))
          {
            v30 = CMIOLog();
            if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionSample initWithXPCDictionary:].cold.4();
            goto LABEL_19;
          }
          CFRelease(pixelBufferOut);
          pixelBufferOut = 0;
          CFRelease(formatDescriptionOut);
          formatDescriptionOut = 0;
          CMPropagateAttachments(v36, sampleBufferOut);
          CFRelease(v36);
          v26 = sampleBufferOut;
          v36 = sampleBufferOut;
        }
        else
        {
          v26 = v36;
        }
        v16 = -[CMIOExtensionSample initWithCMSampleBuffer:](self, "initWithCMSampleBuffer:", v26);
        CFRelease(v36);
        return v16;
      }
      v15 = CMIOLog();
      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSample initWithXPCDictionary:].cold.8();
    }
LABEL_19:
    if (blockBufferOut)
      CFRelease(blockBufferOut);
    if (pixelBufferOut)
      CFRelease(pixelBufferOut);
    if (v36)
      CFRelease(v36);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);

    return 0;
  }

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
  return 0;
}

- (void)copyXPCDictionary
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpcData == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s dataPointer == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s ioSurface == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
