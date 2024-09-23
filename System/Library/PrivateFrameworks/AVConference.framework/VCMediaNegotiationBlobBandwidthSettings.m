@implementation VCMediaNegotiationBlobBandwidthSettings

- (id)configurationAsString:(int)a3
{
  id result;

  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512)
          return CFSTR("mode_FaceTime_2G");
        if (a3 == 1024)
          return CFSTR("mode_Screen_2G");
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            return CFSTR("mode_Default_2G");
          case 0x1000:
            return CFSTR("mode_iPadCompanion_AWDL");
          case 0x2000:
            return CFSTR("mode_iPadCompanion_USB");
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          return CFSTR("mode_MultiwayScreen_Wifi");
        case 0x40000:
          return CFSTR("mode_LowLatencyScreen_Wired");
        case 0x7FFFF:
          return CFSTR("mode_SUPPORTED");
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          return CFSTR("mode_FaceTime_5G");
        case 0x8000:
          return CFSTR("mode_RemoteCamera_AWDL");
        case 0x10000:
          return CFSTR("mode_RemoteCamera_USB");
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("mode_Screen_Wifi");
      if (a3 == 32)
        return CFSTR("mode_Screen_LTE");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("mode_FaceTime_3G");
        case 128:
          return CFSTR("mode_Screen_3G");
        case 256:
          return CFSTR("mode_Default_3G");
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  result = CFSTR("mode_Invalid");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("mode_Default_Wifi");
      break;
    case 2:
      result = CFSTR("mode_Default_LTE");
      break;
    case 4:
      result = CFSTR("mode_FaceTime_Wifi");
      break;
    case 8:
      result = CFSTR("mode_FaceTime_LTE");
      break;
    default:
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  return result;
}

- (int)StringAsConfiguration:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Invalid")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_Wifi")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_LTE")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_Wifi")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_LTE")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_Wifi")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_LTE")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_3G")) & 1) != 0)
    return 64;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_3G")) & 1) != 0)
    return 128;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_3G")) & 1) != 0)
    return 256;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_2G")) & 1) != 0)
    return 512;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_2G")) & 1) != 0)
    return 1024;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_2G")) & 1) != 0)
    return 2048;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_iPadCompanion_AWDL")) & 1) != 0)
    return 4096;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_iPadCompanion_USB")) & 1) != 0)
    return 0x2000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_5G")) & 1) != 0)
    return 0x4000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_RemoteCamera_AWDL")) & 1) != 0)
    return 0x8000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_RemoteCamera_USB")) & 1) != 0)
    return 0x10000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_MultiwayScreen_Wifi")) & 1) != 0)
    return 0x20000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_LowLatencyScreen_Wired")) & 1) != 0)
    return 0x40000;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("mode_SUPPORTED")))
    return 0x7FFFF;
  return 0;
}

- (int)configurationExtension
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_configurationExtension;
  else
    return 0;
}

- (void)setConfigurationExtension:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_configurationExtension = a3;
}

- (void)setHasConfigurationExtension:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfigurationExtension
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)configurationExtensionAsString:(int)a3
{
  id result;

  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512)
          return CFSTR("mode_FaceTime_2G");
        if (a3 == 1024)
          return CFSTR("mode_Screen_2G");
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            return CFSTR("mode_Default_2G");
          case 0x1000:
            return CFSTR("mode_iPadCompanion_AWDL");
          case 0x2000:
            return CFSTR("mode_iPadCompanion_USB");
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          return CFSTR("mode_MultiwayScreen_Wifi");
        case 0x40000:
          return CFSTR("mode_LowLatencyScreen_Wired");
        case 0x7FFFF:
          return CFSTR("mode_SUPPORTED");
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          return CFSTR("mode_FaceTime_5G");
        case 0x8000:
          return CFSTR("mode_RemoteCamera_AWDL");
        case 0x10000:
          return CFSTR("mode_RemoteCamera_USB");
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("mode_Screen_Wifi");
      if (a3 == 32)
        return CFSTR("mode_Screen_LTE");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("mode_FaceTime_3G");
        case 128:
          return CFSTR("mode_Screen_3G");
        case 256:
          return CFSTR("mode_Default_3G");
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  result = CFSTR("mode_Invalid");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("mode_Default_Wifi");
      break;
    case 2:
      result = CFSTR("mode_Default_LTE");
      break;
    case 4:
      result = CFSTR("mode_FaceTime_Wifi");
      break;
    case 8:
      result = CFSTR("mode_FaceTime_LTE");
      break;
    default:
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  return result;
}

