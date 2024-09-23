@implementation GEOSpatialLookupBatchRequest

- (GEOSpatialLookupBatchRequest)init
{
  GEOSpatialLookupBatchRequest *v2;
  GEOSpatialLookupBatchRequest *v3;
  GEOSpatialLookupBatchRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSpatialLookupBatchRequest;
  v2 = -[GEOSpatialLookupBatchRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpatialLookupBatchRequest)initWithData:(id)a3
{
  GEOSpatialLookupBatchRequest *v3;
  GEOSpatialLookupBatchRequest *v4;
  GEOSpatialLookupBatchRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSpatialLookupBatchRequest;
  v3 = -[GEOSpatialLookupBatchRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequests
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequests_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)requests
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *requests;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  requests = self->_requests;
  self->_requests = v4;

}

- (void)clearRequests
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)addRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  -[GEOSpatialLookupBatchRequest _addNoFlagsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)requestsCount
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  return -[NSMutableArray count](self->_requests, "count");
}

- (id)requestAtIndex:(unint64_t)a3
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", a3);
}

+ (Class)requestType
{
  return (Class)objc_opt_class();
}

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCountryCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOSpatialLookupBatchRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOSpatialLookupBatchRequest _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDeviceSku
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSku_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceSku
{
  -[GEOSpatialLookupBatchRequest _readDeviceSku]((uint64_t)self);
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOSpatialLookupBatchRequest _readDeviceSku]((uint64_t)self);
  return self->_deviceSku;
}

- (void)setDeviceSku:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_deviceSku, a3);
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
  v8.super_class = (Class)GEOSpatialLookupBatchRequest;
  -[GEOSpatialLookupBatchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpatialLookupBatchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpatialLookupBatchRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
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
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = a1[4];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v18);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("request"));
  }
  objc_msgSend(a1, "deviceCountryCode", (_QWORD)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("deviceCountryCode");
    else
      v14 = CFSTR("device_country_code");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend(a1, "deviceSku");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("deviceSku");
    else
      v16 = CFSTR("device_sku");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSpatialLookupBatchRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEOSpatialLookupBatchRequest)initWithDictionary:(id)a3
{
  return (GEOSpatialLookupBatchRequest *)-[GEOSpatialLookupBatchRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOSpatialLookupRequest *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v23 = v6;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOSpatialLookupRequest alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOSpatialLookupRequest initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOSpatialLookupRequest initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addRequest:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v9);
        }

        v6 = v23;
      }

      if (a3)
        v16 = CFSTR("deviceCountryCode");
      else
        v16 = CFSTR("device_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setDeviceCountryCode:", v18);

      }
      if (a3)
        v19 = CFSTR("deviceSku");
      else
        v19 = CFSTR("device_sku");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setDeviceSku:", v21);

      }
    }
  }

  return a1;
}

- (GEOSpatialLookupBatchRequest)initWithJSON:(id)a3
{
  return (GEOSpatialLookupBatchRequest *)-[GEOSpatialLookupBatchRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_41;
    else
      v8 = (int *)&readAll__nonRecursiveTag_41;
    GEOSpatialLookupBatchRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_requests;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "readAll:", 1, (_QWORD)v13);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v16;
  unint64_t v18;
  BOOL v19;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_30;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        goto LABEL_30;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        if (v16 != 2)
          goto LABEL_31;
LABEL_28:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_31;
        goto LABEL_29;
      }
      if ((_DWORD)v18 != 1)
        goto LABEL_28;
      if (v16 != 2 || !PBReaderPlaceMark() || !GEOSpatialLookupRequestIsValid((char *)a3))
      {
LABEL_31:
        PBReaderRecallMark();
        return 0;
      }
      PBReaderRecallMark();
LABEL_29:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_30;
    }
    if (v16 != 2)
      goto LABEL_31;
    goto LABEL_28;
  }
LABEL_30:
  v19 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v19;
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpatialLookupBatchRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSpatialLookupBatchRequest readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_requests;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_deviceCountryCode)
      PBDataWriterWriteStringField();
    if (self->_deviceSku)
      PBDataWriterWriteStringField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_requests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1021;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOSpatialLookupBatchRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOSpatialLookupBatchRequest requestsCount](self, "requestsCount"))
  {
    objc_msgSend(v9, "clearRequests");
    v4 = -[GEOSpatialLookupBatchRequest requestsCount](self, "requestsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOSpatialLookupBatchRequest requestAtIndex:](self, "requestAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRequest:", v7);

      }
    }
  }
  if (self->_deviceCountryCode)
    objc_msgSend(v9, "setDeviceCountryCode:");
  v8 = v9;
  if (self->_deviceSku)
  {
    objc_msgSend(v9, "setDeviceSku:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOSpatialLookupBatchRequestReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSpatialLookupBatchRequest readAll:](self, "readAll:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_requests;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v5, "addRequest:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3);
  v14 = (void *)v5[2];
  v5[2] = v13;

  v15 = -[NSString copyWithZone:](self->_deviceSku, "copyWithZone:", a3);
  v16 = (void *)v5[3];
  v5[3] = v15;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *requests;
  NSString *deviceCountryCode;
  NSString *deviceSku;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSpatialLookupBatchRequest readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         requests = self->_requests,
         !((unint64_t)requests | v4[4]))
     || -[NSMutableArray isEqual:](requests, "isEqual:"))
    && ((deviceCountryCode = self->_deviceCountryCode, !((unint64_t)deviceCountryCode | v4[2]))
     || -[NSString isEqual:](deviceCountryCode, "isEqual:")))
  {
    deviceSku = self->_deviceSku;
    if ((unint64_t)deviceSku | v4[3])
      v8 = -[NSString isEqual:](deviceSku, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;

  -[GEOSpatialLookupBatchRequest readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_requests, "hash");
  v4 = -[NSString hash](self->_deviceCountryCode, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deviceSku, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOSpatialLookupBatchRequest addRequest:](self, "addRequest:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[2])
    -[GEOSpatialLookupBatchRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  if (v4[3])
    -[GEOSpatialLookupBatchRequest setDeviceSku:](self, "setDeviceSku:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
