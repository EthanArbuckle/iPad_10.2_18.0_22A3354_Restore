@implementation NPKProtoDeviceDidRegisterRequest

- (void)clearTsmRegionPushTopics
{
  -[NSMutableArray removeAllObjects](self->_tsmRegionPushTopics, "removeAllObjects");
}

- (void)addTsmRegionPushTopics:(id)a3
{
  id v4;
  NSMutableArray *tsmRegionPushTopics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tsmRegionPushTopics = self->_tsmRegionPushTopics;
  v8 = v4;
  if (!tsmRegionPushTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_tsmRegionPushTopics;
    self->_tsmRegionPushTopics = v6;

    v4 = v8;
    tsmRegionPushTopics = self->_tsmRegionPushTopics;
  }
  -[NSMutableArray addObject:](tsmRegionPushTopics, "addObject:", v4);

}

- (unint64_t)tsmRegionPushTopicsCount
{
  return -[NSMutableArray count](self->_tsmRegionPushTopics, "count");
}

- (id)tsmRegionPushTopicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tsmRegionPushTopics, "objectAtIndex:", a3);
}

+ (Class)tsmRegionPushTopicsType
{
  return (Class)objc_opt_class();
}

- (void)clearTsmRegionURLs
{
  -[NSMutableArray removeAllObjects](self->_tsmRegionURLs, "removeAllObjects");
}

- (void)addTsmRegionURLs:(id)a3
{
  id v4;
  NSMutableArray *tsmRegionURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tsmRegionURLs = self->_tsmRegionURLs;
  v8 = v4;
  if (!tsmRegionURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_tsmRegionURLs;
    self->_tsmRegionURLs = v6;

    v4 = v8;
    tsmRegionURLs = self->_tsmRegionURLs;
  }
  -[NSMutableArray addObject:](tsmRegionURLs, "addObject:", v4);

}

- (unint64_t)tsmRegionURLsCount
{
  return -[NSMutableArray count](self->_tsmRegionURLs, "count");
}

- (id)tsmRegionURLsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tsmRegionURLs, "objectAtIndex:", a3);
}

+ (Class)tsmRegionURLsType
{
  return (Class)objc_opt_class();
}

- (void)clearBrokerRegionPushTopics
{
  -[NSMutableArray removeAllObjects](self->_brokerRegionPushTopics, "removeAllObjects");
}

- (void)addBrokerRegionPushTopics:(id)a3
{
  id v4;
  NSMutableArray *brokerRegionPushTopics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  brokerRegionPushTopics = self->_brokerRegionPushTopics;
  v8 = v4;
  if (!brokerRegionPushTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_brokerRegionPushTopics;
    self->_brokerRegionPushTopics = v6;

    v4 = v8;
    brokerRegionPushTopics = self->_brokerRegionPushTopics;
  }
  -[NSMutableArray addObject:](brokerRegionPushTopics, "addObject:", v4);

}

- (unint64_t)brokerRegionPushTopicsCount
{
  return -[NSMutableArray count](self->_brokerRegionPushTopics, "count");
}

- (id)brokerRegionPushTopicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_brokerRegionPushTopics, "objectAtIndex:", a3);
}

