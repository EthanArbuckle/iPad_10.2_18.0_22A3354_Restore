@implementation GEOPDVectorPoiDisplayDV

- (GEOPDVectorPoiDisplayDV)init
{
  GEOPDVectorPoiDisplayDV *v2;
  GEOPDVectorPoiDisplayDV *v3;
  GEOPDVectorPoiDisplayDV *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVectorPoiDisplayDV;
  v2 = -[GEOPDVectorPoiDisplayDV init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVectorPoiDisplayDV)initWithData:(id)a3
{
  GEOPDVectorPoiDisplayDV *v3;
  GEOPDVectorPoiDisplayDV *v4;
  GEOPDVectorPoiDisplayDV *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVectorPoiDisplayDV;
  v3 = -[GEOPDVectorPoiDisplayDV initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDVectorPoiDisplayDV;
  -[GEOPDVectorPoiDisplayDV description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVectorPoiDisplayDV dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVectorPoiDisplayDV _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __CFString *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v52[4];
  id v53;

  if (!a1)
    return 0;
  -[GEOPDVectorPoiDisplayDV readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("poiClass");
    else
      v6 = CFSTR("poi_class");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
  {
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = v7;
      objc_sync_enter(v8);
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClassZoom_tags);
      objc_sync_exit(v8);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("classZoom");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("class_zoom");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("containmentClass");
    else
      v14 = CFSTR("containment_class");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainmentZoom_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v17 = *(id *)(a1 + 48);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("containmentZoom");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("containment_zoom");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 92) & 0x200) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCustomLandmark_tags);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v23 = *(id *)(a1 + 56);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("customLandmark");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("custom_landmark");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClassZoomDriving_tags);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v29 = *(id *)(a1 + 24);
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("classZoomDriving");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("class_zoom_driving");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClassZoomNavigation_tags);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v35 = *(id *)(a1 + 32);
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("classZoomNavigation");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("class_zoom_navigation");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  v39 = *(_WORD *)(a1 + 92);
  if ((v39 & 4) != 0)
  {
    v40 = *(int *)(a1 + 84);
    if (v40 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E1C051A8[v40];
    }
    if (a2)
      v42 = CFSTR("treeDisplayType");
    else
      v42 = CFSTR("tree_display_type");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

    v39 = *(_WORD *)(a1 + 92);
  }
  if ((v39 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("inMiniPoiMarket");
    else
      v44 = CFSTR("in_mini_poi_market");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __53__GEOPDVectorPoiDisplayDV__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E1C00600;
      v49 = v48;
      v53 = v49;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v52);
      v50 = v49;

      v47 = v50;
    }
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVectorPoiDisplayDV _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5630;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5631;
      GEOPDVectorPoiDisplayDVReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __53__GEOPDVectorPoiDisplayDV__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVectorPoiDisplayDVReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E0) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v9;
    if (self->_classZoom)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
    }
    if (self->_containmentZoom)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_customLandmark)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_classZoomDriving)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_classZoomNavigation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
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
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __int16 flags;
  PBUnknownFields *v20;

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
      GEOPDVectorPoiDisplayDVReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_poiClass;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v9 = -[GEOPDZoomInfo copyWithZone:](self->_classZoom, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_containmentClass;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v11 = -[GEOPDZoomInfo copyWithZone:](self->_containmentZoom, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOPDCustomLandmark copyWithZone:](self->_customLandmark, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOPDZoomInfo copyWithZone:](self->_classZoomDriving, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v17 = -[GEOPDZoomInfo copyWithZone:](self->_classZoomNavigation, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_treeDisplayType;
    *(_WORD *)(v5 + 92) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_inMiniPoiMarket;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOPDZoomInfo *classZoom;
  GEOPDZoomInfo *containmentZoom;
  GEOPDCustomLandmark *customLandmark;
  GEOPDZoomInfo *classZoomDriving;
  GEOPDZoomInfo *classZoomNavigation;
  __int16 v12;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 1);
  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_poiClass != *((_DWORD *)v4 + 20))
      goto LABEL_30;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  classZoom = self->_classZoom;
  if ((unint64_t)classZoom | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoom, "isEqual:"))
      goto LABEL_30;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 46);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_containmentClass != *((_DWORD *)v4 + 19))
      goto LABEL_30;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_30;
  }
  containmentZoom = self->_containmentZoom;
  if ((unint64_t)containmentZoom | *((_QWORD *)v4 + 6)
    && !-[GEOPDZoomInfo isEqual:](containmentZoom, "isEqual:"))
  {
    goto LABEL_30;
  }
  customLandmark = self->_customLandmark;
  if ((unint64_t)customLandmark | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDCustomLandmark isEqual:](customLandmark, "isEqual:"))
      goto LABEL_30;
  }
  classZoomDriving = self->_classZoomDriving;
  if ((unint64_t)classZoomDriving | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoomDriving, "isEqual:"))
      goto LABEL_30;
  }
  classZoomNavigation = self->_classZoomNavigation;
  if ((unint64_t)classZoomNavigation | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDZoomInfo isEqual:](classZoomNavigation, "isEqual:"))
      goto LABEL_30;
  }
  v12 = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 46);
  if ((v12 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_treeDisplayType != *((_DWORD *)v4 + 21))
      goto LABEL_30;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_30;
  }
  v14 = (v13 & 8) == 0;
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_inMiniPoiMarket)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 88))
      {
        goto LABEL_30;
      }
      v14 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v14 = 0;
  }
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 flags;
  uint64_t v11;
  uint64_t v12;

  -[GEOPDVectorPoiDisplayDV readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_poiClass;
  else
    v3 = 0;
  v4 = -[GEOPDZoomInfo hash](self->_classZoom, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_containmentClass;
  else
    v5 = 0;
  v6 = -[GEOPDZoomInfo hash](self->_containmentZoom, "hash");
  v7 = -[GEOPDCustomLandmark hash](self->_customLandmark, "hash");
  v8 = -[GEOPDZoomInfo hash](self->_classZoomDriving, "hash");
  v9 = -[GEOPDZoomInfo hash](self->_classZoomNavigation, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v11 = 2654435761 * self->_treeDisplayType;
    if ((flags & 8) != 0)
      goto LABEL_9;
LABEL_11:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((flags & 8) == 0)
    goto LABEL_11;
LABEL_9:
  v12 = 2654435761 * self->_inMiniPoiMarket;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLandmark, 0);
  objc_storeStrong((id *)&self->_containmentZoom, 0);
  objc_storeStrong((id *)&self->_classZoom, 0);
  objc_storeStrong((id *)&self->_classZoomNavigation, 0);
  objc_storeStrong((id *)&self->_classZoomDriving, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
