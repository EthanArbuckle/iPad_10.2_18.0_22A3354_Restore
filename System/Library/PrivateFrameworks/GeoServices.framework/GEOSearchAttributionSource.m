@implementation GEOSearchAttributionSource

- (GEOSearchAttributionSource)init
{
  GEOSearchAttributionSource *v2;
  GEOSearchAttributionSource *v3;
  GEOSearchAttributionSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSearchAttributionSource;
  v2 = -[GEOSearchAttributionSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSearchAttributionSource)initWithData:(id)a3
{
  GEOSearchAttributionSource *v3;
  GEOSearchAttributionSource *v4;
  GEOSearchAttributionSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSearchAttributionSource;
  v3 = -[GEOSearchAttributionSource initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOSearchAttributionSource;
  -[GEOSearchAttributionSource dealloc](&v3, sel_dealloc);
}

- (void)_readSourceIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)sourceIdentifier
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readSourceIdentifier]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)_readLocalizedAttributions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedAttributions_tags_337);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)localizedAttributions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readLocalizedAttributions]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)_addNoFlagsLocalizedAttribution:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readAttributionRequirements
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributionRequirements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (uint64_t)attributionRequirementsAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOSearchAttributionSource _readAttributionRequirements](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (void)_readAttributionApps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributionApps_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)attributionApps
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readAttributionApps]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)_addNoFlagsAttributionApps:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readWebBaseActionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWebBaseActionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)webBaseActionURL
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readWebBaseActionURL]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)_readSupportedComponentActions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedComponentActions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)supportedComponentActions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readSupportedComponentActions]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)_addNoFlagsSupportedComponentActions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readAppAdamID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppAdamID_tags_341);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)appAdamID
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionSource _readAppAdamID]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readSuppressAttributionLogos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuppressAttributionLogos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (uint64_t)suppressAttributionLogosAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOSearchAttributionSource _readSuppressAttributionLogos](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 48) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOSearchAttributionSource;
  -[GEOSearchAttributionSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchAttributionSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchAttributionSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __int16 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOSearchAttributionSource readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchAttributionSource sourceIdentifier]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("sourceIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("sourceVersion"));

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v8 = *(id *)(a1 + 88);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v65 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("localizedAttribution"));
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v17 = 0;
      do
      {
        v18 = *(unsigned int *)(*v16 + 4 * v17);
        if ((v18 - 1) >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E1C10160[(int)v18 - 1];
        }
        objc_msgSend(v15, "addObject:", v19);

        ++v17;
        v16 = (_QWORD *)(a1 + 24);
      }
      while (v17 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("attributionRequirements"));

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v21 = *(id *)(a1 + 80);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v61 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("attributionApps"));
  }
  -[GEOSearchAttributionSource webBaseActionURL]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("webBaseActionURL"));

  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v30 = *(id *)(a1 + 104);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v57 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("supportedComponentActions"));
  }
  if ((*(_WORD *)(a1 + 140) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 137));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("enforceAppStore"));

  }
  -[GEOSearchAttributionSource appAdamID]((id *)a1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("appAdamID"));

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v41 = 0;
      do
      {
        v42 = *(int *)(*v40 + 4 * v41);
        if (v42 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v42);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = off_1E1C10190[v42];
        }
        objc_msgSend(v39, "addObject:", v43);

        ++v41;
        v40 = (_QWORD *)(a1 + 48);
      }
      while (v41 < *(_QWORD *)(a1 + 56));
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("suppressAttributionLogos"));

  }
  v44 = *(_WORD *)(a1 + 140);
  if ((v44 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 138));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("requiresAttributionInPhotoViewerHeader"));

    v44 = *(_WORD *)(a1 + 140);
  }
  if ((v44 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 136));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("devPlaceCardAttr"));

  }
  v47 = *(void **)(a1 + 16);
  if (v47)
  {
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __56__GEOSearchAttributionSource__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E1C00600;
      v51 = v50;
      v55 = v51;
      objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v54);
      v52 = v51;

      v49 = v52;
    }
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchAttributionSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_362_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_363_0;
      GEOSearchAttributionSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOSearchAttributionSourceCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

