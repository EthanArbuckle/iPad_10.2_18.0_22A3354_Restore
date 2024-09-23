@implementation MOVStreamEncoderConfig

+ (BOOL)isProResCodec:(unsigned int)a3
{
  BOOL result;
  unsigned __int16 v4;

  result = 1;
  if ((int)a3 <= 1634755431)
  {
    if (a3 == 1634743400)
      return result;
    v4 = 13432;
    goto LABEL_8;
  }
  if ((a3 - 1634755432 > 0xB || ((1 << (a3 - 104)) & 0x8C1) == 0) && a3 != 1634759272)
  {
    v4 = 29294;
LABEL_8:
    if (a3 != (v4 | 0x61700000))
      return 0;
  }
  return result;
}

+ (BOOL)isEncoderAvailableOfType:(unsigned int)a3 withId:(id)a4
{
  id v5;
  __CFDictionary *Mutable;
  const void *v7;
  uint64_t v8;
  CFIndex Count;
  CFIndex v10;
  const void *v11;
  const void *v12;
  BOOL v13;
  const void *ValueAtIndex;
  CFTypeID v15;
  void *v16;
  CFArrayRef v17;
  uint64_t v19;
  NSObject *v20;
  id v21;
  CFArrayRef listOfVideoEncodersOut;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDF99A8], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDF99B0], v7);
  listOfVideoEncodersOut = 0;
  v8 = VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  CFRelease(Mutable);
  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⛔️⛔️⛔️ ERROR: Cannot get encoder list. Error:'%d'. ⛔️⛔️⛔️"), v8);
    v19 = objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v19, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  Count = CFArrayGetCount(listOfVideoEncodersOut);
  if (Count < 1)
  {
    v13 = 0;
LABEL_12:
    v17 = listOfVideoEncodersOut;
    if (listOfVideoEncodersOut)
      goto LABEL_13;
    goto LABEL_14;
  }
  v10 = 0;
  v11 = (const void *)*MEMORY[0x24BDF9998];
  v12 = (const void *)*MEMORY[0x24BDF99A0];
  v13 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(listOfVideoEncodersOut, v10);
    v15 = CFGetTypeID(ValueAtIndex);
    if (v15 != CFDictionaryGetTypeID()
      || objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11), "intValue") != a3)
    {
      goto LABEL_9;
    }
    if (!v5)
      break;
    CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v5))
    {
      if (listOfVideoEncodersOut)
        CFRelease(listOfVideoEncodersOut);

      goto LABEL_14;
    }

LABEL_9:
    v13 = ++v10 < Count;
    if (Count == v10)
      goto LABEL_12;
  }
  v17 = listOfVideoEncodersOut;
  if (!listOfVideoEncodersOut)
    goto LABEL_14;
LABEL_13:
  CFRelease(v17);
LABEL_14:

  return v13;
}

+ (id)encoderIdsForType:(unsigned int)a3
{
  __CFDictionary *Mutable;
  const void *v5;
  uint64_t v6;
  CFIndex Count;
  void *v8;
  CFIndex v9;
  const void *v10;
  const void *v11;
  const void *ValueAtIndex;
  CFTypeID v13;
  void *v14;
  uint64_t v16;
  NSObject *v17;
  id v18;
  CFArrayRef listOfVideoEncodersOut;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDF99A8], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDF99B0], v5);
  listOfVideoEncodersOut = 0;
  v6 = VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⛔️⛔️⛔️ ERROR: Cannot get encoder list. Error:'%d'. ⛔️⛔️⛔️"), v6);
    v16 = objc_claimAutoreleasedReturnValue();
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v16, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  Count = CFArrayGetCount(listOfVideoEncodersOut);
  v8 = (void *)objc_opt_new();
  if (Count >= 1)
  {
    v9 = 0;
    v10 = (const void *)*MEMORY[0x24BDF9998];
    v11 = (const void *)*MEMORY[0x24BDF99A0];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(listOfVideoEncodersOut, v9);
      v13 = CFGetTypeID(ValueAtIndex);
      if (v13 == CFDictionaryGetTypeID()
        && objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v10), "intValue") == a3)
      {
        CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      ++v9;
    }
    while (Count != v9);
  }
  return v8;
}

