@implementation GEOPBOfflineResponseMetadata

- (GEOPBOfflineResponseMetadata)init
{
  GEOPBOfflineResponseMetadata *v2;
  GEOPBOfflineResponseMetadata *v3;
  GEOPBOfflineResponseMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineResponseMetadata;
  v2 = -[GEOPBOfflineResponseMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineResponseMetadata)initWithData:(id)a3
{
  GEOPBOfflineResponseMetadata *v3;
  GEOPBOfflineResponseMetadata *v4;
  GEOPBOfflineResponseMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineResponseMetadata;
  v3 = -[GEOPBOfflineResponseMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequestIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineResponseMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestIdentifier_tags_170);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasRequestIdentifier
{
  -[GEOPBOfflineResponseMetadata _readRequestIdentifier]((uint64_t)self);
  return self->_requestIdentifier != 0;
}

- (NSString)requestIdentifier
{
  -[GEOPBOfflineResponseMetadata _readRequestIdentifier]((uint64_t)self);
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void)_readPerformanceMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineResponseMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPerformanceMetrics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPerformanceMetrics
{
  -[GEOPBOfflineResponseMetadata _readPerformanceMetrics]((uint64_t)self);
  return self->_performanceMetrics != 0;
}

- (GEOPBOfflinePerformanceMetrics)performanceMetrics
{
  -[GEOPBOfflineResponseMetadata _readPerformanceMetrics]((uint64_t)self);
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
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
  v8.super_class = (Class)GEOPBOfflineResponseMetadata;
  -[GEOPBOfflineResponseMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineResponseMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineResponseMetadata _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "requestIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("requestIdentifier");
      else
        v6 = CFSTR("request_identifier");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "performanceMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("performanceMetrics");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("performance_metrics");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineResponseMetadata _dictionaryRepresentation:](self, 1);
}

- (GEOPBOfflineResponseMetadata)initWithDictionary:(id)a3
{
  return (GEOPBOfflineResponseMetadata *)-[GEOPBOfflineResponseMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPBOfflinePerformanceMetrics *v13;
  GEOPBOfflinePerformanceMetrics *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  GEOPBOfflineServiceMetrics *v40;
  GEOPBOfflineServiceMetrics *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  id v50;
  int v51;
  uint64_t v52;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  GEOPBOfflinePerformanceMetrics *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("requestIdentifier");
      else
        v7 = CFSTR("request_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0x1E0CB3000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v6, "setRequestIdentifier:", v10);

      }
      if (a3)
        v11 = CFSTR("performanceMetrics");
      else
        v11 = CFSTR("performance_metrics");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPBOfflinePerformanceMetrics alloc];
        if (v13)
        {
          v14 = v13;
          v15 = v12;
          v59 = -[GEOPBOfflinePerformanceMetrics init](v14, "init");
          if (v59)
          {
            if (a3)
              v16 = CFSTR("deviceModel");
            else
              v16 = CFSTR("device_model");
            objc_msgSend(v15, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)objc_msgSend(v17, "copy");
              -[GEOPBOfflinePerformanceMetrics setDeviceModel:]((uint64_t)v59, v18);

            }
            if (a3)
              v19 = CFSTR("osBuild");
            else
              v19 = CFSTR("os_build");
            objc_msgSend(v15, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy");
              -[GEOPBOfflinePerformanceMetrics setOsBuild:]((uint64_t)v59, v21);

            }
            if (a3)
              v22 = CFSTR("offlineVersion");
            else
              v22 = CFSTR("offline_version");
            objc_msgSend(v15, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v23, "copy");
              -[GEOPBOfflinePerformanceMetrics setOfflineVersion:]((uint64_t)v59, v24);

            }
            if (a3)
              v25 = CFSTR("dataVersion");
            else
              v25 = CFSTR("data_version");
            objc_msgSend(v15, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = (void *)objc_msgSend(v26, "copy");
              -[GEOPBOfflinePerformanceMetrics setDataVersion:]((uint64_t)v59, v27);

            }
            if (a3)
              v28 = CFSTR("serviceMetrics");
            else
              v28 = CFSTR("service_metrics");
            objc_msgSend(v15, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = v15;
              v56 = v12;
              v57 = v6;
              v58 = v5;
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v54 = v29;
              v30 = v29;
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
              v32 = (uint64_t)v59;
              if (!v31)
                goto LABEL_84;
              v33 = v31;
              v34 = *(_QWORD *)v64;
              if (a3)
                v35 = CFSTR("startTimeMs");
              else
                v35 = CFSTR("start_time_ms");
              v36 = CFSTR("stopTimeMs");
              if (!a3)
                v36 = CFSTR("stop_time_ms");
              v61 = v36;
              v62 = v35;
              v37 = CFSTR("service_id");
              if (a3)
                v37 = CFSTR("serviceId");
              v60 = v37;
              while (1)
              {
                v38 = 0;
                do
                {
                  if (*(_QWORD *)v64 != v34)
                    objc_enumerationMutation(v30);
                  v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v38);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v40 = [GEOPBOfflineServiceMetrics alloc];
                    if (v40)
                    {
                      v41 = v40;
                      v42 = v39;
                      v43 = -[GEOPBOfflineServiceMetrics init](v41, "init");
                      if (v43)
                      {
                        objc_msgSend(v42, "objectForKeyedSubscript:", v62);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v45 = objc_msgSend(v44, "unsignedLongLongValue");
                          *(_BYTE *)(v43 + 28) |= 1u;
                          *(_QWORD *)(v43 + 8) = v45;
                        }

                        objc_msgSend(v42, "objectForKeyedSubscript:", v61);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v47 = objc_msgSend(v46, "unsignedLongLongValue");
                          *(_BYTE *)(v43 + 28) |= 2u;
                          *(_QWORD *)(v43 + 16) = v47;
                        }

                        objc_msgSend(v42, "objectForKeyedSubscript:", v60);
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v49 = v9;
                          v50 = v48;
                          if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_UNKNOWN")) & 1) != 0)
                          {
                            v51 = 0;
                          }
                          else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_DISPATCHER")) & 1) != 0)
                          {
                            v51 = 1;
                          }
                          else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_SEARCH")) & 1) != 0)
                          {
                            v51 = 2;
                          }
                          else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_PLACES")) & 1) != 0)
                          {
                            v51 = 3;
                          }
                          else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_ROUTING")) & 1) != 0)
                          {
                            v51 = 4;
                          }
                          else if ((objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_VECTOR_PARSEC")) & 1) != 0)
                          {
                            v51 = 5;
                          }
                          else if (objc_msgSend(v50, "isEqualToString:", CFSTR("OFFLINE_SERVICE_TYPE_REVGEO")))
                          {
                            v51 = 6;
                          }
                          else
                          {
                            v51 = 0;
                          }

                          v9 = v49;
LABEL_76:
                          *(_BYTE *)(v43 + 28) |= 4u;
                          *(_DWORD *)(v43 + 24) = v51;
                          v32 = (uint64_t)v59;
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v51 = objc_msgSend(v48, "intValue");
                            goto LABEL_76;
                          }
                        }

                      }
                    }
                    else
                    {
                      v43 = 0;
                    }
                    -[GEOPBOfflinePerformanceMetrics addServiceMetrics:](v32, (void *)v43);

                  }
                  ++v38;
                }
                while (v33 != v38);
                v52 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
                v33 = v52;
                if (!v52)
                {
LABEL_84:

                  v6 = v57;
                  v5 = v58;
                  v15 = v55;
                  v12 = v56;
                  v29 = v54;
                  break;
                }
              }
            }

          }
        }
        else
        {
          v59 = 0;
        }
        objc_msgSend(v6, "setPerformanceMetrics:", v59);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPBOfflineResponseMetadata)initWithJSON:(id)a3
{
  return (GEOPBOfflineResponseMetadata *)-[GEOPBOfflineResponseMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_172_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_173_0;
    GEOPBOfflineResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self->_performanceMetrics, 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBOfflineResponseMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineResponseMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBOfflineResponseMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBOfflineResponseMetadata readAll:](self, "readAll:", 0);
    if (self->_requestIdentifier)
      PBDataWriterWriteStringField();
    if (self->_performanceMetrics)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOPBOfflineResponseMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_requestIdentifier)
    objc_msgSend(v4, "setRequestIdentifier:");
  if (self->_performanceMetrics)
    objc_msgSend(v4, "setPerformanceMetrics:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBOfflineResponseMetadata readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEOPBOfflinePerformanceMetrics copyWithZone:](self->_performanceMetrics, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPBOfflineResponseMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  GEOPBOfflinePerformanceMetrics *performanceMetrics;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPBOfflineResponseMetadata readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         requestIdentifier = self->_requestIdentifier,
         !((unint64_t)requestIdentifier | v4[3]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:")))
  {
    performanceMetrics = self->_performanceMetrics;
    if ((unint64_t)performanceMetrics | v4[2])
      v7 = -[GEOPBOfflinePerformanceMetrics isEqual:](performanceMetrics, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  -[GEOPBOfflineResponseMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  return -[GEOPBOfflinePerformanceMetrics hash](self->_performanceMetrics, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOPBOfflinePerformanceMetrics *performanceMetrics;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(v16, "readAll:", 0);
  if (v16[3])
    -[GEOPBOfflineResponseMetadata setRequestIdentifier:](self, "setRequestIdentifier:");
  performanceMetrics = self->_performanceMetrics;
  v5 = (void *)v16[2];
  if (performanceMetrics)
  {
    if (v5)
    {
      v6 = v5;
      -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)v6, 0);
      v7 = (void *)*((_QWORD *)v6 + 3);
      if (v7)
        -[GEOPBOfflinePerformanceMetrics setDeviceModel:]((uint64_t)performanceMetrics, v7);
      v8 = (void *)*((_QWORD *)v6 + 5);
      if (v8)
        -[GEOPBOfflinePerformanceMetrics setOsBuild:]((uint64_t)performanceMetrics, v8);
      v9 = (void *)*((_QWORD *)v6 + 4);
      if (v9)
        -[GEOPBOfflinePerformanceMetrics setOfflineVersion:]((uint64_t)performanceMetrics, v9);
      v10 = (void *)*((_QWORD *)v6 + 2);
      if (v10)
        -[GEOPBOfflinePerformanceMetrics setDataVersion:]((uint64_t)performanceMetrics, v10);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = *((id *)v6 + 6);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            -[GEOPBOfflinePerformanceMetrics addServiceMetrics:]((uint64_t)performanceMetrics, *(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }
  else if (v5)
  {
    -[GEOPBOfflineResponseMetadata setPerformanceMetrics:](self, "setPerformanceMetrics:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