void __56__GEOSearchAttributionSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOSearchAttributionSourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  unint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  unint64_t v20;
  __int16 flags;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  PBDataReader *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), v6 = (__int16)self->_flags, (v6 & 0x1FF0) == 0))
  {
    if ((v6 & 0x80) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v22 = self->_attributionApps;
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v22);
            if (GEOAttributionAppIsDirty(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
          if (v23)
            continue;
          break;
        }
      }

    }
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v27);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSearchAttributionSource readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    PBDataWriterWriteUint32Field();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = self->_localizedAttributions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v8);
    }

    if (self->_attributionRequirements.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_attributionRequirements.count);
    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = self->_attributionApps;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v13; ++k)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v13);
    }

    if (self->_webBaseActionURL)
      PBDataWriterWriteStringField();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_supportedComponentActions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (m = 0; m != v17; ++m)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      }
      while (v17);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_appAdamID)
      PBDataWriterWriteStringField();
    if (self->_suppressAttributionLogos.count)
    {
      v20 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v20 < self->_suppressAttributionLogos.count);
    }
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOSearchAttributionSource *v8;
  PBDataReader *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t k;
  id v32;
  uint64_t v33;
  void *v34;
  __int16 flags;
  PBUnknownFields *v36;
  uint64_t v38;
  GEOSearchAttributionSource *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v38 = 128;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_WORD *)&v8->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOSearchAttributionSourceReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      v10 = (id)v5;
      objc_sync_exit(v9);

      goto LABEL_35;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 0);
  v11 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v11;

  *(_DWORD *)(v5 + 132) = self->_sourceVersion;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v39 = self;
  v13 = self->_localizedAttributions;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v13);
        v17 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "copyWithZone:", a3, v38);
        -[GEOSearchAttributionSource _readLocalizedAttributions](v5);
        -[GEOSearchAttributionSource _addNoFlagsLocalizedAttribution:](v5, v17);

        os_unfair_lock_lock_with_options();
        *(_WORD *)(v5 + 140) |= 0x100u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 128));
        *(_WORD *)(v5 + 140) |= 0x1000u;

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v14);
  }

  PBRepeatedInt32Copy();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = v39->_attributionApps;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "copyWithZone:", a3);
        v23 = v22;
        if (v5)
        {
          v24 = v22;
          -[GEOSearchAttributionSource _readAttributionApps](v5);
          -[GEOSearchAttributionSource _addNoFlagsAttributionApps:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(_WORD *)(v5 + 140) |= 0x80u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + v38));
          *(_WORD *)(v5 + 140) |= 0x1000u;
        }

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v19);
  }

  v25 = -[NSString copyWithZone:](v39->_webBaseActionURL, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v25;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v27 = v39->_supportedComponentActions;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v41;
    v30 = (os_unfair_lock_s *)(v5 + v38);
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v27);
        v32 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * k), "copyWithZone:", a3, v38);
        -[GEOSearchAttributionSource _readSupportedComponentActions](v5);
        -[GEOSearchAttributionSource _addNoFlagsSupportedComponentActions:](v5, v32);

        os_unfair_lock_lock_with_options();
        *(_WORD *)(v5 + 140) |= 0x400u;
        os_unfair_lock_unlock(v30);
        *(_WORD *)(v5 + 140) |= 0x1000u;

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v28);
  }

  if ((*(_WORD *)&v39->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 137) = v39->_enforceAppStore;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v33 = -[NSString copyWithZone:](v39->_appAdamID, "copyWithZone:", a3, v38);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  PBRepeatedInt32Copy();
  flags = (__int16)v39->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 138) = v39->_requiresAttributionInPhotoViewerHeader;
    *(_WORD *)(v5 + 140) |= 4u;
    flags = (__int16)v39->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 136) = v39->_devPlaceCardAttr;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  v36 = v39->_unknownFields;
  v10 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v36;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceIdentifier;
  NSMutableArray *localizedAttributions;
  NSMutableArray *attributionApps;
  NSString *webBaseActionURL;
  NSMutableArray *supportedComponentActions;
  __int16 v10;
  NSString *appAdamID;
  __int16 flags;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 1);
  -[GEOSearchAttributionSource readAll:]((uint64_t)v4, 1);
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:"))
      goto LABEL_35;
  }
  if (self->_sourceVersion != *((_DWORD *)v4 + 33))
    goto LABEL_35;
  localizedAttributions = self->_localizedAttributions;
  if ((unint64_t)localizedAttributions | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](localizedAttributions, "isEqual:"))
      goto LABEL_35;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_35;
  attributionApps = self->_attributionApps;
  if ((unint64_t)attributionApps | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](attributionApps, "isEqual:"))
      goto LABEL_35;
  }
  webBaseActionURL = self->_webBaseActionURL;
  if ((unint64_t)webBaseActionURL | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](webBaseActionURL, "isEqual:"))
      goto LABEL_35;
  }
  supportedComponentActions = self->_supportedComponentActions;
  if ((unint64_t)supportedComponentActions | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](supportedComponentActions, "isEqual:"))
      goto LABEL_35;
  }
  v10 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_35;
    if (self->_enforceAppStore)
    {
      if (!*((_BYTE *)v4 + 137))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_35;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_35;
  }
  appAdamID = self->_appAdamID;
  if ((unint64_t)appAdamID | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](appAdamID, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_35;
  }
  flags = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 70);
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0)
      goto LABEL_35;
    if (self->_requiresAttributionInPhotoViewerHeader)
    {
      if (!*((_BYTE *)v4 + 138))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 138))
    {
      goto LABEL_35;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_35;
  }
  v14 = (v13 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v13 & 1) != 0)
    {
      if (self->_devPlaceCardAttr)
      {
        if (!*((_BYTE *)v4 + 136))
          goto LABEL_35;
      }
      else if (*((_BYTE *)v4 + 136))
      {
        goto LABEL_35;
      }
      v14 = 1;
      goto LABEL_36;
    }
