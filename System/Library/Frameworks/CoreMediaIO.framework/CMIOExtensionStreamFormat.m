@implementation CMIOExtensionStreamFormat

+ (CMIOExtensionStreamFormat)streamFormatWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations
{
  id v10;
  CMTime v12;
  CMTime v13;

  v10 = objc_alloc((Class)objc_opt_class());
  v13 = *maxFrameDuration;
  v12 = *minFrameDuration;
  return (CMIOExtensionStreamFormat *)(id)objc_msgSend(v10, "initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:", formatDescription, &v13, &v12, validFrameDurations);
}

- (CMIOExtensionStreamFormat)initWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations
{
  char *v10;
  CMTimeEpoch epoch;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  CMTime time;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CMIOExtensionStreamFormat;
  v10 = -[CMIOExtensionStreamFormat init](&v22, sel_init);
  if (v10)
  {
    if (formatDescription)
    {
      *((_QWORD *)v10 + 2) = CFRetain(formatDescription);
      epoch = minFrameDuration->epoch;
      *((_OWORD *)v10 + 2) = *(_OWORD *)&minFrameDuration->value;
      *((_QWORD *)v10 + 6) = epoch;
      v12 = *(_OWORD *)&maxFrameDuration->value;
      *((_QWORD *)v10 + 9) = maxFrameDuration->epoch;
      *(_OWORD *)(v10 + 56) = v12;
      *((_QWORD *)v10 + 3) = validFrameDurations;
      if ((v10[44] & 1) != 0 && *((_QWORD *)v10 + 4) && (v10[68] & 1) != 0 && *((_QWORD *)v10 + 7))
      {
        v13 = objc_alloc(MEMORY[0x24BDD17C8]);
        v14 = *((_QWORD *)v10 + 2);
        time = *(CMTime *)(v10 + 32);
        v15 = (uint64_t)(CMTimeGetSeconds(&time) * 1000.0);
        time = *(CMTime *)(v10 + 56);
        v16 = objc_msgSend(v13, "initWithFormat:", CFSTR("<CMIOExtensionStreamFormat: format %@, min %ld ms, max %ld ms>"), v14, v15, (uint64_t)(CMTimeGetSeconds(&time) * 1000.0));
      }
      else
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionStreamFormat: format %@>"), *((_QWORD *)v10 + 2), v19, v20);
      }
      *((_QWORD *)v10 + 1) = v16;
    }
    else
    {
      v17 = CMIOLog();
      if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionStreamFormat initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:].cold.1();

      return 0;
    }
  }
  return (CMIOExtensionStreamFormat *)v10;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionStreamFormat;
  -[CMIOExtensionStreamFormat dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v7;
  NSArray *validFrameDurations;
  CMTime v10;
  CMTime time1;
  CMTime time2;
  uint64_t v13;
  uint64_t v14;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v13 = v3;
    v14 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      LOBYTE(v7) = 0;
      return v7;
    }
    v7 = CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
    if (v7)
    {
      if (a3)
        objc_msgSend(a3, "minFrameDuration");
      else
        memset(&time2, 0, sizeof(time2));
      time1 = (CMTime)self->_minFrameDuration;
      if (CMTimeCompare(&time1, &time2))
        goto LABEL_13;
      if (a3)
        objc_msgSend(a3, "maxFrameDuration");
      else
        memset(&v10, 0, sizeof(v10));
      time1 = (CMTime)self->_maxFrameDuration;
      if (CMTimeCompare(&time1, &v10))
        goto LABEL_13;
      validFrameDurations = self->_validFrameDurations;
      if (validFrameDurations == (NSArray *)objc_msgSend(a3, "validFrameDurations"))
        LOBYTE(v7) = 1;
      else
        LOBYTE(v7) = -[NSArray isEqual:](self->_validFrameDurations, "isEqual:", objc_msgSend(a3, "validFrameDurations"));
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMIOExtensionStreamFormat *v4;
  opaqueCMFormatDescription *formatDescription;
  NSArray *validFrameDurations;
  $95D729B680665BEAEFA1D6FCA8238556 minFrameDuration;
  $95D729B680665BEAEFA1D6FCA8238556 maxFrameDuration;

  v4 = +[CMIOExtensionStreamFormat allocWithZone:](CMIOExtensionStreamFormat, "allocWithZone:", a3);
  formatDescription = self->_formatDescription;
  validFrameDurations = self->_validFrameDurations;
  maxFrameDuration = self->_maxFrameDuration;
  minFrameDuration = self->_minFrameDuration;
  return -[CMIOExtensionStreamFormat initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:](v4, "initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:", formatDescription, &maxFrameDuration, &minFrameDuration, validFrameDurations);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = -[CMIOExtensionStreamFormat copyXPCDictionary](self, "copyXPCDictionary");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("streamFormat"));
    xpc_release(v6);
  }
  else
  {
    v7 = CMIOLog();
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionStreamFormat encodeWithCoder:].cold.1();
    }
  }
}

