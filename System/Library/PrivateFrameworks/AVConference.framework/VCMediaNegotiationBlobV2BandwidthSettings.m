@implementation VCMediaNegotiationBlobV2BandwidthSettings

- (VCMediaNegotiationBlobV2BandwidthSettings)initWithBandwidthConfigurations:(id)a3
{
  VCMediaNegotiationBlobV2BandwidthSettings *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[VCMediaNegotiationBlobV2BandwidthSettings init](self, "init");
  if (!v4)
    return v4;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:].cold.1();
    }
    goto LABEL_16;
  }
  v5 = +[VCMediaNegotiationBlobV2BandwidthSettings filteredSetForArbiterMode:bandwidthConfigurations:](VCMediaNegotiationBlobV2BandwidthSettings, "filteredSetForArbiterMode:bandwidthConfigurations:", 1, a3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:].cold.2();
    }
LABEL_16:

    return 0;
  }
  v6 = v5;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!-[VCMediaNegotiationBlobV2BandwidthSettings setupCapForBandwidthConfiguration:](v4, "setupCapForBandwidthConfiguration:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:].cold.3();
          }
          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
        continue;
      break;
    }
  }
  return v4;
}

- (id)bandwidthConfigurations
{
  id v3;
  void *v4;
  VCMediaNegotiatorBandwidthConfiguration *v5;
  VCMediaNegotiatorBandwidthConfiguration *v6;
  VCMediaNegotiatorBandwidthConfiguration *v7;
  VCMediaNegotiatorBandwidthConfiguration *v8;
  VCMediaNegotiatorBandwidthConfiguration *v9;
  VCMediaNegotiatorBandwidthConfiguration *v10;
  VCMediaNegotiatorBandwidthConfiguration *v11;
  VCMediaNegotiatorBandwidthConfiguration *v12;
  VCMediaNegotiatorBandwidthConfiguration *v13;
  VCMediaNegotiatorBandwidthConfiguration *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.1();
    }
    v15 = 0;
    goto LABEL_29;
  }
  v4 = v3;
  v5 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 0, -[VCMediaNegotiationBlobV2BandwidthSettings cap2G](self, "cap2G"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.2();
    }
    goto LABEL_28;
  }
  v6 = v5;
  objc_msgSend(v4, "addObject:", v5);

  v7 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 1, -[VCMediaNegotiationBlobV2BandwidthSettings cap3G](self, "cap3G"));
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.3();
    }
    goto LABEL_28;
  }
  v8 = v7;
  objc_msgSend(v4, "addObject:", v7);

  v9 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 2, -[VCMediaNegotiationBlobV2BandwidthSettings capLTE](self, "capLTE"));
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.4();
    }
    goto LABEL_28;
  }
  v10 = v9;
  objc_msgSend(v4, "addObject:", v9);

  v11 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 6, -[VCMediaNegotiationBlobV2BandwidthSettings cap5G](self, "cap5G"));
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.5();
    }
    goto LABEL_28;
  }
  v12 = v11;
  objc_msgSend(v4, "addObject:", v11);

  v13 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", 3, -[VCMediaNegotiationBlobV2BandwidthSettings capWifi](self, "capWifi"));
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.6();
    }
LABEL_28:
    v15 = v4;
LABEL_29:
    v4 = 0;
    goto LABEL_8;
  }
  v14 = v13;
  objc_msgSend(v4, "addObject:", v13);

  v15 = 0;
LABEL_8:

  return v4;
}

- (BOOL)isDefaultSettings
{
  VCMediaNegotiationBlobV2BandwidthSettings *v3;

  v3 = objc_alloc_init(VCMediaNegotiationBlobV2BandwidthSettings);
  LOBYTE(self) = -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2BandwidthSettings data](self, "data"), "length"), a4);
  objc_msgSend(v6, "appendFormat:", CFSTR("BandwidthSettings: 2G=%u 3G=%u LTE=%u 5G=%u Wifi=%u"), -[VCMediaNegotiationBlobV2BandwidthSettings cap2G](self, "cap2G"), -[VCMediaNegotiationBlobV2BandwidthSettings cap3G](self, "cap3G"), -[VCMediaNegotiationBlobV2BandwidthSettings capLTE](self, "capLTE"), -[VCMediaNegotiationBlobV2BandwidthSettings cap5G](self, "cap5G"), -[VCMediaNegotiationBlobV2BandwidthSettings capWifi](self, "capWifi"));
  v7 = objc_msgSend(v6, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v14;
      v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2BandwidthSettings(Utils) printWithLogFile:prefix:]";
      v20 = 1024;
      v21 = 90;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

- (void)setupCap2G:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCMediaNegotiationBlobV2BandwidthSettings cap2G](self, "cap2G") != a3)
    -[VCMediaNegotiationBlobV2BandwidthSettings setCap2G:](self, "setCap2G:", v3);
}