LABEL_35:
    v14 = 0;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  unsigned int sourceVersion;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  __int16 flags;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v16;

  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 1);
  v16 = -[NSString hash](self->_sourceIdentifier, "hash");
  sourceVersion = self->_sourceVersion;
  v4 = -[NSMutableArray hash](self->_localizedAttributions, "hash");
  v5 = PBRepeatedInt32Hash();
  v6 = -[NSMutableArray hash](self->_attributionApps, "hash");
  v7 = -[NSString hash](self->_webBaseActionURL, "hash");
  v8 = -[NSMutableArray hash](self->_supportedComponentActions, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v9 = 2654435761 * self->_enforceAppStore;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_appAdamID, "hash");
  v11 = PBRepeatedInt32Hash();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v13 = 2654435761 * self->_requiresAttributionInPhotoViewerHeader;
    if ((flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v14 = 0;
    return (2654435761 * sourceVersion) ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v14 = 2654435761 * self->_devPlaceCardAttr;
  return (2654435761 * sourceVersion) ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webBaseActionURL, 0);
  objc_storeStrong((id *)&self->_supportedComponentActions, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedAttributions, 0);
  objc_storeStrong((id *)&self->_attributionApps, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestLocalizedAttribution
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  id *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0C99DE8];
  -[GEOSearchAttributionSource _readLocalizedAttributions]((uint64_t)a1);
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(a1[11], "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = a1;
  -[GEOSearchAttributionSource localizedAttributions](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v10
          && (-[GEOLocalizedAttribution _readLanguage](*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)), *(_QWORD *)(v10 + 40))
          && (-[GEOLocalizedAttribution language]((id *)v10),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v12 = objc_msgSend(v11, "length", v27),
              v11,
              v12))
        {
          -[GEOLocalizedAttribution language]((id *)v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
        else if (!v7)
        {
          v7 = (id)v10;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v14 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v3, v15, 1, 0);
  v16 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v16;
  if (v16)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[GEOSearchAttributionSource localizedAttributions](v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (v22)
          {
            -[GEOLocalizedAttribution _readLanguage](*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
            if (*(_QWORD *)(v22 + 40))
            {
              -[GEOLocalizedAttribution language]((id *)v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", v28);

              if ((v24 & 1) != 0)
              {
                v25 = (id)v22;

                goto LABEL_31;
              }
            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
          continue;
        break;
      }
    }

  }
  v25 = v7;
LABEL_31:

  return v25;
}

- (BOOL)supportsAction:(int)a3 forComponent:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  _BOOL8 v12;
  unint64_t v14;
  unint64_t v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOSearchAttributionSource supportedComponentActions](a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v10 && (*(_BYTE *)(v10 + 48) & 1) != 0)
          v11 = *(_DWORD *)(v10 + 40);
        else
          v11 = 0;
        if (v11 == a3)
        {
          v14 = 0;
          do
          {
            if (v10)
              v15 = *(_QWORD *)(v10 + 24);
            else
              v15 = 0;
            v12 = v14 < v15;
            if (v14 >= v15)
              break;
            v16 = -[GEOComponentAction actionsAtIndex:](v10, v14++);
          }
          while (v16 != a2);
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)canLocallyHandleAction:(id *)a1 forComponent:(int)a2
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  unint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOSearchAttributionSource supportedComponentActions](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        if ((*(_BYTE *)(v8 + 48) & 1) != 0 && *(_DWORD *)(v8 + 40) == 1)
          break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
    if (!*(_QWORD *)(v8 + 24))
    {
LABEL_17:
      v9 = *(_BYTE *)(v8 + 44) != 0;
      goto LABEL_18;
    }
    v10 = 0;
    while (v10 < *(_QWORD *)(v8 + 24))
    {
      v11 = -[GEOComponentAction actionsAtIndex:](v8, v10++);
      if (v11 == a2)
        goto LABEL_17;
    }
  }
LABEL_12:
  v9 = 0;
LABEL_18:

  return v9;
}

@end
