@implementation HMAccessoryInfoProtoSoftwareVersionInfoEvent

- (void)setMajorVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMajorVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinorVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUpdateVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_updateVersion = a3;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUpdateVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoSoftwareVersionInfoEvent;
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoSoftwareVersionInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *buildVersion;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_majorVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("majorVersion"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minorVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("minorVersion"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_updateVersion);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("updateVersion"));

  }
LABEL_5:
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoSoftwareVersionInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_majorVersion;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_minorVersion;
  *((_BYTE *)v4 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_updateVersion;
    *((_BYTE *)v4 + 40) |= 4u;
  }
LABEL_5:
  if (self->_buildVersion)
  {
    v6 = v4;
    objc_msgSend(v4, "setBuildVersion:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_minorVersion;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_majorVersion;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_updateVersion;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *buildVersion;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_majorVersion != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_minorVersion != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_updateVersion != *((_QWORD *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 4))
    v6 = -[NSString isEqual:](buildVersion, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_buildVersion, "hash");
  }
  v2 = 2654435761 * self->_majorVersion;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_minorVersion;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_updateVersion;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_buildVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_majorVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_minorVersion = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_updateVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setBuildVersion:](self, "setBuildVersion:");
    v4 = v6;
  }

}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)updateVersion
{
  return self->_updateVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
