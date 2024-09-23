@implementation _MPCProtoDelegateInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MPCProtoDelegateInfo;
  -[_MPCProtoDelegateInfo dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)_MPCProtoDelegateInfo;
  -[_MPCProtoDelegateInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoDelegateInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *uuid;
  NSString *deviceGUID;
  NSString *deviceName;
  void *v10;
  NSString *requestUserAgent;
  NSString *timeZoneName;
  void *v13;
  void *v14;
  _MPCProtoDelegateInfoTokenA *tokenA;
  void *v16;
  _MPCProtoDelegateInfoTokenE *tokenE;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_delegateInfoID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("delegateInfoID"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_accountID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("accountID"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  deviceGUID = self->_deviceGUID;
  if (deviceGUID)
    objc_msgSend(v3, "setObject:forKey:", deviceGUID, CFSTR("deviceGUID"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_systemReleaseType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("systemReleaseType"));

  }
  requestUserAgent = self->_requestUserAgent;
  if (requestUserAgent)
    objc_msgSend(v3, "setObject:forKey:", requestUserAgent, CFSTR("requestUserAgent"));
  timeZoneName = self->_timeZoneName;
  if (timeZoneName)
    objc_msgSend(v3, "setObject:forKey:", timeZoneName, CFSTR("timeZoneName"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_privateListeningEnabled);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("privateListeningEnabled"));

  }
  PBRepeatedInt32NSArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("accountCapabilities"));

  tokenA = self->_tokenA;
  if (tokenA)
  {
    -[_MPCProtoDelegateInfoTokenA dictionaryRepresentation](tokenA, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("tokenA"));

  }
  tokenE = self->_tokenE;
  if (tokenE)
  {
    -[_MPCProtoDelegateInfoTokenE dictionaryRepresentation](tokenE, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("tokenE"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_deviceGUID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_requestUserAgent)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_accountCapabilities.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_accountCapabilities.count);
  }
  if (self->_tokenA)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_tokenE)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_delegateInfoID;
    *(_BYTE *)(v5 + 116) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_accountID;
    *(_BYTE *)(v5 + 116) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceGUID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_systemReleaseType;
    *(_BYTE *)(v6 + 116) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_requestUserAgent, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v16;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 112) = self->_privateListeningEnabled;
    *(_BYTE *)(v6 + 116) |= 8u;
  }
  PBRepeatedInt32Copy();
  v18 = -[_MPCProtoDelegateInfoTokenA copyWithZone:](self->_tokenA, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v18;

  v20 = -[_MPCProtoDelegateInfoTokenE copyWithZone:](self->_tokenE, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v20;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  NSString *deviceGUID;
  NSString *deviceName;
  NSString *requestUserAgent;
  NSString *timeZoneName;
  _MPCProtoDelegateInfoTokenA *tokenA;
  _MPCProtoDelegateInfoTokenE *tokenE;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) == 0 || self->_delegateInfoID != *((_QWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_accountID != *((_QWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_40;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](uuid, "isEqual:"))
    goto LABEL_40;
  deviceGUID = self->_deviceGUID;
  if ((unint64_t)deviceGUID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](deviceGUID, "isEqual:"))
      goto LABEL_40;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 18))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_40;
  }
  requestUserAgent = self->_requestUserAgent;
  if ((unint64_t)requestUserAgent | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](requestUserAgent, "isEqual:"))
  {
    goto LABEL_40;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:"))
      goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) != 0)
    {
      if (self->_privateListeningEnabled)
      {
        if (!*((_BYTE *)v4 + 112))
          goto LABEL_40;
        goto LABEL_35;
      }
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_35;
    }
LABEL_40:
    v12 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 116) & 8) != 0)
    goto LABEL_40;
LABEL_35:
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_40;
  tokenA = self->_tokenA;
  if ((unint64_t)tokenA | *((_QWORD *)v4 + 11))
  {
    if (!-[_MPCProtoDelegateInfoTokenA isEqual:](tokenA, "isEqual:"))
      goto LABEL_40;
  }
  tokenE = self->_tokenE;
  if ((unint64_t)tokenE | *((_QWORD *)v4 + 12))
    v12 = -[_MPCProtoDelegateInfoTokenE isEqual:](tokenE, "isEqual:");
  else
    v12 = 1;
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_delegateInfoID;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_accountID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_uuid, "hash");
  v6 = -[NSString hash](self->_deviceGUID, "hash");
  v7 = -[NSString hash](self->_deviceName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_systemReleaseType;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_requestUserAgent, "hash");
  v10 = -[NSString hash](self->_timeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_privateListeningEnabled;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v13 = v11 ^ PBRepeatedInt32Hash();
  v14 = v13 ^ -[_MPCProtoDelegateInfoTokenA hash](self->_tokenA, "hash");
  return v12 ^ v14 ^ -[_MPCProtoDelegateInfoTokenE hash](self->_tokenE, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tokenE, 0);
  objc_storeStrong((id *)&self->_tokenA, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_requestUserAgent, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
}

- (uint64_t)accountCapabilitiesAtIndex:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4 <= a2)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a2, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise");

  }
  return *(unsigned int *)(*(_QWORD *)(a1 + 8) + 4 * a2);
}

- (void)setUuid:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setTokenA:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setTokenE:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

+ (id)currentDeviceDelegateInfo
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;

  v2 = (id *)objc_alloc_init((Class)a1);
  v3 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8770], "defaultInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithClientInfo:", v4);

  objc_msgSend(v5, "deviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong(v2 + 6, v7);

  objc_msgSend(v6, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong(v2 + 7, v8);

  objc_msgSend(v5, "userAgent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong(v2 + 8, v9);

  objc_msgSend(v6, "systemReleaseType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEC8540]) & 1) != 0)
  {
    v11 = 3;
  }
  else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEC8548]) & 1) != 0)
  {
    v11 = 4;
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEC8538]))
  {
    v11 = 2;
  }
  else
  {
    v11 = 1;
  }
  if (v2)
  {
    *((_BYTE *)v2 + 116) |= 4u;
    *((_DWORD *)v2 + 18) = v11;
  }
  objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong(v2 + 10, v13);

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isPrivateListeningEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BDDC750], "isPrivateListeningEnabledForCurrentUserAndAccessory"));
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  if (v15)
  {
    v17 = objc_msgSend(v15, "BOOLValue");
    if (v2)
    {
      *((_BYTE *)v2 + 116) |= 8u;
      *((_BYTE *)v2 + 112) = v17;
    }
  }

  return v2;
}

@end
