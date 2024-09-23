@implementation VCMediaNegotiationBlobV2SettingsU1

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2SettingsU1 setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2SettingsU1;
  -[VCMediaNegotiationBlobV2SettingsU1 dealloc](&v3, sel_dealloc);
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRtpSSRC
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearEncodeDecodeFeatures
{
  -[NSMutableArray removeAllObjects](self->_encodeDecodeFeatures, "removeAllObjects");
}

- (void)addEncodeDecodeFeatures:(id)a3
{
  NSMutableArray *encodeDecodeFeatures;

  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (!encodeDecodeFeatures)
  {
    encodeDecodeFeatures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_encodeDecodeFeatures = encodeDecodeFeatures;
  }
  -[NSMutableArray addObject:](encodeDecodeFeatures, "addObject:", a3);
}

- (unint64_t)encodeDecodeFeaturesCount
{
  return -[NSMutableArray count](self->_encodeDecodeFeatures, "count");
}

- (id)encodeDecodeFeaturesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_encodeDecodeFeatures, "objectAtIndex:", a3);
}

+ (Class)encodeDecodeFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2SettingsU1;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2SettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2SettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *encodeDecodeFeatures;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  if (-[NSMutableArray count](self->_encodeDecodeFeatures, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_encodeDecodeFeatures, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(encodeDecodeFeatures);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("encodeDecodeFeatures"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2SettingsU1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *encodeDecodeFeatures;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(encodeDecodeFeatures);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_rtpSSRC;
    *((_BYTE *)a3 + 20) |= 1u;
  }
  if (-[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeaturesCount](self, "encodeDecodeFeaturesCount"))
  {
    objc_msgSend(a3, "clearEncodeDecodeFeatures");
    v5 = -[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeaturesCount](self, "encodeDecodeFeaturesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addEncodeDecodeFeatures:", -[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeaturesAtIndex:](self, "encodeDecodeFeaturesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *encodeDecodeFeatures;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_rtpSSRC;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(encodeDecodeFeatures);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addEncodeDecodeFeatures:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](encodeDecodeFeatures, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *encodeDecodeFeatures;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 4))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    if ((unint64_t)encodeDecodeFeatures | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSMutableArray isEqual:](encodeDecodeFeatures, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_rtpSSRC;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_encodeDecodeFeatures, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)*((_QWORD *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[VCMediaNegotiationBlobV2SettingsU1 addEncodeDecodeFeatures:](self, "addEncodeDecodeFeatures:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (NSMutableArray)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (VCMediaNegotiationBlobV2SettingsU1)initWithU1Config:(id)a3
{
  VCMediaNegotiationBlobV2SettingsU1 *v4;

  v4 = -[VCMediaNegotiationBlobV2SettingsU1 init](self, "init");
  if (v4)
  {
    if (a3)
    {
      -[VCMediaNegotiationBlobV2SettingsU1 setRtpSSRC:](v4, "setRtpSSRC:", objc_msgSend(a3, "ssrc"));
      if (-[VCMediaNegotiationBlobV2SettingsU1 loadEncodeDecodeFeatures:](v4, "loadEncodeDecodeFeatures:", a3))
        return v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2SettingsU1(Utils) initWithU1Config:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2SettingsU1(Utils) initWithU1Config:].cold.1();
    }

    return 0;
  }
  return v4;
}

- (id)u1Config
{
  VCMediaNegotiatorStreamGroupU1Configuration *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupU1Configuration);
  -[VCMediaNegotiatorStreamGroupU1Configuration setSupportedDirection:](v3, "setSupportedDirection:", 3);
  if (-[VCMediaNegotiationBlobV2SettingsU1 hasRtpSSRC](self, "hasRtpSSRC"))
    -[VCMediaNegotiatorStreamGroupU1Configuration setSsrc:](v3, "setSsrc:", -[VCMediaNegotiationBlobV2SettingsU1 rtpSSRC](self, "rtpSSRC"));
  if (-[NSMutableArray count](-[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeatures](self, "encodeDecodeFeatures"), "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = -[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeatures](self, "encodeDecodeFeatures");
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "encodeDecodeFeatures");
          v11 = (void *)VCPCreateDecompressedFLS();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "rtpPayload")));

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
    -[VCMediaNegotiatorStreamGroupU1Configuration setVideoFeatureStringsFixedPosition:](v3, "setVideoFeatureStringsFixedPosition:", v4);

  }
  return v3;
}

