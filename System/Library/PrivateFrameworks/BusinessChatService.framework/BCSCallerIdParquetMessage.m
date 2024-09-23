@implementation BCSCallerIdParquetMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (void)clearNames
{
  -[NSMutableArray removeAllObjects](self->_names, "removeAllObjects");
}

- (void)addName:(id)a3
{
  id v4;
  NSMutableArray *names;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  names = self->_names;
  v8 = v4;
  if (!names)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_names;
    self->_names = v6;

    v4 = v8;
    names = self->_names;
  }
  -[NSMutableArray addObject:](names, "addObject:", v4);

}

- (unint64_t)namesCount
{
  return -[NSMutableArray count](self->_names, "count");
}

- (id)nameAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_names, "objectAtIndex:", a3);
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLogo
{
  return self->_logo != 0;
}

- (void)setIsVerified:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearIntents
{
  -[NSMutableArray removeAllObjects](self->_intents, "removeAllObjects");
}

- (void)addIntent:(id)a3
{
  id v4;
  NSMutableArray *intents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  intents = self->_intents;
  v8 = v4;
  if (!intents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_intents;
    self->_intents = v6;

    v4 = v8;
    intents = self->_intents;
  }
  -[NSMutableArray addObject:](intents, "addObject:", v4);

}

- (unint64_t)intentsCount
{
  return -[NSMutableArray count](self->_intents, "count");
}

- (id)intentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_intents, "objectAtIndex:", a3);
}

+ (Class)intentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLogoFormat
{
  return self->_logoFormat != 0;
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
  v8.super_class = (Class)BCSCallerIdParquetMessage;
  -[BCSCallerIdParquetMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallerIdParquetMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *phoneNumber;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *logo;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSString *logoFormat;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_phoneHash);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("phone_hash"));

  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v3, "setObject:forKey:", phoneNumber, CFSTR("phone_number"));
  if (-[NSMutableArray count](self->_names, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_names, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_names;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("name"));
  }
  logo = self->_logo;
  if (logo)
    objc_msgSend(v3, "setObject:forKey:", logo, CFSTR("logo"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVerified);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("is_verified"));

  }
  if (-[NSMutableArray count](self->_intents, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_intents, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_intents;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("intent"));
  }
  logoFormat = self->_logoFormat;
  if (logoFormat)
    objc_msgSend(v3, "setObject:forKey:", logoFormat, CFSTR("logo_format"));
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
  char v18;
  unsigned int v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  objc_class *v25;
  uint64_t v26;
  BCSCallerIdLocalizedString *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (!*((_BYTE *)a3 + *v6))
    {
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
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_47;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_45:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_47:
          self->_phoneHash = v20;
          goto LABEL_52;
        case 2u:
          PBReaderReadString();
          v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v26 = 48;
          goto LABEL_43;
        case 3u:
          v27 = objc_alloc_init(BCSCallerIdLocalizedString);
          -[BCSCallerIdParquetMessage addName:](self, "addName:", v27);
          goto LABEL_39;
        case 4u:
          PBReaderReadData();
          v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v26 = 24;
          goto LABEL_43;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v31 = *v4;
            v32 = *(_QWORD *)((char *)a3 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v32);
              *(_QWORD *)((char *)a3 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v15 = v29++ >= 9;
                if (v15)
                {
                  v30 = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v30 = 0;
LABEL_51:
          self->_isVerified = v30 != 0;
          goto LABEL_52;
        case 6u:
          v27 = objc_alloc_init(BCSCallerIdLocalizedString);
          -[BCSCallerIdParquetMessage addIntent:](self, "addIntent:", v27);
LABEL_39:
          if (!PBReaderPlaceMark()
            || (BCSCallerIdLocalizedStringReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v24) = 0;
            return v24;
          }
          PBReaderRecallMark();

LABEL_52:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_53;
          break;
        case 7u:
          PBReaderReadString();
          v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v26 = 32;
LABEL_43:
          v34 = *(Class *)((char *)&self->super.super.isa + v26);
          *(Class *)((char *)&self->super.super.isa + v26) = v25;

          goto LABEL_52;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_52;
      }
    }
  }
