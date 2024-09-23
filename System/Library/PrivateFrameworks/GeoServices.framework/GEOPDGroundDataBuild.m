@implementation GEOPDGroundDataBuild

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
        v6 = (int *)&readAll__recursiveTag_183_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_184_0;
      GEOPDGroundDataBuildReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDGroundDataBuild)init
{
  GEOPDGroundDataBuild *v2;
  GEOPDGroundDataBuild *v3;
  GEOPDGroundDataBuild *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundDataBuild;
  v2 = -[GEOPDGroundDataBuild init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroundDataBuild)initWithData:(id)a3
{
  GEOPDGroundDataBuild *v3;
  GEOPDGroundDataBuild *v4;
  GEOPDGroundDataBuild *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundDataBuild;
  v3 = -[GEOPDGroundDataBuild initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGroundDataBuild;
  -[GEOPDGroundDataBuild dealloc](&v3, sel_dealloc);
}

- (uint64_t)type
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 108);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 0x80) != 0)
      return *(unsigned int *)(v1 + 104);
    else
      return 1;
  }
  return result;
}

- (void)_readCapabilitys
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDGroundDataBuildReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCapabilitys_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addCapability:(uint64_t)a1
{
  -[GEOPDGroundDataBuild _readCapabilitys](a1);
  PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 108) |= 0x100u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  *(_WORD *)(a1 + 108) |= 0x400u;
}

- (void)_readLodWithTextures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundDataBuildReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLodWithTextures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)addLodWithTextures:(uint64_t)a1
{
  -[GEOPDGroundDataBuild _readLodWithTextures](a1);
  PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 108) |= 0x200u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  *(_WORD *)(a1 + 108) |= 0x400u;
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
  v8.super_class = (Class)GEOPDGroundDataBuild;
  -[GEOPDGroundDataBuild description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGroundDataBuild dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundDataBuild _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  __int16 v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  unsigned int v28;
  __CFString *v29;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDGroundDataBuild readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("index"));

    v6 = *(_WORD *)(a1 + 108);
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_43;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("buildId");
  else
    v23 = CFSTR("build_id");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("dataFormatVersion");
  else
    v25 = CFSTR("data_format_version");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0)
      goto LABEL_7;
LABEL_51:
    v28 = *(_DWORD *)(a1 + 104) - 1;
    if (v28 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C11BC8[v28];
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("type"));

    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("dataOutputVersion");
  else
    v27 = CFSTR("data_output_version");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v6 = *(_WORD *)(a1 + 108);
  if ((v6 & 0x80) != 0)
    goto LABEL_51;
LABEL_7:
  if ((v6 & 0x10) != 0)
  {
LABEL_8:
    LODWORD(v5) = *(_DWORD *)(a1 + 92);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("heightAboveGroundM");
    else
      v8 = CFSTR("height_above_ground_m");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
LABEL_12:
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v11 = 0;
      do
      {
        v12 = *(unsigned int *)(*v10 + 4 * v11);
        if ((_DWORD)v12 == 1)
        {
          v13 = CFSTR("PANORAMIC");
        }
        else if ((_DWORD)v12 == 2)
        {
          v13 = CFSTR("WOBBLY");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "addObject:", v13);

        ++v11;
        v10 = (_QWORD *)(a1 + 16);
      }
      while (v11 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("capability"));

  }
  if ((*(_WORD *)(a1 + 108) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("bucketId");
    else
      v15 = CFSTR("bucket_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedUInt32NSArray();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("lodWithTextures");
    else
      v17 = CFSTR("lod_with_textures");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if ((*(_WORD *)(a1 + 108) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("metricsVersion");
    else
      v19 = CFSTR("metrics_version");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroundDataBuild _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  int v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  int v34;
  const __CFString *v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  const __CFString *v44;
  void *v45;
  int v46;
  void *v48;
  int v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_78;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x20u;
    *(_DWORD *)(v6 + 96) = v8;
  }

  if (a3)
    v9 = CFSTR("buildId");
  else
    v9 = CFSTR("build_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 2u;
    *(_DWORD *)(v6 + 80) = v11;
  }

  if (a3)
    v12 = CFSTR("dataFormatVersion");
  else
    v12 = CFSTR("data_format_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 4u;
    *(_DWORD *)(v6 + 84) = v14;
  }

  if (a3)
    v15 = CFSTR("dataOutputVersion");
  else
    v15 = CFSTR("data_output_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 8u;
    *(_DWORD *)(v6 + 88) = v17;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("T300")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("T400")) & 1) != 0)
    {
      v20 = 2;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("T392C")))
    {
      v20 = 3;
    }
    else
    {
      v20 = 1;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_30:
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x80u;
    *(_DWORD *)(v6 + 104) = v20;
  }

  if (a3)
    v21 = CFSTR("heightAboveGroundM");
  else
    v21 = CFSTR("height_above_ground_m");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "floatValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x10u;
    *(_DWORD *)(v6 + 92) = v23;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("capability"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = a3;
    v50 = v5;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v48 = v24;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (!v26)
      goto LABEL_52;
    v27 = v26;
    v28 = *(_QWORD *)v56;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v56 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = v30;
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("PANORAMIC")) & 1) == 0)
            objc_msgSend(v31, "isEqualToString:", CFSTR("WOBBLY"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v30, "intValue");
        }
        -[GEOPDGroundDataBuild addCapability:](v6);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (!v27)
      {
LABEL_52:

        v5 = v50;
        a3 = v49;
        v24 = v48;
        break;
      }
    }
  }

  if (a3)
    v32 = CFSTR("bucketId");
  else
    v32 = CFSTR("bucket_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = objc_msgSend(v33, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 1u;
    *(_DWORD *)(v6 + 76) = v34;
  }

  if (a3)
    v35 = CFSTR("lodWithTextures");
  else
    v35 = CFSTR("lod_with_textures");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = a3;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v38 = v36;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v43, "unsignedIntValue");
            -[GEOPDGroundDataBuild addLodWithTextures:](v6);
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v40);
    }

    a3 = v37;
  }

  if (a3)
    v44 = CFSTR("metricsVersion");
  else
    v44 = CFSTR("metrics_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = objc_msgSend(v45, "unsignedIntValue");
    *(_WORD *)(v6 + 108) |= 0x400u;
    *(_WORD *)(v6 + 108) |= 0x40u;
    *(_DWORD *)(v6 + 100) = v46;
  }

