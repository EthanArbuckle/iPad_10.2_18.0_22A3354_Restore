@implementation AFMyriadAdvertisementContextRecord

- (AFMyriadAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6
{
  id v10;
  id v11;
  AFMyriadAdvertisementContextRecord *v12;
  AFMyriadAdvertisementContextRecord *v13;
  uint64_t v14;
  NSData *advertisementPayload;
  uint64_t v16;
  NSUUID *deviceID;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AFMyriadAdvertisementContextRecord;
  v12 = -[AFMyriadAdvertisementContextRecord init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_advertisementContextVersion = kMyriadAdvertisementContextRecordVersion;
    v12->_advertisementRecordType = a3;
    v12->_voiceTriggerEndTime = a4;
    v14 = objc_msgSend(v10, "copy");
    advertisementPayload = v13->_advertisementPayload;
    v13->_advertisementPayload = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    deviceID = v13->_deviceID;
    v13->_deviceID = (NSUUID *)v16;

  }
  return v13;
}

- (AFMyriadAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3
{
  id v4;
  AFMyriadAdvertisementContextRecord *v5;
  AFMyriadAdvertisementContextRecord *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadAdvertisementContextRecord;
  v5 = -[AFMyriadAdvertisementContextRecord init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AFMyriadAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:](v5, "_initializeMyriadAdvertisementContextRecordFromData:", v4);

  return v6;
}

- (id)description
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NSData length](self->_advertisementPayload, "length"))
  {
    v4 = -[NSData bytes](self->_advertisementPayload, "bytes");
    if (-[NSData length](self->_advertisementPayload, "length"))
    {
      v5 = 0;
      do
        objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v4[v5++]);
      while (v5 < -[NSData length](self->_advertisementPayload, "length"));
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AFMyriadAdvertisementContextRecord: contextVersion=%ld vtEndTime=%f advRecordType=%ld advPayload=0x%@ deviceID=%@"), self->_advertisementContextVersion, *(_QWORD *)&self->_voiceTriggerEndTime, self->_advertisementRecordType, v3, self->_deviceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)myriadAdvertisementContextAsData
{
  void *v3;
  size_t v4;
  uint8_t *v5;
  NSData *advertisementPayload;
  NSUUID *deviceID;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFMyriadAdvertisementContextRecord _advertisementPayloadSizeForVersion:](self, "_advertisementPayloadSizeForVersion:", self->_advertisementContextVersion);
  v5 = &buf[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v5, v4);
  advertisementPayload = self->_advertisementPayload;
  if (advertisementPayload && -[NSData length](advertisementPayload, "length") == v4)
    -[NSData getBytes:length:](self->_advertisementPayload, "getBytes:length:", v5, v4);
  v16[0] = 0;
  v16[1] = 0;
  deviceID = self->_deviceID;
  if (deviceID)
    -[NSUUID getUUIDBytes:](deviceID, "getUUIDBytes:", v16);
  objc_msgSend(v3, "appendBytes:length:", &self->_advertisementContextVersion, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_advertisementRecordType, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_voiceTriggerEndTime, 8);
  objc_msgSend(v3, "appendBytes:length:", v5, v4);
  objc_msgSend(v3, "appendBytes:length:", v16, 16);
  v8 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_msgSend(v3, "length");
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFMyriadAdvertisementContextRecord myriadAdvertisementContextAsData]";
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s Generated Myriad advertisement context data: %lu bytes", buf, 0x16u);

  }
  return v3;
}

- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4
{
  double v6;
  double voiceTriggerEndTime;
  double v8;
  BOOL v9;
  NSObject *v10;
  NSData *advertisementPayload;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  NSData *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      v16 = 2048;
      *(double *)v17 = a3;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s Invalid Voicetrigger endtime: %f", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    v6 = fmin(a4, 0.5);
    voiceTriggerEndTime = self->_voiceTriggerEndTime;
    if (voiceTriggerEndTime - a3 >= 0.0)
      v8 = voiceTriggerEndTime - a3;
    else
      v8 = -(voiceTriggerEndTime - a3);
    v9 = v8 <= v6;
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      advertisementPayload = self->_advertisementPayload;
      v14 = 136316674;
      v15 = "-[AFMyriadAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      v16 = 1024;
      *(_DWORD *)v17 = v8 <= v6;
      *(_WORD *)&v17[4] = 2048;
      *(double *)&v17[6] = v6;
      v18 = 2048;
      v19 = a3;
      v20 = 2048;
      v21 = voiceTriggerEndTime;
      v22 = 2048;
      v23 = v8;
      v24 = 2112;
      v25 = advertisementPayload;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s VoicetriggerEndtime isSane: %d (threshold: %f, me: %f, other: %f, abs-diff: %f adv: %@)", (uint8_t *)&v14, 0x44u);
    }
  }
  return v9;
}

