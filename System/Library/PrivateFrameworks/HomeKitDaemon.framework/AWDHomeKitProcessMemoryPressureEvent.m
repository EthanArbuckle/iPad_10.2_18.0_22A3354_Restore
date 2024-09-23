@implementation AWDHomeKitProcessMemoryPressureEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProcessMemoryState
{
  return self->_processMemoryState != 0;
}

- (BOOL)hasDataSyncState
{
  return self->_dataSyncState != 0;
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
  v8.super_class = (Class)AWDHomeKitProcessMemoryPressureEvent;
  -[AWDHomeKitProcessMemoryPressureEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitProcessMemoryPressureEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *processMemoryState;
  NSString *dataSyncState;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  processMemoryState = self->_processMemoryState;
  if (processMemoryState)
    objc_msgSend(v3, "setObject:forKey:", processMemoryState, CFSTR("processMemoryState"));
  dataSyncState = self->_dataSyncState;
  if (dataSyncState)
    objc_msgSend(v3, "setObject:forKey:", dataSyncState, CFSTR("dataSyncState"));
  return v3;
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
  char v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
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
        PBReaderReadString();
        v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v26 = 16;
      }
      else
      {
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 1)
          {
            v19 = 0;
            v20 = 0;
            v21 = 0;
            *(_BYTE *)&self->_has |= 1u;
            while (1)
            {
              v22 = *v4;
              v23 = *(_QWORD *)((char *)a3 + v22);
              if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v5))
                break;
              v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v23);
              *(_QWORD *)((char *)a3 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if ((v24 & 0x80) == 0)
                goto LABEL_34;
              v19 += 7;
              v15 = v20++ >= 9;
              if (v15)
              {
                v21 = 0;
                goto LABEL_36;
              }
            }
            *((_BYTE *)a3 + *v6) = 1;
LABEL_34:
            if (*((_BYTE *)a3 + *v6))
              v21 = 0;
LABEL_36:
            self->_timestamp = v21;
          }
          else
          {
            v28 = PBReaderSkipValueWithTag();
            if (!v28)
              return v28;
          }
          continue;
        }
        PBReaderReadString();
        v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v26 = 24;
      }
      v27 = *(Class *)((char *)&self->super.super.isa + v26);
      *(Class *)((char *)&self->super.super.isa + v26) = v25;

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_processMemoryState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_dataSyncState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_processMemoryState)
  {
    objc_msgSend(v4, "setProcessMemoryState:");
    v4 = v5;
  }
  if (self->_dataSyncState)
  {
    objc_msgSend(v5, "setDataSyncState:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_processMemoryState, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_dataSyncState, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *processMemoryState;
  NSString *dataSyncState;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  processMemoryState = self->_processMemoryState;
  if ((unint64_t)processMemoryState | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](processMemoryState, "isEqual:"))
  {
    goto LABEL_11;
  }
  dataSyncState = self->_dataSyncState;
  if ((unint64_t)dataSyncState | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](dataSyncState, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_processMemoryState, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_dataSyncState, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[3])
  {
    -[AWDHomeKitProcessMemoryPressureEvent setProcessMemoryState:](self, "setProcessMemoryState:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[AWDHomeKitProcessMemoryPressureEvent setDataSyncState:](self, "setDataSyncState:");
    v4 = v5;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)processMemoryState
{
  return self->_processMemoryState;
}

- (void)setProcessMemoryState:(id)a3
{
  objc_storeStrong((id *)&self->_processMemoryState, a3);
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (void)setDataSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_dataSyncState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMemoryState, 0);
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

@end