LABEL_78:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroundDataBuildReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_27;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
  }
  v6 = v11;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v11;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v6 = v11;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  v6 = v11;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  v6 = v11;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    v6 = v11;
  }
LABEL_11:
  if (self->_capabilitys.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v6 = v11;
      ++v7;
    }
    while (v7 < self->_capabilitys.count);
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v11;
  }
  if (self->_lodWithTextures.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v6 = v11;
      ++v8;
    }
    while (v8 < self->_lodWithTextures.count);
  }
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
LABEL_27:
    v6 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;
  __int16 flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGroundDataBuildReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v7 = (id)v4;
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v4 + 96) = self->_index;
    *(_WORD *)(v4 + 108) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v4 + 80) = self->_buildId;
  *(_WORD *)(v4 + 108) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v4 + 84) = self->_dataFormatVersion;
  *(_WORD *)(v4 + 108) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
LABEL_21:
    *(_DWORD *)(v4 + 104) = self->_type;
    *(_WORD *)(v4 + 108) |= 0x80u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v4 + 88) = self->_dataOutputVersion;
  *(_WORD *)(v4 + 108) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
    goto LABEL_21;
LABEL_10:
  if ((flags & 0x10) != 0)
  {
LABEL_11:
    *(float *)(v4 + 92) = self->_heightAboveGroundM;
    *(_WORD *)(v4 + 108) |= 0x10u;
  }
LABEL_12:
  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 76) = self->_bucketId;
    *(_WORD *)(v4 + 108) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v4 + 100) = self->_metricsVersion;
    *(_WORD *)(v4 + 108) |= 0x40u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 1);
  -[GEOPDGroundDataBuild readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 54);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_index != *((_DWORD *)v4 + 24))
      goto LABEL_44;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_buildId != *((_DWORD *)v4 + 20))
      goto LABEL_44;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dataFormatVersion != *((_DWORD *)v4 + 21))
      goto LABEL_44;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dataOutputVersion != *((_DWORD *)v4 + 22))
      goto LABEL_44;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 26))
      goto LABEL_44;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_heightAboveGroundM != *((float *)v4 + 23))
      goto LABEL_44;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_44;
  v7 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_bucketId != *((_DWORD *)v4 + 19))
      goto LABEL_44;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_44;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_44:
    v9 = 0;
    goto LABEL_45;
  }
  v8 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_metricsVersion != *((_DWORD *)v4 + 25))
      goto LABEL_44;
    v9 = 1;
  }
  else
  {
    v9 = (v8 & 0x40) == 0;
  }
LABEL_45:

  return v9;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float heightAboveGroundM;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  -[GEOPDGroundDataBuild readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v18 = 2654435761 * self->_index;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_buildId;
      if ((flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v18 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_dataFormatVersion;
    if ((flags & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_dataOutputVersion;
    if ((flags & 0x80) != 0)
      goto LABEL_6;
LABEL_15:
    v7 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_7;
LABEL_16:
    v12 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v6 = 0;
  if ((flags & 0x80) == 0)
    goto LABEL_15;
LABEL_6:
  v7 = 2654435761 * self->_type;
  if ((flags & 0x10) == 0)
    goto LABEL_16;
LABEL_7:
  heightAboveGroundM = self->_heightAboveGroundM;
  v9 = heightAboveGroundM;
  if (heightAboveGroundM < 0.0)
    v9 = -heightAboveGroundM;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_19:
  v13 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v14 = 2654435761 * self->_bucketId;
  else
    v14 = 0;
  v15 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
    v16 = 2654435761 * self->_metricsVersion;
  else
    v16 = 0;
  return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v12 ^ v14 ^ v13 ^ v15 ^ v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
