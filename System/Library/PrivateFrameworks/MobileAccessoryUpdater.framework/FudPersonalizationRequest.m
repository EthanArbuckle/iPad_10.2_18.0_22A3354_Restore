@implementation FudPersonalizationRequest

- (FudPersonalizationRequest)initWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v8 = (char *)self;
  if (a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)FudPersonalizationRequest;
    v8 = -[FudPersonalizationRequest init](&v18, sel_init);
    if (v8)
    {
      v16 = a3;
      v8[12] = 0;
      *((_QWORD *)v8 + 5) = v16;
      *((_QWORD *)v8 + 6) = 0;
      *((_QWORD *)v8 + 7) = 0;
      *((_QWORD *)v8 + 8) = 0;
      *(_OWORD *)(v8 + 20) = xmmword_21ADE8AE0;
      *((_DWORD *)v8 + 9) = 0;
      *((_WORD *)v8 + 8) = 0;
      *((_DWORD *)v8 + 2) = 0;
      *((_QWORD *)v8 + 10) = 0;
      *((_QWORD *)v8 + 11) = 0;
      *((_QWORD *)v8 + 9) = 0;
    }
    else
    {
      FudLog(3, (uint64_t)CFSTR("%s(): super init error\n"), v10, v11, v12, v13, v14, v15, (uint64_t)"-[FudPersonalizationRequest initWithName:]");
    }
  }
  else
  {
    FudLog(3, (uint64_t)CFSTR("%s(): requestName=nil\n"), 0, v3, v4, v5, v6, v7, (uint64_t)"-[FudPersonalizationRequest initWithName:]");
  }
  return (FudPersonalizationRequest *)v8;
}

- (void)dealloc
{
  NSString *requestName;
  NSString *requestPrefix;
  NSData *nonceHash;
  NSArray *objectList;
  NSData *payload;
  NSData *extEcID;
  objc_super v9;

  requestName = self->_requestName;
  if (requestName)

  requestPrefix = self->_requestPrefix;
  if (requestPrefix)

  nonceHash = self->_nonceHash;
  if (nonceHash)

  objectList = self->_objectList;
  if (objectList)

  payload = self->_payload;
  if (payload)

  extEcID = self->_extEcID;
  if (extEcID)

  v9.receiver = self;
  v9.super_class = (Class)FudPersonalizationRequest;
  -[FudPersonalizationRequest dealloc](&v9, sel_dealloc);
}

- (void)setProductionMode:(BOOL)a3
{
  self->_cproSet = 1;
  self->_productionMode = a3;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_csecSet = 1;
  self->_securityMode = a3;
}

- (void)setEnableMixMatch:(BOOL)a3
{
  self->_enableMixMatch = a3;
}

- (void)setChipEpoch:(unsigned int)a3
{
  self->_cepoSet = 1;
  self->_chipEpoch = a3;
}

- (void)setUseSSOCredentials:(BOOL)a3
{
  self->_useSSOCredentials = a3;
}

- (BOOL)useSSOCredentials
{
  return self->_useSSOCredentials;
}

- (BOOL)isSecurityModeSet
{
  return self->_csecSet;
}

- (BOOL)isProductionModeSet
{
  return self->_cproSet;
}

- (BOOL)isChipEpochSet
{
  return self->_cepoSet;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestName, CFSTR("requestName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestPrefix, CFSTR("requestPrefix"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_responseFormat, CFSTR("requestRspFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_boardID, CFSTR("requestBoardID"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_chipID, CFSTR("requestChipID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_ecID, CFSTR("requestECID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_extEcID, CFSTR("requestExtECID"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_globalSigning, CFSTR("requestGlobalSign"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_securityDomain, CFSTR("requestSecDomain"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_cproSet, CFSTR("requestProdModeSet"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_productionMode, CFSTR("requestProdMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_csecSet, CFSTR("requestSecModeSet"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_securityMode, CFSTR("requestSecMode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_nonceHash, CFSTR("requestNonceHash"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_cepoSet, CFSTR("requestChipEpochSet"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_chipEpoch, CFSTR("requestChipEpoch"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_enableMixMatch, CFSTR("requestEnableMixMatch"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_objectList, CFSTR("requestObjects"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_payload, CFSTR("requestPayload"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_responseAlignment, CFSTR("requestRspAlign"));
}

- (FudPersonalizationRequest)initWithCoder:(id)a3
{
  FudPersonalizationRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FudPersonalizationRequest;
  v4 = -[FudPersonalizationRequest init](&v10, sel_init);
  if (v4)
  {
    v4->_requestName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestName"));
    v4->_requestPrefix = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestPrefix"));
    v4->_responseFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestRspFormat"));
    v4->_boardID = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestBoardID"));
    v4->_chipID = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestChipID"));
    v4->_ecID = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("requestECID"));
    v4->_extEcID = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestExtECID"));
    v4->_globalSigning = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestGlobalSign"));
    v4->_securityDomain = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestSecDomain"));
    v4->_cproSet = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestProdModeSet"));
    v4->_productionMode = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestProdMode"));
    v4->_csecSet = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestSecModeSet"));
    v4->_securityMode = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestSecMode"));
    v4->_nonceHash = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestNonceHash"));
    v4->_cepoSet = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestChipEpochSet"));
    v4->_chipEpoch = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestChipEpoch"));
    v4->_enableMixMatch = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("requestEnableMixMatch"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v4->_objectList = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), CFSTR("requestObjects"));
    v4->_payload = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestPayload"));
    v4->_responseAlignment = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("requestRspAlign"));
  }
  return v4;
}

- (NSString)requestName
{
  return self->_requestName;
}

- (NSString)requestPrefix
{
  return self->_requestPrefix;
}

- (void)setRequestPrefix:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)responseFormat
{
  return self->_responseFormat;
}

- (void)setResponseFormat:(int)a3
{
  self->_responseFormat = a3;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)extEcID
{
  return self->_extEcID;
}

- (void)setExtEcID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)globalSigning
{
  return self->_globalSigning;
}

- (void)setGlobalSigning:(BOOL)a3
{
  self->_globalSigning = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned int)a3
{
  self->_securityDomain = a3;
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (NSData)nonceHash
{
  return self->_nonceHash;
}

- (void)setNonceHash:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)chipEpoch
{
  return self->_chipEpoch;
}

- (BOOL)enableMixMatch
{
  return self->_enableMixMatch;
}

- (NSArray)objectList
{
  return self->_objectList;
}

- (void)setObjectList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)responseAlignment
{
  return self->_responseAlignment;
}

- (void)setResponseAlignment:(unsigned __int16)a3
{
  self->_responseAlignment = a3;
}

@end
