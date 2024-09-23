@implementation VCMediaNegotiationBlobV2GeneralInfo

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2GeneralInfo setCname:](self, "setCname:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2GeneralInfo;
  -[VCMediaNegotiationBlobV2GeneralInfo dealloc](&v3, sel_dealloc);
}

- (void)setNtpTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ntpTime = a3;
}

- (void)setHasNtpTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNtpTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCname
{
  return self->_cname != 0;
}

- (unsigned)abSwitches
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_abSwitches;
  else
    return 0;
}

- (void)setAbSwitches:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_abSwitches = a3;
}

- (void)setHasAbSwitches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAbSwitches
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScreenRes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_screenRes = a3;
}

- (void)setHasScreenRes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScreenRes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2GeneralInfo;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2GeneralInfo description](&v3, sel_description), -[VCMediaNegotiationBlobV2GeneralInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *cname;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_ntpTime), CFSTR("ntpTime"));
  cname = self->_cname;
  if (cname)
    objc_msgSend(v3, "setObject:forKey:", cname, CFSTR("cname"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_abSwitches), CFSTR("abSwitches"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_screenRes), CFSTR("screenRes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2GeneralInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_cname)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_ntpTime;
    *((_BYTE *)a3 + 36) |= 1u;
  }
  if (self->_cname)
    objc_msgSend(a3, "setCname:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_abSwitches;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_screenRes;
    *((_BYTE *)a3 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_ntpTime;
    *(_BYTE *)(v5 + 36) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_cname, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_abSwitches;
    *(_BYTE *)(v6 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_screenRes;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *cname;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_ntpTime != *((_QWORD *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    cname = self->_cname;
    if ((unint64_t)cname | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSString isEqual:](cname, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_abSwitches != *((_DWORD *)a3 + 4))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_screenRes != *((_DWORD *)a3 + 8))
        goto LABEL_19;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_ntpTime;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_cname, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_abSwitches;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_screenRes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_ntpTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[VCMediaNegotiationBlobV2GeneralInfo setCname:](self, "setCname:");
  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_abSwitches = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 4) != 0)
  {
    self->_screenRes = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)ntpTime
{
  return self->_ntpTime;
}

- (NSString)cname
{
  return self->_cname;
}

- (void)setCname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)screenRes
{
  return self->_screenRes;
}

- (VCMediaNegotiationBlobV2GeneralInfo)initWithCreationTime:(tagNTP)a3 screenResolution:(CGSize)a4 abSwitches:(unsigned int)a5
{
  uint64_t v5;
  double height;
  double width;
  VCMediaNegotiationBlobV2GeneralInfo *v9;
  VCMediaNegotiationBlobV2GeneralInfo *v10;
  unsigned int v11;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = -[VCMediaNegotiationBlobV2GeneralInfo init](self, "init");
  v10 = v9;
  if (v9)
  {
    -[VCMediaNegotiationBlobV2GeneralInfo setNtpTime:](v9, "setNtpTime:", a3.wide);
    if (-[VCMediaNegotiationBlobV2GeneralInfo abSwitches](v10, "abSwitches") != (_DWORD)v5)
      -[VCMediaNegotiationBlobV2GeneralInfo setAbSwitches:](v10, "setAbSwitches:", v5);
    v11 = height;
    if (width >= 0x10000 && v11 >= 0x10000)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = v13;
          v17 = 2080;
          v18 = "-[VCMediaNegotiationBlobV2GeneralInfo(Utils) initWithCreationTime:screenResolution:abSwitches:]";
          v19 = 1024;
          v20 = 29;
          v21 = 1024;
          v22 = (int)width;
          v23 = 1024;
          v24 = (int)height;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Screen size error: %dx%d", (uint8_t *)&v15, 0x28u);
        }
      }

      return 0;
    }
    else
    {
      -[VCMediaNegotiationBlobV2GeneralInfo setScreenRes:](v10, "setScreenRes:", v11 | (width << 16));
    }
  }
  return v10;
}

- (CGSize)screenResolution
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)((int)-[VCMediaNegotiationBlobV2GeneralInfo screenRes](self, "screenRes") >> 16);
  v4 = (double)(__int16)-[VCMediaNegotiationBlobV2GeneralInfo screenRes](self, "screenRes");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = -[VCMediaNegotiationBlobV2GeneralInfo ntpTime](self, "ntpTime");
  -[VCMediaNegotiationBlobV2GeneralInfo screenResolution](self, "screenResolution");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2GeneralInfo data](self, "data"), "length"), a4);
  objc_msgSend(v12, "appendFormat:", CFSTR("General Info: ntpTime=%f screenResolution=%d/%d ABSwitches=0x%08x"), NTPToMicro(v7), (int)v9, (int)v11, -[VCMediaNegotiationBlobV2GeneralInfo abSwitches](self, "abSwitches"));
  v13 = objc_msgSend(v12, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v14, v15, v16, v17, v18, v19, v13);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v23 = v20;
      v24 = 2080;
      v25 = "-[VCMediaNegotiationBlobV2GeneralInfo(Utils) printWithLogFile:prefix:]";
      v26 = 1024;
      v27 = 61;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

@end
