@implementation VCMediaNegotiationBlobV2StreamGroupPayload

+ (id)defaultFTXTCodecConfig
{
  void *v2;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v3, "setCodecType:", 102);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v3, "setRtpPayload:", 100);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v3, "setH264PacketizationMode:", 1);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v3, "setCipherSuite:", 3);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setEncoderUsage:](v3, "setEncoderUsage:", 4);
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

+ (id)defaultDataCodecConfig
{
  void *v2;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v3, "setCodecType:", 102);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v3, "setRtpPayload:", 110);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v3, "setH264PacketizationMode:", 1);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v3, "setCipherSuite:", 3);
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

+ (id)defaultMoCapConfig
{
  void *v2;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v3, "setCodecType:", 301);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v3, "setRtpPayload:", 124);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v3, "setH264PacketizationMode:", 1);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v3, "setCipherSuite:", 3);
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

+ (id)defaultMMJIConfig
{
  void *v2;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v3, "setCodecType:", 302);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v3, "setRtpPayload:", 125);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v3, "setH264PacketizationMode:", 1);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v3, "setCipherSuite:", 3);
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

+ (id)defaultPayloadConfigurationsForStreamGroupID:(unsigned int)a3
{
  void *v4;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v6;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v7;
  uint64_t v8;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v9;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v10;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v11;
  uint64_t v12;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v13;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v14;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v15;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((int)a3 > 1835623281)
  {
    if ((int)a3 <= 1935897188)
    {
      if (a3 == 1835623282)
      {
        v13 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v13, "setCodecType:", 4);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v13, "setPTime:", 20);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v13, "setCipherSuite:", 3);
        objc_msgSend(v4, "addObject:", v13);

        v14 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v14, "setCodecType:", 9);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v14, "setPTime:", 20);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v14, "setCipherSuite:", 3);
        objc_msgSend(v4, "addObject:", v14);

        v15 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v15, "setCodecType:", 8);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v15, "setPTime:", 20);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v15, "setCipherSuite:", 3);
        objc_msgSend(v4, "addObject:", v15);

        if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
          return v4;
        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v6, "setCodecType:", 16);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v6, "setRtpPayload:", 101);
        v7 = v6;
        v8 = 10;
        goto LABEL_23;
      }
      if (a3 != 1835623287)
        return v4;
    }
    else
    {
      if (a3 == 1935897189)
      {
LABEL_14:
        v9 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v9, "setCodecType:", 100);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v9, "setRtpPayload:", 123);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v9, "setH264PacketizationMode:", 1);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v9, "setCipherSuite:", 3);
        objc_msgSend(v4, "addObject:", v9);

        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v6, "setCodecType:", 102);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v6, "setRtpPayload:", 100);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v6, "setH264PacketizationMode:", 1);
LABEL_24:
        v11 = v6;
        v12 = 3;
        goto LABEL_25;
      }
      if (a3 != 1936290409)
      {
        if (a3 != 1937339233)
          return v4;
        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v6, "setCodecType:", 16);
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v6, "setRtpPayload:", 96);
        v7 = v6;
        v8 = 60;
LABEL_23:
        -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v7, "setPTime:", v8);
        goto LABEL_24;
      }
    }
    v10 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v10, "setCodecType:", 12);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v10, "setRtpPayload:", 96);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v10, "setPTime:", 60);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setUseInBandFEC:](v10, "setUseInBandFEC:", 0);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v10, "setRtcpSREnabled:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v10, "setCipherSuite:", 2);
    objc_msgSend(v4, "addObject:", v10);

    v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v6, "setCodecType:", 11);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v6, "setRtpPayload:", 97);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v6, "setPTime:", 40);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setUseInBandFEC:](v6, "setUseInBandFEC:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v6, "setRtcpSREnabled:", 1);
    v11 = v6;
    v12 = 2;
LABEL_25:
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v11, "setCipherSuite:", v12);
    objc_msgSend(v4, "addObject:", v6);

    return v4;
  }
  if ((int)a3 > 1667329398)
  {
    if (a3 != 1667329399)
    {
      if (a3 == 1717854580)
        return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultMMJIConfig](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultMMJIConfig");
      if (a3 == 1718909044)
        return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultFTXTCodecConfig](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultFTXTCodecConfig");
      return v4;
    }
    v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v6, "setCodecType:", 100);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v6, "setRtpPayload:", 123);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_PLIEnabled:](v6, "setRtcpPSFB_PLIEnabled:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_FIREnabled:](v6, "setRtcpPSFB_FIREnabled:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v6, "setRtcpSREnabled:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264LevelAsymmetryAllowed:](v6, "setH264LevelAsymmetryAllowed:", 0);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v6, "setH264PacketizationMode:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setProfileLevelId:](v6, "setProfileLevelId:", 4374559);
    v11 = v6;
    v12 = 1;
    goto LABEL_25;
  }
  if (a3 == 1650745716)
    return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultMoCapConfig](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultMoCapConfig");
  if (a3 == 1667329381)
    goto LABEL_14;
  return v4;
}

