@implementation GEOClientNetworkMetrics

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
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
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOClientNetworkMetrics readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_serviceIpAddress)
    PBDataWriterWriteStringField();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0)
      goto LABEL_12;
LABEL_26:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_26;
LABEL_12:
  if ((flags & 8) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_transactionMetrics;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_29:

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
      v8 = (int *)&readAll__recursiveTag_314;
    else
      v8 = (int *)&readAll__nonRecursiveTag_315;
    GEOClientNetworkMetricsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOClientNetworkMetricsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)setRequestStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_requestStart = a3;
}

- (void)setServiceIpAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_serviceIpAddress, a3);
}

- (void)setRequestEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_requestEnd = a3;
}

- (void)setRedirectCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_redirectCount = a3;
}

- (void)setHttpResponseCode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_httpResponseCode = a3;
}

- (GEOClientNetworkMetrics)init
{
  GEOClientNetworkMetrics *v2;
  GEOClientNetworkMetrics *v3;
  GEOClientNetworkMetrics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOClientNetworkMetrics;
  v2 = -[GEOClientNetworkMetrics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addTransactionMetrics:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  -[GEOClientNetworkMetrics _addNoFlagsTransactionMetrics:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_readTransactionMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientNetworkMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionMetrics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_addNoFlagsTransactionMetrics:(uint64_t)a1
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

- (NSMutableArray)transactionMetrics
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  return self->_transactionMetrics;
}

- (void)setRnfTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  self->_rnfTriggered = a3;
}

- (void)setResponseDataSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_responseDataSize = a3;
}

- (void)setRequestDataSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_requestDataSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionMetrics, 0);
  objc_storeStrong((id *)&self->_serviceIpAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOClientNetworkMetrics)initWithData:(id)a3
{
  GEOClientNetworkMetrics *v3;
  GEOClientNetworkMetrics *v4;
  GEOClientNetworkMetrics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOClientNetworkMetrics;
  v3 = -[GEOClientNetworkMetrics initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHttpResponseCode
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readServiceIpAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientNetworkMetricsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceIpAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasServiceIpAddress
{
  -[GEOClientNetworkMetrics _readServiceIpAddress]((uint64_t)self);
  return self->_serviceIpAddress != 0;
}

- (NSString)serviceIpAddress
{
  -[GEOClientNetworkMetrics _readServiceIpAddress]((uint64_t)self);
  return self->_serviceIpAddress;
}

- (int)requestDataSize
{
  return self->_requestDataSize;
}

- (void)setHasRequestDataSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1040;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasRequestDataSize
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)responseDataSize
{
  return self->_responseDataSize;
}

- (void)setHasResponseDataSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1056;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasResponseDataSize
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)rnfTriggered
{
  return self->_rnfTriggered;
}

- (void)setHasRnfTriggered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1088;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRnfTriggered
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setHasRequestStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasRequestEnd
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)redirectCount
{
  return self->_redirectCount;
}

- (void)setHasRedirectCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRedirectCount
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)setTransactionMetrics:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *transactionMetrics;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  transactionMetrics = self->_transactionMetrics;
  self->_transactionMetrics = v4;

}

- (void)clearTransactionMetrics
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_transactionMetrics, "removeAllObjects");
}

- (unint64_t)transactionMetricsCount
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  return -[NSMutableArray count](self->_transactionMetrics, "count");
}

- (id)transactionMetricsAtIndex:(unint64_t)a3
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_transactionMetrics, "objectAtIndex:", a3);
}

+ (Class)transactionMetricsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOClientNetworkMetrics;
  -[GEOClientNetworkMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientNetworkMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientNetworkMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("httpResponseCode");
    else
      v6 = CFSTR("http_response_code");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "serviceIpAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("serviceIpAddress");
    else
      v8 = CFSTR("service_ip_address");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("requestDataSize");
    else
      v29 = CFSTR("request_data_size");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    v9 = *(_WORD *)(a1 + 88);
    if ((v9 & 0x20) == 0)
    {
LABEL_14:
      if ((v9 & 0x40) == 0)
        goto LABEL_15;
      goto LABEL_50;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("responseDataSize");
  else
    v31 = CFSTR("response_data_size");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 0x40) == 0)
  {
LABEL_15:
    if ((v9 & 2) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v33 = CFSTR("rnfTriggered");
  else
    v33 = CFSTR("rnf_triggered");
  objc_msgSend(v4, "setObject:forKey:", v32, v33);

  v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 2) == 0)
  {
LABEL_16:
    if ((v9 & 1) == 0)
      goto LABEL_17;
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("requestEnd");
    else
      v37 = CFSTR("request_end");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

    if ((*(_WORD *)(a1 + 88) & 8) == 0)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v35 = CFSTR("requestStart");
  else
    v35 = CFSTR("request_start");
  objc_msgSend(v4, "setObject:forKey:", v34, v35);

  v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 1) != 0)
    goto LABEL_58;
