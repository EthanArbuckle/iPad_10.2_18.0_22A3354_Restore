@implementation AFMyriadRecord

- (AFMyriadRecord)init
{
  AFMyriadRecord *v2;
  AFMyriadRecord *v3;
  NSUUID *deviceID;
  AFMyriadRecord *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFMyriadRecord;
  v2 = -[AFMyriadRecord init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_goodness = 0;
    v2->_pHash = 0;
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    *(_DWORD *)&v3->_deviceClass = 0;
    v5 = v3;
  }

  return v3;
}

- (AFMyriadRecord)initWithAudioData:(id)a3
{
  id v4;
  AFMyriadRecord *v5;
  NSObject *v6;
  unsigned int goodness;
  NSUUID *deviceID;
  NSData *advertisementData;
  AFMyriadRecord *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFMyriadRecord;
  v5 = -[AFMyriadRecord init](&v12, sel_init);
  if (v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFMyriadRecord initWithAudioData:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s AFMyriadRecord initfrom: <THISDEVICE> - %@", buf, 0x16u);
    }
    extractMyriadDataFromAudioContext(v4, &v5->_pHash, &v5->_goodness, &v5->_userConfidence, 0, &v5->_tieBreaker);
    goodness = v5->_goodness;
    if (goodness >= 0x7F)
      LOBYTE(goodness) = 127;
    v5->_goodness = goodness;
    v5->_rawAudioGoodnessScore = goodness;
    v5->_deviceGroup = 0;
    deviceID = v5->_deviceID;
    v5->_deviceID = 0;

    v5->_deviceClass = 0;
    if (objc_msgSend(v4, "length") == 13)
      objc_msgSend(v4, "getBytes:range:", &v5->_tieBreaker, 12, 1);
    else
      v5->_tieBreaker = 0;
    v5->_isMe = 0;
    advertisementData = v5->_advertisementData;
    v5->_advertisementData = 0;

    v10 = v5;
  }

  return v5;
}

- (AFMyriadRecord)initWithDeviceID:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  AFMyriadRecord *v9;
  NSObject *v10;
  NSData *advertisementData;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSData *v17;
  AFMyriadRecord *v18;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AFMyriadRecord;
  v9 = -[AFMyriadRecord init](&v23, sel_init);
  if (v9)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[AFMyriadRecord initWithDeviceID:data:]";
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s AFMyriadRecord initfrom: %@ - %@", buf, 0x20u);
    }
    advertisementData = v9->_advertisementData;
    v9->_advertisementData = 0;

    v9->_productType = 0;
    objc_storeStrong((id *)&v9->_deviceID, a3);
    v12 = objc_msgSend(v8, "length");
    if (v12 < 7)
    {
      if (v8)
      {
        v15 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)MEMORY[0x1E0CB37E8];
          v21 = v15;
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v25 = "-[AFMyriadRecord initWithDeviceID:data:]";
          v26 = 2112;
          v27 = v22;
          v28 = 2112;
          v29 = v8;
          _os_log_error_impl(&dword_19AF50000, v21, OS_LOG_TYPE_ERROR, "%s Bad data of unexpected length %@ : %@", buf, 0x20u);

        }
      }
      v9->_pHash = 0;
      *(_DWORD *)&v9->_goodness = 0;
      *(_WORD *)&v9->_productType = 0;
    }
    else
    {
      v13 = v12;
      objc_msgSend(v8, "getBytes:range:", &v9->_pHash, 0, 2);
      objc_msgSend(v8, "getBytes:range:", &v9->_goodness, 2, 1);
      objc_msgSend(v8, "getBytes:range:", &v9->_userConfidence, 3, 1);
      objc_msgSend(v8, "getBytes:range:", &v9->_deviceGroup, 4, 1);
      objc_msgSend(v8, "getBytes:range:", &v9->_deviceClass, 5, 1);
      objc_msgSend(v8, "getBytes:range:", &v9->_tieBreaker, 6, 1);
      if (v13 == 7 || (objc_msgSend(v8, "getBytes:range:", &v9->_productType, 7, 1), v13 == 8))
      {
        v14 = objc_msgSend(v8, "copy");
      }
      else
      {
        v16 = objc_retainAutorelease(v8);
        v14 = objc_msgSend(v16, "initWithBytes:length:", objc_msgSend(v16, "bytes"), 8);
      }
      v17 = v9->_advertisementData;
      v9->_advertisementData = (NSData *)v14;

    }
    v18 = v9;
  }

  return v9;
}