+ (unsigned)defaultRTPSampleRateForStreamGroupID:(unsigned int)a3
{
  int v3;
  unsigned int result;
  int v5;

  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 <= 1667329398)
    {
      if (a3 == 1650745716)
        return 24000;
      v3 = 1667329381;
    }
    else
    {
      if (a3 == 1667329399)
        return 90000;
      if (a3 == 1717854580)
        return 24000;
      v3 = 1718909044;
    }
    if (a3 != v3)
      return 0;
    return 24000;
  }
  result = 48000;
  if ((int)a3 <= 1935897188)
  {
    if (a3 == 1835623282)
      return 24000;
    v5 = 1835623287;
  }
  else
  {
    if (a3 == 1935897189 || a3 == 1936290409)
      return result;
    v5 = 1937339233;
  }
  if (a3 != v5)
    return 0;
  return result;
}

+ (BOOL)isDefaultPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;

  v6 = *(_QWORD *)&a6;
  v10 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", *(_QWORD *)&a6);
  if (objc_msgSend(v10, "count") <= (unint64_t)a4)
    goto LABEL_20;
  v11 = objc_msgSend(v10, "objectAtIndex:", a4);
  if (!v11)
    return v11;
  v12 = (void *)v11;
  v13 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", v6);
  v14 = objc_msgSend(v12, "codecType");
  if (v14 != objc_msgSend(a3, "codecType"))
    goto LABEL_20;
  v15 = objc_msgSend(v12, "rtpPayload");
  if (v15 != objc_msgSend(a3, "rtpPayload"))
    goto LABEL_20;
  v16 = objc_msgSend(v12, "pTime");
  if (v16 != objc_msgSend(a3, "pTime"))
    goto LABEL_20;
  v17 = objc_msgSend(v12, "rtcpRTPFB_GNACKEnabled");
  if (v17 != objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
    || (v18 = objc_msgSend(v12, "rtcpPSFB_PLIEnabled"), v18 != objc_msgSend(a3, "rtcpPSFB_PLIEnabled"))
    || (v19 = objc_msgSend(v12, "rtcpPSFB_FIREnabled"), v19 != objc_msgSend(a3, "rtcpPSFB_FIREnabled"))
    || (v20 = objc_msgSend(v12, "rtcpSREnabled"), v20 != objc_msgSend(a3, "rtcpSREnabled"))
    || (v21 = objc_msgSend(v12, "H264LevelAsymmetryAllowed"),
        v21 != objc_msgSend(a3, "H264LevelAsymmetryAllowed"))
    || (v22 = objc_msgSend(v12, "H264PacketizationMode"), v22 != objc_msgSend(a3, "H264PacketizationMode"))
    || (v23 = objc_msgSend(v12, "useInBandFEC"), v23 != objc_msgSend(a3, "useInBandFEC"))
    || (v24 = objc_msgSend(v12, "profileLevelId"), v24 != objc_msgSend(a3, "profileLevelId")))
  {
LABEL_20:
    LOBYTE(v11) = 0;
    return v11;
  }
  v25 = objc_msgSend(v12, "cipherSuite");
  LOBYTE(v11) = v25 == objc_msgSend(a3, "cipherSuite") && v13 == a5;
  return v11;
}