- (int)StringAsConfigurationExtension:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Invalid")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_Wifi")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_LTE")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_Wifi")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_LTE")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_Wifi")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_LTE")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_3G")) & 1) != 0)
    return 64;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_3G")) & 1) != 0)
    return 128;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_3G")) & 1) != 0)
    return 256;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_2G")) & 1) != 0)
    return 512;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Screen_2G")) & 1) != 0)
    return 1024;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_Default_2G")) & 1) != 0)
    return 2048;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_iPadCompanion_AWDL")) & 1) != 0)
    return 4096;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_iPadCompanion_USB")) & 1) != 0)
    return 0x2000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_FaceTime_5G")) & 1) != 0)
    return 0x4000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_RemoteCamera_AWDL")) & 1) != 0)
    return 0x8000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_RemoteCamera_USB")) & 1) != 0)
    return 0x10000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_MultiwayScreen_Wifi")) & 1) != 0)
    return 0x20000;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("mode_LowLatencyScreen_Wired")) & 1) != 0)
    return 0x40000;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("mode_SUPPORTED")))
    return 0x7FFFF;
  return 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobBandwidthSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobBandwidthSettings description](&v3, sel_description), -[VCMediaNegotiationBlobBandwidthSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  int configuration;
  const __CFString *v5;
  int configurationExtension;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  configuration = self->_configuration;
  if (configuration > 511)
  {
    if (configuration < 0x4000)
    {
      if (configuration <= 2047)
      {
        if (configuration == 512)
        {
          v5 = CFSTR("mode_FaceTime_2G");
          goto LABEL_45;
        }
        if (configuration == 1024)
        {
          v5 = CFSTR("mode_Screen_2G");
          goto LABEL_45;
        }
      }
      else
      {
        switch(configuration)
        {
          case 0x800:
            v5 = CFSTR("mode_Default_2G");
            goto LABEL_45;
          case 0x1000:
            v5 = CFSTR("mode_iPadCompanion_AWDL");
            goto LABEL_45;
          case 0x2000:
            v5 = CFSTR("mode_iPadCompanion_USB");
            goto LABEL_45;
        }
      }
    }
    else if (configuration >= 0x20000)
    {
      switch(configuration)
      {
        case 0x20000:
          v5 = CFSTR("mode_MultiwayScreen_Wifi");
          goto LABEL_45;
        case 0x40000:
          v5 = CFSTR("mode_LowLatencyScreen_Wired");
          goto LABEL_45;
        case 0x7FFFF:
          v5 = CFSTR("mode_SUPPORTED");
          goto LABEL_45;
      }
    }
    else
    {
      switch(configuration)
      {
        case 0x4000:
          v5 = CFSTR("mode_FaceTime_5G");
          goto LABEL_45;
        case 0x8000:
          v5 = CFSTR("mode_RemoteCamera_AWDL");
          goto LABEL_45;
        case 0x10000:
          v5 = CFSTR("mode_RemoteCamera_USB");
          goto LABEL_45;
      }
    }
LABEL_44:
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_configuration);
    goto LABEL_45;
  }
  if (configuration > 15)
  {
    if (configuration <= 63)
    {
      if (configuration == 16)
      {
        v5 = CFSTR("mode_Screen_Wifi");
        goto LABEL_45;
      }
      if (configuration == 32)
      {
        v5 = CFSTR("mode_Screen_LTE");
        goto LABEL_45;
      }
    }
    else
    {
      switch(configuration)
      {
        case 64:
          v5 = CFSTR("mode_FaceTime_3G");
          goto LABEL_45;
        case 128:
          v5 = CFSTR("mode_Screen_3G");
          goto LABEL_45;
        case 256:
          v5 = CFSTR("mode_Default_3G");
          goto LABEL_45;
      }
    }
    goto LABEL_44;
  }
  v5 = CFSTR("mode_Invalid");
  switch(configuration)
  {
    case 0:
      break;
    case 1:
      v5 = CFSTR("mode_Default_Wifi");
      break;
    case 2:
      v5 = CFSTR("mode_Default_LTE");
      break;
    case 4:
      v5 = CFSTR("mode_FaceTime_Wifi");
      break;
    case 8:
      v5 = CFSTR("mode_FaceTime_LTE");
      break;
    default:
      goto LABEL_44;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("configuration"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxBandwidth), CFSTR("maxBandwidth"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    configurationExtension = self->_configurationExtension;
    if (configurationExtension <= 511)
    {
      if (configurationExtension <= 15)
      {
        v7 = CFSTR("mode_Invalid");
        switch(configurationExtension)
        {
          case 0:
            goto LABEL_90;
          case 1:
            v7 = CFSTR("mode_Default_Wifi");
            break;
          case 2:
            v7 = CFSTR("mode_Default_LTE");
            break;
          case 4:
            v7 = CFSTR("mode_FaceTime_Wifi");
            break;
          case 8:
            v7 = CFSTR("mode_FaceTime_LTE");
            break;
          default:
            goto LABEL_89;
        }
        goto LABEL_90;
      }
      if (configurationExtension <= 63)
      {
        if (configurationExtension == 16)
        {
          v7 = CFSTR("mode_Screen_Wifi");
          goto LABEL_90;
        }
        if (configurationExtension == 32)
        {
          v7 = CFSTR("mode_Screen_LTE");
          goto LABEL_90;
        }
      }
      else
      {
        switch(configurationExtension)
        {
          case 64:
            v7 = CFSTR("mode_FaceTime_3G");
            goto LABEL_90;
          case 128:
            v7 = CFSTR("mode_Screen_3G");
            goto LABEL_90;
          case 256:
            v7 = CFSTR("mode_Default_3G");
            goto LABEL_90;
        }
      }
    }
    else if (configurationExtension < 0x4000)
    {
      if (configurationExtension <= 2047)
      {
        if (configurationExtension == 512)
        {
          v7 = CFSTR("mode_FaceTime_2G");
          goto LABEL_90;
        }
        if (configurationExtension == 1024)
        {
          v7 = CFSTR("mode_Screen_2G");
          goto LABEL_90;
        }
      }
      else
      {
        switch(configurationExtension)
        {
          case 0x800:
            v7 = CFSTR("mode_Default_2G");
            goto LABEL_90;
          case 0x1000:
            v7 = CFSTR("mode_iPadCompanion_AWDL");
            goto LABEL_90;
          case 0x2000:
            v7 = CFSTR("mode_iPadCompanion_USB");
            goto LABEL_90;
        }
      }
    }
    else if (configurationExtension >= 0x20000)
    {
      switch(configurationExtension)
      {
        case 0x20000:
          v7 = CFSTR("mode_MultiwayScreen_Wifi");
          goto LABEL_90;
        case 0x40000:
          v7 = CFSTR("mode_LowLatencyScreen_Wired");
          goto LABEL_90;
        case 0x7FFFF:
          v7 = CFSTR("mode_SUPPORTED");
          goto LABEL_90;
      }
    }
    else
    {
      switch(configurationExtension)
      {
        case 0x4000:
          v7 = CFSTR("mode_FaceTime_5G");
          goto LABEL_90;
        case 0x8000:
          v7 = CFSTR("mode_RemoteCamera_AWDL");
          goto LABEL_90;
        case 0x10000:
          v7 = CFSTR("mode_RemoteCamera_USB");
LABEL_90:
          objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("configurationExtension"));
          return v3;
      }
    }
LABEL_89:
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_configurationExtension);
    goto LABEL_90;
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobBandwidthSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_configuration;
  *((_DWORD *)a3 + 4) = self->_maxBandwidth;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_configurationExtension;
    *((_BYTE *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_configuration;
  *((_DWORD *)result + 4) = self->_maxBandwidth;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_configurationExtension;
    *((_BYTE *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_configuration != *((_DWORD *)a3 + 2) || self->_maxBandwidth != *((_DWORD *)a3 + 4))
      goto LABEL_8;
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) != 0 && self->_configurationExtension == *((_DWORD *)a3 + 3))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_8:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_configurationExtension;
  else
    v2 = 0;
  return (2654435761 * self->_maxBandwidth) ^ v2 ^ (2654435761 * self->_configuration);
}