- (void)setPHash:(unsigned __int16)a3
{
  if (self->_pHash != a3)
  {
    self->_pHash = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setRawAudioGoodnessScore:(unsigned __int8)a3 withBump:(unsigned __int8)a4
{
  unsigned __int8 v5;
  int v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int rawAudioGoodnessScore;
  int bump;
  int goodness;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  self->_rawAudioGoodnessScore = a3;
  self->_bump = a4;
  v5 = a4 + a3;
  if ((a4 + a3) >= 0x100)
  {
    v6 = a4;
    v7 = a3;
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315650;
      v14 = "-[AFMyriadRecord setRawAudioGoodnessScore:withBump:]";
      v15 = 1024;
      v16 = v7;
      v17 = 1024;
      v18 = v6;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s [(rawAudioGoodnessScore + bump) overflow] rawAudioGoodnessScore: %d, bump: %d. Overwriting goodness score to 0xff", (uint8_t *)&v13, 0x18u);
    }
    v5 = -1;
  }
  -[AFMyriadRecord setGoodness:](self, "setGoodness:", v5);
  self->_advertisementDataIsDirty = 1;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    rawAudioGoodnessScore = self->_rawAudioGoodnessScore;
    bump = self->_bump;
    goodness = self->_goodness;
    v13 = 136315906;
    v14 = "-[AFMyriadRecord setRawAudioGoodnessScore:withBump:]";
    v15 = 1024;
    v16 = rawAudioGoodnessScore;
    v17 = 1024;
    v18 = bump;
    v19 = 1024;
    v20 = goodness;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s rawAudioGoodnessScore: %d, bump: %d goodness: %d", (uint8_t *)&v13, 0x1Eu);
  }
}

- (void)adjustByMultiplier:(float)a3 adding:(int)a4
{
  unsigned int v4;
  int v6;
  NSObject *v7;
  unsigned int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LOBYTE(v4) = self->_goodness;
  v6 = (int)(float)((float)a4 + (float)((float)v4 * a3));
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[AFMyriadRecord adjustByMultiplier:adding:]";
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s #myriad newGoodness: %d", (uint8_t *)&v9, 0x12u);
  }
  v8 = v6 & ~(v6 >> 31);
  if (v8 >= 0x7F)
    LOBYTE(v8) = 127;
  if (v6 > 254)
    LOBYTE(v8) = -1;
  self->_bump = v8;
  -[AFMyriadRecord setGoodness:](self, "setGoodness:", v8);
  self->_advertisementDataIsDirty = 1;
}