+ (id)monochrome10BitEncoderConfigUsingAVEWithQuality:(double)a3
{
  void *v4;
  MOVStreamEncoderConfig *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  MOVStreamEncoderConfig *v14;
  _QWORD v16[4];
  _QWORD v17[4];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome](MOVStreamIOUtility, "AVEProfileLevel10BitMonochrome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [MOVStreamEncoderConfig alloc];
  v18 = *MEMORY[0x24BDF99C0];
  v6 = MEMORY[0x24BDBD1C8];
  v19[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF91F8];
  v16[0] = *MEMORY[0x24BDF9330];
  v16[1] = v8;
  v17[0] = v4;
  v17[1] = MEMORY[0x24BDBD1C0];
  v9 = *MEMORY[0x24BDF9348];
  v17[2] = v6;
  v10 = *MEMORY[0x24BDF9338];
  v16[2] = v9;
  v16[3] = v10;
  v11 = (void *)MEMORY[0x24BDD16E0];
  +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:", a3);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v5, "initWithCodecType:encoderSpecification:sessionProperties:", 1752589105, v7, v13);

  return v14;
}

+ (id)monochrome10BitEncoderConfigUsingAVEWithBitrate:(unint64_t)a3
{
  void *v4;
  MOVStreamEncoderConfig *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MOVStreamEncoderConfig *v12;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome](MOVStreamIOUtility, "AVEProfileLevel10BitMonochrome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [MOVStreamEncoderConfig alloc];
  v16 = *MEMORY[0x24BDF99C0];
  v6 = MEMORY[0x24BDBD1C8];
  v17[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF91F8];
  v14[0] = *MEMORY[0x24BDF9330];
  v14[1] = v8;
  v15[0] = v4;
  v15[1] = MEMORY[0x24BDBD1C0];
  v15[2] = v6;
  v9 = *MEMORY[0x24BDF9208];
  v14[2] = *MEMORY[0x24BDF9348];
  v14[3] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v5, "initWithCodecType:encoderSpecification:sessionProperties:", 1752589105, v7, v11);

  return v12;
}

