@implementation AVAudioDevice

- (AVAudioDevice)initWithDeviceID:(id)a3
{
  AVAudioDevice *v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVAudioDevice *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)AVAudioDevice;
  v4 = -[AVAudioDevice init](&v8, sel_init);
  if (v4)
  {
    v4->_deviceID = (NSNumber *)objc_msgSend(a3, "copy");
    v4->_preferredDevice = -[AVAudioDevice isBluetoothDevice](v4, "isBluetoothDevice");
    if (!v4->_deviceName)
      -[AVAudioDevice createName](v4, "createName");
    if (!v4->_UID)
      -[AVAudioDevice createUID](v4, "createUID");
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVAudioDevice-initWithDeviceID");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVAudioDevice initWithDeviceID:]";
      v13 = 1024;
      v14 = 78;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVAudioDevice-initWithDeviceID self=%@ initDeviceID=%@", buf, 0x30u);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVAudioDevice;
  -[AVAudioDevice dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%p] deviceName[%@] deviceID[%@] UID[%@] isPreferred[%d] _isLineIn[%d] inputAvailable[%d] outputAvailable[%d]"), NSStringFromClass(v4), self, self->_deviceName, self->_deviceID, self->_UID, self->_preferredDevice, self->_isLineIn, self->_inputAvailable, self->_outputAvailable);
}

- (BOOL)isBluetoothDevice
{
  return 0;
}

- (id)newAudioObjectStringPropertyWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  return 0;
}

- (void)createName
{
  if (!self->_deviceName)
    self->_deviceName = (NSString *)-[AVAudioDevice newAudioObjectStringPropertyWithSelector:scope:element:](self, "newAudioObjectStringPropertyWithSelector:scope:element:", 1819173229, 1735159650, 0);
}

- (void)createUID
{
  if (!self->_UID)
    self->_UID = (NSString *)-[AVAudioDevice newAudioObjectStringPropertyWithSelector:scope:element:](self, "newAudioObjectStringPropertyWithSelector:scope:element:", 1969841184, 1735159650, 0);
}

- (BOOL)isValidDevice
{
  NSString *deviceName;

  deviceName = self->_deviceName;
  if (deviceName)
    LOBYTE(deviceName) = -[NSString rangeOfString:options:](deviceName, "rangeOfString:options:", CFSTR("VPAUAggregateAudioDevice"), 8) == 0x7FFFFFFFFFFFFFFFLL;
  return (char)deviceName;
}

- (BOOL)copyStreamIDArray:(unsigned int *)a3 length:(unsigned int *)a4
{
  AVAudioDevice *v4;
  uint64_t v7;
  OSStatus PropertyDataSize;
  UInt32 v9;
  int ErrorLogLevelForModule;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  OSStatus PropertyData;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  UInt32 ioDataSize;
  UInt32 outDataSize;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[14];
  __int16 v39;
  UInt32 v40;
  __int16 v41;
  UInt32 v42;
  uint64_t v43;

  v4 = self;
  LOBYTE(self) = 0;
  v43 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    return (char)self;
  v7 = -[NSNumber unsignedIntegerValue](v4->_deviceID, "unsignedIntegerValue");
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"#mtstpni";
  inAddress.mElement = 0;
  outDataSize = 0;
  PropertyDataSize = AudioObjectGetPropertyDataSize(v7, &inAddress, 0, 0, &outDataSize);
  v9 = outDataSize;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (PropertyDataSize)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(self) = 0;
      if (!v14)
        return (char)self;
      *(_DWORD *)buf = 136316418;
      v32 = v12;
      v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      v35 = 1024;
      v36 = 218;
      v37 = 2048;
      *(_QWORD *)v38 = v7;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = outDataSize;
      v39 = 1024;
      v40 = PropertyDataSize;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unable to get size for stream vector - deviceID=%lu, streamListDataSizeBytes=%u, status=%d", buf, 0x32u);
    }
