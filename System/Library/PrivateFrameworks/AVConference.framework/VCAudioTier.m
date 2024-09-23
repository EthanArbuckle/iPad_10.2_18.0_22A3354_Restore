@implementation VCAudioTier

+ (BOOL)bundlingAppliedByCodecForPayload:(int)a3 mode:(int)a4
{
  _BOOL4 v5;

  v5 = !+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(_QWORD *)&a3, 1, *(_QWORD *)&a4);
  return a3 != 13 && v5;
}

+ (unsigned)totalAudioBitrateWithTierConfig:(const tagVCAudioTierConfig *)a3
{
  unsigned int result;
  unsigned int var4;
  unsigned int var6;
  unsigned int v6;
  unsigned int v7;

  result = a3->var2;
  var4 = a3->var4;
  if (var4)
  {
    var6 = a3->var6;
    v6 = result + result * var4;
    v7 = result + var6 * var4;
    if (var6)
      return v7;
    else
      return v6;
  }
  return result;
}

+ (unsigned)redPayloadOverheadBytesWithNumPayloads:(unsigned int)a3
{
  if (a3)
    return (4 * a3) | 1;
  else
    return 0;
}

- (void)setUpAssignedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3
{
  unsigned int *p_audioCodecBitrate;
  unsigned int var4;
  unsigned int *p_var6;
  unsigned int var6;
  BOOL v7;

  self->audioCodecBitrate = a3->var2;
  p_audioCodecBitrate = &self->audioCodecBitrate;
  self->packetsPerBundle = a3->var3;
  var4 = a3->var4;
  self->redNumPayloads = var4;
  self->payloadConfig = (VCAudioPayloadConfig *)a3->var0;
  self->_headerSize = a3->var5;
  var6 = a3->var6;
  p_var6 = &a3->var6;
  self->_bundlingAppliedByCodec = *((_BYTE *)p_var6 - 20);
  v7 = var6 == 0;
  self->_isShortREDEnabled = var6 != 0;
  if (var4)
  {
    if (!v7)
      p_audioCodecBitrate = p_var6;
    self->_redPayloadBitrate = *p_audioCodecBitrate;
  }
}

- (void)setUpCalculatedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3
{
  unsigned int v5;
  unsigned int v6;
  double v7;
  unsigned int v8;
  unint64_t v9;
  double v10;
  double v11;
  unsigned int v12;
  unsigned int redNumPayloads;
  unsigned int v14;
  unsigned int packetsPerBundle;

  v5 = +[VCAudioTier totalAudioBitrateWithTierConfig:](VCAudioTier, "totalAudioBitrateWithTierConfig:");
  v6 = +[VCAudioTier redPayloadOverheadBytesWithNumPayloads:](VCAudioTier, "redPayloadOverheadBytesWithNumPayloads:", a3->var4);
  v7 = (double)objc_msgSend(a3->var0, "inputSampleRate");
  v8 = objc_msgSend(a3->var0, "samplesPerFrame");
  LODWORD(v9) = a3->var3;
  v10 = v7 / (double)v8 / (double)v9;
  self->networkBitrate = v5
                       + vcvtpd_u64_f64(v10* ((double)(a3->var5 + objc_msgSend(a3->var0, "bundleHeaderBytes") + v6)* 8.0));
  v11 = (double)v5 / v10 * 0.125;
  v12 = vcvtad_u64_f64(v11);
  self->_payloadSize = v12;
  redNumPayloads = self->redNumPayloads;
  if (redNumPayloads)
  {
    LODWORD(v11) = self->audioCodecBitrate;
    v14 = vcvtpd_u64_f64((double)(v12 - vcvtpd_u64_f64((double)*(unint64_t *)&v11 / v10 * 0.125)) / (double)redNumPayloads);
  }
  else
  {
    v14 = 0;
  }
  self->_redPayloadSize = v14;
  if (self->_bundlingAppliedByCodec)
    packetsPerBundle = -[VCAudioPayloadConfig internalBundleFactor](self->payloadConfig, "internalBundleFactor");
  else
    packetsPerBundle = self->packetsPerBundle;
  self->redMaxDelay20ms = packetsPerBundle * redNumPayloads;
}