- (void)setupCap3G:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCMediaNegotiationBlobV2BandwidthSettings cap3G](self, "cap3G") != a3)
    -[VCMediaNegotiationBlobV2BandwidthSettings setCap3G:](self, "setCap3G:", v3);
}

- (void)setupCapLTE:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCMediaNegotiationBlobV2BandwidthSettings capLTE](self, "capLTE") != a3)
    -[VCMediaNegotiationBlobV2BandwidthSettings setCapLTE:](self, "setCapLTE:", v3);
}

- (void)setupCap5G:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCMediaNegotiationBlobV2BandwidthSettings cap5G](self, "cap5G") != a3)
    -[VCMediaNegotiationBlobV2BandwidthSettings setCap5G:](self, "setCap5G:", v3);
}

- (void)setupCapWifi:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCMediaNegotiationBlobV2BandwidthSettings capWifi](self, "capWifi") != a3)
    -[VCMediaNegotiationBlobV2BandwidthSettings setCapWifi:](self, "setCapWifi:", v3);
}

+ (id)filteredSetForArbiterMode:(unsigned __int8)a3 bandwidthConfigurations:(id)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "connectionType"));
        if (objc_msgSend(v11, "isDefaultMode") && !objc_msgSend(v6, "objectForKeyedSubscript:", v12)
          || objc_msgSend(v11, "mode") == v5)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);
        }
      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(v6, "allValues"));
}

- (BOOL)setupCapForBandwidthConfiguration:(id)a3
{
  BOOL result;

  switch(objc_msgSend(a3, "connectionType"))
  {
    case 0u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap2G:](self, "setupCap2G:", objc_msgSend(a3, "maxBandwidth"));
      goto LABEL_8;
    case 1u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap3G:](self, "setupCap3G:", objc_msgSend(a3, "maxBandwidth"));
      goto LABEL_8;
    case 2u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCapLTE:](self, "setupCapLTE:", objc_msgSend(a3, "maxBandwidth"));
      goto LABEL_8;
    case 3u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCapWifi:](self, "setupCapWifi:", objc_msgSend(a3, "maxBandwidth"));
      goto LABEL_8;
    case 4u:
    case 5u:
      goto LABEL_8;
    case 6u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap5G:](self, "setupCap5G:", objc_msgSend(a3, "maxBandwidth"));
LABEL_8:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unsigned)cap2G
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cap2G;
  else
    return 100;
}

- (void)setCap2G:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cap2G = a3;
}

- (void)setHasCap2G:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCap2G
{
  return *(_BYTE *)&self->_has & 1;
}

- (unsigned)cap3G
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cap3G;
  else
    return 228;
}

- (void)setCap3G:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cap3G = a3;
}

- (void)setHasCap3G:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCap3G
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unsigned)capLTE
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_capLTE;
  else
    return 600;
}

- (void)setCapLTE:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_capLTE = a3;
}

- (void)setHasCapLTE:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCapLTE
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (unsigned)cap5G
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_cap5G;
  else
    return 2000;
}

- (void)setCap5G:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cap5G = a3;
}

- (void)setHasCap5G:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCap5G
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unsigned)capWifi
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_capWifi;
  else
    return 4100;
}

- (void)setCapWifi:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_capWifi = a3;
}

- (void)setHasCapWifi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCapWifi
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2BandwidthSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2BandwidthSettings description](&v3, sel_description), -[VCMediaNegotiationBlobV2BandwidthSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cap2G), CFSTR("cap2G"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cap3G), CFSTR("cap3G"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cap5G), CFSTR("cap5G"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capLTE), CFSTR("capLTE"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capWifi), CFSTR("capWifi"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2BandwidthSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_cap2G;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_cap3G;
  *((_BYTE *)a3 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 5) = self->_capLTE;
  *((_BYTE *)a3 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 6) = self->_capWifi;
    *((_BYTE *)a3 + 28) |= 0x10u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_cap5G;
  *((_BYTE *)a3 + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_cap2G;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_cap3G;
  *((_BYTE *)result + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_capLTE;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_cap5G;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 6) = self->_capWifi;
  *((_BYTE *)result + 28) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_cap2G != *((_DWORD *)a3 + 2))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_cap3G != *((_DWORD *)a3 + 3))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 8) == 0 || self->_capLTE != *((_DWORD *)a3 + 5))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 28) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_cap5G != *((_DWORD *)a3 + 4))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 28) & 4) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 0x10) == 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 0x10) == 0 || self->_capWifi != *((_DWORD *)a3 + 6))
        goto LABEL_26;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_cap2G;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_cap3G;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_capLTE;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_cap5G;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_capWifi;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_cap2G = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cap3G = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_capLTE = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      return;
LABEL_11:
    self->_capWifi = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_10:
  self->_cap5G = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 28) & 0x10) != 0)
    goto LABEL_11;
}

@end