LABEL_17:
  if ((v9 & 8) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("redirectCount");
    else
      v11 = CFSTR("redirect_count");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_22:
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = *(id *)(a1 + 48);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("transactionMetrics");
    else
      v20 = CFSTR("transaction_metrics");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __53__GEOClientNetworkMetrics__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v25 = v24;
      v39 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v38);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientNetworkMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOClientNetworkMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOClientNetworkMetrics)initWithDictionary:(id)a3
{
  return (GEOClientNetworkMetrics *)-[GEOClientNetworkMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  GEOClientNetworkTransactionMetrics *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("httpResponseCode");
      else
        v6 = CFSTR("http_response_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("serviceIpAddress");
      else
        v8 = CFSTR("service_ip_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setServiceIpAddress:", v10);

      }
      if (a3)
        v11 = CFSTR("requestDataSize");
      else
        v11 = CFSTR("request_data_size");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRequestDataSize:", objc_msgSend(v12, "intValue"));

      if (a3)
        v13 = CFSTR("responseDataSize");
      else
        v13 = CFSTR("response_data_size");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResponseDataSize:", objc_msgSend(v14, "intValue"));

      if (a3)
        v15 = CFSTR("rnfTriggered");
      else
        v15 = CFSTR("rnf_triggered");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRnfTriggered:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("requestStart");
      else
        v17 = CFSTR("request_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(a1, "setRequestStart:");
      }

      if (a3)
        v19 = CFSTR("requestEnd");
      else
        v19 = CFSTR("request_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "doubleValue");
        objc_msgSend(a1, "setRequestEnd:");
      }

      if (a3)
        v21 = CFSTR("redirectCount");
      else
        v21 = CFSTR("redirect_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRedirectCount:", objc_msgSend(v22, "intValue"));

      if (a3)
        v23 = CFSTR("transactionMetrics");
      else
        v23 = CFSTR("transaction_metrics");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v24;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v37 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = [GEOClientNetworkTransactionMetrics alloc];
                if ((a3 & 1) != 0)
                  v32 = -[GEOClientNetworkTransactionMetrics initWithJSON:](v31, "initWithJSON:", v30);
                else
                  v32 = -[GEOClientNetworkTransactionMetrics initWithDictionary:](v31, "initWithDictionary:", v30);
                v33 = (void *)v32;
                objc_msgSend(a1, "addTransactionMetrics:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v27);
        }

        v24 = v35;
      }

    }
  }

  return a1;
}

- (GEOClientNetworkMetrics)initWithJSON:(id)a3
{
  return (GEOClientNetworkMetrics *)-[GEOClientNetworkMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientNetworkMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientNetworkMetricsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOClientNetworkMetrics readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 14) = self->_readerMarkPos;
  *((_DWORD *)v10 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v10 + 17) = self->_httpResponseCode;
    *((_WORD *)v10 + 44) |= 4u;
  }
  if (self->_serviceIpAddress)
  {
    objc_msgSend(v10, "setServiceIpAddress:");
    v4 = v10;
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_requestDataSize;
    *((_WORD *)v4 + 44) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 20) = self->_responseDataSize;
  *((_WORD *)v4 + 44) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 84) = self->_rnfTriggered;
  *((_WORD *)v4 + 44) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0)
      goto LABEL_10;
LABEL_21:
    v4[3] = *(id *)&self->_requestEnd;
    *((_WORD *)v4 + 44) |= 1u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  v4[4] = *(id *)&self->_requestStart;
  *((_WORD *)v4 + 44) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_21;
