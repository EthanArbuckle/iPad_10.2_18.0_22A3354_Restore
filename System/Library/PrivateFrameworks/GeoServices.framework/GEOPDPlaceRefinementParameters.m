@implementation GEOPDPlaceRefinementParameters

- (GEOPDPlaceRefinementParameters)initWithIdentifier:(id)a3 placeNameHint:(id)a4 locationHint:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  GEOPDPlaceRefinementParameters *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  GEOLatLng *v16;
  GEOPDPlaceRefinementParameters *v17;
  objc_super v19;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRefinementParameters;
  v11 = -[GEOPDPlaceRefinementParameters init](&v19, sel_init);
  if (v11)
  {
    if (v9)
    {
      objc_msgSend(v9, "mapsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRefinementParameters setMapsId:]((uint64_t)v11, v12);

      if (objc_msgSend(v9, "muid"))
      {
        v13 = objc_msgSend(v9, "muid");
        *(_WORD *)&v11->_flags |= 0x1000u;
        *(_WORD *)&v11->_flags |= 1u;
        v11->_muid = v13;
      }
      v14 = objc_msgSend(v9, "resultProviderID");
      if (!v14)
      {
        +[GEOMapService sharedService](GEOMapService, "sharedService");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v15, "localSearchProviderID");

      }
      *(_WORD *)&v11->_flags |= 0x1000u;
      *(_WORD *)&v11->_flags |= 8u;
      v11->_resultProviderId = v14;
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v16 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDPlaceRefinementParameters setLocationHint:]((uint64_t)v11, v16);

    }
    if (objc_msgSend(v10, "length"))
      -[GEOPDPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v11, v10);
    v17 = v11;
  }

  return v11;
}

- (void)setPlaceNameHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x800u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)setMapsId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x400u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)setLocationHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x200u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_addressObjectHint, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
  void *v9;
  GEOPDPlaceRefinementParameters *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  int v18;
  int v19;
  GEOPDPlaceRefinementParameters *v20;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  objc_msgSend(v7, "_identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOPDPlaceRefinementParameters initWithIdentifier:placeNameHint:locationHint:](self, "initWithIdentifier:placeNameHint:locationHint:", v8, v9, var0, var1);

  if (!v10)
    goto LABEL_15;
  objc_msgSend(v7, "geoAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasStructuredAddress"))
  {
    objc_msgSend(v11, "structuredAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRefinementParameters setAddressHint:]((uint64_t)v10, v12);

  }
  if (objc_msgSend(v11, "formattedAddressLinesCount"))
  {
    objc_msgSend(v11, "formattedAddressLines");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRefinementParameters setFormattedAddressLineHints:]((uint64_t)v10, v13);

  }
  objc_msgSend(v7, "addressObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "rawBytes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      -[GEOPDPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v10, v16);

  }
  v17 = objc_msgSend(v7, "_addressGeocodeAccuracy");
  if (v17 >= 6)
  {
    if (v17 == -1)
      goto LABEL_12;
    v17 = -1;
  }
  *(_WORD *)&v10->_flags |= 0x1000u;
  *(_WORD *)&v10->_flags |= 2u;
  v10->_addressGeocodeAccuracyHint = v17;
LABEL_12:
  v18 = objc_msgSend(v7, "_placeType");
  if (v18)
  {
    v19 = _PDPlaceTypeForMapItemPlaceType(v18);
    *(_WORD *)&v10->_flags |= 0x1000u;
    *(_WORD *)&v10->_flags |= 4u;
    v10->_placeTypeHint = v19;
  }
  *(_WORD *)&v10->_flags |= 0x1000u;
  *(_WORD *)&v10->_flags |= 0x10u;
  v10->_supportCoordinatesOnlyRefinement = 1;
  v20 = v10;

LABEL_15:
  return v10;
}

