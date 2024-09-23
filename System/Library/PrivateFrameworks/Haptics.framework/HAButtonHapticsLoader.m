@implementation HAButtonHapticsLoader

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HAButtonHapticsLoader;
  -[HAButtonHapticsLoader dealloc](&v2, sel_dealloc);
}

+ (id)sharedInstance
{
  if (+[HAButtonHapticsLoader sharedInstance]::onceToken != -1)
    dispatch_once(&+[HAButtonHapticsLoader sharedInstance]::onceToken, &__block_literal_global);
  return (id)gHapticsWaveLoader;
}

void __39__HAButtonHapticsLoader_sharedInstance__block_invoke()
{
  HAButtonHapticsLoader *v0;
  void *v1;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v3;
  __CFRunLoop *Current;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  CFTypeRef CFDictionaryRef;
  CFTypeRef v14;
  CFTypeRef cf;
  uint8_t buf[8];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(HAButtonHapticsLoader);
  v1 = (void *)gHapticsWaveLoader;
  gHapticsWaveLoader = (uint64_t)v0;

  gNotificationPort = (uint64_t)IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)gNotificationPort);
  if (!RunLoopSource)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x24BDACB70];
    v10 = "Haptics IONotificationPortGetRunLoopSource returned NULL";
LABEL_20:
    v11 = 2;
LABEL_21:
    _os_log_impl(&dword_215E8C000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
    return;
  }
  v3 = RunLoopSource;
  Current = CFRunLoopGetCurrent();
  if (!Current)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x24BDACB70];
    v10 = "Haptics CFRunLoopGetCurrent returned NULL";
    goto LABEL_20;
  }
  CFRunLoopAddSource(Current, v3, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  v5 = (IONotificationPort *)gNotificationPort;
  v12 = 1;
  applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[31],int>((applesauce::CF::TypeRef *)&v14, "Button Haptics Asset Interface", &v12);
  *(_QWORD *)buf = &v14;
  v17 = 1;
  CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((uint64_t)buf);
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
  applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[16],applesauce::CF::DictionaryRef &>((applesauce::CF::TypeRef *)&v14, "IOPropertyMatch", &CFDictionaryRef);
  *(_QWORD *)buf = &v14;
  v17 = 1;
  v6 = applesauce::CF::details::make_CFDictionaryRef((uint64_t)buf);
  if (cf)
    CFRelease(cf);
  if (v14)
    CFRelease(v14);
  if (CFDictionaryRef)
    CFRelease(CFDictionaryRef);
  v7 = (void *)IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)MatchingNotificationHandler, 0, (io_iterator_t *)&gIOIterator);
  v8 = (int)v7;
  if ((_DWORD)v7)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    v9 = MEMORY[0x24BDACB70];
    v10 = "Haptics IOServiceAddMatchingNotification err %d";
    v11 = 8;
    goto LABEL_21;
  }
  MatchingNotificationHandler(v7, gIOIterator);
}

- (BOOL)loadButtonHapticOfType:(int64_t)a3 atSlot:(int64_t)a4 error:(id *)a5
{
  return -[HAButtonHapticsLoader loadButtonHapticOfType:withParameters:atSlot:error:](self, "loadButtonHapticOfType:withParameters:atSlot:error:", a3, 0, a4, a5);
}

- (BOOL)loadButtonHapticOfType:(int64_t)a3 withParameters:(id)a4 atSlot:(int64_t)a5 error:(id *)a6
{
  __int16 v7;
  const __CFDictionary *v9;
  id v10;
  _WORD *v11;
  int Property;
  __CFDictionary *v13;
  const __CFString *String;
  const __CFURL *v15;
  UInt32 v16;
  double v17;
  const __CFString *v18;
  const __CFURL *v19;
  UInt32 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  __int16 v25;
  int Float64;
  double v27;
  int v28;
  __int16 v29;
  __int16 v30;
  id v31;
  unsigned int v32;
  BOOL v33;
  int v34;
  NSObject *v36;
  double v37[5];
  UInt32 ioNumBytes;
  UInt32 ioDataSize;
  unint64_t outPropertyData;
  AudioFileID outAudioFile;
  __CFDictionary *v42;
  __CFDictionary *v43;
  _BYTE buf[12];
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v7 = a5;
  v53 = *MEMORY[0x24BDAC8D0];
  v9 = (const __CFDictionary *)a4;
  v10 = (id)*MEMORY[0x24BDD1100];
  if (a6)
    *a6 = 0;
  if (gServiceAvailable == 1)
  {
    v11 = (_WORD *)_sharedMemoryPtr;
    bzero((void *)_sharedMemoryPtr, _sharedMemorySize);
    *v11 = v7;
    v43 = 0;
    Property = dictForType(a3, &v43);
    if (Property)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 361;
        v47 = 2080;
        v48 = "result = dictForType(type, typeDictionary)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
          buf,
          0x2Cu);
      }
      v32 = 2;
