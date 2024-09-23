@implementation CLPMeta

- (void)setSubmissionId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_submissionId = a3;
}

- (void)setHasSubmissionId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubmissionId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProbeId
{
  return self->_probeId != 0;
}

- (void)clearRegulatoryDomainEstimates
{
  -[NSMutableArray removeAllObjects](self->_regulatoryDomainEstimates, "removeAllObjects");
}

- (void)addRegulatoryDomainEstimates:(id)a3
{
  id v4;
  NSMutableArray *regulatoryDomainEstimates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  v8 = v4;
  if (!regulatoryDomainEstimates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_regulatoryDomainEstimates;
    self->_regulatoryDomainEstimates = v6;

    v4 = v8;
    regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  }
  -[NSMutableArray addObject:](regulatoryDomainEstimates, "addObject:", v4);

}

- (unint64_t)regulatoryDomainEstimatesCount
{
  return -[NSMutableArray count](self->_regulatoryDomainEstimates, "count");
}

- (id)regulatoryDomainEstimatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_regulatoryDomainEstimates, "objectAtIndex:", a3);
}

+ (Class)regulatoryDomainEstimatesType
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPMeta;
  -[CLPMeta description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPMeta dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *productId;
  NSString *softwareVersion;
  void *v7;
  NSString *probeId;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  productId = self->_productId;
  if (productId)
    objc_msgSend(v3, "setObject:forKey:", productId, CFSTR("productId"));
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
    objc_msgSend(v4, "setObject:forKey:", softwareVersion, CFSTR("softwareVersion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_submissionId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("submissionId"));

  }
  probeId = self->_probeId;
  if (probeId)
    objc_msgSend(v4, "setObject:forKey:", probeId, CFSTR("probeId"));
  if (-[NSMutableArray count](self->_regulatoryDomainEstimates, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_regulatoryDomainEstimates, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_regulatoryDomainEstimates;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("regulatoryDomainEstimates"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPMetaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_productId)
    -[CLPMeta writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_softwareVersion)
    -[CLPMeta writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_probeId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_regulatoryDomainEstimates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setProductId:", self->_productId);
  objc_msgSend(v8, "setSoftwareVersion:", self->_softwareVersion);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v8 + 1) = self->_submissionId;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  if (self->_probeId)
    objc_msgSend(v8, "setProbeId:");
  if (-[CLPMeta regulatoryDomainEstimatesCount](self, "regulatoryDomainEstimatesCount"))
  {
    objc_msgSend(v8, "clearRegulatoryDomainEstimates");
    v4 = -[CLPMeta regulatoryDomainEstimatesCount](self, "regulatoryDomainEstimatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPMeta regulatoryDomainEstimatesAtIndex:](self, "regulatoryDomainEstimatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRegulatoryDomainEstimates:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_productId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_softwareVersion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_submissionId;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_probeId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_regulatoryDomainEstimates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
        objc_msgSend((id)v5, "addRegulatoryDomainEstimates:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *productId;
  NSString *softwareVersion;
  NSString *probeId;
  NSMutableArray *regulatoryDomainEstimates;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  productId = self->_productId;
  if ((unint64_t)productId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](productId, "isEqual:"))
      goto LABEL_15;
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_submissionId != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  probeId = self->_probeId;
  if ((unint64_t)probeId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](probeId, "isEqual:"))
    goto LABEL_15;
  regulatoryDomainEstimates = self->_regulatoryDomainEstimates;
  if ((unint64_t)regulatoryDomainEstimates | *((_QWORD *)v4 + 4))
    v9 = -[NSMutableArray isEqual:](regulatoryDomainEstimates, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_productId, "hash");
  v4 = -[NSString hash](self->_softwareVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_submissionId;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_probeId, "hash");
  return v6 ^ -[NSMutableArray hash](self->_regulatoryDomainEstimates, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[CLPMeta setProductId:](self, "setProductId:");
  if (*((_QWORD *)v4 + 5))
    -[CLPMeta setSoftwareVersion:](self, "setSoftwareVersion:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_submissionId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[CLPMeta setProbeId:](self, "setProbeId:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CLPMeta addRegulatoryDomainEstimates:](self, "addRegulatoryDomainEstimates:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
  objc_storeStrong((id *)&self->_productId, a3);
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_softwareVersion, a3);
}

- (int64_t)submissionId
{
  return self->_submissionId;
}

- (NSString)probeId
{
  return self->_probeId;
}

- (void)setProbeId:(id)a3
{
  objc_storeStrong((id *)&self->_probeId, a3);
}

- (NSMutableArray)regulatoryDomainEstimates
{
  return self->_regulatoryDomainEstimates;
}

- (void)setRegulatoryDomainEstimates:(id)a3
{
  objc_storeStrong((id *)&self->_regulatoryDomainEstimates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_regulatoryDomainEstimates, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_probeId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPMeta writeTo:]", "CLPCollectionRequest.gen.m", 25685, "nil != self->_productId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPMeta writeTo:]", "CLPCollectionRequest.gen.m", 25690, "nil != self->_softwareVersion");
}

@end