- (BOOL)loadEncodeDecodeFeatures:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "videoFeatureStringsFixedPosition");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8);
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)VCPCreateCompressedFLS();
      v11 = -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures initWithPayload:encodeDecodeFeatures:]([VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures alloc], "initWithPayload:encodeDecodeFeatures:", v9, v10);

      if (!v11)
        break;
      -[VCMediaNegotiationBlobV2SettingsU1 addEncodeDecodeFeatures:](self, "addEncodeDecodeFeatures:", v11);

      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      v16 = 136316162;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2SettingsU1(Utils) loadEncodeDecodeFeatures:]";
      v20 = 1024;
      v21 = 79;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create encodeDecodeFeaturesBlob for rtpPayload=%@, FLS=%@", (uint8_t *)&v16, 0x30u);
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

+ (id)mediaStreamCipherSuitesFromNegotiationCipherSuites:(int)a3
{
  void *v5;
  uint64_t v6;
  int v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  if (a3)
  {
    v6 = 1;
    do
    {
      if ((v6 & a3) != 0)
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "mediaStreamCipherSuiteFromNegotiationCipherSuite:", v6)));
      a3 &= ~(_DWORD)v6;
      if (!a3)
        break;
      v7 = v6 & 3;
      v6 = (2 * v6);
    }
    while (v7);
  }
  return v5;
}

+ (int64_t)mediaStreamCipherSuiteFromNegotiationCipherSuite:(int)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 == 2)
    v3 = 8;
  if (a3 == 4)
    return 9;
  else
    return v3;
}

+ (int)negotiationCipherSuiteFromMediaStreamCipherSuite:(int64_t)a3
{
  int result;

  result = 1;
  switch(a3)
  {
    case -1:
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
    case 6:
    case 7:
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (result)
      {
        +[VCMediaNegotiationBlobV2SettingsU1(Utils) negotiationCipherSuiteFromMediaStreamCipherSuite:].cold.1();
        goto LABEL_5;
      }
      break;
    case 3:
      return result;
    case 8:
      result = 2;
      break;
    case 9:
      result = 4;
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

+ (int)negotiationCipherSuitesFromMediaStreamCipherSuites:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a3);
      v7 |= objc_msgSend(a1, "negotiationCipherSuiteFromMediaStreamCipherSuite:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "integerValue"));
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  }
  while (v6);
  return v7;
}

+ (id)appendCipherSuiteFlags:(unsigned int)a3 toDescription:(id)a4
{
  unsigned int v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  __CFString *v9;
  int v10;

  v5 = a3;
  objc_msgSend(a4, "appendFormat:", CFSTR("cipherSuites=0x%x ["), *(_QWORD *)&a3);
  if (v5)
  {
    v6 = CFSTR("%@");
    v7 = 1;
    do
    {
      if ((v7 & v5) != 0)
      {
        v8 = v7 - 1;
        if ((v7 - 1) < 7 && ((0x4Bu >> v8) & 1) != 0)
          v9 = off_1E9E572B8[v8];
        else
          v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
        objc_msgSend(a4, "appendFormat:", v6, v9);
        v6 = CFSTR(",%@");
      }
      v5 &= ~(_DWORD)v7;
      if (!v5)
        break;
      v10 = v7 & 3;
      v7 = (2 * v7);
    }
    while (v10);
  }
  objc_msgSend(a4, "appendString:", CFSTR("]"));
  return a4;
}

@end