+ (unsigned)negotiationCodecTypeWithCodecType:(int64_t)a3
{
  unsigned int result;

  if (a3 > 99)
  {
    if (a3 <= 299)
    {
      if (a3 == 100)
        return 1;
      if (a3 == 102)
        return 2;
    }
    else
    {
      switch(a3)
      {
        case 300:
          return 6;
        case 301:
          return 10;
        case 302:
          return 11;
      }
    }
    return 0;
  }
  else
  {
    switch(a3)
    {
      case 4:
        result = 8;
        break;
      case 8:
        result = 7;
        break;
      case 9:
        result = 9;
        break;
      case 11:
        result = 4;
        break;
      case 12:
        result = 3;
        break;
      case 16:
        result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (BOOL)isNegotiationCodecTypeAudio:(unsigned int)a3
{
  return (a3 < 9) & (0x1B8u >> a3);
}

+ (int64_t)codecTypeWithNegotiationCodecType:(unsigned int)a3
{
  if (a3 - 1 > 0xA)
    return 0;
  else
    return qword_1D910F748[a3 - 1];
}

+ (unsigned)rtcpFlagsWithPayloadConfig:(id)a3
{
  int v4;
  int v5;
  int v6;
  int v7;

  v4 = objc_msgSend(a3, "rtcpPSFB_PLIEnabled");
  if (objc_msgSend(a3, "rtcpPSFB_FIREnabled"))
    v5 = 2;
  else
    v5 = 0;
  v6 = v5 | v4;
  if (objc_msgSend(a3, "rtcpSREnabled"))
    v7 = 4;
  else
    v7 = 0;
  return v6 | v7;
}

+ (unsigned)mediaFlagsWithPayloadConfig:(id)a3
{
  return objc_msgSend(a3, "useInBandFEC");
}

+ (id)rtcpFlagStringWithPayloadConfig:(id)a3
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  BOOL v7;

  v3 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagsWithPayloadConfig:", a3);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = 1;
  do
  {
    if ((v5 & v3) != 0)
    {
      if (v5 < 5 && ((0x17u >> v5) & 1) != 0)
        v6 = off_1E9E577C8[v5];
      else
        v6 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      objc_msgSend(v4, "addObject:", v6);
    }
    v7 = v5 >= 4;
    v5 = (2 * v5);
  }
  while (!v7);
  return (id)objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
}

+ (unsigned)negotiationCipherSuiteWithCipherSuite:(unsigned int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return -1;
}

+ (unsigned)cipherSuiteWithNegotiationCipherSuite:(unsigned int)a3
{
  if (a3 - 1 >= 4)
    return -1;
  else
    return a3 - 1;
}

- (void)setNegotiationPackedPayloadWithStreamGroupPayload:(tagStreamGroupPayload *)a3
{
  void *v4;

  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 10);
    if (!-[VCMediaNegotiationBlobV2StreamGroupPayload packedPayload](self, "packedPayload")
      || (objc_msgSend(v4, "isEqualToData:", -[VCMediaNegotiationBlobV2StreamGroupPayload packedPayload](self, "packedPayload")) & 1) == 0)
    {
      -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](self, "setPackedPayload:", v4);
    }
  }
}

- (void)getStreamGroupPayload:(tagStreamGroupPayload *)a3
{
  if (a3)
    -[NSData getBytes:length:](-[VCMediaNegotiationBlobV2StreamGroupPayload packedPayload](self, "packedPayload"), "getBytes:length:", a3, 10);
}

+ (int)negotiationPackedRtpSampleRateWithRTPSampleRate:(unsigned int)a3
{
  if ((int)a3 > 31999)
  {
    if ((int)a3 > 47999)
    {
      if (a3 == 48000)
        return 7;
      if (a3 == 90000)
        return 8;
    }
    else
    {
      if (a3 == 32000)
        return 5;
      if (a3 == 44100)
        return 6;
    }
  }
  else if ((int)a3 > 22049)
  {
    if (a3 == 22050)
      return 3;
    if (a3 == 24000)
      return 4;
  }
  else
  {
    if (a3 == 8000)
      return 1;
    if (a3 == 16000)
      return 2;
  }
  return 0;
}

+ (unsigned)rtpSampleRateWithNegotiationPackedSampleRate:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return dword_1D910F7A0[a3 - 1];
}

+ (BOOL)isPTimePackable:(unsigned int)a3
{
  return a3 < 0x500 && -858993459 * a3 < 0x33333334;
}

+ (unsigned)negotiationPackedPTimeWithPTime:(unsigned int)a3
{
  return a3 / 5;
}

+ (unsigned)pTimeWithNegotiationPackedPTime:(unsigned __int8)a3
{
  return 5 * a3;
}

- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4
{
  uint64_t v4;
  VCMediaNegotiationBlobV2StreamGroupPayload *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  VCMediaNegotiationBlobV2StreamGroupPayload *v18;
  unint64_t v19;

  v4 = *(_QWORD *)&a4;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:].cold.3();
    }

  }
  v7 = -[VCMediaNegotiationBlobV2StreamGroupPayload init](self, "init");
  if (v7)
  {
    v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", objc_msgSend(a3, "codecType"));
    if ((_DWORD)v8)
    {
      v9 = v8;
      if (-[VCMediaNegotiationBlobV2StreamGroupPayload codecType](v7, "codecType") != (_DWORD)v8)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setCodecType:](v7, "setCodecType:", v9);
      v10 = -[VCMediaNegotiationBlobV2StreamGroupPayload rtpPayload](v7, "rtpPayload");
      if (v10 != objc_msgSend(a3, "rtpPayload"))
        -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpPayload:](v7, "setRtpPayload:", objc_msgSend(a3, "rtpPayload"));
      v11 = -[VCMediaNegotiationBlobV2StreamGroupPayload pTime](v7, "pTime");
      if (objc_msgSend(a3, "pTime") != v11)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setPTime:](v7, "setPTime:", objc_msgSend(a3, "pTime"));
      v12 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagsWithPayloadConfig:", a3);
      if (-[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlags](v7, "rtcpFlags") != (_DWORD)v12)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setRtcpFlags:](v7, "setRtcpFlags:", v12);
      v13 = +[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "mediaFlagsWithPayloadConfig:", a3);
      if (-[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlags](v7, "mediaFlags") != (_DWORD)v13)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setMediaFlags:](v7, "setMediaFlags:", v13);
      v14 = -[VCMediaNegotiationBlobV2StreamGroupPayload profileLevelId](v7, "profileLevelId");
      if (objc_msgSend(a3, "profileLevelId") != v14)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setProfileLevelId:](v7, "setProfileLevelId:", objc_msgSend(a3, "profileLevelId"));
      v15 = -[VCMediaNegotiationBlobV2StreamGroupPayload encoderUsage](v7, "encoderUsage");
      if (v15 != objc_msgSend(a3, "encoderUsage"))
        -[VCMediaNegotiationBlobV2StreamGroupPayload setEncoderUsage:](v7, "setEncoderUsage:", objc_msgSend(a3, "encoderUsage"));
      if (-[VCMediaNegotiationBlobV2StreamGroupPayload rtpSampleRate](v7, "rtpSampleRate") != (_DWORD)v4)
        -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpSampleRate:](v7, "setRtpSampleRate:", v4);
      v16 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", objc_msgSend(a3, "cipherSuite"));
      if ((_DWORD)v16 != -1)
      {
        v17 = v16;
        if (-[VCMediaNegotiationBlobV2StreamGroupPayload cipherSuite](v7, "cipherSuite") != (_DWORD)v16)
          -[VCMediaNegotiationBlobV2StreamGroupPayload setCipherSuite:](v7, "setCipherSuite:", v17);
        v18 = -[VCMediaNegotiationBlobV2StreamGroupPayload newCompactPayloadWithPayloadConfig:rtpSampleRate:](v7, "newCompactPayloadWithPayloadConfig:rtpSampleRate:", a3, v4);
        if (v18
          && (v19 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v7, "data"), "length"),
              v19 > objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v18, "data"), "length")))
        {

          return v18;
        }
        else
        {

        }
        return v7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:].cold.1();
    }

    return 0;
  }
  return v7;
}

- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  VCMediaNegotiationBlobV2StreamGroupPayload *v30;
  unint64_t v31;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.1();
    }
    goto LABEL_37;
  }
  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", *(_QWORD *)&a6);
  if (objc_msgSend(v11, "count") <= (unint64_t)a4)
    return -[VCMediaNegotiationBlobV2StreamGroupPayload initWithPayloadConfig:rtpSampleRate:](self, "initWithPayloadConfig:rtpSampleRate:", a3, v8);
  v12 = objc_msgSend(v11, "objectAtIndex:", a4);
  if (!v12)
    return -[VCMediaNegotiationBlobV2StreamGroupPayload initWithPayloadConfig:rtpSampleRate:](self, "initWithPayloadConfig:rtpSampleRate:", a3, v8);
  v13 = (void *)v12;
  self = -[VCMediaNegotiationBlobV2StreamGroupPayload init](self, "init");
  if (self)
  {
    v14 = objc_msgSend(v13, "H264PacketizationMode");
    if (v14 == objc_msgSend(a3, "H264PacketizationMode"))
    {
      v15 = objc_msgSend(v13, "H264LevelAsymmetryAllowed");
      if (v15 == objc_msgSend(a3, "H264LevelAsymmetryAllowed"))
      {
        v16 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", v7);
        v17 = objc_msgSend(v13, "codecType");
        if (v17 == objc_msgSend(a3, "codecType"))
        {
LABEL_10:
          v19 = objc_msgSend(v13, "rtpPayload");
          if (v19 != objc_msgSend(a3, "rtpPayload"))
            -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpPayload:](self, "setRtpPayload:", objc_msgSend(a3, "rtpPayload"));
          v20 = objc_msgSend(v13, "pTime");
          if (v20 != objc_msgSend(a3, "pTime"))
            -[VCMediaNegotiationBlobV2StreamGroupPayload setPTime:](self, "setPTime:", objc_msgSend(a3, "pTime"));
          v21 = objc_msgSend(v13, "rtcpRTPFB_GNACKEnabled");
          if (v21 != objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
            || (v22 = objc_msgSend(v13, "rtcpPSFB_PLIEnabled"),
                v22 != objc_msgSend(a3, "rtcpPSFB_PLIEnabled"))
            || (v23 = objc_msgSend(v13, "rtcpPSFB_FIREnabled"),
                v23 != objc_msgSend(a3, "rtcpPSFB_FIREnabled"))
            || (v24 = objc_msgSend(v13, "rtcpSREnabled"), v24 != objc_msgSend(a3, "rtcpSREnabled")))
          {
            -[VCMediaNegotiationBlobV2StreamGroupPayload setRtcpFlags:](self, "setRtcpFlags:", +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagsWithPayloadConfig:", a3));
          }
          v25 = objc_msgSend(v13, "useInBandFEC");
          if (v25 != objc_msgSend(a3, "useInBandFEC"))
            -[VCMediaNegotiationBlobV2StreamGroupPayload setMediaFlags:](self, "setMediaFlags:", +[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "mediaFlagsWithPayloadConfig:", a3));
          v26 = objc_msgSend(v13, "profileLevelId");
          if (v26 != objc_msgSend(a3, "profileLevelId"))
            -[VCMediaNegotiationBlobV2StreamGroupPayload setProfileLevelId:](self, "setProfileLevelId:", objc_msgSend(a3, "profileLevelId"));
          v27 = objc_msgSend(v13, "encoderUsage");
          if (v27 != objc_msgSend(a3, "encoderUsage"))
            -[VCMediaNegotiationBlobV2StreamGroupPayload setEncoderUsage:](self, "setEncoderUsage:", objc_msgSend(a3, "encoderUsage"));
          if (v16 != (_DWORD)v8)
            -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpSampleRate:](self, "setRtpSampleRate:", v8);
          v28 = objc_msgSend(v13, "cipherSuite");
          if (v28 == objc_msgSend(a3, "cipherSuite"))
            goto LABEL_30;
          v29 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", objc_msgSend(a3, "cipherSuite"));
          if ((_DWORD)v29 != -1)
          {
            -[VCMediaNegotiationBlobV2StreamGroupPayload setCipherSuite:](self, "setCipherSuite:", v29);
LABEL_30:
            v30 = -[VCMediaNegotiationBlobV2StreamGroupPayload newCompactPayloadWithPayloadConfig:rtpSampleRate:](self, "newCompactPayloadWithPayloadConfig:rtpSampleRate:", a3, v8);
            if (v30
              && (v31 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"),
                  v31 > objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v30, "data"), "length")))
            {

              return v30;
            }
            else
            {

            }
            return self;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.4();
          }
          goto LABEL_37;
        }
        v18 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", objc_msgSend(a3, "codecType"));
        if ((_DWORD)v18)
        {
          -[VCMediaNegotiationBlobV2StreamGroupPayload setCodecType:](self, "setCodecType:", v18);
          goto LABEL_10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.5();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.2();
    }