- (CMIOExtensionStreamFormat)initWithCoder:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ can only be encoded as part of an xpc message"), self);
  v5 = objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("streamFormat"));
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@ nil xpc object"), self);
  return -[CMIOExtensionStreamFormat initWithXPCDictionary:](self, "initWithXPCDictionary:", v5);
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;
  int64_t MediaSubType;
  const __CFDictionary *Extensions;
  xpc_object_t v6;
  const __CFString *Value;
  const __CFString *v8;
  NSObject *v9;
  NSArray *validFrameDurations;
  NSObject *v11;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_dictionary_create(0, 0, 0);
  if (CMFormatDescriptionGetMediaType(self->_formatDescription) == 1836415096)
  {
    MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDescription);
    Extensions = CMFormatDescriptionGetExtensions(self->_formatDescription);
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "muxtype", MediaSubType);
    if (Extensions)
    {
      Value = (const __CFString *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC0B88]);
      if (Value)
      {
        v26 = 0;
        v25 = 0u;
        v24 = 0u;
        v23 = 0u;
        v22 = 0u;
        v21 = 0u;
        v20 = 0u;
        v19 = 0u;
        v18 = 0u;
        v17 = 0u;
        v16 = 0u;
        v15 = 0u;
        v14 = 0u;
        v13 = 1061109567;
        CFStringGetCString(Value, (char *)&v13, 200, 0x8000100u);
        xpc_dictionary_set_string(v6, "vendor", (const char *)&v13);
      }
      v8 = (const __CFString *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC0B58]);
      if (v8)
      {
        v26 = 0;
        v25 = 0u;
        v24 = 0u;
        v23 = 0u;
        v22 = 0u;
        v21 = 0u;
        v20 = 0u;
        v19 = 0u;
        v18 = 0u;
        v17 = 0u;
        v16 = 0u;
        v15 = 0u;
        v14 = 0u;
        v13 = 1061109567;
        CFStringGetCString(v8, (char *)&v13, 200, 0x8000100u);
        xpc_dictionary_set_string(v6, "name", (const char *)&v13);
      }
    }
    xpc_dictionary_set_value(v3, "muxFormatDescription", v6);
    xpc_release(v6);
  }
  else if (FigXPCMessageSetFormatDescription())
  {
    v9 = CMIOLog();
    if (v9)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionStreamFormat copyXPCDictionary].cold.2();
    }
  }
  xpc_dictionary_set_data(v3, "minFrameDuration", &self->_minFrameDuration, 0x18uLL);
  xpc_dictionary_set_data(v3, "maxFrameDuration", &self->_maxFrameDuration, 0x18uLL);
  validFrameDurations = self->_validFrameDurations;
  if (validFrameDurations)
  {
    if (cmio_XPCMessageSetCFArray(v3, "validFrameDurations", validFrameDurations))
    {
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionStreamFormat copyXPCDictionary].cold.1();
      }
    }
  }
  return v3;
}

