@implementation AWDHomeKitCameraConfigurationData

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

- (void)clearHomeConfigurations
{
  -[NSMutableArray removeAllObjects](self->_homeConfigurations, "removeAllObjects");
}

- (void)addHomeConfigurations:(id)a3
{
  id v4;
  NSMutableArray *homeConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeConfigurations = self->_homeConfigurations;
  v8 = v4;
  if (!homeConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_homeConfigurations;
    self->_homeConfigurations = v6;

    v4 = v8;
    homeConfigurations = self->_homeConfigurations;
  }
  -[NSMutableArray addObject:](homeConfigurations, "addObject:", v4);

}

- (unint64_t)homeConfigurationsCount
{
  return -[NSMutableArray count](self->_homeConfigurations, "count");
}

- (id)homeConfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeConfigurations, "objectAtIndex:", a3);
}

- (void)setIsDemoConfiguration:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isDemoConfiguration = a3;
}

- (void)setHasIsDemoConfiguration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsDemoConfiguration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDHomeKitCameraConfigurationData;
  -[AWDHomeKitCameraConfigurationData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraConfigurationData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_homeConfigurations, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_homeConfigurations, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_homeConfigurations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("homeConfigurations"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDemoConfiguration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isDemoConfiguration"));

  }
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  AWDHomeKitHomeCameraConfigurations *v31;
  int v32;

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
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v28 = *v4;
          v29 = *(_QWORD *)((char *)a3 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
          *(_QWORD *)((char *)a3 + v28) = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0)
            goto LABEL_45;
          v25 += 7;
          v15 = v26++ >= 9;
          if (v15)
          {
            v27 = 0;
            goto LABEL_47;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_45:
        if (*((_BYTE *)a3 + *v6))
          v27 = 0;
LABEL_47:
        self->_isDemoConfiguration = v27 != 0;
      }
      else if ((_DWORD)v18 == 2)
      {
        v31 = objc_alloc_init(AWDHomeKitHomeCameraConfigurations);
        -[AWDHomeKitCameraConfigurationData addHomeConfigurations:](self, "addHomeConfigurations:", v31);
        if (!PBReaderPlaceMark()
          || (AWDHomeKitHomeCameraConfigurationsReadFrom((uint64_t)v31, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v32) = 0;
          return v32;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v18 == 1)
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
            goto LABEL_41;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            v21 = 0;
            goto LABEL_43;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_41:
        if (*((_BYTE *)a3 + *v6))
          v21 = 0;
LABEL_43:
        self->_timestamp = v21;
      }
      else
      {
        v32 = PBReaderSkipValueWithTag();
        if (!v32)
          return v32;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v32) = *((_BYTE *)a3 + *v6) == 0;
  return v32;
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
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_homeConfigurations;
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

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v9 = v4;
  if (-[AWDHomeKitCameraConfigurationData homeConfigurationsCount](self, "homeConfigurationsCount"))
  {
    objc_msgSend(v9, "clearHomeConfigurations");
    v5 = -[AWDHomeKitCameraConfigurationData homeConfigurationsCount](self, "homeConfigurationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[AWDHomeKitCameraConfigurationData homeConfigurationsAtIndex:](self, "homeConfigurationsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addHomeConfigurations:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9[24] = self->_isDemoConfiguration;
    v9[28] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _BYTE *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_BYTE *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_homeConfigurations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addHomeConfigurations:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[24] = self->_isDemoConfiguration;
    v6[28] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *homeConfigurations;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 28);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_12;
  }
  homeConfigurations = self->_homeConfigurations;
  if ((unint64_t)homeConfigurations | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](homeConfigurations, "isEqual:"))
      goto LABEL_12;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 28);
  }
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_isDemoConfiguration)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_12;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_12;
      }
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_homeConfigurations, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_isDemoConfiguration;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BOOL *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (BOOL *)v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[AWDHomeKitCameraConfigurationData addHomeConfigurations:](self, "addHomeConfigurations:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((v5[28] & 2) != 0)
  {
    self->_isDemoConfiguration = v5[24];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)homeConfigurations
{
  return self->_homeConfigurations;
}

- (void)setHomeConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_homeConfigurations, a3);
}

- (BOOL)isDemoConfiguration
{
  return self->_isDemoConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeConfigurations, 0);
}

+ (Class)homeConfigurationsType
{
  return (Class)objc_opt_class();
}

@end