LABEL_42:
      v33 = v32 == 0;
      if (v32 <= 1)
        v34 = 1;
      else
        v34 = v32;
      if (v34 != 2)
        goto LABEL_50;
      goto LABEL_46;
    }
    v13 = v43;
    v42 = v43;
    String = (const __CFString *)getString(v43, CFSTR("AudioFilePath"));
    if (String)
    {
      v15 = CFURLCreateWithFileSystemPath(0, String, kCFURLPOSIXPathStyle, 0);
      *(double *)&outAudioFile = 0.0;
      Property = AudioFileOpenURL(v15, kAudioFileReadPermission, 0, &outAudioFile);
      CFRelease(v15);
      if (Property)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 372;
        v47 = 2080;
        v48 = "result";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
        goto LABEL_70;
      }
      outPropertyData = 0;
      ioDataSize = 8;
      Property = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, &outPropertyData);
      if (Property)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 376;
        v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propSize, &numBytes64)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
        goto LABEL_70;
      }
      v16 = outPropertyData;
      if (outPropertyData >= 0x800)
        v16 = 2048;
      ioNumBytes = v16;
      Property = AudioFileReadBytes(outAudioFile, 1u, 0, &ioNumBytes, v11 + 1030);
      if (Property)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 379;
        v47 = 2080;
        v48 = "result = AudioFileReadBytes(afid, true, 0, &numBytes, buttonInfo.audioWaveformBuffer)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
        goto LABEL_70;
      }
      ioDataSize = 40;
      Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, v37);
      if (Property)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 383;
        v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyDataFormat, &propSize, &fmt)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
        goto LABEL_70;
      }
      v17 = v37[0];
      AudioFileClose(outAudioFile);
      v11[1029] = ioNumBytes >> 1;
    }
    else
    {
      bzero(v11 + 1029, 0x802uLL);
      v17 = 48000.0;
    }
    v18 = (const __CFString *)getString(v13, CFSTR("HapticFilePath"));
    if (!v18)
    {
      Property = 0;
      if (a6)
        *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", v10, -50, 0);
      v32 = 1;
      goto LABEL_41;
    }
    v19 = CFURLCreateWithFileSystemPath(0, v18, kCFURLPOSIXPathStyle, 0);
    *(double *)&outAudioFile = 0.0;
    Property = AudioFileOpenURL(v19, kAudioFileReadPermission, 0, &outAudioFile);
    CFRelease(v19);
    if (Property)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
      v45 = 1024;
      v46 = 408;
      v47 = 2080;
      v48 = "result";
      v49 = 1024;
      v50 = Property;
      v51 = 2080;
      v52 = "FAIL";
      v36 = MEMORY[0x24BDACB70];
    }
    else
    {
      outPropertyData = 0;
      ioDataSize = 8;
      Property = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, &outPropertyData);
      if (Property)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 412;
        v47 = 2080;
        v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyAudioDataByteCount, &propSize, &numBytes64)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
      }
      else
      {
        v20 = outPropertyData;
        if (outPropertyData >= 0x800)
          v20 = 2048;
        ioNumBytes = v20;
        Property = AudioFileReadBytes(outAudioFile, 1u, 0, &ioNumBytes, v11 + 5);
        if (!Property)
        {
          ioDataSize = 40;
          Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, v37);
          if (!Property)
          {
            v21 = v37[0];
            AudioFileClose(outAudioFile);
            v11[4] = ioNumBytes >> 1;
            if (v11[1029])
            {
              *(_QWORD *)buf = 0x3F847AE147AE147BLL;
              getFloat64(v13, CFSTR("AudioPreSilence"), (double *)buf);
              v22 = vcvtmd_s64_f64(*(double *)buf * v17 + 0.5);
            }
            else
            {
              v22 = 0;
            }
            *(_QWORD *)buf = 0x3F847AE147AE147BLL;
            getFloat64(v13, CFSTR("HapticPreSilence"), (double *)buf);
            v23 = *(double *)buf;
            v37[0] = 0.01;
            getFloat64(v13, CFSTR("PostSilence"), v37);
            v24 = vcvtmd_s64_f64(v23 * v21 + 0.5);
            v25 = vcvtmd_s64_f64(v37[0] * v21 + 0.5);
            if (v9)
            {
              *(_QWORD *)buf = 0;
              if (getFloat64(v9, CFSTR("AudioPreSilence"), (double *)buf) && v11[1029])
                v22 = vcvtmd_s64_f64(*(double *)buf * v17 + 0.5);
              v37[0] = 0.0;
              Float64 = getFloat64(v9, CFSTR("HapticPreSilence"), v37);
              v27 = v37[0];
              *(double *)&outAudioFile = 0.0;
              v28 = getFloat64(v9, CFSTR("PostSilence"), (double *)&outAudioFile);
              v29 = vcvtmd_s64_f64(v27 * v21 + 0.5);
              if (Float64)
                v24 = v29;
              v30 = vcvtmd_s64_f64(*(double *)&outAudioFile * v21 + 0.5);
              if (v28)
                v25 = v30;
            }
            v11[1] = v22;
            v11[2] = v24;
            v11[3] = v25;
            Property = IOConnectCallStructMethod(gButtonServiceConnection, 0, 0, 0, 0, 0);
            if (Property)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = Property;
                _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Haptics IOConnectCallStructMethod UpdateSSHBAsset err %d", buf, 8u);
              }
              v31 = (id)*MEMORY[0x24BDD1010];

              v32 = 2;
              v10 = v31;
            }
            else
            {
              v32 = 0;
            }
            goto LABEL_41;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
            v45 = 1024;
            v46 = 419;
            v47 = 2080;
            v48 = "result = AudioFileGetProperty(afid, kAudioFilePropertyDataFormat, &propSize, &fmt)";
            v49 = 1024;
            v50 = Property;
            v51 = 2080;
            v52 = "FAIL";
            v36 = MEMORY[0x24BDACB70];
            goto LABEL_70;
          }
