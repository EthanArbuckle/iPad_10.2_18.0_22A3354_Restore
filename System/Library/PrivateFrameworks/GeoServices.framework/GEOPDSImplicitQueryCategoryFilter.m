@implementation GEOPDSImplicitQueryCategoryFilter

- (GEOPDSImplicitQueryCategoryFilter)init
{
  GEOPDSImplicitQueryCategoryFilter *v2;
  GEOPDSImplicitQueryCategoryFilter *v3;
  GEOPDSImplicitQueryCategoryFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  v2 = -[GEOPDSImplicitQueryCategoryFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSImplicitQueryCategoryFilter)initWithData:(id)a3
{
  GEOPDSImplicitQueryCategoryFilter *v3;
  GEOPDSImplicitQueryCategoryFilter *v4;
  GEOPDSImplicitQueryCategoryFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  v3 = -[GEOPDSImplicitQueryCategoryFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setImplicitQuerySearchForEvcharger:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 64) |= 0x10u;
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readImplicitQuerySearchAroundPoi
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImplicitQuerySearchAroundPoi_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)implicitQuerySearchAroundPoi
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQuerySearchAroundPoi]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setImplicitQuerySearchAroundPoi:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 64) |= 8u;
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readImplicitQueryIntroTipForHiking
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImplicitQueryIntroTipForHiking_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)implicitQueryIntroTipForHiking
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQueryIntroTipForHiking]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setImplicitQueryIntroTipForHiking:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 64) |= 4u;
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

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
  v8.super_class = (Class)GEOPDSImplicitQueryCategoryFilter;
  -[GEOPDSImplicitQueryCategoryFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSImplicitQueryCategoryFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSImplicitQueryCategoryFilter _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEOPDSImplicitQueryCategoryFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v5 = *(int *)(a1 + 60);
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C05948[v5];
    }
    if (a2)
      v7 = CFSTR("implicitQueryType");
    else
      v7 = CFSTR("implicit_query_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImplicitQuerySearchForEvcharger_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("implicitQuerySearchForEvcharger");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("implicit_query_search_for_evcharger");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("implicitQuerySearchAroundPoi");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("implicit_query_search_around_poi");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("implicitQueryIntroTipForHiking");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("implicit_query_intro_tip_for_hiking");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __63__GEOPDSImplicitQueryCategoryFilter__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSImplicitQueryCategoryFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_110;
      else
        v6 = (int *)&readAll__nonRecursiveTag_111;
      GEOPDSImplicitQueryCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDSImplicitQuerySearchAroundPOI readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __63__GEOPDSImplicitQueryCategoryFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSImplicitQueryCategoryFilterReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDSImplicitQueryCategoryFilterIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_implicitQuerySearchForEvcharger)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_implicitQuerySearchAroundPoi)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_implicitQueryIntroTipForHiking)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    -[GEOPDSImplicitQueryCategoryFilter _readImplicitQueryIntroTipForHiking](result);
    v4 = *(_QWORD *)(v3 + 24);
    result = 1;
    if (!v4 || (objc_msgSend(*(id *)(v4 + 24), "hasGreenTeaWithValue:", a2) & 1) == 0)
    {
      -[GEOPDSImplicitQueryCategoryFilter _readImplicitQuerySearchAroundPoi](v3);
      v5 = *(_QWORD *)(v3 + 32);
      if (!v5)
        return 0;
      -[GEOPDSImplicitQuerySearchAroundPOI _readReferenceLocation](v5);
      if ((objc_msgSend(*(id *)(v5 + 40), "hasGreenTeaWithValue:", a2) & 1) == 0)
        return 0;
    }
  }
  return result;
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
  PBUnknownFields *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSImplicitQueryCategoryFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_implicitQueryType;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v9 = -[GEOPDSImplicitQuerySearchForEVCharger copyWithZone:](self->_implicitQuerySearchForEvcharger, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOPDSImplicitQuerySearchAroundPOI copyWithZone:](self->_implicitQuerySearchAroundPoi, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOPDSImplicitQueryIntroTipForHiking copyWithZone:](self->_implicitQueryIntroTipForHiking, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSImplicitQuerySearchForEVCharger *implicitQuerySearchForEvcharger;
  GEOPDSImplicitQuerySearchAroundPOI *implicitQuerySearchAroundPoi;
  GEOPDSImplicitQueryIntroTipForHiking *implicitQueryIntroTipForHiking;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 1);
  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_implicitQueryType != *((_DWORD *)v4 + 15))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  implicitQuerySearchForEvcharger = self->_implicitQuerySearchForEvcharger;
  if ((unint64_t)implicitQuerySearchForEvcharger | *((_QWORD *)v4 + 5)
    && !-[GEOPDSImplicitQuerySearchForEVCharger isEqual:](implicitQuerySearchForEvcharger, "isEqual:"))
  {
    goto LABEL_13;
  }
  implicitQuerySearchAroundPoi = self->_implicitQuerySearchAroundPoi;
  if ((unint64_t)implicitQuerySearchAroundPoi | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDSImplicitQuerySearchAroundPOI isEqual:](implicitQuerySearchAroundPoi, "isEqual:"))
      goto LABEL_13;
  }
  implicitQueryIntroTipForHiking = self->_implicitQueryIntroTipForHiking;
  if ((unint64_t)implicitQueryIntroTipForHiking | *((_QWORD *)v4 + 3))
    v8 = -[GEOPDSImplicitQueryIntroTipForHiking isEqual:](implicitQueryIntroTipForHiking, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_implicitQueryType;
  else
    v3 = 0;
  v4 = -[GEOPDSImplicitQuerySearchForEVCharger hash](self->_implicitQuerySearchForEvcharger, "hash") ^ v3;
  v5 = -[GEOPDSImplicitQuerySearchAroundPOI hash](self->_implicitQuerySearchAroundPoi, "hash");
  return v4 ^ v5 ^ -[GEOPDSImplicitQueryIntroTipForHiking hash](self->_implicitQueryIntroTipForHiking, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 2u;
    *(_BYTE *)(a1 + 64) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSImplicitQueryCategoryFilter readAll:](a1, 0);
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      -[GEOPDSImplicitQuerySearchAroundPOI clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
      -[GEOPDSImplicitQueryIntroTipForHiking clearUnknownFields:](*(_QWORD *)(a1 + 24), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implicitQuerySearchForEvcharger, 0);
  objc_storeStrong((id *)&self->_implicitQuerySearchAroundPoi, 0);
  objc_storeStrong((id *)&self->_implicitQueryIntroTipForHiking, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