- (unint64_t)_advertisementPayloadSizeForVersion:(unsigned __int8)a3
{
  if ((a3 - 1) < 2)
    return 7;
  else
    return 8;
}

- (char)_getAdvertisementRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4;
  char v5;
  uint64_t v7;

  v4 = a4;
  v5 = 7;
  v7 = 7;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 1, 1);
    v5 = v7;
  }

  return v5;
}

- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4;
  double v5;
  double v7;

  v4 = a4;
  v7 = 0.0;
  v5 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0xA)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 2, 8);
    v5 = v7;
  }

  return v5;
}

- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v5;
  size_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[AFMyriadAdvertisementContextRecord _advertisementPayloadSizeForVersion:](self, "_advertisementPayloadSizeForVersion:", self->_advertisementContextVersion);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)v11 - v7;
  bzero((char *)v11 - v7, v6);
  if (objc_msgSend(v5, "length") >= v6 + 10)
    objc_msgSend(v5, "getBytes:range:", v8, 10, v6);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v4 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12[0] = 0;
  v12[1] = 0;
  v7 = objc_msgSend(v6, "length");
  if ((v4 - 1) > 1)
  {
    if (v7 >= 0x22)
    {
      v8 = 18;
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (v7 <= 0x20)
    goto LABEL_7;
  v8 = 17;
LABEL_6:
  objc_msgSend(v6, "getBytes:range:", v12, v8, 16);
  -[AFMyriadAdvertisementContextRecord _deviceIDFromBytes:](self, "_deviceIDFromBytes:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int advertisementContextVersion;
  double v8;
  NSData *v9;
  NSData *advertisementPayload;
  NSUUID *v11;
  NSUUID *deviceID;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v4 && v5)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_advertisementContextVersion, 0, 1);
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      advertisementContextVersion = self->_advertisementContextVersion;
      v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      v16 = 1024;
      LODWORD(v17) = advertisementContextVersion;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Initializing Myriad advertisement context (version: %d)", (uint8_t *)&v14, 0x12u);
    }
    self->_advertisementRecordType = -[AFMyriadAdvertisementContextRecord _getAdvertisementRecordTypeForVersion:data:](self, "_getAdvertisementRecordTypeForVersion:data:", self->_advertisementContextVersion, v4);
    -[AFMyriadAdvertisementContextRecord _getVoiceTriggerEndTimeForVersion:data:](self, "_getVoiceTriggerEndTimeForVersion:data:", self->_advertisementContextVersion, v4);
    self->_voiceTriggerEndTime = v8;
    -[AFMyriadAdvertisementContextRecord _getMyriadAdvertisementDataForVersion:data:](self, "_getMyriadAdvertisementDataForVersion:data:", self->_advertisementContextVersion, v4);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    advertisementPayload = self->_advertisementPayload;
    self->_advertisementPayload = v9;

    -[AFMyriadAdvertisementContextRecord _getDeviceIdForVersion:data:](self, "_getDeviceIdForVersion:data:", self->_advertisementContextVersion, v4);
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    deviceID = self->_deviceID;
    self->_deviceID = v11;

  }
  else
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_19AF50000, v13, OS_LOG_TYPE_ERROR, "%s #myriad-advertisementcontext: Received wedged Myriad advertisement context record %@", (uint8_t *)&v14, 0x16u);
    }
  }

}

- (id)recordForDeviceId:(id)a3
{
  id v4;
  AFMyriadRecord *v5;

  v4 = a3;
  if (v4 && self->_advertisementPayload)
  {
    v5 = -[AFMyriadRecord initWithDeviceID:data:]([AFMyriadRecord alloc], "initWithDeviceID:data:", v4, self->_advertisementPayload);
    -[AFMyriadRecord setIsCollectedFromContextCollector:](v5, "setIsCollectedFromContextCollector:", 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)compareAdvertisementPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4
    && self->_advertisementPayload
    && (v6 = objc_msgSend(v4, "length"), v6 == -[NSData length](self->_advertisementPayload, "length")))
  {
    v7 = objc_msgSend(v5, "isEqual:", self->_advertisementPayload);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deviceIDFromBytes:(const unsigned __int8 *)(a3
{
  void *v5;
  void *v6;
  char out[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (uuid_is_null((const unsigned __int8 *)a3))
    return 0;
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)a3, out);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), out);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    return 0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);

  return v6;
}

- (unsigned)advertisementContextVersion
{
  return self->_advertisementContextVersion;
}

- (int64_t)advertisementRecordType
{
  return self->_advertisementRecordType;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (double)advertisementDispatchTime
{
  return self->_advertisementDispatchTime;
}

- (void)setAdvertisementDispatchTime:(double)a3
{
  self->_advertisementDispatchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end
