@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores

- (NSMutableArray)topicCohorts
{
  return self->_topicCohorts;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScoresReadFrom((char *)self, (uint64_t)a3);
}

- (void)addTopicCohorts:(id)a3
{
  id v4;
  NSMutableArray *topicCohorts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicCohorts = self->_topicCohorts;
  v8 = v4;
  if (!topicCohorts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicCohorts;
    self->_topicCohorts = v6;

    v4 = v8;
    topicCohorts = self->_topicCohorts;
  }
  -[NSMutableArray addObject:](topicCohorts, "addObject:", v4);

}

- (NSMutableArray)topicCohortScores
{
  return self->_topicCohortScores;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
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
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_topicCohorts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addTopicCohorts:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v12 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_globalCohorts, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_sourceChannelCohorts, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_topicCohortScores;
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
        objc_msgSend(v5, "addTopicCohortScores:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicCohorts, 0);
  objc_storeStrong((id *)&self->_topicCohortScores, 0);
  objc_storeStrong((id *)&self->_sourceChannelCohorts, 0);
  objc_storeStrong((id *)&self->_globalCohorts, 0);
}

- (void)clearTopicCohorts
{
  -[NSMutableArray removeAllObjects](self->_topicCohorts, "removeAllObjects");
}

- (unint64_t)topicCohortsCount
{
  return -[NSMutableArray count](self->_topicCohorts, "count");
}

- (id)topicCohortsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicCohorts, "objectAtIndex:", a3);
}

+ (Class)topicCohortsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (void)clearTopicCohortScores
{
  -[NSMutableArray removeAllObjects](self->_topicCohortScores, "removeAllObjects");
}

- (void)addTopicCohortScores:(id)a3
{
  id v4;
  NSMutableArray *topicCohortScores;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicCohortScores = self->_topicCohortScores;
  v8 = v4;
  if (!topicCohortScores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicCohortScores;
    self->_topicCohortScores = v6;

    v4 = v8;
    topicCohortScores = self->_topicCohortScores;
  }
  -[NSMutableArray addObject:](topicCohortScores, "addObject:", v4);

}

- (unint64_t)topicCohortScoresCount
{
  return -[NSMutableArray count](self->_topicCohortScores, "count");
}

- (id)topicCohortScoresAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicCohortScores, "objectAtIndex:", a3);
}

+ (Class)topicCohortScoresType
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores;
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores dictionaryRepresentation](self, "dictionaryRepresentation");
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
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  void *v12;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_topicCohorts, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicCohorts, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = self->_topicCohorts;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("topic_cohorts"));
  }
  globalCohorts = self->_globalCohorts;
  if (globalCohorts)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("global_cohorts"));

  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](sourceChannelCohorts, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("source_channel_cohorts"));

  }
  if (-[NSMutableArray count](self->_topicCohortScores, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicCohortScores, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_topicCohortScores;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("topic_cohort_scores"));
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
  v5 = self->_topicCohorts;
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

  if (self->_globalCohorts)
    PBDataWriterWriteSubmessage();
  if (self->_sourceChannelCohorts)
    PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_topicCohortScores;
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
  if (-[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortsCount](self, "topicCohortsCount"))
  {
    objc_msgSend(v12, "clearTopicCohorts");
    v4 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortsCount](self, "topicCohortsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortsAtIndex:](self, "topicCohortsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addTopicCohorts:", v7);

      }
    }
  }
  if (self->_globalCohorts)
    objc_msgSend(v12, "setGlobalCohorts:");
  if (self->_sourceChannelCohorts)
    objc_msgSend(v12, "setSourceChannelCohorts:");
  if (-[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortScoresCount](self, "topicCohortScoresCount"))
  {
    objc_msgSend(v12, "clearTopicCohortScores");
    v8 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortScoresCount](self, "topicCohortScoresCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores topicCohortScoresAtIndex:](self, "topicCohortScoresAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addTopicCohortScores:", v11);

      }
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *topicCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  NSMutableArray *topicCohortScores;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topicCohorts = self->_topicCohorts, !((unint64_t)topicCohorts | v4[4]))
     || -[NSMutableArray isEqual:](topicCohorts, "isEqual:"))
    && ((globalCohorts = self->_globalCohorts, !((unint64_t)globalCohorts | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:"))
    && ((sourceChannelCohorts = self->_sourceChannelCohorts, !((unint64_t)sourceChannelCohorts | v4[2]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:")))
  {
    topicCohortScores = self->_topicCohortScores;
    if ((unint64_t)topicCohortScores | v4[3])
      v9 = -[NSMutableArray isEqual:](topicCohortScores, "isEqual:");
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
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSMutableArray hash](self->_topicCohorts, "hash");
  v4 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_globalCohorts, "hash") ^ v3;
  v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_sourceChannelCohorts, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_topicCohortScores, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  id v11;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
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
  v4 = (id *)a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores addTopicCohorts:](self, "addTopicCohorts:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  globalCohorts = self->_globalCohorts;
  v11 = v4[1];
  if (globalCohorts)
  {
    if (v11)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
  }
  else if (v11)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  v13 = v4[2];
  if (sourceChannelCohorts)
  {
    if (v13)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
  }
  else if (v13)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v4[3];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleScores addTopicCohortScores:](self, "addTopicCohortScores:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)setTopicCohorts:(id)a3
{
  objc_storeStrong((id *)&self->_topicCohorts, a3);
}

- (void)setGlobalCohorts:(id)a3
{
  objc_storeStrong((id *)&self->_globalCohorts, a3);
}

- (void)setSourceChannelCohorts:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelCohorts, a3);
}

- (void)setTopicCohortScores:(id)a3
{
  objc_storeStrong((id *)&self->_topicCohortScores, a3);
}

@end
