@implementation NPKProtoStandalonePass

- (int)passType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_passType;
  else
    return 100;
}

- (void)setPassType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_passType = a3;
}

- (void)setHasPassType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)passTypeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("Any");
    case 100:
      return CFSTR("Barcode");
    case 110:
      v3 = CFSTR("Payment");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsPassType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Barcode")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Payment")) & 1) != 0)
  {
    v4 = 110;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Any")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)clearUserInfos
{
  -[NSMutableArray removeAllObjects](self->_userInfos, "removeAllObjects");
}

- (void)addUserInfos:(id)a3
{
  id v4;
  NSMutableArray *userInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userInfos = self->_userInfos;
  v8 = v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    v4 = v8;
    userInfos = self->_userInfos;
  }
  -[NSMutableArray addObject:](userInfos, "addObject:", v4);

}

- (unint64_t)userInfosCount
{
  return -[NSMutableArray count](self->_userInfos, "count");
}

- (id)userInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userInfos, "objectAtIndex:", a3);
}

+ (Class)userInfosType
{
  return (Class)objc_opt_class();
}

- (void)setRemotePass:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_remotePass = a3;
}

- (void)setHasRemotePass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRemotePass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePass;
  -[NPKProtoStandalonePass description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int passType;
  __CFString *v5;
  NSString *serialNumber;
  NSString *passTypeIdentifier;
  NSData *imageData;
  NSString *localizedName;
  NSString *localizedDescription;
  NSString *organizationName;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSString *deviceName;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    passType = self->_passType;
    if (passType)
    {
      if (passType == 100)
      {
        v5 = CFSTR("Barcode");
      }
      else if (passType == 110)
      {
        v5 = CFSTR("Payment");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_passType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("Any");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("passType"));

  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v3, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v3, "setObject:forKey:", imageData, CFSTR("imageData"));
  localizedName = self->_localizedName;
  if (localizedName)
    objc_msgSend(v3, "setObject:forKey:", localizedName, CFSTR("localizedName"));
  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v3, "setObject:forKey:", localizedDescription, CFSTR("localizedDescription"));
  organizationName = self->_organizationName;
  if (organizationName)
    objc_msgSend(v3, "setObject:forKey:", organizationName, CFSTR("organizationName"));
  if (-[NSMutableArray count](self->_userInfos, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_userInfos, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = self->_userInfos;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("userInfos"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_remotePass);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("remotePass"));

  }
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePassReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_imageData)
    PBDataWriterWriteDataField();
  if (self->_serialNumber)
    PBDataWriterWriteStringField();
  if (self->_passTypeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_localizedName)
    PBDataWriterWriteStringField();
  if (self->_localizedDescription)
    PBDataWriterWriteStringField();
  if (self->_organizationName)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_userInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BYTE *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_passType;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  v10 = v4;
  if (self->_imageData)
    objc_msgSend(v4, "setImageData:");
  if (self->_serialNumber)
    objc_msgSend(v10, "setSerialNumber:");
  if (self->_passTypeIdentifier)
    objc_msgSend(v10, "setPassTypeIdentifier:");
  if (self->_localizedName)
    objc_msgSend(v10, "setLocalizedName:");
  if (self->_localizedDescription)
    objc_msgSend(v10, "setLocalizedDescription:");
  if (self->_organizationName)
    objc_msgSend(v10, "setOrganizationName:");
  if (-[NPKProtoStandalonePass userInfosCount](self, "userInfosCount"))
  {
    objc_msgSend(v10, "clearUserInfos");
    v5 = -[NPKProtoStandalonePass userInfosCount](self, "userInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NPKProtoStandalonePass userInfosAtIndex:](self, "userInfosAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addUserInfos:", v8);

      }
    }
  }
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[80] = self->_remotePass;
    v10[84] |= 2u;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v10, "setDeviceName:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_passType;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v11;

  v13 = -[NSString copyWithZone:](self->_localizedName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v13;

  v15 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  v17 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = self->_userInfos;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v6, "addUserInfos:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_remotePass;
    *(_BYTE *)(v6 + 84) |= 2u;
  }
  v25 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3, (_QWORD)v28);
  v26 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *imageData;
  NSString *serialNumber;
  NSString *passTypeIdentifier;
  NSString *localizedName;
  NSString *localizedDescription;
  NSString *organizationName;
  NSMutableArray *userInfos;
  char v12;
  NSString *deviceName;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_passType != *((_DWORD *)v4 + 12))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_25;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](imageData, "isEqual:"))
    goto LABEL_25;
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_25;
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:"))
      goto LABEL_25;
  }
  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](localizedName, "isEqual:"))
      goto LABEL_25;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:"))
      goto LABEL_25;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:"))
      goto LABEL_25;
  }
  userInfos = self->_userInfos;
  if ((unint64_t)userInfos | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](userInfos, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0)
      goto LABEL_31;
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 84) & 2) == 0)
    goto LABEL_25;
  if (!self->_remotePass)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_31;
    goto LABEL_25;
  }
  if (!*((_BYTE *)v4 + 80))
    goto LABEL_25;
LABEL_31:
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 1))
    v12 = -[NSString isEqual:](deviceName, "isEqual:");
  else
    v12 = 1;
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_passType;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_imageData, "hash");
  v5 = -[NSString hash](self->_serialNumber, "hash");
  v6 = -[NSString hash](self->_passTypeIdentifier, "hash");
  v7 = -[NSString hash](self->_localizedName, "hash");
  v8 = -[NSString hash](self->_localizedDescription, "hash");
  v9 = -[NSString hash](self->_organizationName, "hash");
  v10 = -[NSMutableArray hash](self->_userInfos, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_remotePass;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_deviceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[21] & 1) != 0)
  {
    self->_passType = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoStandalonePass setImageData:](self, "setImageData:");
  if (*((_QWORD *)v5 + 8))
    -[NPKProtoStandalonePass setSerialNumber:](self, "setSerialNumber:");
  if (*((_QWORD *)v5 + 7))
    -[NPKProtoStandalonePass setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  if (*((_QWORD *)v5 + 4))
    -[NPKProtoStandalonePass setLocalizedName:](self, "setLocalizedName:");
  if (*((_QWORD *)v5 + 3))
    -[NPKProtoStandalonePass setLocalizedDescription:](self, "setLocalizedDescription:");
  if (*((_QWORD *)v5 + 5))
    -[NPKProtoStandalonePass setOrganizationName:](self, "setOrganizationName:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v5 + 9);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NPKProtoStandalonePass addUserInfos:](self, "addUserInfos:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v5 + 84) & 2) != 0)
  {
    self->_remotePass = *((_BYTE *)v5 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 1))
    -[NPKProtoStandalonePass setDeviceName:](self, "setDeviceName:");

}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
  objc_storeStrong((id *)&self->_userInfos, a3);
}

- (BOOL)remotePass
{
  return self->_remotePass;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