LABEL_71:
          v32 = 2;
LABEL_41:
          CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v42);
          goto LABEL_42;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
        v45 = 1024;
        v46 = 415;
        v47 = 2080;
        v48 = "result = AudioFileReadBytes(afid, true, 0, &numBytes, buttonInfo.hapticWaveformBuffer)";
        v49 = 1024;
        v50 = Property;
        v51 = 2080;
        v52 = "FAIL";
        v36 = MEMORY[0x24BDACB70];
      }
    }
LABEL_70:
    _os_log_impl(&dword_215E8C000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
      buf,
      0x2Cu);
    goto LABEL_71;
  }
  Property = 1936881185;
LABEL_46:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = Property;
    _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Haptics loadButtonHapticOfType FAILED %d", buf, 8u);
  }
  v33 = 0;
  if (a6)
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", v10, Property, 0);
LABEL_50:

  return v33;
}

- (BOOL)hapticAssetType:(int64_t)a3 hasAudio:(BOOL *)a4 hasHaptic:(BOOL *)a5 error:(id *)a6
{
  id v10;
  int v11;
  __CFDictionary *v12;
  __CFDictionary *v14;
  _BYTE buf[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = (id)*MEMORY[0x24BDD1100];
  if (a6)
    *a6 = 0;
  v14 = 0;
  v11 = dictForType(a3, &v14);
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "HAButtonHapticsLoader.mm";
      v16 = 1024;
      v17 = 527;
      v18 = 2080;
      v19 = "result = dictForType(type, typeDictionary)";
      v20 = 1024;
      v21 = v11;
      v22 = 2080;
      v23 = "FAIL";
      _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%25s:%-5d  ca_require_noerr: [%s, %d] (goto %s;)",
        buf,
        0x2Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl(&dword_215E8C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Haptics loadButtonHapticOfType FAILED %d", buf, 8u);
    }
    if (a6)
      *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", v10, v11, 0);
  }
  else
  {
    v12 = v14;
    *(_QWORD *)buf = v14;
    if (a4)
      *a4 = getString(v14, CFSTR("AudioFilePath")) != 0;
    if (a5)
      *a5 = getString(v12, CFSTR("HapticFilePath")) != 0;
    CFDictionaryReleaser::~CFDictionaryReleaser((const void **)buf);
  }

  return v11 == 0;
}

- (float)defaultDownGainForType:(int64_t)a3
{
  int v3;
  float v4;
  double v6;
  __CFDictionary *v7;
  __CFDictionary *v8;

  v8 = 0;
  v3 = dictForType(a3, &v8);
  v7 = v8;
  v4 = 0.0;
  if (!v3)
  {
    v6 = 0.0;
    getFloat64(v8, CFSTR("DownGain"), &v6);
    v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)defaultUpGainForType:(int64_t)a3
{
  int v3;
  float v4;
  double v6;
  __CFDictionary *v7;
  __CFDictionary *v8;

  v8 = 0;
  v3 = dictForType(a3, &v8);
  v7 = v8;
  v4 = 0.5;
  if (!v3)
  {
    v6 = 0.0;
    getFloat64(v8, CFSTR("UpGain"), &v6);
    v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)hapticGainForType:(int64_t)a3
{
  int v3;
  float v4;
  double v6;
  __CFDictionary *v7;
  __CFDictionary *v8;

  v8 = 0;
  v3 = dictForType(a3, &v8);
  v7 = v8;
  v4 = 0.5;
  if (!v3)
  {
    v6 = 0.0;
    getFloat64(v8, CFSTR("HapticGain"), &v6);
    v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (float)audioGainForType:(int64_t)a3
{
  int v3;
  float v4;
  double v6;
  __CFDictionary *v7;
  __CFDictionary *v8;

  v8 = 0;
  v3 = dictForType(a3, &v8);
  v7 = v8;
  v4 = 0.5;
  if (!v3)
  {
    v6 = 0.0;
    getFloat64(v8, CFSTR("AudioGain"), &v6);
    v4 = v6;
  }
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)&v7);
  return v4;
}

- (int64_t)maxNumberOfSlots
{
  return gNumberOfSlots;
}

- (BOOL)serviceAvailable
{
  return gServiceAvailable;
}

@end
