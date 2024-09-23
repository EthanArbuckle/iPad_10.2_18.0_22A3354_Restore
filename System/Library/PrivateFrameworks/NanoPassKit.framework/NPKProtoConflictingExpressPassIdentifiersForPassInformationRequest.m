@implementation NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest

- (BOOL)hasExpressPassInformation
{
  return self->_expressPassInformation != 0;
}

- (void)clearReferenceExpressPassesInformations
{
  -[NSMutableArray removeAllObjects](self->_referenceExpressPassesInformations, "removeAllObjects");
}

- (void)addReferenceExpressPassesInformation:(id)a3
{
  id v4;
  NSMutableArray *referenceExpressPassesInformations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  v8 = v4;
  if (!referenceExpressPassesInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_referenceExpressPassesInformations;
    self->_referenceExpressPassesInformations = v6;

    v4 = v8;
    referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  }
  -[NSMutableArray addObject:](referenceExpressPassesInformations, "addObject:", v4);

}

- (unint64_t)referenceExpressPassesInformationsCount
{
  return -[NSMutableArray count](self->_referenceExpressPassesInformations, "count");
}

- (id)referenceExpressPassesInformationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_referenceExpressPassesInformations, "objectAtIndex:", a3);
}

+ (Class)referenceExpressPassesInformationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasExpressPassConfiguration
{
  return self->_expressPassConfiguration != 0;
}

- (void)clearReferenceExpressPassConfigurations
{
  -[NSMutableArray removeAllObjects](self->_referenceExpressPassConfigurations, "removeAllObjects");
}

- (void)addReferenceExpressPassConfigurations:(id)a3
{
  id v4;
  NSMutableArray *referenceExpressPassConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  v8 = v4;
  if (!referenceExpressPassConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_referenceExpressPassConfigurations;
    self->_referenceExpressPassConfigurations = v6;

    v4 = v8;
    referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  }
  -[NSMutableArray addObject:](referenceExpressPassConfigurations, "addObject:", v4);

}

- (unint64_t)referenceExpressPassConfigurationsCount
{
  return -[NSMutableArray count](self->_referenceExpressPassConfigurations, "count");
}

- (id)referenceExpressPassConfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_referenceExpressPassConfigurations, "objectAtIndex:", a3);
}

+ (Class)referenceExpressPassConfigurationsType
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
  v8.super_class = (Class)NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest;
  -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *expressPassInformation;
  NSMutableArray *referenceExpressPassesInformations;
  NSData *expressPassConfiguration;
  NSMutableArray *referenceExpressPassConfigurations;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  expressPassInformation = self->_expressPassInformation;
  if (expressPassInformation)
    objc_msgSend(v3, "setObject:forKey:", expressPassInformation, CFSTR("expressPassInformation"));
  referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  if (referenceExpressPassesInformations)
    objc_msgSend(v4, "setObject:forKey:", referenceExpressPassesInformations, CFSTR("referenceExpressPassesInformation"));
  expressPassConfiguration = self->_expressPassConfiguration;
  if (expressPassConfiguration)
    objc_msgSend(v4, "setObject:forKey:", expressPassConfiguration, CFSTR("expressPassConfiguration"));
  referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  if (referenceExpressPassConfigurations)
    objc_msgSend(v4, "setObject:forKey:", referenceExpressPassConfigurations, CFSTR("referenceExpressPassConfigurations"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoConflictingExpressPassIdentifiersForPassInformationRequestReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_expressPassInformation)
    PBDataWriterWriteDataField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_referenceExpressPassesInformations;
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

  if (self->_expressPassConfiguration)
    PBDataWriterWriteDataField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_referenceExpressPassConfigurations;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_expressPassInformation)
    objc_msgSend(v12, "setExpressPassInformation:");
  if (-[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassesInformationsCount](self, "referenceExpressPassesInformationsCount"))
  {
    objc_msgSend(v12, "clearReferenceExpressPassesInformations");
    v4 = -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassesInformationsCount](self, "referenceExpressPassesInformationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassesInformationAtIndex:](self, "referenceExpressPassesInformationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addReferenceExpressPassesInformation:", v7);

      }
    }
  }
  if (self->_expressPassConfiguration)
    objc_msgSend(v12, "setExpressPassConfiguration:");
  if (-[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassConfigurationsCount](self, "referenceExpressPassConfigurationsCount"))
  {
    objc_msgSend(v12, "clearReferenceExpressPassConfigurations");
    v8 = -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassConfigurationsCount](self, "referenceExpressPassConfigurationsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest referenceExpressPassConfigurationsAtIndex:](self, "referenceExpressPassConfigurationsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addReferenceExpressPassConfigurations:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_expressPassInformation, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_referenceExpressPassesInformations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addReferenceExpressPassesInformation:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_expressPassConfiguration, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_referenceExpressPassConfigurations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addReferenceExpressPassConfigurations:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *expressPassInformation;
  NSMutableArray *referenceExpressPassesInformations;
  NSData *expressPassConfiguration;
  NSMutableArray *referenceExpressPassConfigurations;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((expressPassInformation = self->_expressPassInformation, !((unint64_t)expressPassInformation | v4[2]))
     || -[NSData isEqual:](expressPassInformation, "isEqual:"))
    && ((referenceExpressPassesInformations = self->_referenceExpressPassesInformations,
         !((unint64_t)referenceExpressPassesInformations | v4[4]))
     || -[NSMutableArray isEqual:](referenceExpressPassesInformations, "isEqual:"))
    && ((expressPassConfiguration = self->_expressPassConfiguration,
         !((unint64_t)expressPassConfiguration | v4[1]))
     || -[NSData isEqual:](expressPassConfiguration, "isEqual:")))
  {
    referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
    if ((unint64_t)referenceExpressPassConfigurations | v4[3])
      v9 = -[NSMutableArray isEqual:](referenceExpressPassConfigurations, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_expressPassInformation, "hash");
  v4 = -[NSMutableArray hash](self->_referenceExpressPassesInformations, "hash") ^ v3;
  v5 = -[NSData hash](self->_expressPassConfiguration, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_referenceExpressPassConfigurations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest setExpressPassInformation:](self, "setExpressPassInformation:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest addReferenceExpressPassesInformation:](self, "addReferenceExpressPassesInformation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest setExpressPassConfiguration:](self, "setExpressPassConfiguration:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest addReferenceExpressPassConfigurations:](self, "addReferenceExpressPassConfigurations:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSData)expressPassInformation
{
  return self->_expressPassInformation;
}

- (void)setExpressPassInformation:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassInformation, a3);
}

- (NSMutableArray)referenceExpressPassesInformations
{
  return self->_referenceExpressPassesInformations;
}

- (void)setReferenceExpressPassesInformations:(id)a3
{
  objc_storeStrong((id *)&self->_referenceExpressPassesInformations, a3);
}

- (NSData)expressPassConfiguration
{
  return self->_expressPassConfiguration;
}

- (void)setExpressPassConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassConfiguration, a3);
}

- (NSMutableArray)referenceExpressPassConfigurations
{
  return self->_referenceExpressPassConfigurations;
}

- (void)setReferenceExpressPassConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_referenceExpressPassConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_referenceExpressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_expressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPassConfiguration, 0);
}

@end
