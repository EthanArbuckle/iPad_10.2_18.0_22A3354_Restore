@implementation MXSessionMetadata

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (void)setDataSharingOptInStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataSharingOptInStatus = a3;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)userInterfaceIdiom
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_userInterfaceIdiom;
  else
    return 0;
}

- (void)setUserInterfaceIdiom:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userInterfaceIdiom = a3;
}

- (void)setHasUserInterfaceIdiom:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserInterfaceIdiom
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)userInterfaceIdiomAsString:(int)a3
{
  if (a3 < 8)
    return off_2512EF9C8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserInterfaceIdiom:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_INTERFACE_IDIOM_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZEUS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HORSEMAN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAMEO")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXSessionMetadata;
  -[MXSessionMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXSessionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MXDeviceInfo *deviceInfo;
  void *v5;
  char has;
  void *v7;
  uint64_t userInterfaceIdiom;
  __CFString *v9;
  NSString *language;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    -[MXDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("device_info"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dataSharingOptInStatus);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("data_sharing_opt_in_status"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    userInterfaceIdiom = self->_userInterfaceIdiom;
    if (userInterfaceIdiom >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userInterfaceIdiom);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_2512EF9C8[userInterfaceIdiom];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_interface_idiom"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXSessionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_dataSharingOptInStatus;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_userInterfaceIdiom;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v6, "setLanguage:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MXDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 28) = self->_dataSharingOptInStatus;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_userInterfaceIdiom;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MXDeviceInfo *deviceInfo;
  NSString *language;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((_QWORD *)v4 + 1))
  {
    if (!-[MXDeviceInfo isEqual:](deviceInfo, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) != 0)
    {
      if (self->_dataSharingOptInStatus)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_19;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_12;
    }
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
    goto LABEL_19;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_userInterfaceIdiom != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](language, "isEqual:");
  else
    v7 = 1;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[MXDeviceInfo hash](self->_deviceInfo, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_language, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_userInterfaceIdiom;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_language, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MXDeviceInfo *deviceInfo;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  deviceInfo = self->_deviceInfo;
  v6 = *((_QWORD *)v4 + 1);
  v8 = v4;
  if (deviceInfo)
  {
    if (!v6)
      goto LABEL_7;
    -[MXDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MXSessionMetadata setDeviceInfo:](self, "setDeviceInfo:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_dataSharingOptInStatus = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 32);
  }
  if ((v7 & 1) != 0)
  {
    self->_userInterfaceIdiom = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[MXSessionMetadata setLanguage:](self, "setLanguage:");
    v4 = v8;
  }

}

- (MXDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (BOOL)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
