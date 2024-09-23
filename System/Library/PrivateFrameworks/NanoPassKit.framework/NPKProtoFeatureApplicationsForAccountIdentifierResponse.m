@implementation NPKProtoFeatureApplicationsForAccountIdentifierResponse

- (void)clearDeprecatedFeatureApplications
{
  -[NSMutableArray removeAllObjects](self->_deprecatedFeatureApplications, "removeAllObjects");
}

- (void)addDeprecatedFeatureApplications:(id)a3
{
  id v4;
  NSMutableArray *deprecatedFeatureApplications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  v8 = v4;
  if (!deprecatedFeatureApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_deprecatedFeatureApplications;
    self->_deprecatedFeatureApplications = v6;

    v4 = v8;
    deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  }
  -[NSMutableArray addObject:](deprecatedFeatureApplications, "addObject:", v4);

}

- (unint64_t)deprecatedFeatureApplicationsCount
{
  return -[NSMutableArray count](self->_deprecatedFeatureApplications, "count");
}

- (id)deprecatedFeatureApplicationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_deprecatedFeatureApplications, "objectAtIndex:", a3);
}

+ (Class)deprecatedFeatureApplicationsType
{
  return (Class)objc_opt_class();
}

- (void)clearFeatureApplications
{
  -[NSMutableArray removeAllObjects](self->_featureApplications, "removeAllObjects");
}

- (void)addFeatureApplications:(id)a3
{
  id v4;
  NSMutableArray *featureApplications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  featureApplications = self->_featureApplications;
  v8 = v4;
  if (!featureApplications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_featureApplications;
    self->_featureApplications = v6;

    v4 = v8;
    featureApplications = self->_featureApplications;
  }
  -[NSMutableArray addObject:](featureApplications, "addObject:", v4);

}

- (unint64_t)featureApplicationsCount
{
  return -[NSMutableArray count](self->_featureApplications, "count");
}

- (id)featureApplicationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_featureApplications, "objectAtIndex:", a3);
}

+ (Class)featureApplicationsType
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
  v8.super_class = (Class)NPKProtoFeatureApplicationsForAccountIdentifierResponse;
  -[NPKProtoFeatureApplicationsForAccountIdentifierResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoFeatureApplicationsForAccountIdentifierResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *deprecatedFeatureApplications;
  NSMutableArray *featureApplications;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deprecatedFeatureApplications = self->_deprecatedFeatureApplications;
  if (deprecatedFeatureApplications)
    objc_msgSend(v3, "setObject:forKey:", deprecatedFeatureApplications, CFSTR("deprecatedFeatureApplications"));
  featureApplications = self->_featureApplications;
  if (featureApplications)
    objc_msgSend(v4, "setObject:forKey:", featureApplications, CFSTR("featureApplications"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoFeatureApplicationsForAccountIdentifierResponseReadFrom(self, (uint64_t)a3);
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
  v5 = self->_deprecatedFeatureApplications;
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
  v10 = self->_featureApplications;
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
  if (-[NPKProtoFeatureApplicationsForAccountIdentifierResponse deprecatedFeatureApplicationsCount](self, "deprecatedFeatureApplicationsCount"))
  {
    objc_msgSend(v12, "clearDeprecatedFeatureApplications");
    v4 = -[NPKProtoFeatureApplicationsForAccountIdentifierResponse deprecatedFeatureApplicationsCount](self, "deprecatedFeatureApplicationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoFeatureApplicationsForAccountIdentifierResponse deprecatedFeatureApplicationsAtIndex:](self, "deprecatedFeatureApplicationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDeprecatedFeatureApplications:", v7);

      }
    }
  }
  if (-[NPKProtoFeatureApplicationsForAccountIdentifierResponse featureApplicationsCount](self, "featureApplicationsCount"))
  {
    objc_msgSend(v12, "clearFeatureApplications");
    v8 = -[NPKProtoFeatureApplicationsForAccountIdentifierResponse featureApplicationsCount](self, "featureApplicationsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoFeatureApplicationsForAccountIdentifierResponse featureApplicationsAtIndex:](self, "featureApplicationsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addFeatureApplications:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_deprecatedFeatureApplications;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addDeprecatedFeatureApplications:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_featureApplications;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addFeatureApplications:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *deprecatedFeatureApplications;
  NSMutableArray *featureApplications;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((deprecatedFeatureApplications = self->_deprecatedFeatureApplications,
         !((unint64_t)deprecatedFeatureApplications | v4[1]))
     || -[NSMutableArray isEqual:](deprecatedFeatureApplications, "isEqual:")))
  {
    featureApplications = self->_featureApplications;
    if ((unint64_t)featureApplications | v4[2])
      v7 = -[NSMutableArray isEqual:](featureApplications, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableArray hash](self->_deprecatedFeatureApplications, "hash");
  return -[NSMutableArray hash](self->_featureApplications, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
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
  v4 = (id *)a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        -[NPKProtoFeatureApplicationsForAccountIdentifierResponse addDeprecatedFeatureApplications:](self, "addDeprecatedFeatureApplications:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
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
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoFeatureApplicationsForAccountIdentifierResponse addFeatureApplications:](self, "addFeatureApplications:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSMutableArray)deprecatedFeatureApplications
{
  return self->_deprecatedFeatureApplications;
}

- (void)setDeprecatedFeatureApplications:(id)a3
{
  objc_storeStrong((id *)&self->_deprecatedFeatureApplications, a3);
}

- (NSMutableArray)featureApplications
{
  return self->_featureApplications;
}

- (void)setFeatureApplications:(id)a3
{
  objc_storeStrong((id *)&self->_featureApplications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_deprecatedFeatureApplications, 0);
}

@end
