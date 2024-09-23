@implementation GEOPDGeocodingParameters

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  return -[GEOPDGeocodingParameters initWithForwardGeocodeAddress:addressString:maxResults:traits:](self, "initWithForwardGeocodeAddress:addressString:maxResults:traits:", a3, 0, *(_QWORD *)&a4, a5);
}

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddress:(id)a3 addressString:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  id v10;
  id v11;
  id v12;
  GEOPDGeocodingParameters *v13;
  void *v14;
  void *v15;
  void *v16;
  GEOPDGeocodingParameters *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDGeocodingParameters;
  v13 = -[GEOPDGeocodingParameters init](&v19, sel_init);
  if (v13)
  {
    if (v10)
    {
      objc_msgSend(v10, "structuredAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v10, "structuredAddress");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDGeocodingParameters setStructuredAddress:]((uint64_t)v13, v15);

      }
    }
    if (v11 && objc_msgSend(v11, "length"))
      -[GEOPDGeocodingParameters setQueryString:]((uint64_t)v13, v11);
    if (a5)
    {
      *(_WORD *)&v13->_flags |= 0x100u;
      *(_WORD *)&v13->_flags |= 1u;
      v13->_maxResults = a5;
    }
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDGeocodingParameters setViewportInfo:]((uint64_t)v13, v16);

    v17 = v13;
  }

  return v13;
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)setStructuredAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x40u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_structuredAddress, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_punchInHints, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_queryString, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_maxResults;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v11 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[GEOStructuredAddress copyWithZone:](self->_structuredAddress, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[GEOPDSPunchInHints copyWithZone:](self->_punchInHints, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v17 = -[GEOPDAddressResultSubTypeFilter copyWithZone:](self->_addressResultSubTypeFilter, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_10:

  return (id)v5;
}

- (GEOPDGeocodingParameters)init
{
  GEOPDGeocodingParameters *v2;
  GEOPDGeocodingParameters *v3;
  GEOPDGeocodingParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGeocodingParameters;
  v2 = -[GEOPDGeocodingParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
  if (self->_reader && !_GEOPDGeocodingParametersIsDirty((uint64_t)self))
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
    -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 0);
    if (self->_queryString)
      PBDataWriterWriteStringField();
    v5 = v8;
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v8;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_structuredAddress)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_punchInHints)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

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
        v6 = (int *)&readAll__recursiveTag_2358;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2359;
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDGeocodingParameters)initWithData:(id)a3
{
  GEOPDGeocodingParameters *v3;
  GEOPDGeocodingParameters *v4;
  GEOPDGeocodingParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGeocodingParameters;
  v3 = -[GEOPDGeocodingParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQueryString
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryString_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)queryString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGeocodingParameters _readQueryString]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setQueryString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x20u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_2346);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)_readStructuredAddress
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStructuredAddress_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)structuredAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGeocodingParameters _readStructuredAddress]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readPunchInHints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPunchInHints_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)setPunchInHints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x10u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setAddressResultSubTypeFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 84) |= 8u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDGeocodingParameters;
  -[GEOPDGeocodingParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGeocodingParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
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
  -[GEOPDGeocodingParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGeocodingParameters queryString]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("queryString");
    else
      v6 = CFSTR("query_string");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_WORD *)(a1 + 84) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("maxResults");
    else
      v8 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDGeocodingParameters _readViewportInfo](a1);
  v9 = *(id *)(a1 + 56);
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDGeocodingParameters structuredAddress]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("structuredAddress");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("structured_address");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  -[GEOPDGeocodingParameters _readPunchInHints](a1);
  v17 = *(id *)(a1 + 32);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("punchInHints");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("punch_in_hints");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("isStrictMapRegion");
    else
      v22 = CFSTR("is_strict_map_region");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 8) == 0)
  {
    v23 = *(void **)(a1 + 8);
    if (v23)
    {
      v24 = v23;
      objc_sync_enter(v24);
      GEOPDGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags_2347);
      objc_sync_exit(v24);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v25 = *(id *)(a1 + 24);
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("addressResultSubTypeFilter");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("address_result_sub_type_filter");
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
      v36[2] = __54__GEOPDGeocodingParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDGeocodingParameters _readPunchInHints](result);
    if ((-[GEOPDSPunchInHints hasGreenTeaWithValue:](*(_QWORD *)(v3 + 32), a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDGeocodingParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 56), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *queryString;
  __int16 v6;
  GEOPDViewportInfo *viewportInfo;
  GEOStructuredAddress *structuredAddress;
  GEOPDSPunchInHints *punchInHints;
  __int16 v10;
  char v11;
  GEOPDAddressResultSubTypeFilter *addressResultSubTypeFilter;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDGeocodingParameters readAll:]((uint64_t)v4, 1);
  queryString = self->_queryString;
  if ((unint64_t)queryString | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](queryString, "isEqual:"))
      goto LABEL_19;
  }
  v6 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 19))
      goto LABEL_19;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_19;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 7) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    goto LABEL_19;
  structuredAddress = self->_structuredAddress;
  if ((unint64_t)structuredAddress | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStructuredAddress isEqual:](structuredAddress, "isEqual:"))
      goto LABEL_19;
  }
  punchInHints = self->_punchInHints;
  if ((unint64_t)punchInHints | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDSPunchInHints isEqual:](punchInHints, "isEqual:"))
      goto LABEL_19;
  }
  v10 = *((_WORD *)v4 + 42);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_25;
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  if ((v10 & 2) == 0)
    goto LABEL_19;
  if (!self->_isStrictMapRegion)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_25;
    goto LABEL_19;
  }
  if (!*((_BYTE *)v4 + 80))
    goto LABEL_19;
LABEL_25:
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((_QWORD *)v4 + 3))
    v11 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOPDGeocodingParameters readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_queryString, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_maxResults;
  else
    v4 = 0;
  v5 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v6 = -[GEOStructuredAddress hash](self->_structuredAddress, "hash");
  v7 = -[GEOPDSPunchInHints hash](self->_punchInHints, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_isStrictMapRegion;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[GEOPDAddressResultSubTypeFilter hash](self->_addressResultSubTypeFilter, "hash");
}

- (GEOPDGeocodingParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  return -[GEOPDGeocodingParameters initWithForwardGeocodeAddress:addressString:maxResults:traits:](self, "initWithForwardGeocodeAddress:addressString:maxResults:traits:", 0, a3, *(_QWORD *)&a4, a5);
}

@end
