@implementation GEODataSetURLOverride

- (GEODataSetURLOverride)init
{
  GEODataSetURLOverride *v2;
  GEODataSetURLOverride *v3;
  GEODataSetURLOverride *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODataSetURLOverride;
  v2 = -[GEODataSetURLOverride init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODataSetURLOverride)initWithData:(id)a3
{
  GEODataSetURLOverride *v3;
  GEODataSetURLOverride *v4;
  GEODataSetURLOverride *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODataSetURLOverride;
  v3 = -[GEODataSetURLOverride initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEODataSetURLOverride;
  -[GEODataSetURLOverride description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataSetURLOverride dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODataSetURLOverride _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v58[4];
  id v59;

  if (!a1)
    return 0;
  -[GEODataSetURLOverride readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 160) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 156));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("dataSet"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 0x80) == 0)
  {
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = v6;
      objc_sync_enter(v7);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsURL_tags);
      objc_sync_exit(v7);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v8 = *(id *)(a1 + 64);
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("directionsURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 2) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaURL_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v11 = *(id *)(a1 + 80);
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("etaURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 0x20) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v14 = *(id *)(a1 + 48);
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("batchReverseGeocoderURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 0x80) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSimpleETAURL_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v17 = *(id *)(a1 + 128);
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("simpleETAURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 4) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v20 = *(id *)(a1 + 24);
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("addressCorrectionInitURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 8) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v23 = *(id *)(a1 + 32);
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("addressCorrectionUpdateURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 0x40) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v26 = *(id *)(a1 + 120);
  if (v26)
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("problemSubmissionURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 0x20) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemStatusURL_tags);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v29 = *(id *)(a1 + 112);
  if (v29)
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("problemStatusURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 8) == 0)
  {
    v30 = *(void **)(a1 + 8);
    if (v30)
    {
      v31 = v30;
      objc_sync_enter(v31);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags);
      objc_sync_exit(v31);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v32 = *(id *)(a1 + 96);
  if (v32)
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("problemCategoriesURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 0x10) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsURL_tags);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v35 = *(id *)(a1 + 40);
  if (v35)
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("announcementsURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 1) == 0)
  {
    v36 = *(void **)(a1 + 8);
    if (v36)
    {
      v37 = v36;
      objc_sync_enter(v37);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDispatcherURL_tags);
      objc_sync_exit(v37);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v38 = *(id *)(a1 + 72);
  if (v38)
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("dispatcherURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 0x10) == 0)
  {
    v39 = *(void **)(a1 + 8);
    if (v39)
    {
      v40 = v39;
      objc_sync_enter(v40);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemOptInURL_tags);
      objc_sync_exit(v40);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v41 = *(id *)(a1 + 104);
  if (v41)
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("problemOptInURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 160) & 0x40) == 0)
  {
    v42 = *(void **)(a1 + 8);
    if (v42)
    {
      v43 = v42;
      objc_sync_enter(v43);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags);
      objc_sync_exit(v43);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v44 = *(id *)(a1 + 56);
  if (v44)
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("businessPortalBaseURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 161) & 4) == 0)
  {
    v45 = *(void **)(a1 + 8);
    if (v45)
    {
      v46 = v45;
      objc_sync_enter(v46);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags);
      objc_sync_exit(v46);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v47 = *(id *)(a1 + 88);
  if (v47)
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("logMessageUsageURL"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
  if ((*(_BYTE *)(a1 + 162) & 1) == 0)
  {
    v48 = *(void **)(a1 + 8);
    if (v48)
    {
      v49 = v48;
      objc_sync_enter(v49);
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpatialLookupURL_tags);
      objc_sync_exit(v49);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  v50 = *(id *)(a1 + 136);
  if (v50)
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("spatialLookupURL"));

  v51 = *(void **)(a1 + 16);
  if (v51)
  {
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __51__GEODataSetURLOverride__dictionaryRepresentation___block_invoke;
      v58[3] = &unk_1E1C00600;
      v55 = v54;
      v59 = v55;
      objc_msgSend(v53, "enumerateKeysAndObjectsUsingBlock:", v58);
      v56 = v55;

      v53 = v56;
    }
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODataSetURLOverride _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_309;
      else
        v6 = (int *)&readAll__nonRecursiveTag_310;
      GEODataSetURLOverrideReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

void __51__GEODataSetURLOverride__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEODataSetURLOverrideReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x3FFFC) == 0))
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
    -[GEODataSetURLOverride readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v8;
    if (self->_directionsURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_etaURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_batchReverseGeocoderURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_simpleETAURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_addressCorrectionInitURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_addressCorrectionUpdateURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_problemSubmissionURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_problemStatusURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_problemCategoriesURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_announcementsURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_dispatcherURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_problemOptInURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_businessPortalBaseURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_logMessageUsageURL)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_spatialLookupURL)
    {
      PBDataWriterWriteStringField();
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  PBUnknownFields *v39;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEODataSetURLOverrideReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODataSetURLOverride readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 156) = self->_dataSet;
    *(_DWORD *)(v5 + 160) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_directionsURL, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_etaURL, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  v13 = -[NSString copyWithZone:](self->_batchReverseGeocoderURL, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_simpleETAURL, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v15;

  v17 = -[NSString copyWithZone:](self->_addressCorrectionInitURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[NSString copyWithZone:](self->_addressCorrectionUpdateURL, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = -[NSString copyWithZone:](self->_problemSubmissionURL, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v21;

  v23 = -[NSString copyWithZone:](self->_problemStatusURL, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v23;

  v25 = -[NSString copyWithZone:](self->_problemCategoriesURL, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = -[NSString copyWithZone:](self->_announcementsURL, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v27;

  v29 = -[NSString copyWithZone:](self->_dispatcherURL, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v29;

  v31 = -[NSString copyWithZone:](self->_problemOptInURL, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v31;

  v33 = -[NSString copyWithZone:](self->_businessPortalBaseURL, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v33;

  v35 = -[NSString copyWithZone:](self->_logMessageUsageURL, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v35;

  v37 = -[NSString copyWithZone:](self->_spatialLookupURL, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v37;

  v39 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v39;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *directionsURL;
  NSString *etaURL;
  NSString *batchReverseGeocoderURL;
  NSString *simpleETAURL;
  NSString *addressCorrectionInitURL;
  NSString *addressCorrectionUpdateURL;
  NSString *problemSubmissionURL;
  NSString *problemStatusURL;
  NSString *problemCategoriesURL;
  NSString *announcementsURL;
  NSString *dispatcherURL;
  NSString *problemOptInURL;
  NSString *businessPortalBaseURL;
  NSString *logMessageUsageURL;
  NSString *spatialLookupURL;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEODataSetURLOverride readAll:]((uint64_t)self, 1);
  -[GEODataSetURLOverride readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 39))
      goto LABEL_37;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_37:
    v21 = 0;
    goto LABEL_38;
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](directionsURL, "isEqual:"))
  {
    goto LABEL_37;
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](etaURL, "isEqual:"))
      goto LABEL_37;
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURL, "isEqual:"))
      goto LABEL_37;
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](simpleETAURL, "isEqual:"))
      goto LABEL_37;
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](addressCorrectionInitURL, "isEqual:"))
      goto LABEL_37;
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURL, "isEqual:"))
      goto LABEL_37;
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](problemSubmissionURL, "isEqual:"))
      goto LABEL_37;
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](problemStatusURL, "isEqual:"))
      goto LABEL_37;
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](problemCategoriesURL, "isEqual:"))
      goto LABEL_37;
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](announcementsURL, "isEqual:"))
      goto LABEL_37;
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](dispatcherURL, "isEqual:"))
      goto LABEL_37;
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](problemOptInURL, "isEqual:"))
      goto LABEL_37;
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](businessPortalBaseURL, "isEqual:"))
      goto LABEL_37;
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](logMessageUsageURL, "isEqual:"))
      goto LABEL_37;
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((_QWORD *)v4 + 17))
    v21 = -[NSString isEqual:](spatialLookupURL, "isEqual:");
  else
    v21 = 1;
LABEL_38:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;

  -[GEODataSetURLOverride readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_dataSet;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_directionsURL, "hash") ^ v3;
  v5 = -[NSString hash](self->_etaURL, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_batchReverseGeocoderURL, "hash");
  v7 = -[NSString hash](self->_simpleETAURL, "hash");
  v8 = v7 ^ -[NSString hash](self->_addressCorrectionInitURL, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_addressCorrectionUpdateURL, "hash");
  v10 = -[NSString hash](self->_problemSubmissionURL, "hash");
  v11 = v10 ^ -[NSString hash](self->_problemStatusURL, "hash");
  v12 = v11 ^ -[NSString hash](self->_problemCategoriesURL, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_announcementsURL, "hash");
  v14 = -[NSString hash](self->_dispatcherURL, "hash");
  v15 = v14 ^ -[NSString hash](self->_problemOptInURL, "hash");
  v16 = v15 ^ -[NSString hash](self->_businessPortalBaseURL, "hash");
  v17 = v16 ^ -[NSString hash](self->_logMessageUsageURL, "hash");
  return v13 ^ v17 ^ -[NSString hash](self->_spatialLookupURL, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