- (void)setAddressObjectHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)setFormattedAddressLineHints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)setAddressHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x40u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FC0) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 0);
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_locationHint)
      PBDataWriterWriteSubmessage();
    if (self->_addressHint)
      PBDataWriterWriteSubmessage();
    if (self->_placeNameHint)
      PBDataWriterWriteStringField();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_formattedAddressLineHints;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_addressObjectHint)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3959;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3960;
      GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (GEOPDPlaceRefinementParameters)init
{
  GEOPDPlaceRefinementParameters *v2;
  GEOPDPlaceRefinementParameters *v3;
  GEOPDPlaceRefinementParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRefinementParameters;
  v2 = -[GEOPDPlaceRefinementParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceRefinementParameters)initWithData:(id)a3
{
  GEOPDPlaceRefinementParameters *v3;
  GEOPDPlaceRefinementParameters *v4;
  GEOPDPlaceRefinementParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRefinementParameters;
  v3 = -[GEOPDPlaceRefinementParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationHint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)locationHint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRefinementParameters _readLocationHint]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readAddressHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressHint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)addressHint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRefinementParameters _readAddressHint]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readPlaceNameHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceNameHint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)placeNameHint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRefinementParameters _readPlaceNameHint]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readFormattedAddressLineHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)formattedAddressLineHints
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRefinementParameters _readFormattedAddressLineHints]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (uint64_t)clearFormattedAddressLineHints
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 88));
    *(_WORD *)(v1 + 108) |= 0x1000u;
    return objc_msgSend(*(id *)(v1 + 40), "removeAllObjects");
  }
  return result;
}