- (VCAudioTier)initWithConfig:(const tagVCAudioTierConfig *)a3
{
  VCAudioTier *v5;
  VCAudioTier *v6;
  uint64_t v8;
  NSObject *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)VCAudioTier;
    v5 = -[VCAudioTier init](&v10, sel_init);
    v6 = v5;
    if (v5)
    {
      -[VCAudioTier setUpAssignedPropertiesWithConfig:](v5, "setUpAssignedPropertiesWithConfig:", a3);
      -[VCAudioTier setUpCalculatedPropertiesWithConfig:](v6, "setUpCalculatedPropertiesWithConfig:", a3);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioTier initWithConfig:].cold.1(v8, v9);
    }

    return 0;
  }
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t packetsPerBundle;
  const char *v7;
  const char *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VCAudioTier;
  v4 = -[VCAudioTier description](&v10, sel_description);
  v5 = -[VCAudioPayloadConfig payload](self->payloadConfig, "payload");
  if (self->_bundlingAppliedByCodec)
  {
    packetsPerBundle = -[VCAudioPayloadConfig internalBundleFactor](self->payloadConfig, "internalBundleFactor");
    if (self->_bundlingAppliedByCodec)
      v7 = "*";
    else
      v7 = "";
  }
  else
  {
    packetsPerBundle = self->packetsPerBundle;
    v7 = "";
  }
  if (self->_isShortREDEnabled)
    v8 = "YES";
  else
    v8 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ payload=%d bundle=%d%s audioCodecBitrate=%d redNumPayloads=%d redMaxDelay20ms=%d networkBitrate=%d packetSize=%d payloadSize=%d headerSize=%d redPayloadSize=%u shortREDEnabled=%s }"), v4, v5, packetsPerBundle, v7, self->audioCodecBitrate, self->redNumPayloads, self->redMaxDelay20ms, self->networkBitrate, self->_payloadSize + self->_headerSize, self->_payloadSize, self->_headerSize, self->_redPayloadSize, v8);
}

- (id)dictionary
{
  void *v3;
  uint64_t packetsPerBundle;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("payload");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCAudioPayloadConfig payload](self->payloadConfig, "payload"));
  v6[1] = CFSTR("bundle");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  if (self->_bundlingAppliedByCodec)
    packetsPerBundle = -[VCAudioPayloadConfig internalBundleFactor](self->payloadConfig, "internalBundleFactor");
  else
    packetsPerBundle = self->packetsPerBundle;
  v7[1] = objc_msgSend(v3, "numberWithUnsignedInt:", packetsPerBundle);
  v6[2] = CFSTR("audioCodecBitrate");
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->audioCodecBitrate);
  v6[3] = CFSTR("redNumPayloads");
  v7[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->redNumPayloads);
  v6[4] = CFSTR("redMaxDelay");
  v7[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->redMaxDelay20ms);
  v6[5] = CFSTR("networkBitrate");
  v7[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->networkBitrate);
  v6[6] = CFSTR("shortREDEnabled");
  v7[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isShortREDEnabled);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
}

- (BOOL)isEqual:(id)a3
{
  unsigned int networkBitrate;
  unsigned int audioCodecBitrate;
  unsigned int packetsPerBundle;
  unsigned int redNumPayloads;
  int v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  networkBitrate = self->networkBitrate;
  if (networkBitrate != objc_msgSend(a3, "networkBitrate"))
    return 0;
  audioCodecBitrate = self->audioCodecBitrate;
  if (audioCodecBitrate != objc_msgSend(a3, "audioCodecBitrate"))
    return 0;
  packetsPerBundle = self->packetsPerBundle;
  if (packetsPerBundle != objc_msgSend(a3, "packetsPerBundle"))
    return 0;
  redNumPayloads = self->redNumPayloads;
  if (redNumPayloads != objc_msgSend(a3, "redNumPayloads"))
    return 0;
  v9 = -[VCAudioPayloadConfig payload](self->payloadConfig, "payload");
  return v9 == objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload");
}

- (unsigned)networkBitrate
{
  return self->networkBitrate;
}

- (unsigned)audioCodecBitrate
{
  return self->audioCodecBitrate;
}

- (unsigned)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (unsigned)redNumPayloads
{
  return self->redNumPayloads;
}

- (unsigned)redMaxDelay20ms
{
  return self->redMaxDelay20ms;
}

- (VCAudioPayloadConfig)payloadConfig
{
  return self->payloadConfig;
}

- (unsigned)redPayloadSize
{
  return self->_redPayloadSize;
}

- (BOOL)shortREDEnabled
{
  return self->_isShortREDEnabled;
}

- (void)setShortREDEnabled:(BOOL)a3
{
  self->_isShortREDEnabled = a3;
}

- (unsigned)redPayloadBitrate
{
  return self->_redPayloadBitrate;
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCAudioTier initWithConfig:]";
  v6 = 1024;
  v7 = 92;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Attempting to create an audio tier with a nil configuration reference.", (uint8_t *)&v2, 0x1Cu);
}

@end
