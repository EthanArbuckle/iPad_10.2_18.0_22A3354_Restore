@implementation CBAudioLinkQualityInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBAudioLinkQualityInfo)initWithCoder:(id)a3
{
  id v4;
  CBAudioLinkQualityInfo *v5;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  NSDecodeNSDictionaryOfClassesIfPresent();

  v5 = -[CBAudioLinkQualityInfo initWithDictionary:error:](self, "initWithDictionary:error:", 0, 0);
  return v5;
}

- (CBAudioLinkQualityInfo)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CBAudioLinkQualityInfo *v13;
  uint64_t v15;

  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = -[CBAudioLinkQualityInfo initWithXPCObject:error:](self, "initWithXPCObject:error:", v12, a4);
    v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBControllerInfo convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CBAudioLinkQualityInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBAudioLinkQualityInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  CBAudioLinkQualityInfo *v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  v7 = -[CBAudioLinkQualityInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_33;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v30);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_33;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_aosState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_33;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_bitRate = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_33;
  }
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_btBand = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_33;
  }
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_codecType = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_33;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeDouble())
    goto LABEL_33;
  v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v7->_noiseFloor90 = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_33;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_33;
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v7->_rssiAverage = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_33;
  }
  v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 != 6)
  {
    if (v20 != 5)
      goto LABEL_27;
LABEL_33:
    v21 = 0;
    goto LABEL_28;
  }
  v7->_signalToNoiseRatio = 0;
LABEL_27:
  v21 = v7;
LABEL_28:

  return v21;
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[CBAudioLinkQualityInfo encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
  v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CBAudioLinkQualityInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("auLQ"));

}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t bitRate;
  NSString *deviceName;
  const char *v8;
  double jitterBufferSeconds;
  double retransmitRate;
  void *v11;
  xpc_object_t xdict;

  v4 = a3;
  v5 = v4;
  if (self->_aosState)
    xpc_dictionary_set_uint64(v4, "aos", self->_aosState);
  bitRate = self->_bitRate;
  if ((_DWORD)bitRate)
    xpc_dictionary_set_uint64(v5, "auBR", bitRate);
  if (self->_btBand)
    xpc_dictionary_set_uint64(v5, "btBd", self->_btBand);
  if (self->_codecType)
    xpc_dictionary_set_int64(v5, "auCT", self->_codecType);
  deviceName = self->_deviceName;
  xdict = v5;
  v8 = -[NSString UTF8String](objc_retainAutorelease(deviceName), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(xdict, "dvNm", v8);

  jitterBufferSeconds = self->_jitterBufferSeconds;
  if (jitterBufferSeconds != 0.0)
    xpc_dictionary_set_double(xdict, "jtBf", jitterBufferSeconds);
  if (self->_noiseFloor90)
    xpc_dictionary_set_int64(xdict, "noFl", self->_noiseFloor90);
  retransmitRate = self->_retransmitRate;
  v11 = xdict;
  if (retransmitRate != 0.0)
  {
    xpc_dictionary_set_double(xdict, "rtmR", retransmitRate);
    v11 = xdict;
  }
  if (self->_rssiAverage)
  {
    xpc_dictionary_set_int64(xdict, "rsAv", self->_rssiAverage);
    v11 = xdict;
  }
  if (self->_signalToNoiseRatio)
  {
    xpc_dictionary_set_int64(xdict, "snr", self->_signalToNoiseRatio);
    v11 = xdict;
  }

}

- (id)description
{
  return -[CBAudioLinkQualityInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  _QWORD v28[9];
  id v29;
  uint64_t v30;
  _QWORD v31[8];
  id v32;
  uint64_t v33;

  v3 = a3;
  if (qword_1ECF9A1F0 != -1)
    dispatch_once(&qword_1ECF9A1F0, &__block_literal_global_341);
  v4 = (void *)qword_1ECF9A1E8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 > 0x14)
  {
    v30 = 0;
    NSAppendPrintF_safe();
    v29 = 0;
    NSAppendPrintF_safe();
    v9 = v29;

    v28[8] = v9;
    NSAppendPrintF_safe();
    v10 = v9;

    v28[7] = v10;
    NSAppendPrintF_safe();
    v12 = v10;

    v28[6] = v12;
    NSAppendPrintF_safe();
    v19 = v12;

    v28[5] = v19;
    NSAppendPrintF_safe();
    v20 = v19;

    v28[4] = v20;
    NSAppendPrintF_safe();
    v21 = v20;

    v28[3] = v21;
    NSAppendPrintF_safe();
    v22 = v21;

    v28[2] = v22;
    NSAppendPrintF_safe();
    v23 = v22;

    v28[1] = v23;
    NSAppendPrintF_safe();
    v17 = v23;

    v28[0] = v17;
    v18 = (id *)v28;
  }
  else
  {
    v33 = 0;
    NSAppendPrintF_safe();
    v32 = 0;
    NSAppendPrintF_safe();
    v7 = v32;

    v31[7] = v7;
    NSAppendPrintF_safe();
    v8 = v7;

    v31[6] = v8;
    NSAppendPrintF_safe();
    v11 = v8;

    v31[5] = v11;
    NSAppendPrintF_safe();
    v13 = v11;

    v31[4] = v13;
    NSAppendPrintF_safe();
    v14 = v13;

    v31[3] = v14;
    NSAppendPrintF_safe();
    v15 = v14;

    v31[2] = v15;
    NSAppendPrintF_safe();
    v16 = v15;

    v31[1] = v16;
    NSAppendPrintF_safe();
    v17 = v16;

    v31[0] = v17;
    v18 = (id *)v31;
  }
  NSAppendPrintF_safe();
  v24 = (__CFString *)*v18;

  if (v24)
    v25 = v24;
  else
    v25 = &stru_1E5403C08;
  v26 = v25;

  return v26;
}