LABEL_28:
    LOBYTE(self) = 0;
    return (char)self;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v32 = v15;
      v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      v35 = 1024;
      v36 = 221;
      v37 = 1024;
      *(_DWORD *)v38 = outDataSize;
      *(_WORD *)&v38[4] = 2048;
      *(_QWORD *)&v38[6] = v7;
      v39 = 1024;
      v40 = 0;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioObjectGetPropertyDataSize for kAudioDevicePropertyStreams returned streamListDataSizeBytes=%u for deviceID=%lu with status=%d", buf, 0x32u);
    }
  }
  v17 = (unint64_t)outDataSize >> 2;
  v18 = malloc_type_calloc(v17, 4uLL, 0x100004052888210uLL);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)self)
        return (char)self;
      -[AVAudioDevice copyStreamIDArray:length:].cold.1(v25, v26);
    }
    goto LABEL_28;
  }
  v19 = v18;
  ioDataSize = outDataSize;
  PropertyData = AudioObjectGetPropertyData(v7, &inAddress, 0, 0, &ioDataSize, v18);
  if (PropertyData || outDataSize != ioDataSize)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        v32 = v23;
        v33 = 2080;
        v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
        v35 = 1024;
        v36 = 233;
        v37 = 2048;
        *(_QWORD *)v38 = v19;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = PropertyData;
        v39 = 1024;
        v40 = outDataSize;
        v41 = 1024;
        v42 = ioDataSize;
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to get stream vector - streamList=%p, status=%d, expectedStreamListDataSizeBytes=%u, actualStreamListDataSizeBytes=%u", buf, 0x38u);
      }
    }
    free(v19);
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v32 = v21;
      v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      v35 = 1024;
      v36 = 237;
      v37 = 2048;
      *(_QWORD *)v38 = v19;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = outDataSize;
      v39 = 1024;
      v40 = v17;
      v41 = 1024;
      v42 = 0;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Returning streamList=%p with streamListDataSizeBytes=%u, streamListLength=%u, and status=%d", buf, 0x38u);
    }
  }
  *a3 = (unsigned int *)v19;
  *a4 = v17;
  LOBYTE(self) = 1;
  return (char)self;
}

- (BOOL)deviceHasNonTapStreamsInStreamList:(unsigned int *)a3 length:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  int HasProperty;
  int v8;
  OSStatus PropertyData;
  OSStatus v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  NSNumber *deviceID;
  uint64_t v16;
  NSObject *v17;
  NSNumber *v18;
  NSString *deviceName;
  UInt32 ioDataSize;
  int outData;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  NSNumber *v33;
  __int16 v34;
  _BYTE v35[10];
  _DWORD v36[4];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  inAddress.mElement = 0;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"spatbolg";
  outData = 0;
  if (a4)
  {
    v5 = 0;
    v6 = a4;
    while (1)
    {
      ioDataSize = 4;
      HasProperty = AudioObjectHasProperty(a3[v5], &inAddress);
      if (!HasProperty)
        break;
      v8 = HasProperty;
      PropertyData = AudioObjectGetPropertyData(a3[v5], &inAddress, 0, 0, &ioDataSize, &outData);
      if (PropertyData)
      {
        v10 = PropertyData;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = a3[v5];
            deviceID = self->_deviceID;
            *(_DWORD *)buf = 136316930;
            v25 = v11;
            v26 = 2080;
            v27 = "-[AVAudioDevice deviceHasNonTapStreamsInStreamList:length:]";
            v28 = 1024;
            v29 = 270;
            v30 = 1024;
            v31 = v13;
            v32 = 2112;
            v33 = deviceID;
            v34 = 1024;
            *(_DWORD *)v35 = v10;
            *(_WORD *)&v35[4] = 1024;
            *(_DWORD *)&v35[6] = v5 + 1;
            LOWORD(v36[0]) = 1024;
            *(_DWORD *)((char *)v36 + 2) = v6;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unable to get kAudioStreamPropertyIsTapStream data from streamID=%u on _deviceID=%@, status=%d - array value i=%u out of total=%u", buf, 0x3Eu);
          }
        }
      }
      else
      {
        if (!outData)
          break;
        v8 = 1;
      }
      if (v6 == ++v5)
        goto LABEL_16;
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
LABEL_16:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      v18 = self->_deviceID;
      *(_DWORD *)buf = 136316674;
      v25 = v16;
      v26 = 2080;
      v27 = "-[AVAudioDevice deviceHasNonTapStreamsInStreamList:length:]";
      v28 = 1024;
      v29 = 278;
      v30 = 1024;
      v31 = v8;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      *(_QWORD *)v35 = deviceName;
      *(_WORD *)&v35[8] = 1024;
      v36[0] = outData;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d deviceHasOnlyTapStreamInputs=%{BOOL}d, _deviceId=%@, _deviceName [%@], isTapStream=%u", buf, 0x3Cu);
    }
  }
  return v8 == 0;
}

