@implementation GEOPDMediaLink

- (GEOPDMediaLink)init
{
  GEOPDMediaLink *v2;
  GEOPDMediaLink *v3;
  GEOPDMediaLink *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMediaLink;
  v2 = -[GEOPDMediaLink init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMediaLink)initWithData:(id)a3
{
  GEOPDMediaLink *v3;
  GEOPDMediaLink *v4;
  GEOPDMediaLink *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMediaLink;
  v3 = -[GEOPDMediaLink initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMediaLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdamId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)adamId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMediaLink _readAdamId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readSubId
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
        GEOPDMediaLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)subId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMediaLink _readSubId]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (uint64_t)mediaType
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

- (uint64_t)mediaSubType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readThirdPartyLinks
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
        GEOPDMediaLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThirdPartyLinks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)thirdPartyLinks
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMediaLink _readThirdPartyLinks]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addThirdPartyLink:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDMediaLink _readThirdPartyLinks](a1);
    -[GEOPDMediaLink _addNoFlagsThirdPartyLink:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsThirdPartyLink:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readMediaLinkPositionMetaData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMediaLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMediaLinkPositionMetaData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)mediaLinkPositionMetaData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMediaLink _readMediaLinkPositionMetaData]((uint64_t)a1);
    a1 = (id *)v1[4];
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
  v8.super_class = (Class)GEOPDMediaLink;
  -[GEOPDMediaLink description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMediaLink dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMediaLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDMediaLink readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMediaLink adamId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("adamId");
    else
      v6 = CFSTR("adam_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDMediaLink subId]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("subId");
    else
      v8 = CFSTR("sub_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 2) != 0)
  {
    v10 = *(int *)(a1 + 72);
    if (v10 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C0BC00[v10];
    }
    if (a2)
      v12 = CFSTR("mediaType");
    else
      v12 = CFSTR("media_type");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v9 = *(_BYTE *)(a1 + 76);
  }
  if ((v9 & 1) != 0)
  {
    v13 = *(int *)(a1 + 68);
    if (v13 >= 0x14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C0BC30[v13];
    }
    if (a2)
      v15 = CFSTR("mediaSubType");
    else
      v15 = CFSTR("media_sub_type");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = *(id *)(a1 + 48);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("thirdPartyLink");
    else
      v24 = CFSTR("third_party_link");
    objc_msgSend(v4, "setObject:forKey:", v16, v24);

  }
  -[GEOPDMediaLink mediaLinkPositionMetaData]((id *)a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("mediaLinkPositionMetaData");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("media_link_position_meta_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __44__GEOPDMediaLink__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E1C00600;
      v33 = v32;
      v37 = v33;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v36);
      v34 = v33;

      v31 = v34;
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMediaLink _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4808_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4809_0;
      GEOPDMediaLinkReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDMediaLinkCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDMediaLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMediaLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMediaLink readAll:]((uint64_t)self, 0);
    if (self->_adamId)
      PBDataWriterWriteStringField();
    if (self->_subId)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_thirdPartyLinks;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (self->_mediaLinkPositionMetaData)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char flags;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
      GEOPDMediaLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMediaLink readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_adamId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_subId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_mediaType;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_mediaSubType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_thirdPartyLinks;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        -[GEOPDMediaLink addThirdPartyLink:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v19 = -[GEOPDMediaLinkPositionMetaData copyWithZone:](self->_mediaLinkPositionMetaData, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *adamId;
  NSString *subId;
  NSMutableArray *thirdPartyLinks;
  GEOPDMediaLinkPositionMetaData *mediaLinkPositionMetaData;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDMediaLink readAll:]((uint64_t)self, 1);
  -[GEOPDMediaLink readAll:]((uint64_t)v4, 1);
  adamId = self->_adamId;
  if ((unint64_t)adamId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](adamId, "isEqual:"))
      goto LABEL_20;
  }
  subId = self->_subId;
  if ((unint64_t)subId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](subId, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_mediaType != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_mediaSubType != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_20;
  }
  thirdPartyLinks = self->_thirdPartyLinks;
  if ((unint64_t)thirdPartyLinks | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](thirdPartyLinks, "isEqual:"))
  {
    goto LABEL_20;
  }
  mediaLinkPositionMetaData = self->_mediaLinkPositionMetaData;
  if ((unint64_t)mediaLinkPositionMetaData | *((_QWORD *)v4 + 4))
    v9 = -[GEOPDMediaLinkPositionMetaData isEqual:](mediaLinkPositionMetaData, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOPDMediaLink readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_adamId, "hash");
  v4 = -[NSString hash](self->_subId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_mediaType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_mediaSubType;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_thirdPartyLinks, "hash");
  return v7 ^ -[GEOPDMediaLinkPositionMetaData hash](self->_mediaLinkPositionMetaData, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_subId, 0);
  objc_storeStrong((id *)&self->_mediaLinkPositionMetaData, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