LABEL_37:

    return 0;
  }
  return self;
}

- (id)newCompactPayloadWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  VCMediaNegotiationBlobV2StreamGroupPayload *v12;
  VCMediaNegotiationBlobV2StreamGroupPayload *v13;
  _BYTE v15[5];
  unsigned int v16;
  char v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v16 = 0;
  v6 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", objc_msgSend(a3, "codecType"));
  v7 = v6;
  if (v6 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.1();
    }
    return 0;
  }
  v15[0] = v6;
  if (objc_msgSend(a3, "rtpPayload") >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.2();
    }
    return 0;
  }
  v15[1] = objc_msgSend(a3, "rtpPayload");
  v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagsWithPayloadConfig:", a3);
  if (v8 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.3();
    }
    return 0;
  }
  v15[2] = v8;
  v9 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationPackedRtpSampleRateWithRTPSampleRate:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationPackedRtpSampleRateWithRTPSampleRate:", v4);
  if (v9 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.4();
    }
    return 0;
  }
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.5();
    }
    return 0;
  }
  v15[3] = v9;
  v10 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", objc_msgSend(a3, "cipherSuite"));
  if (v10 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.6();
    }
    return 0;
  }
  v15[4] = v10;
  if (+[VCMediaNegotiationBlobV2StreamGroupPayload isNegotiationCodecTypeAudio:](VCMediaNegotiationBlobV2StreamGroupPayload, "isNegotiationCodecTypeAudio:", v7))
  {
    v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "mediaFlagsWithPayloadConfig:", a3);
    if (v11 >= 0x100)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.7();
      }
      return 0;
    }
    BYTE1(v16) = v11;
    if (!+[VCMediaNegotiationBlobV2StreamGroupPayload isPTimePackable:](VCMediaNegotiationBlobV2StreamGroupPayload, "isPTimePackable:", objc_msgSend(a3, "pTime")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.9();
      }
      return 0;
    }
    LOBYTE(v16) = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationPackedPTimeWithPTime:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationPackedPTimeWithPTime:", objc_msgSend(a3, "pTime"));
  }
  else
  {
    v16 = bswap32(objc_msgSend(a3, "profileLevelId"));
    v17 = objc_msgSend(a3, "encoderUsage");
  }
  v12 = objc_alloc_init(VCMediaNegotiationBlobV2StreamGroupPayload);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.8();
    }
    return 0;
  }
  v13 = v12;
  -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](v12, "setPackedPayload:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 10));
  return v13;
}

