@implementation BCSCallerIdWrapper

- (BOOL)hasPhone
{
  return self->_phone != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)setModTime:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modTime = a3;
}

- (void)setHasModTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModTime
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BCSCallerIdWrapper;
  -[BCSCallerIdWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallerIdWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *phone;
  BCSCallerIdMessage *message;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  phone = self->_phone;
  if (phone)
    objc_msgSend(v3, "setObject:forKey:", phone, CFSTR("phone"));
  message = self->_message;
  if (message)
  {
    -[BCSCallerIdMessage dictionaryRepresentation](message, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("message"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_modTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("mod_time"));

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
  unint64_t v18;
  NSString *v19;
  NSString *phone;
  char v21;
  unsigned int v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BCSCallerIdMessage *v27;
  int v28;

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
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v24 = *v4;
          v25 = *(_QWORD *)((char *)a3 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
          *(_QWORD *)((char *)a3 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_35;
          v21 += 7;
          v15 = v22++ >= 9;
          if (v15)
          {
            v23 = 0;
            goto LABEL_37;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_35:
        if (*((_BYTE *)a3 + *v6))
          v23 = 0;
LABEL_37:
        self->_modTime = v23;
      }
      else if ((_DWORD)v18 == 2)
      {
        v27 = objc_alloc_init(BCSCallerIdMessage);
        objc_storeStrong((id *)&self->_message, v27);
        if (!PBReaderPlaceMark() || (BCSCallerIdMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v28) = 0;
          return v28;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v18 == 1)
      {
        PBReaderReadString();
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        phone = self->_phone;
        self->_phone = v19;

      }
      else
      {
        v28 = PBReaderSkipValueWithTag();
        if (!v28)
          return v28;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v28) = *((_BYTE *)a3 + *v6) == 0;
  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_phone)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_message)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_phone)
  {
    objc_msgSend(v4, "setPhone:");
    v4 = v5;
  }
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_modTime;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_phone, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[BCSCallerIdMessage copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_modTime;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *phone;
  BCSCallerIdMessage *message;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  phone = self->_phone;
  if ((unint64_t)phone | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](phone, "isEqual:"))
      goto LABEL_10;
  }
  message = self->_message;
  if ((unint64_t)message | *((_QWORD *)v4 + 2))
  {
    if (!-[BCSCallerIdMessage isEqual:](message, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_modTime == *((_QWORD *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_phone, "hash");
  v4 = -[BCSCallerIdMessage hash](self->_message, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_modTime;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  BCSCallerIdMessage *message;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[BCSCallerIdWrapper setPhone:](self, "setPhone:");
    v4 = v7;
  }
  message = self->_message;
  v6 = v4[2];
  if (message)
  {
    if (!v6)
      goto LABEL_9;
    -[BCSCallerIdMessage mergeFrom:](message, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[BCSCallerIdWrapper setMessage:](self, "setMessage:");
  }
  v4 = v7;
LABEL_9:
  if ((v4[4] & 1) != 0)
  {
    self->_modTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
  objc_storeStrong((id *)&self->_phone, a3);
}

- (BCSCallerIdMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)modTime
{
  return self->_modTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
