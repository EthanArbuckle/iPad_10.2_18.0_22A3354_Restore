@implementation _MPCProtoRadioCreationProperties

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioCreationProperties;
  -[_MPCProtoRadioCreationProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoRadioCreationProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *radioStationID;
  NSString *radioStationURLString;
  _MPCProtoRadioContentReference *seedContentReference;
  void *v8;
  _MPCProtoRadioContentReference *nowPlayingContentReference;
  void *v10;
  _MPCProtoDelegateInfo *accountInfo;
  void *v12;
  NSString *playActivityFeatureName;
  NSString *playActivityQueueGroupingID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  radioStationID = self->_radioStationID;
  if (radioStationID)
    objc_msgSend(v3, "setObject:forKey:", radioStationID, CFSTR("radioStationID"));
  radioStationURLString = self->_radioStationURLString;
  if (radioStationURLString)
    objc_msgSend(v4, "setObject:forKey:", radioStationURLString, CFSTR("radioStationURLString"));
  seedContentReference = self->_seedContentReference;
  if (seedContentReference)
  {
    -[_MPCProtoRadioContentReference dictionaryRepresentation](seedContentReference, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("seedContentReference"));

  }
  nowPlayingContentReference = self->_nowPlayingContentReference;
  if (nowPlayingContentReference)
  {
    -[_MPCProtoRadioContentReference dictionaryRepresentation](nowPlayingContentReference, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("nowPlayingContentReference"));

  }
  accountInfo = self->_accountInfo;
  if (accountInfo)
  {
    -[_MPCProtoDelegateInfo dictionaryRepresentation](accountInfo, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("accountInfo"));

  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if (playActivityFeatureName)
    objc_msgSend(v4, "setObject:forKey:", playActivityFeatureName, CFSTR("playActivityFeatureName"));
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if (playActivityQueueGroupingID)
    objc_msgSend(v4, "setObject:forKey:", playActivityQueueGroupingID, CFSTR("playActivityQueueGroupingID"));
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
  objc_class *v18;
  uint64_t v19;
  _MPCProtoRadioContentReference *v20;
  uint64_t v21;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
    return *((_BYTE *)a3 + *v6) == 0;
  v8 = (int *)MEMORY[0x24BE7AF30];
  while (2)
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
    switch((v11 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_33;
      case 2u:
        PBReaderReadString();
        v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v19 = 48;
        goto LABEL_33;
      case 3u:
        v20 = objc_alloc_init(_MPCProtoRadioContentReference);
        v21 = 56;
        goto LABEL_25;
      case 4u:
        v20 = objc_alloc_init(_MPCProtoRadioContentReference);
        v21 = 16;
LABEL_25:
        objc_storeStrong((id *)((char *)&self->super.super.isa + v21), v20);
        if (!PBReaderPlaceMark()
          || !_MPCProtoRadioContentReferenceReadFrom((id *)&v20->super.super.isa, (uint64_t)a3))
        {
          goto LABEL_38;
        }
        goto LABEL_30;
      case 5u:
        v20 = objc_alloc_init(_MPCProtoDelegateInfo);
        objc_storeStrong((id *)&self->_accountInfo, v20);
        if (PBReaderPlaceMark() && (_MPCProtoDelegateInfoReadFrom((uint64_t)v20, (uint64_t)a3) & 1) != 0)
        {
LABEL_30:
          PBReaderRecallMark();
LABEL_34:

LABEL_35:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            return *((_BYTE *)a3 + *v6) == 0;
          continue;
        }
LABEL_38:

        return 0;
      case 6u:
        PBReaderReadString();
        v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_33;
      case 7u:
        PBReaderReadString();
        v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v19 = 32;
LABEL_33:
        v20 = *(_MPCProtoRadioContentReference **)((char *)&self->super.super.isa + v19);
        *(Class *)((char *)&self->super.super.isa + v19) = v18;
        goto LABEL_34;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_35;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_radioStationID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_radioStationURLString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_seedContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_nowPlayingContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_accountInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playActivityFeatureName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_playActivityQueueGroupingID)
  {
    PBDataWriterWriteStringField();
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
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_radioStationID, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_radioStationURLString, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v10 = -[_MPCProtoRadioContentReference copyWithZone:](self->_seedContentReference, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v12 = -[_MPCProtoRadioContentReference copyWithZone:](self->_nowPlayingContentReference, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[_MPCProtoDelegateInfo copyWithZone:](self->_accountInfo, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v16 = -[NSString copyWithZone:](self->_playActivityFeatureName, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[NSString copyWithZone:](self->_playActivityQueueGroupingID, "copyWithZone:", a3);
  v19 = (void *)v5[4];
  v5[4] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *radioStationID;
  NSString *radioStationURLString;
  _MPCProtoRadioContentReference *seedContentReference;
  _MPCProtoRadioContentReference *nowPlayingContentReference;
  _MPCProtoDelegateInfo *accountInfo;
  NSString *playActivityFeatureName;
  NSString *playActivityQueueGroupingID;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((radioStationID = self->_radioStationID, !((unint64_t)radioStationID | v4[5]))
     || -[NSString isEqual:](radioStationID, "isEqual:"))
    && ((radioStationURLString = self->_radioStationURLString, !((unint64_t)radioStationURLString | v4[6]))
     || -[NSString isEqual:](radioStationURLString, "isEqual:"))
    && ((seedContentReference = self->_seedContentReference, !((unint64_t)seedContentReference | v4[7]))
     || -[_MPCProtoRadioContentReference isEqual:](seedContentReference, "isEqual:"))
    && ((nowPlayingContentReference = self->_nowPlayingContentReference,
         !((unint64_t)nowPlayingContentReference | v4[2]))
     || -[_MPCProtoRadioContentReference isEqual:](nowPlayingContentReference, "isEqual:"))
    && ((accountInfo = self->_accountInfo, !((unint64_t)accountInfo | v4[1]))
     || -[_MPCProtoDelegateInfo isEqual:](accountInfo, "isEqual:"))
    && ((playActivityFeatureName = self->_playActivityFeatureName, !((unint64_t)playActivityFeatureName | v4[3]))
     || -[NSString isEqual:](playActivityFeatureName, "isEqual:")))
  {
    playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
    if ((unint64_t)playActivityQueueGroupingID | v4[4])
      v12 = -[NSString isEqual:](playActivityQueueGroupingID, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_radioStationID, "hash");
  v4 = -[NSString hash](self->_radioStationURLString, "hash") ^ v3;
  v5 = -[_MPCProtoRadioContentReference hash](self->_seedContentReference, "hash");
  v6 = v4 ^ v5 ^ -[_MPCProtoRadioContentReference hash](self->_nowPlayingContentReference, "hash");
  v7 = -[_MPCProtoDelegateInfo hash](self->_accountInfo, "hash");
  v8 = v7 ^ -[NSString hash](self->_playActivityFeatureName, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_playActivityQueueGroupingID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_radioStationURLString, 0);
  objc_storeStrong((id *)&self->_radioStationID, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
}

@end
