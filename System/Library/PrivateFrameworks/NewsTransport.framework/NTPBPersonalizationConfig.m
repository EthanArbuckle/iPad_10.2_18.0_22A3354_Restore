@implementation NTPBPersonalizationConfig

- (BOOL)hasBinningConfig
{
  return self->_binningConfig != 0;
}

- (void)setModuloForHashing:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_moduloForHashing = a3;
}

- (void)setHasModuloForHashing:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuloForHashing
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDefaultPersonalizationTreatment
{
  return self->_defaultPersonalizationTreatment != 0;
}

- (void)clearPersonalizationBuckets
{
  -[NSMutableArray removeAllObjects](self->_personalizationBuckets, "removeAllObjects");
}

- (void)addPersonalizationBuckets:(id)a3
{
  id v4;
  NSMutableArray *personalizationBuckets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  personalizationBuckets = self->_personalizationBuckets;
  v8 = v4;
  if (!personalizationBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_personalizationBuckets;
    self->_personalizationBuckets = v6;

    v4 = v8;
    personalizationBuckets = self->_personalizationBuckets;
  }
  -[NSMutableArray addObject:](personalizationBuckets, "addObject:", v4);

}

- (unint64_t)personalizationBucketsCount
{
  return -[NSMutableArray count](self->_personalizationBuckets, "count");
}

- (id)personalizationBucketsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personalizationBuckets, "objectAtIndex:", a3);
}

+ (Class)personalizationBucketsType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizationTreatments
{
  -[NSMutableArray removeAllObjects](self->_personalizationTreatments, "removeAllObjects");
}

- (void)addPersonalizationTreatments:(id)a3
{
  id v4;
  NSMutableArray *personalizationTreatments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  personalizationTreatments = self->_personalizationTreatments;
  v8 = v4;
  if (!personalizationTreatments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_personalizationTreatments;
    self->_personalizationTreatments = v6;

    v4 = v8;
    personalizationTreatments = self->_personalizationTreatments;
  }
  -[NSMutableArray addObject:](personalizationTreatments, "addObject:", v4);

}

- (unint64_t)personalizationTreatmentsCount
{
  return -[NSMutableArray count](self->_personalizationTreatments, "count");
}

- (id)personalizationTreatmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personalizationTreatments, "objectAtIndex:", a3);
}

+ (Class)personalizationTreatmentsType
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
  v8.super_class = (Class)NTPBPersonalizationConfig;
  -[NTPBPersonalizationConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPersonalizationConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBBinningConfig *binningConfig;
  void *v5;
  void *v6;
  NTPBPersonalizationTreatment *defaultPersonalizationTreatment;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
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
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  binningConfig = self->_binningConfig;
  if (binningConfig)
  {
    -[NTPBBinningConfig dictionaryRepresentation](binningConfig, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("binning_config"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_moduloForHashing);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("modulo_for_hashing"));

  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  if (defaultPersonalizationTreatment)
  {
    -[NTPBPersonalizationTreatment dictionaryRepresentation](defaultPersonalizationTreatment, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("default_personalization_treatment"));

  }
  if (-[NSMutableArray count](self->_personalizationBuckets, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationBuckets, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = self->_personalizationBuckets;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("personalization_buckets"));
  }
  if (-[NSMutableArray count](self->_personalizationTreatments, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_personalizationTreatments, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_personalizationTreatments;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("personalization_treatments"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationConfigReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_binningConfig)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_defaultPersonalizationTreatment)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_personalizationBuckets;
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

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_personalizationTreatments;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBBinningConfig copyWithZone:](self->_binningConfig, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_moduloForHashing;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v8 = -[NTPBPersonalizationTreatment copyWithZone:](self->_defaultPersonalizationTreatment, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_personalizationBuckets;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPersonalizationBuckets:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_personalizationTreatments;
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
        objc_msgSend((id)v5, "addPersonalizationTreatments:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBBinningConfig *binningConfig;
  NTPBPersonalizationTreatment *defaultPersonalizationTreatment;
  NSMutableArray *personalizationBuckets;
  NSMutableArray *personalizationTreatments;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  binningConfig = self->_binningConfig;
  if ((unint64_t)binningConfig | *((_QWORD *)v4 + 2))
  {
    if (!-[NTPBBinningConfig isEqual:](binningConfig, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_moduloForHashing != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  if ((unint64_t)defaultPersonalizationTreatment | *((_QWORD *)v4 + 3)
    && !-[NTPBPersonalizationTreatment isEqual:](defaultPersonalizationTreatment, "isEqual:"))
  {
    goto LABEL_15;
  }
  personalizationBuckets = self->_personalizationBuckets;
  if ((unint64_t)personalizationBuckets | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](personalizationBuckets, "isEqual:"))
      goto LABEL_15;
  }
  personalizationTreatments = self->_personalizationTreatments;
  if ((unint64_t)personalizationTreatments | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](personalizationTreatments, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NTPBBinningConfig hash](self->_binningConfig, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_moduloForHashing;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NTPBPersonalizationTreatment hash](self->_defaultPersonalizationTreatment, "hash");
  v7 = v5 ^ v6 ^ -[NSMutableArray hash](self->_personalizationBuckets, "hash");
  return v7 ^ -[NSMutableArray hash](self->_personalizationTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBBinningConfig *binningConfig;
  uint64_t v6;
  NTPBPersonalizationTreatment *defaultPersonalizationTreatment;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  v4 = a3;
  binningConfig = self->_binningConfig;
  v6 = *((_QWORD *)v4 + 2);
  if (binningConfig)
  {
    if (v6)
      -[NTPBBinningConfig mergeFrom:](binningConfig, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPersonalizationConfig setBinningConfig:](self, "setBinningConfig:");
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_moduloForHashing = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  defaultPersonalizationTreatment = self->_defaultPersonalizationTreatment;
  v8 = *((_QWORD *)v4 + 3);
  if (defaultPersonalizationTreatment)
  {
    if (v8)
      -[NTPBPersonalizationTreatment mergeFrom:](defaultPersonalizationTreatment, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBPersonalizationConfig setDefaultPersonalizationTreatment:](self, "setDefaultPersonalizationTreatment:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        -[NTPBPersonalizationConfig addPersonalizationBuckets:](self, "addPersonalizationBuckets:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 5);
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
        -[NTPBPersonalizationConfig addPersonalizationTreatments:](self, "addPersonalizationTreatments:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (NTPBBinningConfig)binningConfig
{
  return self->_binningConfig;
}

- (void)setBinningConfig:(id)a3
{
  objc_storeStrong((id *)&self->_binningConfig, a3);
}

- (int64_t)moduloForHashing
{
  return self->_moduloForHashing;
}

- (NTPBPersonalizationTreatment)defaultPersonalizationTreatment
{
  return self->_defaultPersonalizationTreatment;
}

- (void)setDefaultPersonalizationTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPersonalizationTreatment, a3);
}

- (NSMutableArray)personalizationBuckets
{
  return self->_personalizationBuckets;
}

- (void)setPersonalizationBuckets:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationBuckets, a3);
}

- (NSMutableArray)personalizationTreatments
{
  return self->_personalizationTreatments;
}

- (void)setPersonalizationTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationTreatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationTreatments, 0);
  objc_storeStrong((id *)&self->_personalizationBuckets, 0);
  objc_storeStrong((id *)&self->_defaultPersonalizationTreatment, 0);
  objc_storeStrong((id *)&self->_binningConfig, 0);
}

@end