- (void)mergeFrom:(id)a3
{
  self->_configuration = *((_DWORD *)a3 + 2);
  self->_maxBandwidth = *((_DWORD *)a3 + 4);
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_configurationExtension = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (int)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(int)a3
{
  self->_configuration = a3;
}

- (unsigned)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->_maxBandwidth = a3;
}

+ (int)bandwidthConfigurationFor2GWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 < 8u)
    return dword_1D910FB70[(char)a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor2GWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationFor3GWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 < 8u)
    return dword_1D910FB90[(char)a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor3GWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationForLTEWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 < 8u)
    return dword_1D910FBB0[(char)a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForLTEWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationFor5GWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 == 1)
    return 0x4000;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor5GWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationForWiFiWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 < 8u)
    return dword_1D910FBD0[(char)a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForWiFiWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationForAWDLWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if ((a3 - 4) < 3)
    return dword_1D910FBF0[(char)(a3 - 4)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForAWDLWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationForUSBWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if ((a3 - 4) < 3)
    return dword_1D910FBFC[(char)(a3 - 4)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForUSBWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationForWiredWithArbiterMode:(unsigned __int8)a3
{
  int result;

  if (a3 == 5)
    return 0x40000;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForWiredWithArbiterMode:].cold.1();
  }
  return 0;
}

+ (int)bandwidthConfigurationWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5;
  int result;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 0:
      result = objc_msgSend(a1, "bandwidthConfigurationFor2GWithArbiterMode:", a3);
      break;
    case 1:
      result = objc_msgSend(a1, "bandwidthConfigurationFor3GWithArbiterMode:", a3);
      break;
    case 2:
      result = objc_msgSend(a1, "bandwidthConfigurationForLTEWithArbiterMode:", a3);
      break;
    case 3:
      result = objc_msgSend(a1, "bandwidthConfigurationForWiFiWithArbiterMode:", a3);
      break;
    case 4:
      result = objc_msgSend(a1, "bandwidthConfigurationForAWDLWithArbiterMode:", a3);
      break;
    case 5:
      result = objc_msgSend(a1, "bandwidthConfigurationForUSBWithArbiterMode:", a3);
      break;
    case 6:
      result = objc_msgSend(a1, "bandwidthConfigurationFor5GWithArbiterMode:", a3);
      break;
    case 7:
      result = objc_msgSend(a1, "bandwidthConfigurationForWiredWithArbiterMode:", a3);
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = 136316162;
          v10 = v7;
          v11 = 2080;
          v12 = "+[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationWithArbiterMode:connectionType:]";
          v13 = 1024;
          v14 = 1172;
          v15 = 1024;
          v16 = a4;
          v17 = 1024;
          v18 = v5;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid bandwidth configuration: connection type=%d, arbiterMode=%hhu", (uint8_t *)&v9, 0x28u);
        }
      }
      result = 0;
      break;
  }
  return result;
}

