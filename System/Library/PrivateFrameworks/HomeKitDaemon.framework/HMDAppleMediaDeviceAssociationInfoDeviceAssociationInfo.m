@implementation HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo

- (BOOL)hasAccessoryUUID
{
  return self->_accessoryUUID != 0;
}

- (BOOL)hasIdsIdentifier
{
  return self->_idsIdentifier != 0;
}

- (BOOL)hasIdsDestination
{
  return self->_idsDestination != 0;
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
  v8.super_class = (Class)HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo;
  -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accessoryUUID;
  NSString *idsIdentifier;
  NSString *idsDestination;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accessoryUUID = self->_accessoryUUID;
  if (accessoryUUID)
    objc_msgSend(v3, "setObject:forKey:", accessoryUUID, CFSTR("accessoryUUID"));
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
    objc_msgSend(v4, "setObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
  idsDestination = self->_idsDestination;
  if (idsDestination)
    objc_msgSend(v4, "setObject:forKey:", idsDestination, CFSTR("idsDestination"));
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
  int v16;
  unint64_t v18;
  objc_class *v19;
  uint64_t v20;
  void *v21;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        return *((_BYTE *)a3 + *v6) == 0;
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
        if (v10++ >= 9)
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
        return *((_BYTE *)a3 + *v6) == 0;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v20 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v18 == 1)
      {
        PBReaderReadString();
        v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v20 = 8;
LABEL_24:
        v21 = *(Class *)((char *)&self->super.super.isa + v20);
        *(Class *)((char *)&self->super.super.isa + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        return *((_BYTE *)a3 + *v6) == 0;
    }
    PBReaderReadString();
    v19 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v20 = 16;
    goto LABEL_24;
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accessoryUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_idsIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_idsDestination)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accessoryUUID)
  {
    objc_msgSend(v4, "setAccessoryUUID:");
    v4 = v5;
  }
  if (self->_idsIdentifier)
  {
    objc_msgSend(v5, "setIdsIdentifier:");
    v4 = v5;
  }
  if (self->_idsDestination)
  {
    objc_msgSend(v5, "setIdsDestination:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accessoryUUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_idsIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_idsDestination, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *accessoryUUID;
  NSString *idsIdentifier;
  NSString *idsDestination;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((accessoryUUID = self->_accessoryUUID, !((unint64_t)accessoryUUID | v4[1]))
     || -[NSString isEqual:](accessoryUUID, "isEqual:"))
    && ((idsIdentifier = self->_idsIdentifier, !((unint64_t)idsIdentifier | v4[3]))
     || -[NSString isEqual:](idsIdentifier, "isEqual:")))
  {
    idsDestination = self->_idsDestination;
    if ((unint64_t)idsDestination | v4[2])
      v8 = -[NSString isEqual:](idsDestination, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_accessoryUUID, "hash");
  v4 = -[NSString hash](self->_idsIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_idsDestination, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setAccessoryUUID:](self, "setAccessoryUUID:");
  if (v4[3])
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsIdentifier:](self, "setIdsIdentifier:");
  if (v4[2])
    -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsDestination:](self, "setIdsDestination:");

}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
  objc_storeStrong((id *)&self->_idsDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
