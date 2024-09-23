@implementation GEOPDBatchReverseGeocodingParameters

- (GEOPDBatchReverseGeocodingParameters)init
{
  GEOPDBatchReverseGeocodingParameters *v2;
  GEOPDBatchReverseGeocodingParameters *v3;
  GEOPDBatchReverseGeocodingParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  v2 = -[GEOPDBatchReverseGeocodingParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBatchReverseGeocodingParameters)initWithData:(id)a3
{
  GEOPDBatchReverseGeocodingParameters *v3;
  GEOPDBatchReverseGeocodingParameters *v4;
  GEOPDBatchReverseGeocodingParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  v3 = -[GEOPDBatchReverseGeocodingParameters initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  -[GEOPDBatchReverseGeocodingParameters dealloc](&v3, sel_dealloc);
}

- (void)_readAssetLocations
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
        GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAssetLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)assetLocations
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBatchReverseGeocodingParameters _readAssetLocations]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setAssetLocations:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 8u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)addAssetLocation:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDBatchReverseGeocodingParameters _readAssetLocations](a1);
    -[GEOPDBatchReverseGeocodingParameters _addNoFlagsAssetLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 8u;
  }
}

- (void)_addNoFlagsAssetLocation:(uint64_t)a1
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

- (void)_readAdditionalPlaceTypes
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
        GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addAdditionalPlaceType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 8u;
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
  v8.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  -[GEOPDBatchReverseGeocodingParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBatchReverseGeocodingParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBatchReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDBatchReverseGeocodingParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("assetLocation");
    else
      v13 = CFSTR("asset_location");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v16 = 0;
      do
      {
        v17 = *(unsigned int *)(*v15 + 4 * v16);
        switch((int)v17)
        {
          case '#':
            v18 = CFSTR("TIME_ZONE");
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
LABEL_26:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
          case '+':
            v18 = CFSTR("SUB_LOCALITY");
            break;
          case ',':
            v18 = CFSTR("OCEAN");
            break;
          case '-':
            v18 = CFSTR("AOI");
            break;
          case '.':
            v18 = CFSTR("INLAND_WATER");
            break;
          case '/':
            v18 = CFSTR("BUSINESS");
            break;
          case '0':
            v18 = CFSTR("ISLAND");
            break;
          case '1':
            v18 = CFSTR("STREET");
            break;
          case '2':
            v18 = CFSTR("ADMIN");
            break;
          case '3':
            v18 = CFSTR("POSTAL");
            break;
          case '6':
            v18 = CFSTR("INTERSECTION");
            break;
          case '7':
            v18 = CFSTR("BUILDING");
            break;
          case '9':
            v18 = CFSTR("ADDRESS");
            break;
          case '=':
            v18 = CFSTR("CONTINENT");
            break;
          case '?':
            v18 = CFSTR("REGION");
            break;
          case '@':
            v18 = CFSTR("DIVISION");
            break;
          case 'A':
            v18 = CFSTR("PHYSICAL_FEATURE");
            break;
          default:
            v18 = CFSTR("UNKNOWN_PLACE_TYPE");
            switch((int)v17)
            {
              case 0:
                goto LABEL_45;
              case 1:
                v18 = CFSTR("COUNTRY");
                break;
              case 2:
                v18 = CFSTR("ADMINISTRATIVE_AREA");
                break;
              case 3:
                goto LABEL_26;
              case 4:
                v18 = CFSTR("SUB_ADMINISTRATIVE_AREA");
                break;
              default:
                if ((_DWORD)v17 != 16)
                  goto LABEL_26;
                v18 = CFSTR("LOCALITY");
                break;
            }
            break;
        }
LABEL_45:
        objc_msgSend(v14, "addObject:", v18);

        ++v16;
        v15 = (_QWORD *)(a1 + 24);
      }
      while (v16 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v19 = CFSTR("additionalPlaceType");
    else
      v19 = CFSTR("additional_place_type");
    objc_msgSend(v4, "setObject:forKey:", v14, v19);

  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__GEOPDBatchReverseGeocodingParameters__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBatchReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1721;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1722;
      GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDBatchReverseGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __66__GEOPDBatchReverseGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDBatchReverseGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
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
    -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_assetLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_additionalPlaceTypes.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_additionalPlaceTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDBatchReverseGeocodingParametersReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_assetLocations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        -[GEOPDBatchReverseGeocodingParameters addAssetLocation:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *assetLocations;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 1),
         -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)v4, 1),
         assetLocations = self->_assetLocations,
         !((unint64_t)assetLocations | v4[6]))
     || -[NSMutableArray isEqual:](assetLocations, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_assetLocations, "hash");
  return PBRepeatedInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