- (id)newBandwidthConfigurations
{
  id v3;
  int configuration;
  VCMediaNegotiatorBandwidthConfiguration *v5;
  int configurationExtension;
  VCMediaNegotiatorBandwidthConfiguration *v7;
  VCMediaNegotiatorBandwidthConfiguration *v9;
  VCMediaNegotiatorBandwidthConfiguration *v10;
  VCMediaNegotiatorBandwidthConfiguration *v11;
  VCMediaNegotiatorBandwidthConfiguration *v12;
  VCMediaNegotiatorBandwidthConfiguration *v13;
  VCMediaNegotiatorBandwidthConfiguration *v14;
  VCMediaNegotiatorBandwidthConfiguration *v15;
  VCMediaNegotiatorBandwidthConfiguration *v16;
  VCMediaNegotiatorBandwidthConfiguration *v17;
  VCMediaNegotiatorBandwidthConfiguration *v18;
  VCMediaNegotiatorBandwidthConfiguration *v19;
  VCMediaNegotiatorBandwidthConfiguration *v20;
  VCMediaNegotiatorBandwidthConfiguration *v21;
  VCMediaNegotiatorBandwidthConfiguration *v22;
  VCMediaNegotiatorBandwidthConfiguration *v23;
  VCMediaNegotiatorBandwidthConfiguration *v24;
  VCMediaNegotiatorBandwidthConfiguration *v25;
  VCMediaNegotiatorBandwidthConfiguration *v26;
  VCMediaNegotiatorBandwidthConfiguration *v27;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  configuration = self->_configuration;
  if ((configuration & 1) != 0)
  {
    v9 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 3, self->_maxBandwidth);
    objc_msgSend(v3, "addObject:", v9);

    configuration = self->_configuration;
    if ((configuration & 2) == 0)
    {
LABEL_3:
      if ((configuration & 4) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((configuration & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 2, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v10);

  configuration = self->_configuration;
  if ((configuration & 4) == 0)
  {
LABEL_4:
    if ((configuration & 8) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  v11 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 3, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v11);

  configuration = self->_configuration;
  if ((configuration & 8) == 0)
  {
LABEL_5:
    if ((configuration & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  v12 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 2, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v12);

  configuration = self->_configuration;
  if ((configuration & 0x10) == 0)
  {
LABEL_6:
    if ((configuration & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  v13 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 3, 3, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v13);

  configuration = self->_configuration;
  if ((configuration & 0x20) == 0)
  {
LABEL_7:
    if ((configuration & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  v14 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 3, 2, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v14);

  configuration = self->_configuration;
  if ((configuration & 0x40) == 0)
  {
LABEL_8:
    if ((configuration & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  v15 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 1, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v15);

  configuration = self->_configuration;
  if ((configuration & 0x80) == 0)
  {
LABEL_9:
    if ((configuration & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  v16 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 3, 1, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v16);

  configuration = self->_configuration;
  if ((configuration & 0x100) == 0)
  {
LABEL_10:
    if ((configuration & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  v17 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 1, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v17);

  configuration = self->_configuration;
  if ((configuration & 0x200) == 0)
  {
LABEL_11:
    if ((configuration & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  v18 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 0, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v18);

  configuration = self->_configuration;
  if ((configuration & 0x400) == 0)
  {
LABEL_12:
    if ((configuration & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_35:
  v19 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 3, 0, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v19);

  if ((self->_configuration & 0x800) != 0)
  {
LABEL_13:
    v5 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 0, self->_maxBandwidth);
    objc_msgSend(v3, "addObject:", v5);

  }
LABEL_14:
  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x1000) != 0)
  {
    v20 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 4, 4, self->_maxBandwidth);
    objc_msgSend(v3, "addObject:", v20);

    configurationExtension = self->_configurationExtension;
    if ((configurationExtension & 0x2000) == 0)
    {
LABEL_16:
      if ((configurationExtension & 0x4000) == 0)
        goto LABEL_17;
      goto LABEL_39;
    }
  }
  else if ((configurationExtension & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  v21 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 4, 5, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v21);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x4000) == 0)
  {
LABEL_17:
    if ((configurationExtension & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v22 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 6, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v22);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x1000) == 0)
  {
LABEL_18:
    if ((configurationExtension & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v23 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 5, 4, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v23);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x2000) == 0)
  {
LABEL_19:
    if ((configurationExtension & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v24 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 5, 5, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v24);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x8000) == 0)
  {
LABEL_20:
    if ((configurationExtension & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  v25 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 6, 4, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v25);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x10000) == 0)
  {
LABEL_21:
    if ((configurationExtension & 0x20000) == 0)
      goto LABEL_22;
LABEL_44:
    v27 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 7, 3, self->_maxBandwidth);
    objc_msgSend(v3, "addObject:", v27);

    if ((self->_configurationExtension & 0x40000) == 0)
      return v3;
    goto LABEL_23;
  }
LABEL_43:
  v26 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 6, 5, self->_maxBandwidth);
  objc_msgSend(v3, "addObject:", v26);

  configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x20000) != 0)
    goto LABEL_44;
LABEL_22:
  if ((configurationExtension & 0x40000) != 0)
  {
LABEL_23:
    v7 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 5, 7, self->_maxBandwidth);
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

@end
