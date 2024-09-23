@implementation GEOPBOfflinePerformanceMetrics

- (GEOPBOfflinePerformanceMetrics)init
{
  GEOPBOfflinePerformanceMetrics *v2;
  GEOPBOfflinePerformanceMetrics *v3;
  GEOPBOfflinePerformanceMetrics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  v2 = -[GEOPBOfflinePerformanceMetrics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflinePerformanceMetrics)initWithData:(id)a3
{
  GEOPBOfflinePerformanceMetrics *v3;
  GEOPBOfflinePerformanceMetrics *v4;
  GEOPBOfflinePerformanceMetrics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  v3 = -[GEOPBOfflinePerformanceMetrics initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setDeviceModel:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 2u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setOsBuild:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 8u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setOfflineVersion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 4u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setDataVersion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 1u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 16), a2);

}

- (void)addServiceMetrics:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceMetrics_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOPBOfflinePerformanceMetrics _addNoFlagsServiceMetrics:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsServiceMetrics:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  -[GEOPBOfflinePerformanceMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflinePerformanceMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflinePerformanceMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const __CFString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPBOfflinePerformanceMetrics readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceModel_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("deviceModel");
    else
      v8 = CFSTR("device_model");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOsBuild_tags_0);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v11 = *(id *)(a1 + 40);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("osBuild");
    else
      v12 = CFSTR("os_build");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineVersion_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v15 = *(id *)(a1 + 32);
  if (v15)
  {
    if (a2)
      v16 = CFSTR("offlineVersion");
    else
      v16 = CFSTR("offline_version");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataVersion_tags_0);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v19 = *(id *)(a1 + 16);
  if (v19)
  {
    if (a2)
      v20 = CFSTR("dataVersion");
    else
      v20 = CFSTR("data_version");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = *(id *)(a1 + 48);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation", (_QWORD)v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27, (_QWORD)v30);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("serviceMetrics");
    else
      v28 = CFSTR("service_metrics");
    objc_msgSend(v4, "setObject:forKey:", v21, v28, (_QWORD)v30);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflinePerformanceMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_81;
      else
        v6 = (int *)&readAll__nonRecursiveTag_81;
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPBOfflinePerformanceMetricsCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflinePerformanceMetricsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3F) == 0))
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
    -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 0);
    if (self->_deviceModel)
      PBDataWriterWriteStringField();
    if (self->_osBuild)
      PBDataWriterWriteStringField();
    if (self->_offlineVersion)
      PBDataWriterWriteStringField();
    if (self->_dataVersion)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_serviceMetrics;
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

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPBOfflinePerformanceMetricsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_osBuild, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_offlineVersion, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_dataVersion, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = self->_serviceMetrics;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPBOfflinePerformanceMetrics addServiceMetrics:]((uint64_t)v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *deviceModel;
  NSString *osBuild;
  NSString *offlineVersion;
  NSString *dataVersion;
  NSMutableArray *serviceMetrics;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 1),
         -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)v4, 1),
         deviceModel = self->_deviceModel,
         !((unint64_t)deviceModel | v4[3]))
     || -[NSString isEqual:](deviceModel, "isEqual:"))
    && ((osBuild = self->_osBuild, !((unint64_t)osBuild | v4[5]))
     || -[NSString isEqual:](osBuild, "isEqual:"))
    && ((offlineVersion = self->_offlineVersion, !((unint64_t)offlineVersion | v4[4]))
     || -[NSString isEqual:](offlineVersion, "isEqual:"))
    && ((dataVersion = self->_dataVersion, !((unint64_t)dataVersion | v4[2]))
     || -[NSString isEqual:](dataVersion, "isEqual:")))
  {
    serviceMetrics = self->_serviceMetrics;
    if ((unint64_t)serviceMetrics | v4[6])
      v10 = -[NSMutableArray isEqual:](serviceMetrics, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_deviceModel, "hash");
  v4 = -[NSString hash](self->_osBuild, "hash") ^ v3;
  v5 = -[NSString hash](self->_offlineVersion, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_dataVersion, "hash");
  return v6 ^ -[NSMutableArray hash](self->_serviceMetrics, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceMetrics, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_offlineVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
