@implementation GEOPDChildAction

- (GEOPDChildAction)init
{
  GEOPDChildAction *v2;
  GEOPDChildAction *v3;
  GEOPDChildAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDChildAction;
  v2 = -[GEOPDChildAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDChildAction)initWithData:(id)a3
{
  GEOPDChildAction *v3;
  GEOPDChildAction *v4;
  GEOPDChildAction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDChildAction;
  v3 = -[GEOPDChildAction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)childActionType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
    else
      return 0;
  }
  return result;
}

- (void)_readChildActionSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildActionSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)childActionSearch
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDChildAction _readChildActionSearch]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readChildActionGuides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildActionGuides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)childActionGuides
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDChildAction _readChildActionGuides]((uint64_t)a1);
    a1 = (id *)v1[6];
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
  v8.super_class = (Class)GEOPDChildAction;
  -[GEOPDChildAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDChildAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDChildAction _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v41[4];
  id v42;

  if (!a1)
    return 0;
  -[GEOPDChildAction readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0C0E8[v5];
    }
    if (a2)
      v7 = CFSTR("childActionType");
    else
      v7 = CFSTR("child_action_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 4) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildActionDirections_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v10 = *(id *)(a1 + 24);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("childActionDirections");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("child_action_directions");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildActionFlyover_tags);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v16 = *(id *)(a1 + 40);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("childActionFlyover");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("child_action_flyover");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  -[GEOPDChildAction childActionSearch]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("childActionSearch");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("child_action_search");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  -[GEOPDChildAction childActionGuides]((id *)a1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("childActionGuides");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("child_action_guides");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 8) == 0)
  {
    v28 = *(void **)(a1 + 8);
    if (v28)
    {
      v29 = v28;
      objc_sync_enter(v29);
      GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildActionDownloadOfflineMap_tags);
      objc_sync_exit(v29);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v30 = *(id *)(a1 + 32);
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("childActionDownloadOfflineMap");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("child_action_download_offline_map");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __46__GEOPDChildAction__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E1C00600;
      v38 = v37;
      v42 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v41);
      v39 = v38;

      v36 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDChildAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1171;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1172;
      GEOPDChildActionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __46__GEOPDChildAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDChildActionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 3u))
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
    -[GEOPDChildAction readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_childActionDirections)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childActionFlyover)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childActionSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childActionGuides)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childActionDownloadOfflineMap)
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
  id v17;
  void *v18;
  PBUnknownFields *v19;

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
      GEOPDChildActionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDChildAction readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_childActionType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEOPDChildActionDirections copyWithZone:](self->_childActionDirections, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDChildActionFlyover copyWithZone:](self->_childActionFlyover, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOPDChildActionSearch copyWithZone:](self->_childActionSearch, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOPDChildActionGuides copyWithZone:](self->_childActionGuides, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[GEOPDChildActionDownloadOfflineMap copyWithZone:](self->_childActionDownloadOfflineMap, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDChildActionDirections *childActionDirections;
  GEOPDChildActionFlyover *childActionFlyover;
  GEOPDChildActionSearch *childActionSearch;
  GEOPDChildActionGuides *childActionGuides;
  GEOPDChildActionDownloadOfflineMap *childActionDownloadOfflineMap;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDChildAction readAll:]((uint64_t)self, 1);
  -[GEOPDChildAction readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_childActionType != *((_DWORD *)v4 + 19))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  childActionDirections = self->_childActionDirections;
  if ((unint64_t)childActionDirections | *((_QWORD *)v4 + 3)
    && !-[GEOPDChildActionDirections isEqual:](childActionDirections, "isEqual:"))
  {
    goto LABEL_17;
  }
  childActionFlyover = self->_childActionFlyover;
  if ((unint64_t)childActionFlyover | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDChildActionFlyover isEqual:](childActionFlyover, "isEqual:"))
      goto LABEL_17;
  }
  childActionSearch = self->_childActionSearch;
  if ((unint64_t)childActionSearch | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDChildActionSearch isEqual:](childActionSearch, "isEqual:"))
      goto LABEL_17;
  }
  childActionGuides = self->_childActionGuides;
  if ((unint64_t)childActionGuides | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDChildActionGuides isEqual:](childActionGuides, "isEqual:"))
      goto LABEL_17;
  }
  childActionDownloadOfflineMap = self->_childActionDownloadOfflineMap;
  if ((unint64_t)childActionDownloadOfflineMap | *((_QWORD *)v4 + 4))
    v10 = -[GEOPDChildActionDownloadOfflineMap isEqual:](childActionDownloadOfflineMap, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDChildAction readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_childActionType;
  else
    v3 = 0;
  v4 = -[GEOPDChildActionDirections hash](self->_childActionDirections, "hash") ^ v3;
  v5 = -[GEOPDChildActionFlyover hash](self->_childActionFlyover, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDChildActionSearch hash](self->_childActionSearch, "hash");
  v7 = -[GEOPDChildActionGuides hash](self->_childActionGuides, "hash");
  return v6 ^ v7 ^ -[GEOPDChildActionDownloadOfflineMap hash](self->_childActionDownloadOfflineMap, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childActionSearch, 0);
  objc_storeStrong((id *)&self->_childActionGuides, 0);
  objc_storeStrong((id *)&self->_childActionFlyover, 0);
  objc_storeStrong((id *)&self->_childActionDownloadOfflineMap, 0);
  objc_storeStrong((id *)&self->_childActionDirections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
