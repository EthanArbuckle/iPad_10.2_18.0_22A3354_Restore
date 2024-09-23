@implementation GEOPDClientRankingFeatureUnit

- (GEOPDClientRankingFeatureUnit)init
{
  GEOPDClientRankingFeatureUnit *v2;
  GEOPDClientRankingFeatureUnit *v3;
  GEOPDClientRankingFeatureUnit *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientRankingFeatureUnit;
  v2 = -[GEOPDClientRankingFeatureUnit init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDClientRankingFeatureUnit)initWithData:(id)a3
{
  GEOPDClientRankingFeatureUnit *v3;
  GEOPDClientRankingFeatureUnit *v4;
  GEOPDClientRankingFeatureUnit *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientRankingFeatureUnit;
  v3 = -[GEOPDClientRankingFeatureUnit initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)functionType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 72);
    else
      return 0;
  }
  return result;
}

- (void)_readFunctionTypeLinear
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFunctionTypeLinear_tags_862);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)functionTypeLinear
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureUnit _readFunctionTypeLinear]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readFunctionTypeDiscrete
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFunctionTypeDiscrete_tags_863);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)functionTypeDiscrete
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDClientRankingFeatureUnit _readFunctionTypeDiscrete]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDClientRankingFeatureUnit;
  -[GEOPDClientRankingFeatureUnit description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientRankingFeatureUnit dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureUnit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;

  if (!a1)
    return 0;
  -[GEOPDClientRankingFeatureUnit readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C05910[v5];
    }
    if (a2)
      v7 = CFSTR("featureType");
    else
      v7 = CFSTR("feature_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDClientRankingFeatureUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureTypeSource_tags_860);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v10 = *(id *)(a1 + 32);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("featureTypeSource");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("feature_type_source");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 8) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDClientRankingFeatureUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureTypeResult_tags_861);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v16 = *(id *)(a1 + 24);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("featureTypeResult");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("feature_type_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v20 = *(int *)(a1 + 72);
    if (v20 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C05930[v20];
    }
    if (a2)
      v22 = CFSTR("functionType");
    else
      v22 = CFSTR("function_type");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDClientRankingFeatureUnit functionTypeLinear]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("functionTypeLinear");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("function_type_linear");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDClientRankingFeatureUnit functionTypeDiscrete]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("functionTypeDiscrete");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("function_type_discrete");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __59__GEOPDClientRankingFeatureUnit__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureUnit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_864;
      else
        v6 = (int *)&readAll__nonRecursiveTag_865;
      GEOPDClientRankingFeatureUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __59__GEOPDClientRankingFeatureUnit__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureUnitReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
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
    -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_featureTypeSource)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_featureTypeResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_functionTypeLinear)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_functionTypeDiscrete)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDClientRankingFeatureUnitReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_featureType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[GEOPDClientRankingFeatureTypeSource copyWithZone:](self->_featureTypeSource, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPDClientRankingFeatureTypeResult copyWithZone:](self->_featureTypeResult, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_functionType;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v13 = -[GEOPDClientRankingFeatureFunctionTypeLinear copyWithZone:](self->_functionTypeLinear, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[GEOPDClientRankingFeatureFunctionTypeDiscrete copyWithZone:](self->_functionTypeDiscrete, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDClientRankingFeatureTypeSource *featureTypeSource;
  GEOPDClientRankingFeatureTypeResult *featureTypeResult;
  GEOPDClientRankingFeatureFunctionTypeLinear *functionTypeLinear;
  GEOPDClientRankingFeatureFunctionTypeDiscrete *functionTypeDiscrete;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 1);
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  featureTypeSource = self->_featureTypeSource;
  if ((unint64_t)featureTypeSource | *((_QWORD *)v4 + 4)
    && !-[GEOPDClientRankingFeatureTypeSource isEqual:](featureTypeSource, "isEqual:"))
  {
    goto LABEL_20;
  }
  featureTypeResult = self->_featureTypeResult;
  if ((unint64_t)featureTypeResult | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDClientRankingFeatureTypeResult isEqual:](featureTypeResult, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_functionType != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  functionTypeLinear = self->_functionTypeLinear;
  if ((unint64_t)functionTypeLinear | *((_QWORD *)v4 + 6)
    && !-[GEOPDClientRankingFeatureFunctionTypeLinear isEqual:](functionTypeLinear, "isEqual:"))
  {
    goto LABEL_20;
  }
  functionTypeDiscrete = self->_functionTypeDiscrete;
  if ((unint64_t)functionTypeDiscrete | *((_QWORD *)v4 + 5))
    v9 = -[GEOPDClientRankingFeatureFunctionTypeDiscrete isEqual:](functionTypeDiscrete, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_featureType;
  else
    v3 = 0;
  v4 = -[GEOPDClientRankingFeatureTypeSource hash](self->_featureTypeSource, "hash");
  v5 = -[GEOPDClientRankingFeatureTypeResult hash](self->_featureTypeResult, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_functionType;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[GEOPDClientRankingFeatureFunctionTypeLinear hash](self->_functionTypeLinear, "hash");
  return v7 ^ v8 ^ -[GEOPDClientRankingFeatureFunctionTypeDiscrete hash](self->_functionTypeDiscrete, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 4u;
    *(_BYTE *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDClientRankingFeatureUnit readAll:](a1, 0);
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      v7 = *(_QWORD *)(a1 + 24);
      if (v7)
      {
        v8 = *(void **)(v7 + 8);
        *(_QWORD *)(v7 + 8) = 0;

      }
      v9 = *(_QWORD *)(a1 + 48);
      if (v9)
      {
        v10 = *(void **)(v9 + 8);
        *(_QWORD *)(v9 + 8) = 0;

      }
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        v12 = *(void **)(v11 + 8);
        *(_QWORD *)(v11 + 8) = 0;

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionTypeLinear, 0);
  objc_storeStrong((id *)&self->_functionTypeDiscrete, 0);
  objc_storeStrong((id *)&self->_featureTypeSource, 0);
  objc_storeStrong((id *)&self->_featureTypeResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