- (CMIOExtensionStreamFormat)initWithXPCDictionary:(id)a3
{
  _QWORD *data;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  CMIOExtensionStreamFormat *v12;
  xpc_object_t value;
  void *v15;
  CMMuxedStreamType int64;
  const __CFAllocator *v17;
  __CFDictionary *Mutable;
  const char *string;
  const char *v20;
  CFStringRef v21;
  const char *v22;
  const char *v23;
  CFStringRef v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  size_t length;
  CFTypeRef cf;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  CMMuxedFormatDescriptionRef formatDescriptionOut;

  if (!a3)
  {

    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    v11 = CFSTR("nil xpc dictionary");
LABEL_16:
    objc_msgSend(v9, "raise:format:", v10, v11);
    return 0;
  }
  formatDescriptionOut = 0;
  v33 = *MEMORY[0x24BDC0D40];
  v34 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  v31 = v33;
  v32 = v34;
  length = 24;
  cf = 0;
  data = xpc_dictionary_get_data(a3, "minFrameDuration", &length);
  if (data)
  {
    v33 = *(_OWORD *)data;
    v34 = data[2];
  }
  v6 = xpc_dictionary_get_data(a3, "maxFrameDuration", &length);
  if (v6)
  {
    v31 = *(_OWORD *)v6;
    v32 = v6[2];
  }
  if (cmio_XPCMessageCopyCFArray(a3, "validFrameDurations", (NSObject **)&cf))
  {
    v7 = CMIOLog();
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionStreamFormat initWithXPCDictionary:].cold.2();
    }
  }
  if (FigXPCMessageCopyFormatDescription())
  {
    v8 = CMIOLog();
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionStreamFormat initWithXPCDictionary:].cold.1();

    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    v11 = CFSTR("nil formatDescription");
    goto LABEL_16;
  }
  value = xpc_dictionary_get_value(a3, "muxFormatDescription");
  if (value)
  {
    v15 = value;
    int64 = xpc_dictionary_get_int64(value, "muxtype");
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    string = xpc_dictionary_get_string(v15, "vendor");
    if (string)
      v20 = string;
    else
      v20 = "?";
    v21 = CFStringCreateWithCString(v17, v20, 0x8000100u);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC0B88], v21);
    CFRelease(v21);
    v22 = xpc_dictionary_get_string(v15, "name");
    if (v22)
      v23 = v22;
    else
      v23 = "?";
    v24 = CFStringCreateWithCString(v17, v23, 0x8000100u);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC0B58], v24);
    CFRelease(v24);
    CMMuxedFormatDescriptionCreate(v17, int64, Mutable, &formatDescriptionOut);
    CFRelease(Mutable);
  }
  v27 = v31;
  v28 = v32;
  v25 = v33;
  v26 = v34;
  v12 = -[CMIOExtensionStreamFormat initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:](self, "initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:", formatDescriptionOut, &v27, &v25, cf);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (cf)
    CFRelease(cf);
  return v12;
}

+ (id)copyXPCArrayFromFormats:(id)a3
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = xpc_array_create(0, 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = CMIOLog();
          if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:].cold.2();
          return v4;
        }
        v10 = (void *)objc_msgSend(v9, "copyXPCDictionary");
        if (!v10)
        {
          v13 = CMIOLog();
          if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:].cold.1();
          return v4;
        }
        v11 = v10;
        xpc_array_append_value(v4, v10);
        xpc_release(v11);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  return v4;
}

+ (id)copyFormatsFromXPCArray:(id)a3
{
  id v4;
  _QWORD applier[5];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc array"));
    return 0;
  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke;
  applier[3] = &unk_250457E08;
  applier[4] = v4;
  if (!xpc_array_apply(a3, applier))
  {

    return 0;
  }
  return v4;
}

BOOL __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMIOExtensionStreamFormat *v4;
  NSObject *v5;

  v4 = -[CMIOExtensionStreamFormat initWithXPCDictionary:]([CMIOExtensionStreamFormat alloc], "initWithXPCDictionary:", a3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke_cold_1();
  }
  return v4 != 0;
}

- (CMFormatDescriptionRef)formatDescription
{
  return (CMFormatDescriptionRef)objc_getProperty(self, a2, 16, 1);
}

- (CMTime)minFrameDuration
{
  CMTime *result;

  objc_copyStruct(retstr, &self->_minFrameDuration, 24, 1, 0);
  return result;
}

- (CMTime)maxFrameDuration
{
  CMTime *result;

  objc_copyStruct(retstr, &self->_maxFrameDuration, 24, 1, 0);
  return result;
}

- (NSArray)validFrameDurations
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid format description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)encodeWithCoder:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, FigXPCMessageSetFormatDescription", v2, v3, v4, v5, v6);
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

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, FigXPCMessageCopyFormatDescription", v2, v3, v4, v5, v6);
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

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)copyXPCArrayFromFormats:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s could not create xpc object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)copyXPCArrayFromFormats:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid format type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s could not create object for index %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
