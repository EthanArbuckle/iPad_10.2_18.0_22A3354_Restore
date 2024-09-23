@implementation GEOPDExtendedGeoLookupParameters

- (GEOPDExtendedGeoLookupParameters)init
{
  GEOPDExtendedGeoLookupParameters *v2;
  GEOPDExtendedGeoLookupParameters *v3;
  GEOPDExtendedGeoLookupParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  v2 = -[GEOPDExtendedGeoLookupParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExtendedGeoLookupParameters)initWithData:(id)a3
{
  GEOPDExtendedGeoLookupParameters *v3;
  GEOPDExtendedGeoLookupParameters *v4;
  GEOPDExtendedGeoLookupParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  v3 = -[GEOPDExtendedGeoLookupParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  -[GEOPDExtendedGeoLookupParameters dealloc](&v3, sel_dealloc);
}

- (void)setPreserveFields:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x100u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)_readPrimaryFeatureLocation
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrimaryFeatureLocation_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPrimaryFeatureLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x200u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)_readIntersectingFeatureGeoIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIntersectingFeatureGeoIds_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addIntersectingFeatureGeoId:(uint64_t)a1
{
  -[GEOPDExtendedGeoLookupParameters _readIntersectingFeatureGeoIds](a1);
  PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 112) |= 0x20u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  *(_WORD *)(a1 + 112) |= 0x400u;
}

- (void)setDataSourceId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x40u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setInterpolationParameter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x80u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 56), a2);

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
  v8.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  -[GEOPDExtendedGeoLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExtendedGeoLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExtendedGeoLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  id v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;

  if (!a1)
    return 0;
  -[GEOPDExtendedGeoLookupParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreserveFields_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v7 = *(id *)(a1 + 64);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("preserveFields");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("preserve_fields");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if ((*(_WORD *)(a1 + 112) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("primaryFeatureGeoId");
    else
      v12 = CFSTR("primary_feature_geo_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDExtendedGeoLookupParameters _readPrimaryFeatureLocation](a1);
  v13 = *(id *)(a1 + 80);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("primaryFeatureLocation");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("primary_feature_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("intersectingFeatureGeoId");
    else
      v18 = CFSTR("intersecting_feature_geo_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  v19 = *(_WORD *)(a1 + 112);
  if ((v19 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 109));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("isLatlngRequest");
    else
      v21 = CFSTR("is_latlng_request");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    v19 = *(_WORD *)(a1 + 112);
  }
  if ((v19 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("streetSubPostalGeoId");
    else
      v23 = CFSTR("street_sub_postal_geo_id");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataSourceId_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v26 = *(id *)(a1 + 48);
  if (v26)
  {
    if (a2)
      v27 = CFSTR("dataSourceId");
    else
      v27 = CFSTR("data_source_id");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  if ((*(_WORD *)(a1 + 112) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("dataSourceIdRequired");
    else
      v29 = CFSTR("data_source_id_required");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
  {
    v30 = *(void **)(a1 + 8);
    if (v30)
    {
      v31 = v30;
      objc_sync_enter(v31);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInterpolationParameter_tags);
      objc_sync_exit(v31);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v32 = *(id *)(a1 + 56);
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("interpolationParameter");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("interpolation_parameter");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __62__GEOPDExtendedGeoLookupParameters__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExtendedGeoLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2250;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2251;
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 64), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 80), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __62__GEOPDExtendedGeoLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDExtendedGeoLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  __int16 flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDExtendedGeoLookupParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_preserveFields)
      PBDataWriterWriteSubmessage();
    v5 = v10;
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
    }
    if (self->_primaryFeatureLocation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_intersectingFeatureGeoIds.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_intersectingFeatureGeoIds.count);
    }
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
    }
    if (self->_dataSourceId)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
    }
    if (self->_interpolationParameter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
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
  __int16 flags;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  PBUnknownFields *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDExtendedGeoLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 0);
  v9 = -[GEOAddress copyWithZone:](self->_preserveFields, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_primaryFeatureGeoId;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v11 = -[GEOLatLng copyWithZone:](self->_primaryFeatureLocation, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  PBRepeatedUInt64Copy();
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 109) = self->_isLatlngRequest;
    *(_WORD *)(v5 + 112) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_streetSubPostalGeoId;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_dataSourceId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_dataSourceIdRequired;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  v16 = -[GEOInterpolationParameters copyWithZone:](self->_interpolationParameter, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOAddress *preserveFields;
  __int16 v6;
  GEOLatLng *primaryFeatureLocation;
  __int16 flags;
  __int16 v9;
  NSString *dataSourceId;
  char v11;
  GEOInterpolationParameters *interpolationParameter;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)v4, 1);
  preserveFields = self->_preserveFields;
  if ((unint64_t)preserveFields | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOAddress isEqual:](preserveFields, "isEqual:"))
      goto LABEL_32;
  }
  v6 = *((_WORD *)v4 + 56);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_primaryFeatureGeoId != *((_QWORD *)v4 + 9))
      goto LABEL_32;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_32;
  }
  primaryFeatureLocation = self->_primaryFeatureLocation;
  if ((unint64_t)primaryFeatureLocation | *((_QWORD *)v4 + 10)
    && !-[GEOLatLng isEqual:](primaryFeatureLocation, "isEqual:")
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_32;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_32;
    if (self->_isLatlngRequest)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_32;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_streetSubPostalGeoId != *((_QWORD *)v4 + 11))
      goto LABEL_32;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_32;
  }
  dataSourceId = self->_dataSourceId;
  if ((unint64_t)dataSourceId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](dataSourceId, "isEqual:"))
      goto LABEL_32;
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 56);
  }
  if ((flags & 4) == 0)
  {
    if ((v9 & 4) == 0)
      goto LABEL_38;
LABEL_32:
    v11 = 0;
    goto LABEL_33;
  }
  if ((v9 & 4) == 0)
    goto LABEL_32;
  if (!self->_dataSourceIdRequired)
  {
    if (!*((_BYTE *)v4 + 108))
      goto LABEL_38;
    goto LABEL_32;
  }
  if (!*((_BYTE *)v4 + 108))
    goto LABEL_32;
LABEL_38:
  interpolationParameter = self->_interpolationParameter;
  if ((unint64_t)interpolationParameter | *((_QWORD *)v4 + 7))
    v11 = -[GEOInterpolationParameters isEqual:](interpolationParameter, "isEqual:");
  else
    v11 = 1;
LABEL_33:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int16 flags;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 1);
  v3 = -[GEOAddress hash](self->_preserveFields, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761u * self->_primaryFeatureGeoId;
  else
    v4 = 0;
  v5 = -[GEOLatLng hash](self->_primaryFeatureLocation, "hash");
  v6 = PBRepeatedUInt64Hash();
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v8 = 2654435761 * self->_isLatlngRequest;
    if ((flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      v9 = 2654435761u * self->_streetSubPostalGeoId;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = -[NSString hash](self->_dataSourceId, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v11 = 2654435761 * self->_dataSourceIdRequired;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[GEOInterpolationParameters hash](self->_interpolationParameter, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryFeatureLocation, 0);
  objc_storeStrong((id *)&self->_preserveFields, 0);
  objc_storeStrong((id *)&self->_interpolationParameter, 0);
  objc_storeStrong((id *)&self->_dataSourceId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
