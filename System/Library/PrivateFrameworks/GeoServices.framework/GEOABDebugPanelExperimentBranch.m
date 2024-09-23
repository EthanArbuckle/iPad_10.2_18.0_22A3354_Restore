@implementation GEOABDebugPanelExperimentBranch

- (GEOABDebugPanelExperimentBranch)init
{
  GEOABDebugPanelExperimentBranch *v2;
  GEOABDebugPanelExperimentBranch *v3;
  GEOABDebugPanelExperimentBranch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOABDebugPanelExperimentBranch;
  v2 = -[GEOABDebugPanelExperimentBranch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABDebugPanelExperimentBranch)initWithData:(id)a3
{
  GEOABDebugPanelExperimentBranch *v3;
  GEOABDebugPanelExperimentBranch *v4;
  GEOABDebugPanelExperimentBranch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOABDebugPanelExperimentBranch;
  v3 = -[GEOABDebugPanelExperimentBranch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readExperimentId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExperimentId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasExperimentId
{
  -[GEOABDebugPanelExperimentBranch _readExperimentId]((uint64_t)self);
  return self->_experimentId != 0;
}

- (NSString)experimentId
{
  -[GEOABDebugPanelExperimentBranch _readExperimentId]((uint64_t)self);
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (void)_readExperimentName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExperimentName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasExperimentName
{
  -[GEOABDebugPanelExperimentBranch _readExperimentName]((uint64_t)self);
  return self->_experimentName != 0;
}

- (NSString)experimentName
{
  -[GEOABDebugPanelExperimentBranch _readExperimentName]((uint64_t)self);
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_experimentName, a3);
}

- (void)_readBranchLabel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBranchLabel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBranchLabel
{
  -[GEOABDebugPanelExperimentBranch _readBranchLabel]((uint64_t)self);
  return self->_branchLabel != 0;
}

- (NSString)branchLabel
{
  -[GEOABDebugPanelExperimentBranch _readBranchLabel]((uint64_t)self);
  return self->_branchLabel;
}

- (void)setBranchLabel:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_branchLabel, a3);
}

- (void)_readBranchName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBranchName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBranchName
{
  -[GEOABDebugPanelExperimentBranch _readBranchName]((uint64_t)self);
  return self->_branchName != 0;
}

- (NSString)branchName
{
  -[GEOABDebugPanelExperimentBranch _readBranchName]((uint64_t)self);
  return self->_branchName;
}

- (void)setBranchName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_branchName, a3);
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
  v8.super_class = (Class)GEOABDebugPanelExperimentBranch;
  -[GEOABDebugPanelExperimentBranch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABDebugPanelExperimentBranch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABDebugPanelExperimentBranch _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("experimentId");
    else
      v6 = CFSTR("experiment_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "experimentName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("experimentName");
    else
      v8 = CFSTR("experiment_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "branchLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("branchLabel");
    else
      v10 = CFSTR("branch_label");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend(a1, "branchName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("branchName");
    else
      v12 = CFSTR("branch_name");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__GEOABDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABDebugPanelExperimentBranch _dictionaryRepresentation:](self, 1);
}

void __61__GEOABDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOABDebugPanelExperimentBranch)initWithDictionary:(id)a3
{
  return (GEOABDebugPanelExperimentBranch *)-[GEOABDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("experimentId");
      else
        v6 = CFSTR("experiment_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setExperimentId:", v8);

      }
      if (a3)
        v9 = CFSTR("experimentName");
      else
        v9 = CFSTR("experiment_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setExperimentName:", v11);

      }
      if (a3)
        v12 = CFSTR("branchLabel");
      else
        v12 = CFSTR("branch_label");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setBranchLabel:", v14);

      }
      if (a3)
        v15 = CFSTR("branchName");
      else
        v15 = CFSTR("branch_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setBranchName:", v17);

      }
    }
  }

  return a1;
}

- (GEOABDebugPanelExperimentBranch)initWithJSON:(id)a3
{
  return (GEOABDebugPanelExperimentBranch *)-[GEOABDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_474;
    else
      v8 = (int *)&readAll__nonRecursiveTag_475;
    GEOABDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABDebugPanelExperimentBranchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABDebugPanelExperimentBranchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 0);
    if (self->_experimentId)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_experimentName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_branchLabel)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_branchName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_experimentId)
    objc_msgSend(v5, "setExperimentId:");
  if (self->_experimentName)
    objc_msgSend(v5, "setExperimentName:");
  v4 = v5;
  if (self->_branchLabel)
  {
    objc_msgSend(v5, "setBranchLabel:");
    v4 = v5;
  }
  if (self->_branchName)
  {
    objc_msgSend(v5, "setBranchName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_experimentId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSString copyWithZone:](self->_experimentName, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[NSString copyWithZone:](self->_branchLabel, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[NSString copyWithZone:](self->_branchName, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOABDebugPanelExperimentBranchReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *experimentId;
  NSString *experimentName;
  NSString *branchLabel;
  NSString *branchName;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         experimentId = self->_experimentId,
         !((unint64_t)experimentId | v4[5]))
     || -[NSString isEqual:](experimentId, "isEqual:"))
    && ((experimentName = self->_experimentName, !((unint64_t)experimentName | v4[6]))
     || -[NSString isEqual:](experimentName, "isEqual:"))
    && ((branchLabel = self->_branchLabel, !((unint64_t)branchLabel | v4[3]))
     || -[NSString isEqual:](branchLabel, "isEqual:")))
  {
    branchName = self->_branchName;
    if ((unint64_t)branchName | v4[4])
      v9 = -[NSString isEqual:](branchName, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  -[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[NSString hash](self->_experimentName, "hash") ^ v3;
  v5 = -[NSString hash](self->_branchLabel, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_branchName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[5])
    -[GEOABDebugPanelExperimentBranch setExperimentId:](self, "setExperimentId:");
  if (v4[6])
    -[GEOABDebugPanelExperimentBranch setExperimentName:](self, "setExperimentName:");
  if (v4[3])
    -[GEOABDebugPanelExperimentBranch setBranchLabel:](self, "setBranchLabel:");
  if (v4[4])
    -[GEOABDebugPanelExperimentBranch setBranchName:](self, "setBranchName:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOABDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_478);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOABDebugPanelExperimentBranch readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_branchName, 0);
  objc_storeStrong((id *)&self->_branchLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