- (void)setUserConfidence:(unsigned __int8)a3
{
  if (self->_userConfidence != a3)
  {
    self->_userConfidence = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)generateRandomConfidence
{
  unsigned __int8 v3;

  v3 = arc4random_uniform(0x100u);
  self->_userConfidence = v3;
  while (_lastRandomConfidenceGenerated == v3)
  {
    v3 = arc4random_uniform(0x100u);
    self->_userConfidence = v3;
  }
  _lastRandomConfidenceGenerated = v3;
  self->_advertisementDataIsDirty = 1;
}

- (void)setDeviceGroup:(unsigned __int8)a3
{
  if (self->_deviceGroup != a3)
  {
    self->_deviceGroup = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  if (self->_deviceClass != a3)
  {
    self->_deviceClass = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setProductType:(unsigned __int8)a3
{
  if (self->_productType != a3)
  {
    self->_productType = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setTieBreaker:(unsigned __int8)a3
{
  if (self->_tieBreaker != a3)
  {
    self->_tieBreaker = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)generateTiebreaker
{
  unsigned __int8 v3;

  v3 = arc4random_uniform(0x100u);
  self->_tieBreaker = v3;
  while (_lastRandomTieBreakerGenerated == v3)
  {
    v3 = arc4random_uniform(0x100u);
    self->_tieBreaker = v3;
  }
  _lastRandomTieBreakerGenerated = v3;
  self->_advertisementDataIsDirty = 1;
}

- (BOOL)isATrump
{
  return self->_goodness >= 0xF0u && (__int16)self->_pHash == -1;
}

- (BOOL)isInEarTrump
{
  return self->_goodness == 248 && (__int16)self->_pHash == -1;
}

- (BOOL)isCarplayTrump
{
  return self->_goodness == 244 && (__int16)self->_pHash == -1;
}

- (BOOL)isALateSupressionTrumpFor:(id)a3
{
  id v4;
  int pHash;
  BOOL v6;

  v4 = a3;
  pHash = self->_pHash;
  v6 = pHash == objc_msgSend(v4, "pHash")
    && !-[AFMyriadRecord isAContinuation](self, "isAContinuation")
    && !-[AFMyriadRecord isATrump](self, "isATrump")
    && self->_goodness == 255
    && objc_msgSend(v4, "goodness") != 255;

  return v6;
}

- (BOOL)isAContinuation
{
  return !self->_goodness && (__int16)self->_pHash == -1;
}

- (BOOL)isAnEmergency
{
  return self->_goodness == 239 && self->_pHash == 0;
}

- (BOOL)isAnEmergencyHandled
{
  return self->_goodness == 224 && self->_pHash == 0;
}

- (BOOL)isSane
{
  int goodness;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  goodness = self->_goodness;
  v6 = (char)goodness > -17 || goodness == 224 || goodness == 208;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = self->_deviceClass < 0xBu && v6;
    v10 = 136315394;
    v11 = "-[AFMyriadRecord isSane]";
    v12 = 1024;
    v13 = v8;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s AFMyriadRecord sanity: %d", (uint8_t *)&v10, 0x12u);
  }
  return self->_deviceClass < 0xBu && v6;
}

- (BOOL)isSlowdown
{
  return self->_goodness == 208 && self->_pHash == 0;
}

- (int)slowdownDelay
{
  int result;

  result = -[AFMyriadRecord isSlowdown](self, "isSlowdown");
  if (result)
    return 8 * self->_userConfidence;
  return result;
}

- (id)asAdvertisementData
{
  NSData *v3;
  void *v4;
  NSData *v5;
  NSData *advertisementData;

  if (self->_advertisementDataIsDirty || (v3 = self->_advertisementData) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendBytes:length:", &self->_pHash, 2);
    objc_msgSend(v4, "appendBytes:length:", &self->_goodness, 1);
    objc_msgSend(v4, "appendBytes:length:", &self->_userConfidence, 1);
    objc_msgSend(v4, "appendBytes:length:", &self->_deviceGroup, 1);
    objc_msgSend(v4, "appendBytes:length:", &self->_deviceClass, 1);
    objc_msgSend(v4, "appendBytes:length:", &self->_tieBreaker, 1);
    objc_msgSend(v4, "appendBytes:length:", &self->_productType, 1);
    v5 = (NSData *)objc_msgSend(v4, "copy");
    advertisementData = self->_advertisementData;
    self->_advertisementData = v5;

    self->_advertisementDataIsDirty = 0;
    v3 = self->_advertisementData;
  }
  return (id)-[NSData copy](v3, "copy");
}

- (BOOL)hasEqualAdvertisementData:(id)a3
{
  id v4;
  id v5;
  int pHash;
  int goodness;
  int userConfidence;
  int deviceGroup;
  int deviceClass;
  int tieBreaker;
  int productType;
  BOOL v13;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    pHash = self->_pHash;
    v13 = 0;
    if (pHash == objc_msgSend(v5, "pHash"))
    {
      goodness = self->_goodness;
      if (goodness == objc_msgSend(v5, "goodness"))
      {
        userConfidence = self->_userConfidence;
        if (userConfidence == objc_msgSend(v5, "userConfidence"))
        {
          deviceGroup = self->_deviceGroup;
          if (deviceGroup == objc_msgSend(v5, "deviceGroup"))
          {
            deviceClass = self->_deviceClass;
            if (deviceClass == objc_msgSend(v5, "deviceClass"))
            {
              tieBreaker = self->_tieBreaker;
              if (tieBreaker == objc_msgSend(v5, "tieBreaker"))
              {
                productType = self->_productType;
                if (productType == objc_msgSend(v5, "productType"))
                  v13 = 1;
              }
            }
          }
        }
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  const __CFString *v2;

  if (self->_isMe)
    v2 = CFSTR("TRUE");
  else
    v2 = CFSTR("FALSE");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MyriadRecord: hash=%#04x,good=%d,conf=%d,dc=%d,pt=%d,tb=%d,isMe=%@,g=%d,cc=%d"), self->_pHash, self->_goodness, self->_userConfidence, self->_deviceClass, self->_productType, self->_tieBreaker, v2, self->_deviceGroup, self->_isCollectedFromContextCollector);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AFMyriadRecord *v4;

  v4 = -[AFMyriadRecord init](+[AFMyriadRecord allocWithZone:](AFMyriadRecord, "allocWithZone:", a3), "init");
  -[AFMyriadRecord setDeviceID:](v4, "setDeviceID:", self->_deviceID);
  -[AFMyriadRecord setPHash:](v4, "setPHash:", self->_pHash);
  -[AFMyriadRecord setGoodness:](v4, "setGoodness:", self->_goodness);
  -[AFMyriadRecord setRawAudioGoodnessScore:](v4, "setRawAudioGoodnessScore:", self->_rawAudioGoodnessScore);
  -[AFMyriadRecord setBump:](v4, "setBump:", self->_bump);
  -[AFMyriadRecord setUserConfidence:](v4, "setUserConfidence:", self->_userConfidence);
  -[AFMyriadRecord setDeviceGroup:](v4, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v4, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setTieBreaker:](v4, "setTieBreaker:", self->_tieBreaker);
  -[AFMyriadRecord setProductType:](v4, "setProductType:", self->_productType);
  -[AFMyriadRecord setIsMe:](v4, "setIsMe:", self->_isMe);
  -[AFMyriadRecord setIsCollectedFromContextCollector:](v4, "setIsCollectedFromContextCollector:", self->_isCollectedFromContextCollector);
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_deviceID, "hash");
  -[AFMyriadRecord asAdvertisementData](self, "asAdvertisementData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ self->_isMe ^ v3 ^ self->_isCollectedFromContextCollector ^ (unint64_t)self->_rawAudioGoodnessScore ^ self->_bump;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSUUID *deviceID;
  void *v7;
  int pHash;
  int goodness;
  int rawAudioGoodnessScore;
  int bump;
  int userConfidence;
  int deviceGroup;
  int deviceClass;
  int tieBreaker;
  int productType;
  int isMe;
  int isCollectedFromContextCollector;
  BOOL v19;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    deviceID = self->_deviceID;
    objc_msgSend(v5, "deviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSUUID isEqual:](deviceID, "isEqual:", v7))
      goto LABEL_16;
    pHash = self->_pHash;
    if (pHash != objc_msgSend(v5, "pHash"))
      goto LABEL_16;
    goodness = self->_goodness;
    if (goodness != objc_msgSend(v5, "goodness"))
      goto LABEL_16;
    rawAudioGoodnessScore = self->_rawAudioGoodnessScore;
    if (rawAudioGoodnessScore != objc_msgSend(v5, "rawAudioGoodnessScore"))
      goto LABEL_16;
    bump = self->_bump;
    if (bump == objc_msgSend(v5, "bump")
      && (userConfidence = self->_userConfidence, userConfidence == objc_msgSend(v5, "userConfidence"))
      && (deviceGroup = self->_deviceGroup, deviceGroup == objc_msgSend(v5, "deviceGroup"))
      && (deviceClass = self->_deviceClass, deviceClass == objc_msgSend(v5, "deviceClass"))
      && (tieBreaker = self->_tieBreaker, tieBreaker == objc_msgSend(v5, "tieBreaker"))
      && (productType = self->_productType, productType == objc_msgSend(v5, "productType"))
      && (isMe = self->_isMe, isMe == objc_msgSend(v5, "isMe")))
    {
      isCollectedFromContextCollector = self->_isCollectedFromContextCollector;
      v19 = isCollectedFromContextCollector == objc_msgSend(v5, "isCollectedFromContextCollector");
    }
    else
    {
LABEL_16:
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unsigned)goodness
{
  return self->_goodness;
}

- (void)setGoodness:(unsigned __int8)a3
{
  self->_goodness = a3;
}

- (unsigned)userConfidence
{
  return self->_userConfidence;
}

- (unsigned)pHash
{
  return self->_pHash;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (unsigned)rawAudioGoodnessScore
{
  return self->_rawAudioGoodnessScore;
}

- (void)setRawAudioGoodnessScore:(unsigned __int8)a3
{
  self->_rawAudioGoodnessScore = a3;
}

- (unsigned)bump
{
  return self->_bump;
}

- (void)setBump:(unsigned __int8)a3
{
  self->_bump = a3;
}

- (unsigned)isCollectedFromContextCollector
{
  return self->_isCollectedFromContextCollector;
}

- (void)setIsCollectedFromContextCollector:(unsigned __int8)a3
{
  self->_isCollectedFromContextCollector = a3;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)advertisementDataIsDirty
{
  return self->_advertisementDataIsDirty;
}

- (void)setAdvertisementDataIsDirty:(BOOL)a3
{
  self->_advertisementDataIsDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
