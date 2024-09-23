@implementation GEOLogMsgStateExperiments

- (GEOLogMsgStateExperiments)init
{
  GEOLogMsgStateExperiments *v2;
  GEOLogMsgStateExperiments *v3;
  GEOLogMsgStateExperiments *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateExperiments;
  v2 = -[GEOLogMsgStateExperiments init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateExperiments)initWithData:(id)a3
{
  GEOLogMsgStateExperiments *v3;
  GEOLogMsgStateExperiments *v4;
  GEOLogMsgStateExperiments *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateExperiments;
  v3 = -[GEOLogMsgStateExperiments initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTilesAbExperimentAssignment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTilesAbExperimentAssignment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTilesAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readTilesAbExperimentAssignment]((uint64_t)self);
  return self->_tilesAbExperimentAssignment != 0;
}

- (GEOABExperimentAssignment)tilesAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readTilesAbExperimentAssignment]((uint64_t)self);
  return self->_tilesAbExperimentAssignment;
}

- (void)setTilesAbExperimentAssignment:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_tilesAbExperimentAssignment, a3);
}

- (void)_readClientAbExperimentAssignment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientAbExperimentAssignment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasClientAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readClientAbExperimentAssignment]((uint64_t)self);
  return self->_clientAbExperimentAssignment != 0;
}

- (GEOABClientConfig)clientAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readClientAbExperimentAssignment]((uint64_t)self);
  return self->_clientAbExperimentAssignment;
}

