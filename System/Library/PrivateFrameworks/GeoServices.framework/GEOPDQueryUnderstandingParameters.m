@implementation GEOPDQueryUnderstandingParameters

- (GEOPDQueryUnderstandingParameters)init
{
  GEOPDQueryUnderstandingParameters *v2;
  GEOPDQueryUnderstandingParameters *v3;
  GEOPDQueryUnderstandingParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDQueryUnderstandingParameters;
  v2 = -[GEOPDQueryUnderstandingParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDQueryUnderstandingParameters)initWithData:(id)a3
{
  GEOPDQueryUnderstandingParameters *v3;
  GEOPDQueryUnderstandingParameters *v4;
  GEOPDQueryUnderstandingParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDQueryUnderstandingParameters;
  v3 = -[GEOPDQueryUnderstandingParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 8u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_4825);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setTaxonomySearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x20u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setTaxonomyLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x10u;
  *(_BYTE *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDQueryUnderstandingParameters;
  -[GEOPDQueryUnderstandingParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQueryUnderstandingParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQueryUnderstandingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
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

  if (!a1)
    return 0;
  -[GEOPDQueryUnderstandingParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04E50[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 8) == 0)
  {
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = v7;
      objc_sync_enter(v8);
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_4824);
      objc_sync_exit(v8);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v9 = *(id *)(a1 + 24);
  if (v9)
  {
    if (a2)
      v10 = CFSTR("searchString");
    else
      v10 = CFSTR("search_string");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  -[GEOPDQueryUnderstandingParameters _readViewportInfo](a1);
  v11 = *(id *)(a1 + 48);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v15 = *(int *)(a1 + 72);
    if (v15 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C04E78[v15];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("workflow"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTaxonomySearchParameters_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v19 = *(id *)(a1 + 40);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("taxonomySearchParameters");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("taxonomy_search_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
  {
    v23 = *(void **)(a1 + 8);
    if (v23)
    {
      v24 = v23;
      objc_sync_enter(v24);
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTaxonomyLookupParameters_tags);
      objc_sync_exit(v24);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v25 = *(id *)(a1 + 32);
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("taxonomyLookupParameters");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("taxonomy_lookup_parameters");
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
      v36[2] = __63__GEOPDQueryUnderstandingParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDQueryUnderstandingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4838;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4839;
      GEOPDQueryUnderstandingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDQueryUnderstandingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __63__GEOPDQueryUnderstandingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDQueryUnderstandingParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDQueryUnderstandingParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_searchString)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_taxonomySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_taxonomyLookupParameters)
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
  uint64_t v9;
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
      GEOPDQueryUnderstandingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_type;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_workflow;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v13 = -[GEOPDQueryUnderstandingTaxonomySearchParameters copyWithZone:](self->_taxonomySearchParameters, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[GEOPDQueryUnderstandingTaxonomyLookupParameters copyWithZone:](self->_taxonomyLookupParameters, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  GEOPDViewportInfo *viewportInfo;
  GEOPDQueryUnderstandingTaxonomySearchParameters *taxonomySearchParameters;
  GEOPDQueryUnderstandingTaxonomyLookupParameters *taxonomyLookupParameters;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_type != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_20;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_workflow != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  taxonomySearchParameters = self->_taxonomySearchParameters;
  if ((unint64_t)taxonomySearchParameters | *((_QWORD *)v4 + 5)
    && !-[GEOPDQueryUnderstandingTaxonomySearchParameters isEqual:](taxonomySearchParameters, "isEqual:"))
  {
    goto LABEL_20;
  }
  taxonomyLookupParameters = self->_taxonomyLookupParameters;
  if ((unint64_t)taxonomyLookupParameters | *((_QWORD *)v4 + 4))
    v9 = -[GEOPDQueryUnderstandingTaxonomyLookupParameters isEqual:](taxonomyLookupParameters, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_searchString, "hash");
  v5 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_workflow;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[GEOPDQueryUnderstandingTaxonomySearchParameters hash](self->_taxonomySearchParameters, "hash");
  return v7 ^ v8 ^ -[GEOPDQueryUnderstandingTaxonomyLookupParameters hash](self->_taxonomyLookupParameters, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_taxonomySearchParameters, 0);
  objc_storeStrong((id *)&self->_taxonomyLookupParameters, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
