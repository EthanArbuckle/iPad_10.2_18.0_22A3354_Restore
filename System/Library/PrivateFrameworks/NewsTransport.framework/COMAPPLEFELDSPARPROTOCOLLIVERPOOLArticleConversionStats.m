@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStatsReadFrom((char *)self, (uint64_t)a3);
}

- (NSMutableArray)topicConversionStats
{
  return self->_topicConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);
  objc_storeStrong((id *)&self->_channelConversionStats, 0);
}

- (void)clearTopicConversionStats
{
  -[NSMutableArray removeAllObjects](self->_topicConversionStats, "removeAllObjects");
}

- (void)addTopicConversionStats:(id)a3
{
  id v4;
  NSMutableArray *topicConversionStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicConversionStats = self->_topicConversionStats;
  v8 = v4;
  if (!topicConversionStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicConversionStats;
    self->_topicConversionStats = v6;

    v4 = v8;
    topicConversionStats = self->_topicConversionStats;
  }
  -[NSMutableArray addObject:](topicConversionStats, "addObject:", v4);

}

- (unint64_t)topicConversionStatsCount
{
  return -[NSMutableArray count](self->_topicConversionStats, "count");
}

- (id)topicConversionStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicConversionStats, "objectAtIndex:", a3);
}

+ (Class)topicConversionStatsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats;
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  void *v12;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_topicConversionStats, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicConversionStats, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_topicConversionStats;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("topic_conversion_stats"));
  }
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](channelConversionStats, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("channel_conversion_stats"));

  }
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("global_conversion_stats"));

  }
  return v3;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_topicConversionStats;
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

  if (self->_channelConversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_globalConversionStats)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats topicConversionStatsCount](self, "topicConversionStatsCount"))
  {
    objc_msgSend(v9, "clearTopicConversionStats");
    v4 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats topicConversionStatsCount](self, "topicConversionStatsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats topicConversionStatsAtIndex:](self, "topicConversionStatsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTopicConversionStats:", v7);

      }
    }
  }
  if (self->_channelConversionStats)
    objc_msgSend(v9, "setChannelConversionStats:");
  v8 = v9;
  if (self->_globalConversionStats)
  {
    objc_msgSend(v9, "setGlobalConversionStats:");
    v8 = v9;
  }

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
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_topicConversionStats;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addTopicConversionStats:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_channelConversionStats, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_globalConversionStats, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *topicConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topicConversionStats = self->_topicConversionStats, !((unint64_t)topicConversionStats | v4[3]))
     || -[NSMutableArray isEqual:](topicConversionStats, "isEqual:"))
    && ((channelConversionStats = self->_channelConversionStats, !((unint64_t)channelConversionStats | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:")))
  {
    globalConversionStats = self->_globalConversionStats;
    if ((unint64_t)globalConversionStats | v4[2])
      v8 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
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
  unint64_t v4;

  v3 = -[NSMutableArray hash](self->_topicConversionStats, "hash");
  v4 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_channelConversionStats, "hash") ^ v3;
  return v4 ^ -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_globalConversionStats, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  id v11;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats addTopicConversionStats:](self, "addTopicConversionStats:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  channelConversionStats = self->_channelConversionStats;
  v11 = v4[1];
  if (channelConversionStats)
  {
    if (v11)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
  }
  else if (v11)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  v13 = v4[2];
  if (globalConversionStats)
  {
    if (v13)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
  }
  else if (v13)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleConversionStats setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }

}

- (void)setTopicConversionStats:(id)a3
{
  objc_storeStrong((id *)&self->_topicConversionStats, a3);
}

- (void)setChannelConversionStats:(id)a3
{
  objc_storeStrong((id *)&self->_channelConversionStats, a3);
}

- (void)setGlobalConversionStats:(id)a3
{
  objc_storeStrong((id *)&self->_globalConversionStats, a3);
}

@end
