@implementation GEOPDGuidesHomeParameters

- (GEOPDGuidesHomeParameters)init
{
  GEOPDGuidesHomeParameters *v2;
  GEOPDGuidesHomeParameters *v3;
  GEOPDGuidesHomeParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeParameters;
  v2 = -[GEOPDGuidesHomeParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeParameters)initWithData:(id)a3
{
  GEOPDGuidesHomeParameters *v3;
  GEOPDGuidesHomeParameters *v4;
  GEOPDGuidesHomeParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeParameters;
  v3 = -[GEOPDGuidesHomeParameters initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGuidesHomeParameters;
  -[GEOPDGuidesHomeParameters dealloc](&v3, sel_dealloc);
}

- (void)_readSupportedFixedSectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 116) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedFixedSectionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)addSupportedFixedSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 116) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_BYTE *)(a1 + 116) |= 0x80u;
  }
}

- (void)_readSupportedRepeatableSectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 116) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedRepeatableSectionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)addSupportedRepeatableSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 116) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_BYTE *)(a1 + 116) |= 0x80u;
  }
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_BYTE *)(a1 + 116) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_2417);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 116) |= 0x40u;
    *(_BYTE *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }

}

- (void)_readGuidesLocationEntry
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_BYTE *)(a1 + 116) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesLocationEntry_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setGuidesLocationEntry:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 116) |= 8u;
    *(_BYTE *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)setResultFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 116) |= 0x20u;
    *(_BYTE *)(a1 + 116) |= 0x80u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }

}

- (void)_readRefinementGuidesHome
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_BYTE *)(a1 + 116) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementGuidesHome_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)setRefinementGuidesHome:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 116) |= 0x10u;
  *(_BYTE *)(a1 + 116) |= 0x80u;
  objc_storeStrong((id *)(a1 + 80), a2);

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
  v8.super_class = (Class)GEOPDGuidesHomeParameters;
  -[GEOPDGuidesHomeParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;

  if (!a1)
    return 0;
  -[GEOPDGuidesHomeParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C04AA0[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 24);
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v10 = CFSTR("supportedFixedSectionType");
    else
      v10 = CFSTR("supported_fixed_section_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v13 = 0;
      do
      {
        v14 = *(int *)(*v12 + 4 * v13);
        if (v14 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E1C04AC0[v14];
        }
        objc_msgSend(v11, "addObject:", v15);

        ++v13;
        v12 = (_QWORD *)(a1 + 48);
      }
      while (v13 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v16 = CFSTR("supportedRepeatableSectionType");
    else
      v16 = CFSTR("supported_repeatable_section_type");
    objc_msgSend(v4, "setObject:forKey:", v11, v16);

  }
  -[GEOPDGuidesHomeParameters _readViewportInfo](a1);
  v17 = *(id *)(a1 + 96);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDGuidesHomeParameters _readGuidesLocationEntry](a1);
  v21 = *(id *)(a1 + 72);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("guidesLocationEntry");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("guides_location_entry");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_BYTE *)(a1 + 116) & 0x20) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      v26 = v25;
      objc_sync_enter(v26);
      GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultFilter_tags_2418);
      objc_sync_exit(v26);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v27 = *(id *)(a1 + 88);
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("resultFilter");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("result_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  -[GEOPDGuidesHomeParameters _readRefinementGuidesHome](a1);
  v31 = *(id *)(a1 + 80);
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("refinementGuidesHome");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("refinement_guides_home");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __55__GEOPDGuidesHomeParameters__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2436;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2437;
      GEOPDGuidesHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesHomeParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __55__GEOPDGuidesHomeParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGuidesHomeParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesHomeParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 0);
    v5 = v10;
    if (self->_supportedFixedSectionTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_supportedFixedSectionTypes.count);
    }
    if (self->_supportedRepeatableSectionTypes.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_supportedRepeatableSectionTypes.count);
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_guidesLocationEntry)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_resultFilter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_refinementGuidesHome)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDGuidesHomeParameters _readGuidesLocationEntry](result);
    if ((-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(_QWORD *)(v3 + 72), a2) & 1) != 0)
      return 1;
    -[GEOPDGuidesHomeParameters _readRefinementGuidesHome](v3);
    if ((-[GEOPDResultRefinementGuidesHome hasGreenTeaWithValue:](*(_QWORD *)(v3 + 80), a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDGuidesHomeParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 96), "hasGreenTeaWithValue:", a2);
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
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    v8 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v8;

    v10 = -[GEOPDGuidesLocationEntry copyWithZone:](self->_guidesLocationEntry, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v10;

    v12 = -[GEOPDGuidesHomeResultFilter copyWithZone:](self->_resultFilter, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v12;

    v14 = -[GEOPDResultRefinementGuidesHome copyWithZone:](self->_refinementGuidesHome, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDGuidesHomeParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDViewportInfo *viewportInfo;
  GEOPDGuidesLocationEntry *guidesLocationEntry;
  GEOPDGuidesHomeResultFilter *resultFilter;
  GEOPDResultRefinementGuidesHome *refinementGuidesHome;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 1),
        -[GEOPDGuidesHomeParameters readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && PBRepeatedInt32IsEqual()
    && ((viewportInfo = self->_viewportInfo, !((unint64_t)viewportInfo | v4[12]))
     || -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    && ((guidesLocationEntry = self->_guidesLocationEntry, !((unint64_t)guidesLocationEntry | v4[9]))
     || -[GEOPDGuidesLocationEntry isEqual:](guidesLocationEntry, "isEqual:"))
    && ((resultFilter = self->_resultFilter, !((unint64_t)resultFilter | v4[11]))
     || -[GEOPDGuidesHomeResultFilter isEqual:](resultFilter, "isEqual:")))
  {
    refinementGuidesHome = self->_refinementGuidesHome;
    if ((unint64_t)refinementGuidesHome | v4[10])
      v9 = -[GEOPDResultRefinementGuidesHome isEqual:](refinementGuidesHome, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDGuidesHomeParameters readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt32Hash();
  v4 = PBRepeatedInt32Hash() ^ v3;
  v5 = v4 ^ -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v6 = -[GEOPDGuidesLocationEntry hash](self->_guidesLocationEntry, "hash");
  v7 = v5 ^ v6 ^ -[GEOPDGuidesHomeResultFilter hash](self->_resultFilter, "hash");
  return v7 ^ -[GEOPDResultRefinementGuidesHome hash](self->_refinementGuidesHome, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_resultFilter, 0);
  objc_storeStrong((id *)&self->_refinementGuidesHome, 0);
  objc_storeStrong((id *)&self->_guidesLocationEntry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