+ (id)supportedProfileLevelsForHEVC
{
  uint64_t v2;
  void *v4;
  void *v5;
  CFDictionaryRef supportedPropertyDictionaryOut;
  VTSessionRef session;

  session = 0;
  v2 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 640, 480, 0x68766331u, MEMORY[0x24BDBD1B8], 0, 0, 0, 0, (VTCompressionSessionRef *)&session);
  if ((_DWORD)v2)
  {
    NSLog(CFSTR("Assert: (%d) %s - f: %s, l: %d\n"), v2, "VTCompressionSessionCreate failed\n", "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamEncoderConfig.mm", 421);
    return 0;
  }
  else
  {
    supportedPropertyDictionaryOut = 0;
    VTSessionCopySupportedPropertyDictionary(session, &supportedPropertyDictionaryOut);
    -[__CFDictionary objectForKey:](supportedPropertyDictionaryOut, "objectForKey:", CFSTR("ProfileLevel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SupportedValueList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (supportedPropertyDictionaryOut)
      CFRelease(supportedPropertyDictionaryOut);
    VTCompressionSessionInvalidate((VTCompressionSessionRef)session);
    CFRelease(session);
    return v5;
  }
}

- (MOVStreamEncoderConfig)initWithCodecType:(unsigned int)a3 encoderSpecification:(id)a4 sessionProperties:(id)a5
{
  id v8;
  id v9;
  MOVStreamEncoderConfig *v10;
  MOVStreamEncoderConfig *v11;
  uint64_t v12;
  NSDictionary *encoderSpecification;
  uint64_t v14;
  NSDictionary *sessionProperties;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOVStreamEncoderConfig;
  v10 = -[MOVStreamEncoderConfig init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_codecType = a3;
    v12 = objc_msgSend(v8, "copy");
    encoderSpecification = v11->_encoderSpecification;
    v11->_encoderSpecification = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    sessionProperties = v11->_sessionProperties;
    v11->_sessionProperties = (NSDictionary *)v14;

  }
  return v11;
}

- (MOVStreamEncoderConfig)initWithDictionary:(id)a3
{
  id v4;
  MOVStreamEncoderConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *encoderSpecification;
  void *v10;
  uint64_t v11;
  NSDictionary *sessionProperties;
  MOVStreamEncoderConfig *v13;
  NSObject *v14;
  uint8_t v16[16];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOVStreamEncoderConfig;
  v5 = -[MOVStreamEncoderConfig init](&v17, sel_init);
  if (!v5)
    goto LABEL_4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("codecType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_codecType = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("encoderSpecification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    encoderSpecification = v5->_encoderSpecification;
    v5->_encoderSpecification = (NSDictionary *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("sessionProperties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    sessionProperties = v5->_sessionProperties;
    v5->_sessionProperties = (NSDictionary *)v11;

LABEL_4:
    v13 = v5;
    goto LABEL_8;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot read config from nil dictionary", v16, 2u);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (MOVStreamEncoderConfig)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  MOVStreamEncoderConfig *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[MOVStreamEncoderConfig initWithDictionary:](self, "initWithDictionary:", v8);
      v9 = self;
    }
    else
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *a4;
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot read config from file '%{public}@'. ⛔️⛔️⛔️", buf, 0xCu);
      }

      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot read config from file '%@'."), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v10, 24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    v9 = 0;
  }

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("codecType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[MOVStreamEncoderConfig codecType](self, "codecType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("encoderSpecification");
  -[MOVStreamEncoderConfig encoderSpecification](self, "encoderSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("sessionProperties");
  -[MOVStreamEncoderConfig sessionProperties](self, "sessionProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1770];
  -[MOVStreamEncoderConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v8, 100, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && *a4)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *a4;
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: %{public}@. ⛔️⛔️⛔️", buf, 0xCu);
    }

LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "writeToFile:atomically:", v6, 1) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot write to file %@."), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", v13, 24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    goto LABEL_11;
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (void)enableAVEHighPerformanceProfile
{
  NSDictionary *v3;
  NSDictionary *sessionProperties;
  id v5;

  v5 = (id)-[NSDictionary mutableCopy](self->_sessionProperties, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  v3 = (NSDictionary *)objc_msgSend(v5, "copy");
  sessionProperties = self->_sessionProperties;
  self->_sessionProperties = v3;

}

- (unsigned)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(unsigned int)a3
{
  self->_codecType = a3;
}

- (NSDictionary)encoderSpecification
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncoderSpecification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)sessionProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProperties, 0);
  objc_storeStrong((id *)&self->_encoderSpecification, 0);
}

- (BOOL)applySessionProperties:(OpaqueVTCompressionSession *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  void *v11;
  void *v12;
  OSStatus v13;
  BOOL v14;
  OSStatus v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  OSStatus v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MOVStreamEncoderConfig sessionProperties](self, "sessionProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[MOVStreamEncoderConfig sessionProperties](self, "sessionProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = VTSessionSetProperty(a3, v10, v12);
        if (v13)
        {
          v15 = v13;
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v23 = v10;
            v24 = 2114;
            v25 = v12;
            v26 = 1024;
            v27 = v15;
            _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Set '%{public}@' to '%{public}@' in encoder config (Err: %d). ⛔️⛔️⛔️", buf, 0x1Cu);
          }

          v14 = 0;
          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_13:

  return v14;
}

@end
