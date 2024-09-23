@implementation GEOPDVenueFeatureValue

- (GEOPDVenueFeatureValue)init
{
  GEOPDVenueFeatureValue *v2;
  GEOPDVenueFeatureValue *v3;
  GEOPDVenueFeatureValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueFeatureValue;
  v2 = -[GEOPDVenueFeatureValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueFeatureValue)initWithData:(id)a3
{
  GEOPDVenueFeatureValue *v3;
  GEOPDVenueFeatureValue *v4;
  GEOPDVenueFeatureValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueFeatureValue;
  v3 = -[GEOPDVenueFeatureValue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDVenueFeatureValue;
  -[GEOPDVenueFeatureValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVenueFeatureValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueFeatureValue _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  -[GEOPDVenueFeatureValue readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDVenueFeatureValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureVenue_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v7 = *(id *)(a1 + 40);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("featureVenue");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("feature_venue");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 2) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDVenueFeatureValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureBuilding_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v13 = *(id *)(a1 + 24);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("featureBuilding");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("feature_building");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 4) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDVenueFeatureValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeaturePoi_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v19 = *(id *)(a1 + 32);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("featurePoi");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("feature_poi");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __52__GEOPDVenueFeatureValue__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueFeatureValue _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_198;
      else
        v6 = (int *)&readAll__nonRecursiveTag_199;
      GEOPDVenueFeatureValueReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDFeatureVenue readAll:](*(_QWORD *)(a1 + 40), 1);
      -[GEOPDFeatureBuilding readAll:](*(_QWORD *)(a1 + 24), 1);
      -[GEOPDFeaturePOI readAll:](*(_QWORD *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __52__GEOPDVenueFeatureValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueFeatureValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  GEOPDFeatureVenue *featureVenue;
  char IsDirty;
  GEOPDFeatureBuilding *featureBuilding;
  char v9;
  GEOPDFeaturePOI *featurePoi;
  char v11;
  id v12;
  PBDataReader *v13;
  void *v14;
  id v15;

  v15 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_14;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    featureVenue = self->_featureVenue;
    if (featureVenue)
    {
      os_unfair_lock_lock_with_options();
      IsDirty = _GEOPDFeatureVenueIsDirty((uint64_t)featureVenue);
      os_unfair_lock_unlock(&featureVenue->_readerLock);
      if ((IsDirty & 1) != 0)
        goto LABEL_14;
      flags = (char)self->_flags;
    }
  }
  if ((flags & 2) != 0)
  {
    featureBuilding = self->_featureBuilding;
    if (featureBuilding)
    {
      os_unfair_lock_lock_with_options();
      v9 = _GEOPDFeatureBuildingIsDirty((uint64_t)featureBuilding);
      os_unfair_lock_unlock(&featureBuilding->_readerLock);
      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    flags = (char)self->_flags;
  }
  if ((flags & 4) == 0
    || (featurePoi = self->_featurePoi) == 0
    || (os_unfair_lock_lock_with_options(),
        v11 = _GEOPDFeaturePOIIsDirty((uint64_t)featurePoi),
        os_unfair_lock_unlock(&featurePoi->_readerLock),
        (v11 & 1) == 0))
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_21;
  }
LABEL_14:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 0);
  if (self->_featureVenue)
    PBDataWriterWriteSubmessage();
  v12 = v15;
  if (self->_featureBuilding)
  {
    PBDataWriterWriteSubmessage();
    v12 = v15;
  }
  if (self->_featurePoi)
  {
    PBDataWriterWriteSubmessage();
    v12 = v15;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v12);
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDFeatureVenue copyWithZone:](self->_featureVenue, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[GEOPDFeatureBuilding copyWithZone:](self->_featureBuilding, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEOPDFeaturePOI copyWithZone:](self->_featurePoi, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDVenueFeatureValueReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDFeatureVenue *featureVenue;
  GEOPDFeatureBuilding *featureBuilding;
  GEOPDFeaturePOI *featurePoi;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 1),
         -[GEOPDVenueFeatureValue readAll:]((uint64_t)v4, 1),
         featureVenue = self->_featureVenue,
         !((unint64_t)featureVenue | v4[5]))
     || -[GEOPDFeatureVenue isEqual:](featureVenue, "isEqual:"))
    && ((featureBuilding = self->_featureBuilding, !((unint64_t)featureBuilding | v4[3]))
     || -[GEOPDFeatureBuilding isEqual:](featureBuilding, "isEqual:")))
  {
    featurePoi = self->_featurePoi;
    if ((unint64_t)featurePoi | v4[4])
      v8 = -[GEOPDFeaturePOI isEqual:](featurePoi, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDFeatureVenue hash](self->_featureVenue, "hash");
  v4 = -[GEOPDFeatureBuilding hash](self->_featureBuilding, "hash") ^ v3;
  return v4 ^ -[GEOPDFeaturePOI hash](self->_featurePoi, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVenue, 0);
  objc_storeStrong((id *)&self->_featurePoi, 0);
  objc_storeStrong((id *)&self->_featureBuilding, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
