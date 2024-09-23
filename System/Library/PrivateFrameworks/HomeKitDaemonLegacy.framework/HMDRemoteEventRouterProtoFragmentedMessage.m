@implementation HMDRemoteEventRouterProtoFragmentedMessage

- (BOOL)hasFragmentData
{
  return self->_fragmentData != 0;
}

- (void)setFragmentNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fragmentNumber = a3;
}

- (void)setHasFragmentNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFragmentNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalSize = a3;
}

- (void)setHasTotalSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalFragments:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_totalFragments = a3;
}

- (void)setHasTotalFragments:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotalFragments
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRouterVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_routerVersion = a3;
}

- (void)setHasRouterVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRouterVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HMDRemoteEventRouterProtoFragmentedMessage;
  -[HMDRemoteEventRouterProtoFragmentedMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoFragmentedMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *fragmentData;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fragmentData = self->_fragmentData;
  if (fragmentData)
    objc_msgSend(v3, "setObject:forKey:", fragmentData, CFSTR("fragmentData"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_fragmentNumber);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("fragmentNumber"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalFragments);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("totalFragments"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("totalSize"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_routerVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routerVersion"));

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
  NSData *v18;
  NSData *fragmentData;
  int v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
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
        case 1u:
          PBReaderReadData();
          v18 = (NSData *)objc_claimAutoreleasedReturnValue();
          fragmentData = self->_fragmentData;
          self->_fragmentData = v18;

          continue;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v25);
              *(_QWORD *)((char *)a3 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v23) = 0;
LABEL_53:
          v43 = 32;
          goto LABEL_67;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  v29 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v29 = 0;
LABEL_57:
          v44 = 16;
          goto LABEL_62;
        case 4u:
          v33 = 0;
          v34 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
              *(_QWORD *)((char *)a3 + v35) = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  v29 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v29 = 0;
LABEL_61:
          v44 = 8;
LABEL_62:
          *(Class *)((char *)&self->super.super.isa + v44) = (Class)v29;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v23 = 0;
          *(_BYTE *)&self->_has |= 8u;
          break;
        default:
          v20 = PBReaderSkipValueWithTag();
          if (!v20)
            return v20;
          continue;
      }
      while (1)
      {
        v40 = *v4;
        v41 = *(_QWORD *)((char *)a3 + v40);
        if (v41 == -1 || v41 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v42 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v41);
        *(_QWORD *)((char *)a3 + v40) = v41 + 1;
        v23 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0)
          goto LABEL_64;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v23) = 0;
          goto LABEL_66;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_64:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v23) = 0;
LABEL_66:
      v43 = 36;
LABEL_67:
      *(_DWORD *)((char *)&self->super.super.isa + v43) = v23;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((_BYTE *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_fragmentData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_fragmentData)
  {
    v6 = v4;
    objc_msgSend(v4, "setFragmentData:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_fragmentNumber;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v4 + 1) = self->_totalFragments;
      *((_BYTE *)v4 + 40) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = self->_totalSize;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_routerVersion;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_fragmentData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fragmentNumber;
    *(_BYTE *)(v5 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_totalFragments;
      *(_BYTE *)(v5 + 40) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_totalSize;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_routerVersion;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *fragmentData;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  fragmentData = self->_fragmentData;
  if ((unint64_t)fragmentData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](fragmentData, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_fragmentNumber != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_totalSize != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_totalFragments != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_routerVersion != *((_DWORD *)v4 + 9))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_fragmentData, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_fragmentNumber;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_totalSize;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761u * self->_totalFragments;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_routerVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentData:](self, "setFragmentData:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_fragmentNumber = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
LABEL_11:
      self->_totalFragments = *((_QWORD *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 40) & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_totalSize = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    self->_routerVersion = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:

}

- (NSData)fragmentData
{
  return self->_fragmentData;
}

- (void)setFragmentData:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentData, a3);
}

- (unsigned)fragmentNumber
{
  return self->_fragmentNumber;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unint64_t)totalFragments
{
  return self->_totalFragments;
}

- (unsigned)routerVersion
{
  return self->_routerVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentData, 0);
}

@end