- (void)setClientAbExperimentAssignment:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_clientAbExperimentAssignment, a3);
}

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDatasetAbStatus
{
  -[GEOLogMsgStateExperiments _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOLogMsgStateExperiments _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readAbAssignInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbAssignInfo_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAbAssignInfo
{
  -[GEOLogMsgStateExperiments _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOLogMsgStateExperiments _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
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
  v8.super_class = (Class)GEOLogMsgStateExperiments;
  -[GEOLogMsgStateExperiments description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateExperiments dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateExperiments _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tilesAbExperimentAssignment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tilesAbExperimentAssignment");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tiles_ab_experiment_assignment");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "clientAbExperimentAssignment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("clientAbExperimentAssignment");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("client_ab_experiment_assignment");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend(a1, "datasetAbStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("datasetAbStatus");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("dataset_ab_status");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

    }
    objc_msgSend(a1, "abAssignInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v17, "jsonRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("abAssignInfo");
      }
      else
      {
        objc_msgSend(v17, "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("ab_assign_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateExperiments _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateExperiments)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateExperiments *)-[GEOLogMsgStateExperiments _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOABExperimentAssignment *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOABClientConfig *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOPDDatasetABStatus *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOAbAssignInfo *v23;
  uint64_t v24;
  void *v25;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tilesAbExperimentAssignment");
      else
        v6 = CFSTR("tiles_ab_experiment_assignment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOABExperimentAssignment alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOABExperimentAssignment initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOABExperimentAssignment initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setTilesAbExperimentAssignment:", v9);

      }
      if (a3)
        v11 = CFSTR("clientAbExperimentAssignment");
      else
        v11 = CFSTR("client_ab_experiment_assignment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOABClientConfig alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOABClientConfig initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOABClientConfig initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setClientAbExperimentAssignment:", v14);

      }
      if (a3)
        v16 = CFSTR("datasetAbStatus");
      else
        v16 = CFSTR("dataset_ab_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOPDDatasetABStatus alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOPDDatasetABStatus initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOPDDatasetABStatus initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setDatasetAbStatus:", v19);

      }
      if (a3)
        v21 = CFSTR("abAssignInfo");
      else
        v21 = CFSTR("ab_assign_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOAbAssignInfo alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEOAbAssignInfo initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEOAbAssignInfo initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setAbAssignInfo:", v24);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateExperiments)initWithJSON:(id)a3
{
  return (GEOLogMsgStateExperiments *)-[GEOLogMsgStateExperiments _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_6161;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6162;
    GEOLogMsgStateExperimentsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStateExperimentsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateExperimentsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateExperimentsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStateExperimentsIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateExperiments readAll:](self, "readAll:", 0);
    if (self->_tilesAbExperimentAssignment)
      PBDataWriterWriteSubmessage();
    if (self->_clientAbExperimentAssignment)
      PBDataWriterWriteSubmessage();
    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    if (self->_abAssignInfo)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgStateExperiments readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tilesAbExperimentAssignment)
    objc_msgSend(v5, "setTilesAbExperimentAssignment:");
  if (self->_clientAbExperimentAssignment)
    objc_msgSend(v5, "setClientAbExperimentAssignment:");
  v4 = v5;
  if (self->_datasetAbStatus)
  {
    objc_msgSend(v5, "setDatasetAbStatus:");
    v4 = v5;
  }
  if (self->_abAssignInfo)
  {
    objc_msgSend(v5, "setAbAssignInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateExperiments readAll:](self, "readAll:", 0);
    v8 = -[GEOABExperimentAssignment copyWithZone:](self->_tilesAbExperimentAssignment, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = -[GEOABClientConfig copyWithZone:](self->_clientAbExperimentAssignment, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3);
    v13 = (void *)v5[4];
    v5[4] = v12;

    v14 = -[GEOAbAssignInfo copyWithZone:](self->_abAssignInfo, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateExperimentsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOABExperimentAssignment *tilesAbExperimentAssignment;
  GEOABClientConfig *clientAbExperimentAssignment;
  GEOPDDatasetABStatus *datasetAbStatus;
  GEOAbAssignInfo *abAssignInfo;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLogMsgStateExperiments readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         tilesAbExperimentAssignment = self->_tilesAbExperimentAssignment,
         !((unint64_t)tilesAbExperimentAssignment | v4[5]))
     || -[GEOABExperimentAssignment isEqual:](tilesAbExperimentAssignment, "isEqual:"))
    && ((clientAbExperimentAssignment = self->_clientAbExperimentAssignment,
         !((unint64_t)clientAbExperimentAssignment | v4[3]))
     || -[GEOABClientConfig isEqual:](clientAbExperimentAssignment, "isEqual:"))
    && ((datasetAbStatus = self->_datasetAbStatus, !((unint64_t)datasetAbStatus | v4[4]))
     || -[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:")))
  {
    abAssignInfo = self->_abAssignInfo;
    if ((unint64_t)abAssignInfo | v4[2])
      v9 = -[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOLogMsgStateExperiments readAll:](self, "readAll:", 1);
  v3 = -[GEOABExperimentAssignment hash](self->_tilesAbExperimentAssignment, "hash");
  v4 = -[GEOABClientConfig hash](self->_clientAbExperimentAssignment, "hash") ^ v3;
  v5 = -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  return v4 ^ v5 ^ -[GEOAbAssignInfo hash](self->_abAssignInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOABExperimentAssignment *tilesAbExperimentAssignment;
  uint64_t v5;
  GEOABClientConfig *clientAbExperimentAssignment;
  uint64_t v7;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v9;
  GEOAbAssignInfo *abAssignInfo;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  tilesAbExperimentAssignment = self->_tilesAbExperimentAssignment;
  v5 = v12[5];
  if (tilesAbExperimentAssignment)
  {
    if (v5)
      -[GEOABExperimentAssignment mergeFrom:](tilesAbExperimentAssignment, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgStateExperiments setTilesAbExperimentAssignment:](self, "setTilesAbExperimentAssignment:");
  }
  clientAbExperimentAssignment = self->_clientAbExperimentAssignment;
  v7 = v12[3];
  if (clientAbExperimentAssignment)
  {
    if (v7)
      -[GEOABClientConfig mergeFrom:](clientAbExperimentAssignment, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLogMsgStateExperiments setClientAbExperimentAssignment:](self, "setClientAbExperimentAssignment:");
  }
  datasetAbStatus = self->_datasetAbStatus;
  v9 = v12[4];
  if (datasetAbStatus)
  {
    if (v9)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOLogMsgStateExperiments setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  abAssignInfo = self->_abAssignInfo;
  v11 = v12[2];
  if (abAssignInfo)
  {
    if (v11)
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOLogMsgStateExperiments setAbAssignInfo:](self, "setAbAssignInfo:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilesAbExperimentAssignment, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientAbExperimentAssignment, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