- (unsigned)rtpSampleRateWithStreamGroupID:(unsigned int)a3
{
  unsigned int v4;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", *(_QWORD *)&a3);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasPackedPayload](self, "hasPackedPayload"))
  {
    v7 = 0;
    v6 = 0;
    -[VCMediaNegotiationBlobV2StreamGroupPayload getStreamGroupPayload:](self, "getStreamGroupPayload:", &v6);
    return +[VCMediaNegotiationBlobV2StreamGroupPayload rtpSampleRateWithNegotiationPackedSampleRate:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtpSampleRateWithNegotiationPackedSampleRate:", BYTE3(v6));
  }
  else if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasRtpSampleRate](self, "hasRtpSampleRate"))
  {
    return self->_rtpSampleRate;
  }
  return v4;
}

- (id)payloadConfigurationWithStreamGroupID:(unsigned int)a3 index:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v8;
  int v9;

  v6 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", *(_QWORD *)&a3);
  if (objc_msgSend(v6, "count") > (unint64_t)a4 && (v7 = objc_msgSend(v6, "objectAtIndex:", a4)) != 0)
  {
    v8 = (VCMediaNegotiatorStreamGroupCodecConfiguration *)v7;
    v9 = 0;
  }
  else
  {
    v8 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    v9 = 1;
  }
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setSerializedSize:](v8, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasPackedPayload](self, "hasPackedPayload"))
    return -[VCMediaNegotiationBlobV2StreamGroupPayload payloadConfigurationWithPayloadConfig:](self, "payloadConfigurationWithPayloadConfig:", v8);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasCodecType](self, "hasCodecType"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v8, "setCodecType:", +[VCMediaNegotiationBlobV2StreamGroupPayload codecTypeWithNegotiationCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "codecTypeWithNegotiationCodecType:", self->_codecType));
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasRtpPayload](self, "hasRtpPayload"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v8, "setRtpPayload:", self->_rtpPayload);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasPTime](self, "hasPTime"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v8, "setPTime:", self->_pTime);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasRtcpFlags](self, "hasRtcpFlags"))
  {
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_PLIEnabled:](v8, "setRtcpPSFB_PLIEnabled:", self->_rtcpFlags & 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_FIREnabled:](v8, "setRtcpPSFB_FIREnabled:", (self->_rtcpFlags >> 1) & 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v8, "setRtcpSREnabled:", (self->_rtcpFlags >> 2) & 1);
  }
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasMediaFlags](self, "hasMediaFlags"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setUseInBandFEC:](v8, "setUseInBandFEC:", self->_mediaFlags & 1);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasProfileLevelId](self, "hasProfileLevelId"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setProfileLevelId:](v8, "setProfileLevelId:", self->_profileLevelId);
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasEncoderUsage](self, "hasEncoderUsage"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setEncoderUsage:](v8, "setEncoderUsage:", self->_encoderUsage);
  if (v9 && -[VCMediaNegotiatorStreamGroupCodecConfiguration codecType](v8, "codecType") == 100)
  {
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264LevelAsymmetryAllowed:](v8, "setH264LevelAsymmetryAllowed:", 1);
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v8, "setH264PacketizationMode:", 1);
  }
  if (-[VCMediaNegotiationBlobV2StreamGroupPayload hasCipherSuite](self, "hasCipherSuite"))
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v8, "setCipherSuite:", +[VCMediaNegotiationBlobV2StreamGroupPayload cipherSuiteWithNegotiationCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "cipherSuiteWithNegotiationCipherSuite:", self->_cipherSuite));
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setSerializedSize:](v8, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
  return v8;
}