- (void)addFormattedAddressLineHint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceRefinementParameters _readFormattedAddressLineHints](a1);
    -[GEOPDPlaceRefinementParameters _addNoFlagsFormattedAddressLineHint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 108) |= 0x1000u;
  }
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
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
  v8.super_class = (Class)GEOPDPlaceRefinementParameters;
  -[GEOPDPlaceRefinementParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRefinementParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v46[4];
  id v47;

  if (!a1)
    return 0;
  -[GEOPDPlaceRefinementParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 100));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("resultProviderId");
    else
      v7 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 108);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("muid"));

  }
  -[GEOPDPlaceRefinementParameters locationHint]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("locationHint");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("location_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDPlaceRefinementParameters addressHint]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("addressHint");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("address_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  -[GEOPDPlaceRefinementParameters placeNameHint]((id *)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("placeNameHint");
    else
      v18 = CFSTR("place_name_hint");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    -[GEOPDPlaceRefinementParameters formattedAddressLineHints]((id *)a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("formattedAddressLineHint");
    else
      v20 = CFSTR("formatted_address_line_hint");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(_WORD *)(a1 + 108);
  if ((v21 & 4) != 0)
  {
    v22 = *(_DWORD *)(a1 + 96);
    switch(v22)
    {
      case '#':
        v23 = CFSTR("TIME_ZONE");
        break;
      case '$':
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '4':
      case '5':
      case '8':
      case ':':
      case ';':
      case '<':
      case '>':
LABEL_36:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 96));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v23 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v23 = CFSTR("OCEAN");
        break;
      case '-':
        v23 = CFSTR("AOI");
        break;
      case '.':
        v23 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v23 = CFSTR("BUSINESS");
        break;
      case '0':
        v23 = CFSTR("ISLAND");
        break;
      case '1':
        v23 = CFSTR("STREET");
        break;
      case '2':
        v23 = CFSTR("ADMIN");
        break;
      case '3':
        v23 = CFSTR("POSTAL");
        break;
      case '6':
        v23 = CFSTR("INTERSECTION");
        break;
      case '7':
        v23 = CFSTR("BUILDING");
        break;
      case '9':
        v23 = CFSTR("ADDRESS");
        break;
      case '=':
        v23 = CFSTR("CONTINENT");
        break;
      case '?':
        v23 = CFSTR("REGION");
        break;
      case '@':
        v23 = CFSTR("DIVISION");
        break;
      case 'A':
        v23 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v23 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v22)
        {
          case 0:
            goto LABEL_55;
          case 1:
            v23 = CFSTR("COUNTRY");
            break;
          case 2:
            v23 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_36;
          case 4:
            v23 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v22 != 16)
              goto LABEL_36;
            v23 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_55:
    if (a2)
      v24 = CFSTR("placeTypeHint");
    else
      v24 = CFSTR("place_type_hint");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v21 = *(_WORD *)(a1 + 108);
  }
  if ((v21 & 2) != 0)
  {
    v25 = *(int *)(a1 + 92);
    if (v25 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C051D0[v25];
    }
    if (a2)
      v27 = CFSTR("addressGeocodeAccuracyHint");
    else
      v27 = CFSTR("address_geocode_accuracy_hint");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
  {
    v28 = *(void **)(a1 + 8);
    if (v28)
    {
      v29 = v28;
      objc_sync_enter(v29);
      GEOPDPlaceRefinementParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressObjectHint_tags);
      objc_sync_exit(v29);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v30 = *(id *)(a1 + 32);
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("addressObjectHint"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("address_object_hint"));
    }
  }

  if ((*(_WORD *)(a1 + 108) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("supportCoordinatesOnlyRefinement");
    else
      v34 = CFSTR("support_coordinates_only_refinement");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  -[GEOPDPlaceRefinementParameters _readMapsId](a1);
  v35 = *(id *)(a1 + 56);
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __60__GEOPDPlaceRefinementParameters__dictionaryRepresentation___block_invoke;
      v46[3] = &unk_1E1C00600;
      v43 = v42;
      v47 = v43;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v46);
      v44 = v43;

      v41 = v44;
    }
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDPlaceRefinementParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  GEOLatLng *v13;
  GEOLatLng *v14;
  GEOLatLng *v15;
  const __CFString *v16;
  void *v17;
  GEOStructuredAddress *v18;
  GEOStructuredAddress *v19;
  GEOStructuredAddress *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  int v36;
  const __CFString *v37;
  void *v38;
  id v39;
  int v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  char v46;
  const __CFString *v47;
  void *v48;
  GEOPDMapsIdentifier *v49;
  GEOPDMapsIdentifier *v50;
  GEOPDMapsIdentifier *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_138;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_138;
  if (a3)
    v6 = CFSTR("resultProviderId");
  else
    v6 = CFSTR("result_provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "intValue");
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 8u;
    *(_DWORD *)(a1 + 100) = v8;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "unsignedLongLongValue");
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 1u;
    *(_QWORD *)(a1 + 64) = v10;
  }

  if (a3)
    v11 = CFSTR("locationHint");
  else
    v11 = CFSTR("location_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOLatLng initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOLatLng initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = v14;
    -[GEOPDPlaceRefinementParameters setLocationHint:](a1, v14);

  }
  if (a3)
    v16 = CFSTR("addressHint");
  else
    v16 = CFSTR("address_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOStructuredAddress alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOStructuredAddress initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOStructuredAddress initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = v19;
    -[GEOPDPlaceRefinementParameters setAddressHint:](a1, v19);

  }
  if (a3)
    v21 = CFSTR("placeNameHint");
  else
    v21 = CFSTR("place_name_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    -[GEOPDPlaceRefinementParameters setPlaceNameHint:](a1, v23);

  }
  if (a3)
    v24 = CFSTR("formattedAddressLineHint");
  else
    v24 = CFSTR("formatted_address_line_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v54 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = (void *)objc_msgSend(v31, "copy", (_QWORD)v53);
            -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](a1, v32);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v28);
    }

  }
  if (a3)
    v33 = CFSTR("placeTypeHint");
  else
    v33 = CFSTR("place_type_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33, (_QWORD)v53);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v34;
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
    {
      v36 = 0;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
    {
      v36 = 1;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v36 = 2;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v36 = 4;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
    {
      v36 = 16;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
    {
      v36 = 35;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
    {
      v36 = 43;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
    {
      v36 = 44;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
    {
      v36 = 45;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
    {
      v36 = 46;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v36 = 47;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
    {
      v36 = 48;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
    {
      v36 = 49;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
    {
      v36 = 50;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v36 = 51;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
    {
      v36 = 54;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
    {
      v36 = 55;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v36 = 57;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
    {
      v36 = 61;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
    {
      v36 = 63;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
    {
      v36 = 64;
    }
    else if (objc_msgSend(v35, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
    {
      v36 = 65;
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_98;
    v36 = objc_msgSend(v34, "intValue");
  }
  *(_WORD *)(a1 + 108) |= 0x1000u;
  *(_WORD *)(a1 + 108) |= 4u;
  *(_DWORD *)(a1 + 96) = v36;
LABEL_98:

  if (a3)
    v37 = CFSTR("addressGeocodeAccuracyHint");
  else
    v37 = CFSTR("address_geocode_accuracy_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
    {
      v40 = 0;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
    {
      v40 = 1;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
    {
      v40 = 2;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("POSTAL_ZIP")) & 1) != 0)
    {
      v40 = 3;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
    {
      v40 = 4;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("SUBPREMISE")))
    {
      v40 = 5;
    }
    else
    {
      v40 = 0;
    }

    goto LABEL_118;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = objc_msgSend(v38, "intValue");
LABEL_118:
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 2u;
    *(_DWORD *)(a1 + 92) = v40;
  }

  if (a3)
    v41 = CFSTR("addressObjectHint");
  else
    v41 = CFSTR("address_object_hint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v42, 0);
    -[GEOPDPlaceRefinementParameters setAddressObjectHint:](a1, v43);

  }
  if (a3)
    v44 = CFSTR("supportCoordinatesOnlyRefinement");
  else
    v44 = CFSTR("support_coordinates_only_refinement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = objc_msgSend(v45, "BOOLValue");
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 0x10u;
    *(_BYTE *)(a1 + 104) = v46;
  }

  if (a3)
    v47 = CFSTR("mapsId");
  else
    v47 = CFSTR("maps_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v50 = -[GEOPDMapsIdentifier initWithJSON:](v49, "initWithJSON:", v48);
    else
      v50 = -[GEOPDMapsIdentifier initWithDictionary:](v49, "initWithDictionary:", v48);
    v51 = v50;
    -[GEOPDPlaceRefinementParameters setMapsId:](a1, v50);

  }
LABEL_138:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceRefinementParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDPlaceRefinementParameters _readLocationHint](result);
    if ((objc_msgSend(*(id *)(v3 + 48), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceRefinementParameters _readMapsId](v3);
      return objc_msgSend(*(id *)(v3 + 56), "hasGreenTeaWithValue:", a2);
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
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int16 v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceRefinementParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_resultProviderId;
    *(_WORD *)(v5 + 108) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  v10 = -[GEOLatLng copyWithZone:](self->_locationHint, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[GEOStructuredAddress copyWithZone:](self->_addressHint, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_placeNameHint, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = self->_formattedAddressLineHints;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  v21 = (__int16)self->_flags;
  if ((v21 & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_placeTypeHint;
    *(_WORD *)(v5 + 108) |= 4u;
    v21 = (__int16)self->_flags;
  }
  if ((v21 & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  v22 = -[NSData copyWithZone:](self->_addressObjectHint, "copyWithZone:", a3, (_QWORD)v28);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_supportCoordinatesOnlyRefinement;
    *(_WORD *)(v5 + 108) |= 0x10u;
  }
  v24 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOLatLng *locationHint;
  GEOStructuredAddress *addressHint;
  NSString *placeNameHint;
  NSMutableArray *formattedAddressLineHints;
  __int16 v11;
  __int16 v12;
  NSData *addressObjectHint;
  char v14;
  GEOPDMapsIdentifier *mapsId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 54);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 25))
      goto LABEL_37;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 8))
      goto LABEL_37;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_37;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((_QWORD *)v4 + 6) && !-[GEOLatLng isEqual:](locationHint, "isEqual:"))
    goto LABEL_37;
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:"))
      goto LABEL_37;
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:"))
      goto LABEL_37;
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:"))
      goto LABEL_37;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 54);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 24))
      goto LABEL_37;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 23))
      goto LABEL_37;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_37;
  }
  addressObjectHint = self->_addressObjectHint;
  if ((unint64_t)addressObjectHint | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](addressObjectHint, "isEqual:"))
      goto LABEL_37;
    v11 = (__int16)self->_flags;
    v12 = *((_WORD *)v4 + 54);
  }
  if ((v11 & 0x10) == 0)
  {
    if ((v12 & 0x10) == 0)
      goto LABEL_43;
LABEL_37:
    v14 = 0;
    goto LABEL_38;
  }
  if ((v12 & 0x10) == 0)
    goto LABEL_37;
  if (!self->_supportCoordinatesOnlyRefinement)
  {
    if (!*((_BYTE *)v4 + 104))
      goto LABEL_43;
    goto LABEL_37;
  }
  if (!*((_BYTE *)v4 + 104))
    goto LABEL_37;
LABEL_43:
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 7))
    v14 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  else
    v14 = 1;
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v15 = 2654435761 * self->_resultProviderId;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEOLatLng hash](self->_locationHint, "hash");
  v6 = -[GEOStructuredAddress hash](self->_addressHint, "hash");
  v7 = -[NSString hash](self->_placeNameHint, "hash");
  v8 = -[NSMutableArray hash](self->_formattedAddressLineHints, "hash");
  v9 = (__int16)self->_flags;
  if ((v9 & 4) != 0)
  {
    v10 = 2654435761 * self->_placeTypeHint;
    if ((v9 & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    v10 = 0;
    if ((v9 & 2) != 0)
    {
LABEL_8:
      v11 = 2654435761 * self->_addressGeocodeAccuracyHint;
      goto LABEL_11;
    }
  }
  v11 = 0;
LABEL_11:
  v12 = -[NSData hash](self->_addressObjectHint, "hash");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    v13 = 2654435761 * self->_supportCoordinatesOnlyRefinement;
  else
    v13 = 0;
  return v4 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  __int16 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int16 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)v3, 0);
    v5 = *((_WORD *)v4 + 54);
    if ((v5 & 8) != 0)
    {
      *(_DWORD *)(a1 + 100) = *((_DWORD *)v4 + 25);
      *(_WORD *)(a1 + 108) |= 8u;
      v5 = *((_WORD *)v4 + 54);
    }
    if ((v5 & 1) != 0)
    {
      *(_QWORD *)(a1 + 64) = *((_QWORD *)v4 + 8);
      *(_WORD *)(a1 + 108) |= 1u;
    }
    v6 = *(void **)(a1 + 48);
    v7 = *((_QWORD *)v4 + 6);
    if (v6)
    {
      if (v7)
        objc_msgSend(v6, "mergeFrom:");
    }
    else if (v7)
    {
      -[GEOPDPlaceRefinementParameters setLocationHint:](a1, *((void **)v4 + 6));
    }
    v8 = *(void **)(a1 + 24);
    v9 = *((_QWORD *)v4 + 3);
    if (v8)
    {
      if (v9)
        objc_msgSend(v8, "mergeFrom:");
    }
    else if (v9)
    {
      -[GEOPDPlaceRefinementParameters setAddressHint:](a1, *((void **)v4 + 3));
    }
    v10 = (void *)*((_QWORD *)v4 + 9);
    if (v10)
      -[GEOPDPlaceRefinementParameters setPlaceNameHint:](a1, v10);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *((id *)v4 + 5);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](a1, *(void **)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v16 = *((_WORD *)v4 + 54);
    if ((v16 & 4) != 0)
    {
      *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
      *(_WORD *)(a1 + 108) |= 4u;
      v16 = *((_WORD *)v4 + 54);
    }
    if ((v16 & 2) != 0)
    {
      *(_DWORD *)(a1 + 92) = *((_DWORD *)v4 + 23);
      *(_WORD *)(a1 + 108) |= 2u;
    }
    v17 = (void *)*((_QWORD *)v4 + 4);
    if (v17)
      -[GEOPDPlaceRefinementParameters setAddressObjectHint:](a1, v17);
    if ((*((_WORD *)v4 + 54) & 0x10) != 0)
    {
      *(_BYTE *)(a1 + 104) = *((_BYTE *)v4 + 104);
      *(_WORD *)(a1 + 108) |= 0x10u;
    }
    v18 = *(void **)(a1 + 56);
    v19 = *((_QWORD *)v4 + 7);
    if (v18)
    {
      if (v19)
        objc_msgSend(v18, "mergeFrom:", (_QWORD)v20);
    }
    else if (v19)
    {
      -[GEOPDPlaceRefinementParameters setMapsId:](a1, *((void **)v4 + 7));
    }
  }

}

- (BOOL)_hasRequiredFields
{
  GEOPDPlaceRefinementParameters *v2;

  if (self)
  {
    v2 = self;
    -[GEOPDPlaceRefinementParameters _readLocationHint]((uint64_t)self);
    LOBYTE(self) = v2->_locationHint != 0;
  }
  return (char)self;
}

- (unint64_t)_routeHypothesisPlaceRefinementParametersHash
{
  void *v3;
  unint64_t v4;

  if (!-[GEOPDPlaceRefinementParameters _hasRequiredFields](self, "_hasRequiredFields"))
    return 1;
  -[GEOPDPlaceRefinementParameters locationHint]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)_routeHypothesisPlaceRefinementParametersIsEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  if (-[GEOPDPlaceRefinementParameters _hasRequiredFields](self, "_hasRequiredFields")
    && (objc_msgSend(v4, "_hasRequiredFields") & 1) != 0)
  {
    -[GEOPDPlaceRefinementParameters locationHint]((id *)&self->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRefinementParameters locationHint](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEOPDPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  GEOPDPlaceRefinementParameters *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "coordinate");
  else
    v9 = -180.0;
  v10 = -[GEOPDPlaceRefinementParameters initWithIdentifier:placeNameHint:locationHint:](self, "initWithIdentifier:placeNameHint:locationHint:", v8, v6, v9);

  return v10;
}

@end
