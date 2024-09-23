@implementation NPKProtoRemotePassUpdateResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPass
{
  return self->_pass != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (int)upgradeStatus
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_upgradeStatus;
  else
    return 0;
}

- (void)setUpgradeStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_upgradeStatus = a3;
}

- (void)setHasUpgradeStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUpgradeStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)upgradeStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_24CFEDF58[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUpgradeStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KeepAlive")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpgradeStarted")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpgradeCompleted")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ExpressModeSetupCompleted")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearExpressPassInformations
{
  -[NSMutableArray removeAllObjects](self->_expressPassInformations, "removeAllObjects");
}

- (void)addExpressPassInformation:(id)a3
{
  id v4;
  NSMutableArray *expressPassInformations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  expressPassInformations = self->_expressPassInformations;
  v8 = v4;
  if (!expressPassInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_expressPassInformations;
    self->_expressPassInformations = v6;

    v4 = v8;
    expressPassInformations = self->_expressPassInformations;
  }
  -[NSMutableArray addObject:](expressPassInformations, "addObject:", v4);

}

- (unint64_t)expressPassInformationsCount
{
  return -[NSMutableArray count](self->_expressPassInformations, "count");
}

- (id)expressPassInformationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_expressPassInformations, "objectAtIndex:", a3);
}

+ (Class)expressPassInformationType
{
  return (Class)objc_opt_class();
}

- (void)clearExpressPassConfigurations
{
  -[NSMutableArray removeAllObjects](self->_expressPassConfigurations, "removeAllObjects");
}

- (void)addExpressPassConfiguration:(id)a3
{
  id v4;
  NSMutableArray *expressPassConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  expressPassConfigurations = self->_expressPassConfigurations;
  v8 = v4;
  if (!expressPassConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_expressPassConfigurations;
    self->_expressPassConfigurations = v6;

    v4 = v8;
    expressPassConfigurations = self->_expressPassConfigurations;
  }
  -[NSMutableArray addObject:](expressPassConfigurations, "addObject:", v4);

}

- (unint64_t)expressPassConfigurationsCount
{
  return -[NSMutableArray count](self->_expressPassConfigurations, "count");
}

- (id)expressPassConfigurationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_expressPassConfigurations, "objectAtIndex:", a3);
}

+ (Class)expressPassConfigurationType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NPKProtoRemotePassUpdateResponse;
  -[NPKProtoRemotePassUpdateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassUpdateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NPKProtoPass *pass;
  void *v6;
  NSData *errorData;
  uint64_t upgradeStatus;
  __CFString *v9;
  NSMutableArray *expressPassInformations;
  NSMutableArray *expressPassConfigurations;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  pass = self->_pass;
  if (pass)
  {
    -[NPKProtoPass dictionaryRepresentation](pass, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("pass"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    upgradeStatus = self->_upgradeStatus;
    if (upgradeStatus >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_upgradeStatus);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_24CFEDF58[upgradeStatus];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("upgradeStatus"));

  }
  expressPassInformations = self->_expressPassInformations;
  if (expressPassInformations)
    objc_msgSend(v3, "setObject:forKey:", expressPassInformations, CFSTR("expressPassInformation"));
  expressPassConfigurations = self->_expressPassConfigurations;
  if (expressPassConfigurations)
    objc_msgSend(v3, "setObject:forKey:", expressPassConfigurations, CFSTR("expressPassConfiguration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_pass)
    PBDataWriterWriteSubmessage();
  if (self->_errorData)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_expressPassInformations;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_expressPassConfigurations;
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
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[44] = self->_pending;
    v4[48] |= 2u;
  }
  v13 = v4;
  if (self->_pass)
  {
    objc_msgSend(v4, "setPass:");
    v4 = v13;
  }
  if (self->_errorData)
  {
    objc_msgSend(v13, "setErrorData:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_upgradeStatus;
    v4[48] |= 1u;
  }
  if (-[NPKProtoRemotePassUpdateResponse expressPassInformationsCount](self, "expressPassInformationsCount"))
  {
    objc_msgSend(v13, "clearExpressPassInformations");
    v5 = -[NPKProtoRemotePassUpdateResponse expressPassInformationsCount](self, "expressPassInformationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NPKProtoRemotePassUpdateResponse expressPassInformationAtIndex:](self, "expressPassInformationAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addExpressPassInformation:", v8);

      }
    }
  }
  if (-[NPKProtoRemotePassUpdateResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount"))
  {
    objc_msgSend(v13, "clearExpressPassConfigurations");
    v9 = -[NPKProtoRemotePassUpdateResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NPKProtoRemotePassUpdateResponse expressPassConfigurationAtIndex:](self, "expressPassConfigurationAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addExpressPassConfiguration:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_pending;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v7 = -[NPKProtoPass copyWithZone:](self->_pass, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_upgradeStatus;
    *(_BYTE *)(v6 + 48) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_expressPassInformations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addExpressPassInformation:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_expressPassConfigurations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v6, "addExpressPassConfiguration:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoPass *pass;
  NSData *errorData;
  NSMutableArray *expressPassInformations;
  NSMutableArray *expressPassConfigurations;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_23;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_10;
    }
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 48) & 2) != 0)
    goto LABEL_23;
LABEL_10:
  pass = self->_pass;
  if ((unint64_t)pass | *((_QWORD *)v4 + 4) && !-[NPKProtoPass isEqual:](pass, "isEqual:"))
    goto LABEL_23;
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_upgradeStatus != *((_DWORD *)v4 + 10))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_23;
  }
  expressPassInformations = self->_expressPassInformations;
  if ((unint64_t)expressPassInformations | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](expressPassInformations, "isEqual:"))
  {
    goto LABEL_23;
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((_QWORD *)v4 + 2))
    v9 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  else
    v9 = 1;
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NPKProtoPass hash](self->_pass, "hash");
  v5 = -[NSData hash](self->_errorData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_upgradeStatus;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSMutableArray hash](self->_expressPassInformations, "hash");
  return v7 ^ v8 ^ -[NSMutableArray hash](self->_expressPassConfigurations, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  id v5;
  NPKProtoPass *pass;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[48] & 2) != 0)
  {
    self->_pending = v4[44];
    *(_BYTE *)&self->_has |= 2u;
  }
  pass = self->_pass;
  v7 = *((_QWORD *)v5 + 4);
  if (pass)
  {
    if (v7)
      -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
  }
  else if (v7)
  {
    -[NPKProtoRemotePassUpdateResponse setPass:](self, "setPass:");
  }
  if (*((_QWORD *)v5 + 1))
    -[NPKProtoRemotePassUpdateResponse setErrorData:](self, "setErrorData:");
  if ((*((_BYTE *)v5 + 48) & 1) != 0)
  {
    self->_upgradeStatus = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = *((id *)v5 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[NPKProtoRemotePassUpdateResponse addExpressPassInformation:](self, "addExpressPassInformation:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v5 + 2);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[NPKProtoRemotePassUpdateResponse addExpressPassConfiguration:](self, "addExpressPassConfiguration:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (NSMutableArray)expressPassInformations
{
  return self->_expressPassInformations;
}

- (void)setExpressPassInformations:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassInformations, a3);
}

- (NSMutableArray)expressPassConfigurations
{
  return self->_expressPassConfigurations;
}

- (void)setExpressPassConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_expressPassInformations, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