- (id)payloadConfigurationWithPayloadConfig:(id)a3
{
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  memset(v6, 0, 10);
  -[VCMediaNegotiationBlobV2StreamGroupPayload getStreamGroupPayload:](self, "getStreamGroupPayload:", v6);
  objc_msgSend(a3, "setCodecType:", +[VCMediaNegotiationBlobV2StreamGroupPayload codecTypeWithNegotiationCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "codecTypeWithNegotiationCodecType:", LOBYTE(v6[0])));
  objc_msgSend(a3, "setRtpPayload:", BYTE1(v6[0]));
  objc_msgSend(a3, "setRtcpPSFB_PLIEnabled:", BYTE2(v6[0]) & 1);
  objc_msgSend(a3, "setRtcpPSFB_FIREnabled:", (BYTE2(v6[0]) >> 1) & 1);
  objc_msgSend(a3, "setRtcpSREnabled:", (BYTE2(v6[0]) >> 2) & 1);
  objc_msgSend(a3, "setCipherSuite:", +[VCMediaNegotiationBlobV2StreamGroupPayload cipherSuiteWithNegotiationCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "cipherSuiteWithNegotiationCipherSuite:", BYTE4(v6[0])));
  if (+[VCMediaNegotiationBlobV2StreamGroupPayload isNegotiationCodecTypeAudio:](VCMediaNegotiationBlobV2StreamGroupPayload, "isNegotiationCodecTypeAudio:", LOBYTE(v6[0])))
  {
    objc_msgSend(a3, "setPTime:", +[VCMediaNegotiationBlobV2StreamGroupPayload pTimeWithNegotiationPackedPTime:](VCMediaNegotiationBlobV2StreamGroupPayload, "pTimeWithNegotiationPackedPTime:", BYTE5(v6[0])));
    objc_msgSend(a3, "setUseInBandFEC:", BYTE6(v6[0]) & 1);
  }
  else
  {
    objc_msgSend(a3, "setProfileLevelId:", bswap32(*(unsigned int *)((char *)v6 + 5)));
    objc_msgSend(a3, "setEncoderUsage:", BYTE1(v6[1]));
    if (objc_msgSend(a3, "codecType") == 100)
    {
      objc_msgSend(a3, "setH264LevelAsymmetryAllowed:", 1);
      objc_msgSend(a3, "setH264PacketizationMode:", 1);
    }
  }
  objc_msgSend(a3, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
  return a3;
}

+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 payloadConfig:(id)a5
{
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend(a5, "serializedSize"), a4);
  objc_msgSend(v7, "appendString:", CFSTR("Payload config:"));
  if (!a5)
  {
    v10 = CFSTR(" <failed to decode>");
LABEL_19:
    objc_msgSend(v7, "appendFormat:", v10, v22);
    goto LABEL_20;
  }
  v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", objc_msgSend(a5, "codecType"));
  if (v8 >= 0xC)
    v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
  else
    v9 = off_1E9E577F0[(int)v8];
  objc_msgSend(v7, "appendFormat:", CFSTR(" CodecType=%@"), v9);
  if (objc_msgSend(a5, "rtpPayload"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" RTPPayload=%u"), objc_msgSend(a5, "rtpPayload"));
  if (objc_msgSend(a5, "pTime"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" pTime=%lu"), objc_msgSend(a5, "pTime"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" rtcpFlags=[%@]"), +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagStringWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagStringWithPayloadConfig:", a5));
  if (objc_msgSend(a5, "useInBandFEC"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" useInBandFEC=1"));
  if (objc_msgSend(a5, "profileLevelId"))
    objc_msgSend(v7, "appendFormat:", CFSTR(" profileLevelID=%lx"), objc_msgSend(a5, "profileLevelId"));
  v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", objc_msgSend(a5, "cipherSuite"));
  if ((v11 - 1) >= 4)
    v12 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
  else
    v12 = off_1E9E57850[(int)v11 - 1];
  objc_msgSend(v7, "appendFormat:", CFSTR(" cipherSuite=%@"), v12);
  if (objc_msgSend(a5, "encoderUsage"))
  {
    v22 = objc_msgSend(a5, "encoderUsage");
    v10 = CFSTR(" encoderUsage=%u");
    goto LABEL_19;
  }
LABEL_20:
  v13 = objc_msgSend(v7, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v14, v15, v16, v17, v18, v19, v13);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = v20;
      v25 = 2080;
      v26 = "+[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) printWithLogFile:prefix:payloadConfig:]";
      v27 = 1024;
      v28 = 901;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](self, "setPackedPayload:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupPayload;
  -[VCMediaNegotiationBlobV2StreamGroupPayload dealloc](&v3, sel_dealloc);
}

- (void)setCodecType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_codecType = a3;
}

- (void)setHasCodecType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCodecType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRtpPayload:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rtpPayload = a3;
}

- (void)setHasRtpPayload:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRtpPayload
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pTime = a3;
}

- (void)setHasPTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRtcpFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rtcpFlags = a3;
}

- (void)setHasRtcpFlags:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRtcpFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMediaFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mediaFlags = a3;
}

- (void)setHasMediaFlags:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMediaFlags
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setProfileLevelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_profileLevelId = a3;
}

- (void)setHasProfileLevelId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasProfileLevelId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRtpSampleRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rtpSampleRate = a3;
}

- (void)setHasRtpSampleRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRtpSampleRate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCipherSuite:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cipherSuite = a3;
}

- (void)setHasCipherSuite:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCipherSuite
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasPackedPayload
{
  return self->_packedPayload != 0;
}

- (void)setEncoderUsage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_encoderUsage = a3;
}

