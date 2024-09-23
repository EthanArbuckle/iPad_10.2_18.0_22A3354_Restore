@implementation _MPCProtoDelegateInfoTokenB

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenB;
  -[_MPCProtoDelegateInfoTokenB description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoDelegateInfoTokenB dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *picData;
  NSData *machineIDData;
  NSData *hardwareInfoData;
  NSString *userAgent;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  picData = self->_picData;
  if (picData)
    objc_msgSend(v3, "setObject:forKey:", picData, CFSTR("picData"));
  machineIDData = self->_machineIDData;
  if (machineIDData)
    objc_msgSend(v4, "setObject:forKey:", machineIDData, CFSTR("machineIDData"));
  hardwareInfoData = self->_hardwareInfoData;
  if (hardwareInfoData)
    objc_msgSend(v4, "setObject:forKey:", hardwareInfoData, CFSTR("hardwareInfoData"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v4, "setObject:forKey:", userAgent, CFSTR("userAgent"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sessionID"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  objc_class *v18;
  uint64_t v19;
  int v20;
  void *v21;
  char v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 0u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_25;
        case 1u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_25;
        case 2u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 16;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_25:
          v21 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;

          continue;
        case 4u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)&self->_has |= 1u;
          break;
        default:
          v20 = PBReaderSkipValueWithTag();
          if (!v20)
            return v20;
          continue;
      }
      while (1)
      {
        v25 = *v4;
        v26 = *(_QWORD *)((char *)a3 + v25);
        if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v27 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v26);
        *(_QWORD *)((char *)a3 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0)
          goto LABEL_34;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          v24 = 0;
          goto LABEL_36;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_34:
      if (*((_BYTE *)a3 + *v6))
        v24 = 0;
LABEL_36:
      self->_sessionID = v24;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((_BYTE *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_picData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_machineIDData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_hardwareInfoData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_picData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_machineIDData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_hardwareInfoData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_sessionID;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *picData;
  NSData *machineIDData;
  NSData *hardwareInfoData;
  NSString *userAgent;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  picData = self->_picData;
  if ((unint64_t)picData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](picData, "isEqual:"))
      goto LABEL_14;
  }
  machineIDData = self->_machineIDData;
  if ((unint64_t)machineIDData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](machineIDData, "isEqual:"))
      goto LABEL_14;
  }
  hardwareInfoData = self->_hardwareInfoData;
  if ((unint64_t)hardwareInfoData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](hardwareInfoData, "isEqual:"))
      goto LABEL_14;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_sessionID == *((_QWORD *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  v3 = -[NSData hash](self->_picData, "hash");
  v4 = -[NSData hash](self->_machineIDData, "hash");
  v5 = -[NSData hash](self->_hardwareInfoData, "hash");
  v6 = -[NSString hash](self->_userAgent, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_sessionID;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_picData, 0);
  objc_storeStrong((id *)&self->_machineIDData, 0);
  objc_storeStrong((id *)&self->_hardwareInfoData, 0);
}

- (uint64_t)setSessionID:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 48) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (void)setPicData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setMachineIDData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setHardwareInfoData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setUserAgent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (uint64_t)picData
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)machineIDData
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)hardwareInfoData
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)userAgent
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)sessionID
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

@end