+ (Class)brokerRegionPushTopicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPrimaryRegionTopic
{
  return self->_primaryRegionTopic != 0;
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
  v8.super_class = (Class)NPKProtoDeviceDidRegisterRequest;
  -[NPKProtoDeviceDidRegisterRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoDeviceDidRegisterRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *tsmRegionPushTopics;
  NSMutableArray *tsmRegionURLs;
  NSMutableArray *brokerRegionPushTopics;
  NSString *primaryRegionTopic;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tsmRegionPushTopics = self->_tsmRegionPushTopics;
  if (tsmRegionPushTopics)
    objc_msgSend(v3, "setObject:forKey:", tsmRegionPushTopics, CFSTR("tsmRegionPushTopics"));
  tsmRegionURLs = self->_tsmRegionURLs;
  if (tsmRegionURLs)
    objc_msgSend(v4, "setObject:forKey:", tsmRegionURLs, CFSTR("tsmRegionURLs"));
  brokerRegionPushTopics = self->_brokerRegionPushTopics;
  if (brokerRegionPushTopics)
    objc_msgSend(v4, "setObject:forKey:", brokerRegionPushTopics, CFSTR("brokerRegionPushTopics"));
  primaryRegionTopic = self->_primaryRegionTopic;
  if (primaryRegionTopic)
    objc_msgSend(v4, "setObject:forKey:", primaryRegionTopic, CFSTR("primaryRegionTopic"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDeviceDidRegisterRequestReadFrom(self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_tsmRegionPushTopics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_tsmRegionURLs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_brokerRegionPushTopics;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_primaryRegionTopic)
    PBDataWriterWriteStringField();

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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id v16;

  v16 = a3;
  if (-[NPKProtoDeviceDidRegisterRequest tsmRegionPushTopicsCount](self, "tsmRegionPushTopicsCount"))
  {
    objc_msgSend(v16, "clearTsmRegionPushTopics");
    v4 = -[NPKProtoDeviceDidRegisterRequest tsmRegionPushTopicsCount](self, "tsmRegionPushTopicsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoDeviceDidRegisterRequest tsmRegionPushTopicsAtIndex:](self, "tsmRegionPushTopicsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTsmRegionPushTopics:", v7);

      }
    }
  }
  if (-[NPKProtoDeviceDidRegisterRequest tsmRegionURLsCount](self, "tsmRegionURLsCount"))
  {
    objc_msgSend(v16, "clearTsmRegionURLs");
    v8 = -[NPKProtoDeviceDidRegisterRequest tsmRegionURLsCount](self, "tsmRegionURLsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NPKProtoDeviceDidRegisterRequest tsmRegionURLsAtIndex:](self, "tsmRegionURLsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTsmRegionURLs:", v11);

      }
    }
  }
  if (-[NPKProtoDeviceDidRegisterRequest brokerRegionPushTopicsCount](self, "brokerRegionPushTopicsCount"))
  {
    objc_msgSend(v16, "clearBrokerRegionPushTopics");
    v12 = -[NPKProtoDeviceDidRegisterRequest brokerRegionPushTopicsCount](self, "brokerRegionPushTopicsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NPKProtoDeviceDidRegisterRequest brokerRegionPushTopicsAtIndex:](self, "brokerRegionPushTopicsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addBrokerRegionPushTopics:", v15);

      }
    }
  }
  if (self->_primaryRegionTopic)
    objc_msgSend(v16, "setPrimaryRegionTopic:");

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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = self->_tsmRegionPushTopics;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addTsmRegionPushTopics:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_tsmRegionURLs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addTsmRegionURLs:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_brokerRegionPushTopics;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addBrokerRegionPushTopics:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_primaryRegionTopic, "copyWithZone:", a3);
  v25 = (void *)v5[2];
  v5[2] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *tsmRegionPushTopics;
  NSMutableArray *tsmRegionURLs;
  NSMutableArray *brokerRegionPushTopics;
  NSString *primaryRegionTopic;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((tsmRegionPushTopics = self->_tsmRegionPushTopics, !((unint64_t)tsmRegionPushTopics | v4[3]))
     || -[NSMutableArray isEqual:](tsmRegionPushTopics, "isEqual:"))
    && ((tsmRegionURLs = self->_tsmRegionURLs, !((unint64_t)tsmRegionURLs | v4[4]))
     || -[NSMutableArray isEqual:](tsmRegionURLs, "isEqual:"))
    && ((brokerRegionPushTopics = self->_brokerRegionPushTopics, !((unint64_t)brokerRegionPushTopics | v4[1]))
     || -[NSMutableArray isEqual:](brokerRegionPushTopics, "isEqual:")))
  {
    primaryRegionTopic = self->_primaryRegionTopic;
    if ((unint64_t)primaryRegionTopic | v4[2])
      v9 = -[NSString isEqual:](primaryRegionTopic, "isEqual:");
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

  v3 = -[NSMutableArray hash](self->_tsmRegionPushTopics, "hash");
  v4 = -[NSMutableArray hash](self->_tsmRegionURLs, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_brokerRegionPushTopics, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_primaryRegionTopic, "hash");
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[NPKProtoDeviceDidRegisterRequest addTsmRegionPushTopics:](self, "addTsmRegionPushTopics:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[4];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoDeviceDidRegisterRequest addTsmRegionURLs:](self, "addTsmRegionURLs:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[1];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NPKProtoDeviceDidRegisterRequest addBrokerRegionPushTopics:](self, "addBrokerRegionPushTopics:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (v4[2])
    -[NPKProtoDeviceDidRegisterRequest setPrimaryRegionTopic:](self, "setPrimaryRegionTopic:");

}

- (NSMutableArray)tsmRegionPushTopics
{
  return self->_tsmRegionPushTopics;
}

- (void)setTsmRegionPushTopics:(id)a3
{
  objc_storeStrong((id *)&self->_tsmRegionPushTopics, a3);
}

- (NSMutableArray)tsmRegionURLs
{
  return self->_tsmRegionURLs;
}

- (void)setTsmRegionURLs:(id)a3
{
  objc_storeStrong((id *)&self->_tsmRegionURLs, a3);
}

- (NSMutableArray)brokerRegionPushTopics
{
  return self->_brokerRegionPushTopics;
}

- (void)setBrokerRegionPushTopics:(id)a3
{
  objc_storeStrong((id *)&self->_brokerRegionPushTopics, a3);
}

- (NSString)primaryRegionTopic
{
  return self->_primaryRegionTopic;
}

- (void)setPrimaryRegionTopic:(id)a3
{
  objc_storeStrong((id *)&self->_primaryRegionTopic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tsmRegionURLs, 0);
  objc_storeStrong((id *)&self->_tsmRegionPushTopics, 0);
  objc_storeStrong((id *)&self->_primaryRegionTopic, 0);
  objc_storeStrong((id *)&self->_brokerRegionPushTopics, 0);
}

@end