- (void)setHasEncoderUsage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEncoderUsage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupPayload;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2StreamGroupPayload description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupPayload dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSData *packedPayload;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_codecType), CFSTR("codecType"));
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpPayload), CFSTR("rtpPayload"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pTime), CFSTR("pTime"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtcpFlags), CFSTR("rtcpFlags"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediaFlags), CFSTR("mediaFlags"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_profileLevelId), CFSTR("profileLevelId"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSampleRate), CFSTR("rtpSampleRate"));
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cipherSuite), CFSTR("cipherSuite"));
LABEL_10:
  packedPayload = self->_packedPayload;
  if (packedPayload)
    objc_msgSend(v3, "setObject:forKey:", packedPayload, CFSTR("packedPayload"));
  if ((*(_WORD *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_encoderUsage), CFSTR("encoderUsage"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_packedPayload)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_codecType;
    *((_WORD *)a3 + 28) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_rtpPayload;
  *((_WORD *)a3 + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_pTime;
  *((_WORD *)a3 + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 11) = self->_rtcpFlags;
  *((_WORD *)a3 + 28) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_mediaFlags;
  *((_WORD *)a3 + 28) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 10) = self->_profileLevelId;
  *((_WORD *)a3 + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  *((_DWORD *)a3 + 13) = self->_rtpSampleRate;
  *((_WORD *)a3 + 28) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 2) = self->_cipherSuite;
    *((_WORD *)a3 + 28) |= 1u;
  }
LABEL_10:
  if (self->_packedPayload)
    objc_msgSend(a3, "setPackedPayload:");
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_encoderUsage;
    *((_WORD *)a3 + 28) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_codecType;
    *(_WORD *)(v5 + 56) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_rtpPayload;
  *(_WORD *)(v5 + 56) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 24) = self->_pTime;
  *(_WORD *)(v5 + 56) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 44) = self->_rtcpFlags;
  *(_WORD *)(v5 + 56) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 20) = self->_mediaFlags;
  *(_WORD *)(v5 + 56) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 40) = self->_profileLevelId;
  *(_WORD *)(v5 + 56) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  *(_DWORD *)(v5 + 52) = self->_rtpSampleRate;
  *(_WORD *)(v5 + 56) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 8) = self->_cipherSuite;
    *(_WORD *)(v5 + 56) |= 1u;
  }
LABEL_10:

  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_packedPayload, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_encoderUsage;
    *(_WORD *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSData *packedPayload;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 28);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_codecType != *((_DWORD *)a3 + 3))
        goto LABEL_49;
    }
    else if ((v7 & 2) != 0)
    {
LABEL_49:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rtpPayload != *((_DWORD *)a3 + 12))
        goto LABEL_49;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_pTime != *((_DWORD *)a3 + 6))
        goto LABEL_49;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_rtcpFlags != *((_DWORD *)a3 + 11))
        goto LABEL_49;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_mediaFlags != *((_DWORD *)a3 + 5))
        goto LABEL_49;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_profileLevelId != *((_DWORD *)a3 + 10))
        goto LABEL_49;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x100) == 0 || self->_rtpSampleRate != *((_DWORD *)a3 + 13))
        goto LABEL_49;
    }
    else if ((*((_WORD *)a3 + 28) & 0x100) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_cipherSuite != *((_DWORD *)a3 + 2))
        goto LABEL_49;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_49;
    }
    packedPayload = self->_packedPayload;
    if ((unint64_t)packedPayload | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSData isEqual:](packedPayload, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 28);
    LOBYTE(v5) = (v9 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_encoderUsage != *((_DWORD *)a3 + 4))
        goto LABEL_49;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v14 = 2654435761 * self->_codecType;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rtpPayload;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v14 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_pTime;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_rtcpFlags;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_mediaFlags;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_profileLevelId;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((has & 1) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_rtpSampleRate;
  if ((has & 1) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_cipherSuite;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
LABEL_18:
  v11 = -[NSData hash](self->_packedPayload, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_encoderUsage;
  else
    v12 = 0;
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 2) != 0)
  {
    self->_codecType = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)a3 + 28);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_rtpPayload = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_pTime = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_rtcpFlags = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_mediaFlags = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_profileLevelId = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  self->_rtpSampleRate = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 28) & 1) != 0)
  {
LABEL_9:
    self->_cipherSuite = *((_DWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_10:
  if (*((_QWORD *)a3 + 4))
    -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](self, "setPackedPayload:");
  if ((*((_WORD *)a3 + 28) & 4) != 0)
  {
    self->_encoderUsage = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 4u;
  }
}

- (unsigned)codecType
{
  return self->_codecType;
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (unsigned)pTime
{
  return self->_pTime;
}

- (unsigned)rtcpFlags
{
  return self->_rtcpFlags;
}

- (unsigned)mediaFlags
{
  return self->_mediaFlags;
}

- (unsigned)profileLevelId
{
  return self->_profileLevelId;
}

- (unsigned)rtpSampleRate
{
  return self->_rtpSampleRate;
}

- (unsigned)cipherSuite
{
  return self->_cipherSuite;
}

- (NSData)packedPayload
{
  return self->_packedPayload;
}

- (void)setPackedPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)encoderUsage
{
  return self->_encoderUsage;
}

@end
