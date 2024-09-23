@implementation NPKProtoGenerateAuxiliaryCapabilitiesResponse

- (void)clearRequirementKeys
{
  -[NSMutableArray removeAllObjects](self->_requirementKeys, "removeAllObjects");
}

- (void)addRequirementKeys:(id)a3
{
  id v4;
  NSMutableArray *requirementKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requirementKeys = self->_requirementKeys;
  v8 = v4;
  if (!requirementKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_requirementKeys;
    self->_requirementKeys = v6;

    v4 = v8;
    requirementKeys = self->_requirementKeys;
  }
  -[NSMutableArray addObject:](requirementKeys, "addObject:", v4);

}

- (unint64_t)requirementKeysCount
{
  return -[NSMutableArray count](self->_requirementKeys, "count");
}

- (id)requirementKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requirementKeys, "objectAtIndex:", a3);
}

+ (Class)requirementKeysType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyMaterialValues
{
  -[NSMutableArray removeAllObjects](self->_keyMaterialValues, "removeAllObjects");
}

- (void)addKeyMaterialValues:(id)a3
{
  id v4;
  NSMutableArray *keyMaterialValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyMaterialValues = self->_keyMaterialValues;
  v8 = v4;
  if (!keyMaterialValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_keyMaterialValues;
    self->_keyMaterialValues = v6;

    v4 = v8;
    keyMaterialValues = self->_keyMaterialValues;
  }
  -[NSMutableArray addObject:](keyMaterialValues, "addObject:", v4);

}

- (unint64_t)keyMaterialValuesCount
{
  return -[NSMutableArray count](self->_keyMaterialValues, "count");
}

- (id)keyMaterialValuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyMaterialValues, "objectAtIndex:", a3);
}

+ (Class)keyMaterialValuesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)NPKProtoGenerateAuxiliaryCapabilitiesResponse;
  -[NPKProtoGenerateAuxiliaryCapabilitiesResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoGenerateAuxiliaryCapabilitiesResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *requirementKeys;
  NSMutableArray *keyMaterialValues;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requirementKeys = self->_requirementKeys;
  if (requirementKeys)
    objc_msgSend(v3, "setObject:forKey:", requirementKeys, CFSTR("requirementKeys"));
  keyMaterialValues = self->_keyMaterialValues;
  if (keyMaterialValues)
    objc_msgSend(v4, "setObject:forKey:", keyMaterialValues, CFSTR("keyMaterialValues"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateAuxiliaryCapabilitiesResponseReadFrom(self, (uint64_t)a3);
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_requirementKeys;
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
  v10 = self->_keyMaterialValues;
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

  if (self->_errorData)
    PBDataWriterWriteDataField();

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
  if (-[NPKProtoGenerateAuxiliaryCapabilitiesResponse requirementKeysCount](self, "requirementKeysCount"))
  {
    objc_msgSend(v12, "clearRequirementKeys");
    v4 = -[NPKProtoGenerateAuxiliaryCapabilitiesResponse requirementKeysCount](self, "requirementKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoGenerateAuxiliaryCapabilitiesResponse requirementKeysAtIndex:](self, "requirementKeysAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addRequirementKeys:", v7);

      }
    }
  }
  if (-[NPKProtoGenerateAuxiliaryCapabilitiesResponse keyMaterialValuesCount](self, "keyMaterialValuesCount"))
  {
    objc_msgSend(v12, "clearKeyMaterialValues");
    v8 = -[NPKProtoGenerateAuxiliaryCapabilitiesResponse keyMaterialValuesCount](self, "keyMaterialValuesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoGenerateAuxiliaryCapabilitiesResponse keyMaterialValuesAtIndex:](self, "keyMaterialValuesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addKeyMaterialValues:", v11);

      }
    }
  }
  if (self->_errorData)
    objc_msgSend(v12, "setErrorData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_requirementKeys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addRequirementKeys:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_keyMaterialValues;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addKeyMaterialValues:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v18 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v19 = (void *)v5[1];
  v5[1] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *requirementKeys;
  NSMutableArray *keyMaterialValues;
  NSData *errorData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requirementKeys = self->_requirementKeys, !((unint64_t)requirementKeys | v4[3]))
     || -[NSMutableArray isEqual:](requirementKeys, "isEqual:"))
    && ((keyMaterialValues = self->_keyMaterialValues, !((unint64_t)keyMaterialValues | v4[2]))
     || -[NSMutableArray isEqual:](keyMaterialValues, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1])
      v8 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_requirementKeys, "hash");
  v4 = -[NSMutableArray hash](self->_keyMaterialValues, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_errorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[3];
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
        -[NPKProtoGenerateAuxiliaryCapabilitiesResponse addRequirementKeys:](self, "addRequirementKeys:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[2];
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
        -[NPKProtoGenerateAuxiliaryCapabilitiesResponse addKeyMaterialValues:](self, "addKeyMaterialValues:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (v4[1])
    -[NPKProtoGenerateAuxiliaryCapabilitiesResponse setErrorData:](self, "setErrorData:");

}

- (NSMutableArray)requirementKeys
{
  return self->_requirementKeys;
}

- (void)setRequirementKeys:(id)a3
{
  objc_storeStrong((id *)&self->_requirementKeys, a3);
}

- (NSMutableArray)keyMaterialValues
{
  return self->_keyMaterialValues;
}

- (void)setKeyMaterialValues:(id)a3
{
  objc_storeStrong((id *)&self->_keyMaterialValues, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementKeys, 0);
  objc_storeStrong((id *)&self->_keyMaterialValues, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