LABEL_10:
  if ((flags & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 18) = self->_redirectCount;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_12:
  if (-[GEOClientNetworkMetrics transactionMetricsCount](self, "transactionMetricsCount"))
  {
    objc_msgSend(v10, "clearTransactionMetrics");
    v6 = -[GEOClientNetworkMetrics transactionMetricsCount](self, "transactionMetricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOClientNetworkMetrics transactionMetricsAtIndex:](self, "transactionMetricsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addTransactionMetrics:", v9);

      }
    }
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
  __int16 flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      GEOClientNetworkMetricsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOClientNetworkMetrics readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_httpResponseCode;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_serviceIpAddress, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_requestDataSize;
    *(_WORD *)(v5 + 88) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_25;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 80) = self->_responseDataSize;
  *(_WORD *)(v5 + 88) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 84) = self->_rnfTriggered;
  *(_WORD *)(v5 + 88) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0)
      goto LABEL_12;
LABEL_27:
    *(double *)(v5 + 24) = self->_requestEnd;
    *(_WORD *)(v5 + 88) |= 1u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_26:
  *(double *)(v5 + 32) = self->_requestStart;
  *(_WORD *)(v5 + 88) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_27;
LABEL_12:
  if ((flags & 8) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 72) = self->_redirectCount;
    *(_WORD *)(v5 + 88) |= 8u;
  }
LABEL_14:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_transactionMetrics;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addTransactionMetrics:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *serviceIpAddress;
  NSMutableArray *transactionMetrics;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  -[GEOClientNetworkMetrics readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 17))
      goto LABEL_45;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_45;
  }
  serviceIpAddress = self->_serviceIpAddress;
  if ((unint64_t)serviceIpAddress | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](serviceIpAddress, "isEqual:"))
      goto LABEL_45;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_requestDataSize != *((_DWORD *)v4 + 19))
      goto LABEL_45;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_responseDataSize != *((_DWORD *)v4 + 20))
      goto LABEL_45;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_rnfTriggered)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_45;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_28;
    }
LABEL_45:
    v9 = 0;
    goto LABEL_46;
  }
  if ((v6 & 0x40) != 0)
    goto LABEL_45;
LABEL_28:
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestStart != *((double *)v4 + 4))
      goto LABEL_45;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_requestEnd != *((double *)v4 + 3))
      goto LABEL_45;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_redirectCount != *((_DWORD *)v4 + 18))
      goto LABEL_45;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_45;
  }
  transactionMetrics = self->_transactionMetrics;
  if ((unint64_t)transactionMetrics | *((_QWORD *)v4 + 6))
    v9 = -[NSMutableArray isEqual:](transactionMetrics, "isEqual:");
  else
    v9 = 1;
LABEL_46:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  __int16 flags;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double requestStart;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double requestEnd;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;

  -[GEOClientNetworkMetrics readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v3 = 2654435761 * self->_httpResponseCode;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_serviceIpAddress, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v6 = 2654435761 * self->_requestDataSize;
    if ((flags & 0x20) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_responseDataSize;
      if ((flags & 0x40) != 0)
        goto LABEL_7;
LABEL_14:
      v8 = 0;
      if ((flags & 2) != 0)
        goto LABEL_8;
LABEL_15:
      v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v6 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((flags & 0x40) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_rnfTriggered;
  if ((flags & 2) == 0)
    goto LABEL_15;
LABEL_8:
  requestStart = self->_requestStart;
  v10 = -requestStart;
  if (requestStart >= 0.0)
    v10 = self->_requestStart;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_18:
  if ((flags & 1) != 0)
  {
    requestEnd = self->_requestEnd;
    v16 = -requestEnd;
    if (requestEnd >= 0.0)
      v16 = self->_requestEnd;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 8) != 0)
    v19 = 2654435761 * self->_redirectCount;
  else
    v19 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v19 ^ -[NSMutableArray hash](self->_transactionMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 44) & 4) != 0)
  {
    self->_httpResponseCode = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
    -[GEOClientNetworkMetrics setServiceIpAddress:](self, "setServiceIpAddress:");
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_requestDataSize = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_responseDataSize = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_rnfTriggered = *((_BYTE *)v4 + 84);
  *(_WORD *)&self->_flags |= 0x40u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_requestStart = *((double *)v4 + 4);
  *(_WORD *)&self->_flags |= 2u;
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_24:
  self->_requestEnd = *((double *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
LABEL_11:
    self->_redirectCount = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_12:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOClientNetworkMetrics addTransactionMetrics:](self, "addTransactionMetrics:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOClientNetworkMetricsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_318);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x480u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOClientNetworkMetrics readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_transactionMetrics;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

@end