void __47__CBAudioLinkQualityInfo_descriptionWithLevel___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ECF9A1E8;
  qword_1ECF9A1E8 = (uint64_t)v0;

  objc_msgSend((id)qword_1ECF9A1E8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  v2 = (void *)qword_1ECF9A1E8;
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int aosState;
  unsigned int bitRate;
  int btBand;
  int codecType;
  NSString *deviceName;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  int v15;
  double jitterBufferSeconds;
  double v17;
  int noiseFloor90;
  double retransmitRate;
  double v20;
  int rssiAverage;
  int signalToNoiseRatio;
  BOOL v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = 0;
    goto LABEL_19;
  }
  v5 = v4;
  aosState = self->_aosState;
  if (aosState != objc_msgSend(v5, "aosState"))
    goto LABEL_17;
  bitRate = self->_bitRate;
  if (bitRate != objc_msgSend(v5, "bitRate"))
    goto LABEL_17;
  btBand = self->_btBand;
  if (btBand != objc_msgSend(v5, "btBand"))
    goto LABEL_17;
  codecType = self->_codecType;
  if (codecType != objc_msgSend(v5, "codecType"))
    goto LABEL_17;
  deviceName = self->_deviceName;
  objc_msgSend(v5, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = deviceName;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if ((v12 == 0) == (v13 != 0))
    {

LABEL_17:
      v23 = 0;
      goto LABEL_18;
    }
    v15 = -[NSString isEqual:](v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_17;
  }
  jitterBufferSeconds = self->_jitterBufferSeconds;
  objc_msgSend(v5, "jitterBufferSeconds");
  if (jitterBufferSeconds != v17)
    goto LABEL_17;
  noiseFloor90 = self->_noiseFloor90;
  if (noiseFloor90 != objc_msgSend(v5, "noiseFloor90"))
    goto LABEL_17;
  retransmitRate = self->_retransmitRate;
  objc_msgSend(v5, "retransmitRate");
  if (retransmitRate != v20)
    goto LABEL_17;
  rssiAverage = self->_rssiAverage;
  if (rssiAverage != objc_msgSend(v5, "rssiAverage"))
    goto LABEL_17;
  signalToNoiseRatio = self->_signalToNoiseRatio;
  v23 = signalToNoiseRatio == objc_msgSend(v5, "signalToNoiseRatio");
LABEL_18:

LABEL_19:
  return v23;
}

- (unsigned)aosState
{
  return self->_aosState;
}

- (void)setAosState:(unsigned __int8)a3
{
  self->_aosState = a3;
}

- (unsigned)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(unsigned int)a3
{
  self->_bitRate = a3;
}

- (unsigned)btBand
{
  return self->_btBand;
}

- (void)setBtBand:(unsigned __int8)a3
{
  self->_btBand = a3;
}

- (char)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(char)a3
{
  self->_codecType = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)jitterBufferSeconds
{
  return self->_jitterBufferSeconds;
}

- (void)setJitterBufferSeconds:(double)a3
{
  self->_jitterBufferSeconds = a3;
}

- (char)noiseFloor90
{
  return self->_noiseFloor90;
}

- (void)setNoiseFloor90:(char)a3
{
  self->_noiseFloor90 = a3;
}

- (double)retransmitRate
{
  return self->_retransmitRate;
}

- (void)setRetransmitRate:(double)a3
{
  self->_retransmitRate = a3;
}

- (char)rssiAverage
{
  return self->_rssiAverage;
}

- (void)setRssiAverage:(char)a3
{
  self->_rssiAverage = a3;
}

- (char)signalToNoiseRatio
{
  return self->_signalToNoiseRatio;
}

- (void)setSignalToNoiseRatio:(char)a3
{
  self->_signalToNoiseRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