- (BOOL)hasRealInputStream
{
  BOOL v3;
  unsigned int v5;
  void *v6[2];

  v6[1] = *(void **)MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v5 = 0;
  v3 = 0;
  if (-[AVAudioDevice copyStreamIDArray:length:](self, "copyStreamIDArray:length:", v6, &v5))
  {
    v3 = -[AVAudioDevice deviceHasNonTapStreamsInStreamList:length:](self, "deviceHasNonTapStreamsInStreamList:length:", v6[0], v5);
    free(v6[0]);
  }
  return v3;
}

- (BOOL)isAggregableDevice
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  id outData;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  outData = 0;
  inAddress.mElement = 0;
  ioDataSize = 8;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"glpobolg";
  AudioObjectGetPropertyData(-[NSNumber unsignedIntegerValue](self->_deviceID, "unsignedIntegerValue"), &inAddress, 0, 0, &ioDataSize, &outData);
  v2 = objc_msgSend(outData, "hasPrefix:", CFSTR("com.apple.audio.CoreAudio"));

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[AVAudioDevice isAggregableDevice]";
      v13 = 1024;
      v14 = 313;
      v15 = 1024;
      v16 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Input device created by CoreAudio result=%{BOOL}d", buf, 0x22u);
    }
  }
  return v2;
}

- (BOOL)isValidInputDevice
{
  _BOOL4 v3;

  v3 = -[AVAudioDevice hasRealInputStream](self, "hasRealInputStream");
  if (v3)
  {
    v3 = -[AVAudioDevice isAggregableDevice](self, "isAggregableDevice");
    if (v3)
      LOBYTE(v3) = !self->_isLineIn || -[AVAudioDevice isSomethingConnectedToJack](self, "isSomethingConnectedToJack");
  }
  return v3;
}

- (BOOL)isSomethingConnectedToJack
{
  OSStatus PropertyData;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  char *v7;
  NSNumber *deviceID;
  uint64_t v9;
  NSObject *v10;
  AudioObjectPropertyAddress inAddress;
  UInt32 ioDataSize;
  int outData;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  OSStatus v24;
  __int16 v25;
  NSNumber *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ioDataSize = 4;
  outData = 0;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"kcajtpni";
  inAddress.mElement = 0;
  PropertyData = AudioObjectGetPropertyData(-[NSNumber unsignedIntValue](self->_deviceID, "unsignedIntValue"), &inAddress, 0, 0, &ioDataSize, &outData);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (PropertyData)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = FourccToCStr(PropertyData);
        deviceID = self->_deviceID;
        *(_DWORD *)buf = 136316418;
        v16 = v5;
        v17 = 2080;
        v18 = "-[AVAudioDevice isSomethingConnectedToJack]";
        v19 = 1024;
        v20 = 338;
        v21 = 2080;
        v22 = v7;
        v23 = 1024;
        v24 = PropertyData;
        v25 = 2112;
        v26 = deviceID;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d AudioDeviceGetProperty failed for JackIsConnected error=%s [%d] deviceId=%@", buf, 0x36u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v9;
      v17 = 2080;
      v18 = "-[AVAudioDevice isSomethingConnectedToJack]";
      v19 = 1024;
      v20 = 340;
      v21 = 1024;
      LODWORD(v22) = outData;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioDeviceGetProperty kAudioDevicePropertyJackIsConnected returned nValue=%u", buf, 0x22u);
    }
  }
  return outData != 0;
}

- (BOOL)isBuiltInDevice
{
  return 0;
}

- (unsigned)allocDeviceControlListAndSize:(unsigned int *)a3
{
  return 0;
}

- (unsigned)getDataSourceControlID
{
  return 0;
}

- (BOOL)isStreamAvailableForScope:(unsigned int)a3
{
  return 0;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_deviceID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSNumber isEqualToNumber:](self->_deviceID, "isEqualToNumber:", objc_msgSend(a3, "deviceID"));
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSString)UID
{
  return self->_UID;
}

- (BOOL)inputAvailable
{
  return self->_inputAvailable;
}

- (BOOL)outputAvailable
{
  return self->_outputAvailable;
}

- (BOOL)isPreferredDevice
{
  return self->_preferredDevice;
}

- (void)copyStreamIDArray:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[AVAudioDevice copyStreamIDArray:length:]";
  v6 = 1024;
  v7 = 226;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d streamList calloc failed", (uint8_t *)&v2, 0x1Cu);
}

@end