LABEL_53:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_phoneNumber)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_names;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_logo)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_intents;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_logoFormat)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  _BYTE *v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_phoneHash;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v13 = v4;
  if (self->_phoneNumber)
    objc_msgSend(v4, "setPhoneNumber:");
  if (-[BCSCallerIdParquetMessage namesCount](self, "namesCount"))
  {
    objc_msgSend(v13, "clearNames");
    v5 = -[BCSCallerIdParquetMessage namesCount](self, "namesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BCSCallerIdParquetMessage nameAtIndex:](self, "nameAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addName:", v8);

      }
    }
  }
  if (self->_logo)
    objc_msgSend(v13, "setLogo:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13[56] = self->_isVerified;
    v13[60] |= 2u;
  }
  if (-[BCSCallerIdParquetMessage intentsCount](self, "intentsCount"))
  {
    objc_msgSend(v13, "clearIntents");
    v9 = -[BCSCallerIdParquetMessage intentsCount](self, "intentsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BCSCallerIdParquetMessage intentAtIndex:](self, "intentAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addIntent:", v12);

      }
    }
  }
  if (self->_logoFormat)
    objc_msgSend(v13, "setLogoFormat:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_phoneHash;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_names;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addName:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  v15 = -[NSData copyWithZone:](self->_logo, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_isVerified;
    *(_BYTE *)(v6 + 60) |= 2u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = self->_intents;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v6, "addIntent:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_logoFormat, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *phoneNumber;
  NSMutableArray *names;
  NSData *logo;
  NSMutableArray *intents;
  NSString *logoFormat;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_phoneHash != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_25;
  }
  phoneNumber = self->_phoneNumber;
  if ((unint64_t)phoneNumber | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](phoneNumber, "isEqual:"))
  {
    goto LABEL_25;
  }
  names = self->_names;
  if ((unint64_t)names | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](names, "isEqual:"))
      goto LABEL_25;
  }
  logo = self->_logo;
  if ((unint64_t)logo | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](logo, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_25;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_21;
    }
LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
    goto LABEL_25;
LABEL_21:
  intents = self->_intents;
  if ((unint64_t)intents | *((_QWORD *)v4 + 2) && !-[NSMutableArray isEqual:](intents, "isEqual:"))
    goto LABEL_25;
  logoFormat = self->_logoFormat;
  if ((unint64_t)logoFormat | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](logoFormat, "isEqual:");
  else
    v10 = 1;
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_phoneHash;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_phoneNumber, "hash");
  v5 = -[NSMutableArray hash](self->_names, "hash");
  v6 = -[NSData hash](self->_logo, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_isVerified;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSMutableArray hash](self->_intents, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_logoFormat, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_phoneHash = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[6])
    -[BCSCallerIdParquetMessage setPhoneNumber:](self, "setPhoneNumber:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v5 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[BCSCallerIdParquetMessage addName:](self, "addName:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 3))
    -[BCSCallerIdParquetMessage setLogo:](self, "setLogo:");
  if ((*((_BYTE *)v5 + 60) & 2) != 0)
  {
    self->_isVerified = *((_BYTE *)v5 + 56);
    *(_BYTE *)&self->_has |= 2u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[BCSCallerIdParquetMessage addIntent:](self, "addIntent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v5 + 4))
    -[BCSCallerIdParquetMessage setLogoFormat:](self, "setLogoFormat:");

}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (NSData)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSMutableArray)intents
{
  return self->_intents;
}

- (void)setIntents:(id)a3
{
  objc_storeStrong((id *)&self->_intents, a3);
}

- (NSString)logoFormat
{
  return self->_logoFormat;
}

- (void)setLogoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_logoFormat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_logoFormat, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_intents, 0);
}

@end
