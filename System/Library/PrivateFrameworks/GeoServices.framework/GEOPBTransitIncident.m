@implementation GEOPBTransitIncident

- (GEOPBTransitIncident)init
{
  GEOPBTransitIncident *v2;
  GEOPBTransitIncident *v3;
  GEOPBTransitIncident *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitIncident;
  v2 = -[GEOPBTransitIncident init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitIncident)initWithData:(id)a3
{
  GEOPBTransitIncident *v3;
  GEOPBTransitIncident *v4;
  GEOPBTransitIncident *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitIncident;
  v3 = -[GEOPBTransitIncident initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (os_unfair_lock_s)iconEnum
{
  os_unfair_lock_s *v1;
  uint32_t os_unfair_lock_opaque;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v1[34]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 26);
    if ((os_unfair_lock_opaque & 8) != 0)
      return (os_unfair_lock_s *)v1[29]._os_unfair_lock_opaque;
    else
      return 0;
  }
  return result;
}

- (void)_readAffectedEntitys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAffectedEntitys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)affectedEntitys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readAffectedEntitys]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAffectedEntitys:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 136) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)addAffectedEntity:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPBTransitIncident _readAffectedEntitys]((uint64_t)a1);
    -[GEOPBTransitIncident _addNoFlagsAffectedEntity:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[34]._os_unfair_lock_opaque |= 0x200u;
    os_unfair_lock_unlock(a1 + 26);
    a1[34]._os_unfair_lock_opaque |= 0x20000u;
  }
}

- (void)_addNoFlagsAffectedEntity:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readLongDescriptionString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLongDescriptionString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)longDescriptionString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readLongDescriptionString]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setLongDescriptionString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x800u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readShortDescriptionString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShortDescriptionString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)shortDescriptionString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readShortDescriptionString]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)setShortDescriptionString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x8000u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }

}

- (void)_readTitleString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitleString_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)titleString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readTitleString]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)setTitleString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 136) |= 0x10000u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }

}

- (void)_readMessageString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessageString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readMessageString]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readMessageForAllBlocking
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessageForAllBlocking_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageForAllBlocking
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readMessageForAllBlocking]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readMessageForIncidentType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessageForIncidentType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)messageForIncidentType
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readMessageForIncidentType]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readIncidentTypeArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 137) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentTypeArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)incidentTypeArtwork
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPBTransitIncident _readIncidentTypeArtwork]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
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
  v8.super_class = (Class)GEOPBTransitIncident;
  -[GEOPBTransitIncident description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitIncident dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  int v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPBTransitIncident readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 120));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("incidentIndex");
    else
      v35 = CFSTR("incident_index");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_71;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v37 = CFSTR("incidentMuid");
  else
    v37 = CFSTR("incident_muid");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_87;
  }
LABEL_71:
  v38 = *(_DWORD *)(a1 + 116);
  if (v38)
  {
    if (v38 == 1)
    {
      v39 = CFSTR("ICON_CONSTRUCTION");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 116));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = CFSTR("ICON_WARNING");
  }
  if (a2)
    v47 = CFSTR("iconEnum");
  else
    v47 = CFSTR("icon_enum");
  objc_msgSend(v4, "setObject:forKey:", v39, v47);

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_91;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v49 = CFSTR("startDatetime");
  else
    v49 = CFSTR("start_datetime");
  objc_msgSend(v4, "setObject:forKey:", v48, v49);

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
LABEL_95:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v53 = CFSTR("creationDatetime");
    else
      v53 = CFSTR("creation_datetime");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

    if ((*(_DWORD *)(a1 + 136) & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 112));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v51 = CFSTR("endDatetime");
  else
    v51 = CFSTR("end_datetime");
  objc_msgSend(v4, "setObject:forKey:", v50, v51);

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 2) != 0)
    goto LABEL_95;
LABEL_8:
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("updatedDatetime");
    else
      v7 = CFSTR("updated_datetime");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_13:
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v9 = *(id *)(a1 + 24);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("affectedEntity");
    else
      v16 = CFSTR("affected_entity");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  if ((*(_BYTE *)(a1 + 136) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("blocking"));

  }
  -[GEOPBTransitIncident longDescriptionString]((id *)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("longDescriptionString");
    else
      v19 = CFSTR("long_description_string");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  -[GEOPBTransitIncident shortDescriptionString]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("shortDescriptionString");
    else
      v21 = CFSTR("short_description_string");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  -[GEOPBTransitIncident titleString]((id *)a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (a2)
      v23 = CFSTR("titleString");
    else
      v23 = CFSTR("title_string");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);
  }

  -[GEOPBTransitIncident messageString]((id *)a1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("messageString");
    else
      v25 = CFSTR("message_string");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  -[GEOPBTransitIncident messageForAllBlocking]((id *)a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("messageForAllBlocking");
    else
      v27 = CFSTR("message_for_all_blocking");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  -[GEOPBTransitIncident messageForIncidentType]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if (a2)
      v29 = CFSTR("messageForIncidentType");
    else
      v29 = CFSTR("message_for_incident_type");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);
  }

  -[GEOPBTransitIncident incidentTypeArtwork]((id *)a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("incidentTypeArtwork");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("incident_type_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __50__GEOPBTransitIncident__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E1C00600;
      v44 = v43;
      v55 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v54);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_298;
      else
        v6 = (int *)&readAll__nonRecursiveTag_299;
      GEOPBTransitIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPBTransitIncidentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __50__GEOPBTransitIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  int v16;
  const __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  int v25;
  const __CFString *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  GEOPBTransitIncidentEntity *v39;
  GEOPBTransitIncidentEntity *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  GEOPBTransitIncidentEntityFilter *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  GEOPBTransitIncidentEntityFilter *v55;
  uint64_t v56;
  void *v57;
  char v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  id v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  id v75;
  const __CFString *v76;
  void *v77;
  void *v78;
  id v79;
  const __CFString *v80;
  void *v81;
  GEOPBTransitArtwork *v82;
  GEOPBTransitArtwork *v83;
  GEOPBTransitArtwork *v84;
  GEOPBTransitArtwork *v85;
  void *v87;
  id v88;
  int v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  const __CFString *v94;
  uint64_t v95;
  void *v96;
  const __CFString *v97;
  uint64_t v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_128;
  }
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("incidentIndex");
    else
      v7 = CFSTR("incident_index");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "unsignedIntValue");
      *(_DWORD *)(v6 + 136) |= 0x20000u;
      *(_DWORD *)(v6 + 136) |= 0x10u;
      *(_DWORD *)(v6 + 120) = v9;
    }

    if (a3)
      v10 = CFSTR("incidentMuid");
    else
      v10 = CFSTR("incident_muid");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "unsignedLongLongValue");
      *(_DWORD *)(v6 + 136) |= 0x20000u;
      *(_DWORD *)(v6 + 136) |= 1u;
      *(_QWORD *)(v6 + 32) = v12;
    }

    if (a3)
      v13 = CFSTR("iconEnum");
    else
      v13 = CFSTR("icon_enum");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ICON_WARNING")) & 1) != 0)
        v16 = 0;
      else
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("ICON_CONSTRUCTION"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_24:

        if (a3)
          v17 = CFSTR("startDatetime");
        else
          v17 = CFSTR("start_datetime");
        objc_msgSend(v5, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = objc_msgSend(v18, "unsignedIntValue");
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x20u;
          *(_DWORD *)(v6 + 124) = v19;
        }

        if (a3)
          v20 = CFSTR("endDatetime");
        else
          v20 = CFSTR("end_datetime");
        objc_msgSend(v5, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_msgSend(v21, "unsignedIntValue");
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 4u;
          *(_DWORD *)(v6 + 112) = v22;
        }

        if (a3)
          v23 = CFSTR("creationDatetime");
        else
          v23 = CFSTR("creation_datetime");
        objc_msgSend(v5, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = objc_msgSend(v24, "unsignedIntValue");
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 2u;
          *(_DWORD *)(v6 + 108) = v25;
        }

        if (a3)
          v26 = CFSTR("updatedDatetime");
        else
          v26 = CFSTR("updated_datetime");
        objc_msgSend(v5, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = objc_msgSend(v27, "unsignedIntValue");
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x40u;
          *(_DWORD *)(v6 + 128) = v28;
        }

        if (a3)
          v29 = CFSTR("affectedEntity");
        else
          v29 = CFSTR("affected_entity");
        objc_msgSend(v5, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = a3;
          v87 = v30;
          v88 = v5;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v31 = v30;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
          if (v32)
          {
            v33 = v32;
            v34 = CFSTR("affected_muid");
            v35 = *(_QWORD *)v101;
            if (a3)
              v34 = CFSTR("affectedMuid");
            v97 = v34;
            v36 = CFSTR("nextStopMuid");
            if (!a3)
              v36 = CFSTR("next_stop_muid");
            v94 = v36;
            v95 = v6;
            v90 = *(_QWORD *)v101;
            v91 = v31;
            do
            {
              v37 = 0;
              v98 = v33;
              do
              {
                if (*(_QWORD *)v101 != v35)
                  objc_enumerationMutation(v31);
                v38 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v37);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v39 = [GEOPBTransitIncidentEntity alloc];
                  if (v39)
                  {
                    v40 = v39;
                    v41 = v38;
                    v42 = -[GEOPBTransitIncidentEntity init](v40, "init");
                    if (v42)
                    {
                      v99 = v41;
                      objc_msgSend(v41, "objectForKeyedSubscript:", v97);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v44 = objc_msgSend(v43, "unsignedLongLongValue");
                        *(_BYTE *)(v42 + 32) |= 1u;
                        *(_QWORD *)(v42 + 16) = v44;
                      }

                      v41 = v99;
                      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("filter"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v46 = [GEOPBTransitIncidentEntityFilter alloc];
                        v96 = v45;
                        if (v46)
                        {
                          v47 = v45;
                          v46 = -[GEOPBTransitIncidentEntityFilter init](v46, "init");
                          if (v46)
                          {
                            objc_msgSend(v47, "objectForKeyedSubscript:", v94);
                            v48 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v92 = v48;
                              v93 = v47;
                              v106 = 0u;
                              v107 = 0u;
                              v104 = 0u;
                              v105 = 0u;
                              v49 = v48;
                              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
                              if (v50)
                              {
                                v51 = v50;
                                v52 = *(_QWORD *)v105;
                                do
                                {
                                  for (i = 0; i != v51; ++i)
                                  {
                                    if (*(_QWORD *)v105 != v52)
                                      objc_enumerationMutation(v49);
                                    v54 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      objc_msgSend(v54, "unsignedLongLongValue");
                                      PBRepeatedUInt64Add();
                                    }
                                  }
                                  v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
                                }
                                while (v51);
                              }

                              v35 = v90;
                              v31 = v91;
                              v48 = v92;
                              v47 = v93;
                            }

                            v6 = v95;
                          }

                        }
                        v55 = v46;
                        objc_storeStrong((id *)(v42 + 24), v46);

                        v41 = v99;
                        v45 = v96;
                      }

                    }
                  }
                  else
                  {
                    v42 = 0;
                  }
                  -[GEOPBTransitIncident addAffectedEntity:]((os_unfair_lock_s *)v6, (void *)v42);

                  v33 = v98;
                }
                ++v37;
              }
              while (v37 != v33);
              v56 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
              v33 = v56;
            }
            while (v56);
          }

          v30 = v87;
          v5 = v88;
          a3 = v89;
        }

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blocking"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = objc_msgSend(v57, "BOOLValue");
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          *(_DWORD *)(v6 + 136) |= 0x80u;
          *(_BYTE *)(v6 + 132) = v58;
        }

        if (a3)
          v59 = CFSTR("longDescriptionString");
        else
          v59 = CFSTR("long_description_string");
        objc_msgSend(v5, "objectForKeyedSubscript:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v61 = (void *)objc_msgSend(v60, "copy");
          -[GEOPBTransitIncident setLongDescriptionString:](v6, v61);

        }
        if (a3)
          v62 = CFSTR("shortDescriptionString");
        else
          v62 = CFSTR("short_description_string");
        objc_msgSend(v5, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v64 = (void *)objc_msgSend(v63, "copy");
          -[GEOPBTransitIncident setShortDescriptionString:](v6, v64);

        }
        if (a3)
          v65 = CFSTR("titleString");
        else
          v65 = CFSTR("title_string");
        objc_msgSend(v5, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v67 = (void *)objc_msgSend(v66, "copy");
          -[GEOPBTransitIncident setTitleString:](v6, v67);

        }
        if (a3)
          v68 = CFSTR("messageString");
        else
          v68 = CFSTR("message_string");
        objc_msgSend(v5, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v70 = (void *)objc_msgSend(v69, "copy");
          v71 = v70;
          *(_DWORD *)(v6 + 136) |= 0x4000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 72), v70);

        }
        if (a3)
          v72 = CFSTR("messageForAllBlocking");
        else
          v72 = CFSTR("message_for_all_blocking");
        objc_msgSend(v5, "objectForKeyedSubscript:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = (void *)objc_msgSend(v73, "copy");
          v75 = v74;
          *(_DWORD *)(v6 + 136) |= 0x1000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 56), v74);

        }
        if (a3)
          v76 = CFSTR("messageForIncidentType");
        else
          v76 = CFSTR("message_for_incident_type");
        objc_msgSend(v5, "objectForKeyedSubscript:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v78 = (void *)objc_msgSend(v77, "copy");
          v79 = v78;
          *(_DWORD *)(v6 + 136) |= 0x2000u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 64), v78);

        }
        if (a3)
          v80 = CFSTR("incidentTypeArtwork");
        else
          v80 = CFSTR("incident_type_artwork");
        objc_msgSend(v5, "objectForKeyedSubscript:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v82 = [GEOPBTransitArtwork alloc];
          if ((a3 & 1) != 0)
            v83 = -[GEOPBTransitArtwork initWithJSON:](v82, "initWithJSON:", v81);
          else
            v83 = -[GEOPBTransitArtwork initWithDictionary:](v82, "initWithDictionary:", v81);
          v84 = v83;
          v85 = v83;
          *(_DWORD *)(v6 + 136) |= 0x400u;
          *(_DWORD *)(v6 + 136) |= 0x20000u;
          objc_storeStrong((id *)(v6 + 40), v84);

        }
        goto LABEL_128;
      }
      v16 = objc_msgSend(v14, "intValue");
    }
    *(_DWORD *)(v6 + 136) |= 0x20000u;
    *(_DWORD *)(v6 + 136) |= 8u;
    *(_DWORD *)(v6 + 116) = v16;
    goto LABEL_24;
  }
LABEL_128:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  if (self->_reader && (_GEOPBTransitIncidentIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_43;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
LABEL_40:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    goto LABEL_40;
LABEL_9:
  if ((*(_BYTE *)&flags & 0x40) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_affectedEntitys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_longDescriptionString)
    PBDataWriterWriteStringField();
  if (self->_shortDescriptionString)
    PBDataWriterWriteStringField();
  if (self->_titleString)
    PBDataWriterWriteStringField();
  if (self->_messageString)
    PBDataWriterWriteStringField();
  if (self->_messageForAllBlocking)
    PBDataWriterWriteStringField();
  if (self->_messageForIncidentType)
    PBDataWriterWriteStringField();
  if (self->_incidentTypeArtwork)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_43:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  id v27;
  void *v28;
  PBUnknownFields *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
      GEOPBTransitIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_incidentIndex;
    *(_DWORD *)(v5 + 136) |= 0x10u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v5 + 32) = self->_incidentMuid;
  *(_DWORD *)(v5 + 136) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 116) = self->_iconEnum;
  *(_DWORD *)(v5 + 136) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 124) = self->_startDatetime;
  *(_DWORD *)(v5 + 136) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_11;
LABEL_29:
    *(_DWORD *)(v5 + 108) = self->_creationDatetime;
    *(_DWORD *)(v5 + 136) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_28:
  *(_DWORD *)(v5 + 112) = self->_endDatetime;
  *(_DWORD *)(v5 + 136) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    goto LABEL_29;
LABEL_11:
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 128) = self->_updatedDatetime;
    *(_DWORD *)(v5 + 136) |= 0x40u;
  }
LABEL_13:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_affectedEntitys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v31);
        -[GEOPBTransitIncident addAffectedEntity:]((os_unfair_lock_s *)v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 132) = self->_blocking;
    *(_DWORD *)(v5 + 136) |= 0x80u;
  }
  v15 = -[NSString copyWithZone:](self->_longDescriptionString, "copyWithZone:", a3, (_QWORD)v31);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[NSString copyWithZone:](self->_shortDescriptionString, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v19 = -[NSString copyWithZone:](self->_titleString, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v19;

  v21 = -[NSString copyWithZone:](self->_messageString, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v21;

  v23 = -[NSString copyWithZone:](self->_messageForAllBlocking, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  v25 = -[NSString copyWithZone:](self->_messageForIncidentType, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v25;

  v27 = -[GEOPBTransitArtwork copyWithZone:](self->_incidentTypeArtwork, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v27;

  v29 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v29;
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags;
  int v6;
  NSMutableArray *affectedEntitys;
  NSString *longDescriptionString;
  NSString *shortDescriptionString;
  NSString *titleString;
  NSString *messageString;
  NSString *messageForAllBlocking;
  NSString *messageForIncidentType;
  GEOPBTransitArtwork *incidentTypeArtwork;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  -[GEOPBTransitIncident readAll:]((uint64_t)self, 1);
  -[GEOPBTransitIncident readAll:]((uint64_t)v4, 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 34);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 30))
      goto LABEL_62;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_incidentMuid != *((_QWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_iconEnum != *((_DWORD *)v4 + 29))
      goto LABEL_62;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startDatetime != *((_DWORD *)v4 + 31))
      goto LABEL_62;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_endDatetime != *((_DWORD *)v4 + 28))
      goto LABEL_62;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_creationDatetime != *((_DWORD *)v4 + 27))
      goto LABEL_62;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_updatedDatetime != *((_DWORD *)v4 + 32))
      goto LABEL_62;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  affectedEntitys = self->_affectedEntitys;
  if ((unint64_t)affectedEntitys | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](affectedEntitys, "isEqual:"))
      goto LABEL_62;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 34);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_blocking)
      {
        if (!*((_BYTE *)v4 + 132))
          goto LABEL_62;
        goto LABEL_48;
      }
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_48;
    }
LABEL_62:
    v15 = 0;
    goto LABEL_63;
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_62;
LABEL_48:
  longDescriptionString = self->_longDescriptionString;
  if ((unint64_t)longDescriptionString | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](longDescriptionString, "isEqual:"))
  {
    goto LABEL_62;
  }
  shortDescriptionString = self->_shortDescriptionString;
  if ((unint64_t)shortDescriptionString | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](shortDescriptionString, "isEqual:"))
      goto LABEL_62;
  }
  titleString = self->_titleString;
  if ((unint64_t)titleString | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](titleString, "isEqual:"))
      goto LABEL_62;
  }
  messageString = self->_messageString;
  if ((unint64_t)messageString | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](messageString, "isEqual:"))
      goto LABEL_62;
  }
  messageForAllBlocking = self->_messageForAllBlocking;
  if ((unint64_t)messageForAllBlocking | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](messageForAllBlocking, "isEqual:"))
      goto LABEL_62;
  }
  messageForIncidentType = self->_messageForIncidentType;
  if ((unint64_t)messageForIncidentType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](messageForIncidentType, "isEqual:"))
      goto LABEL_62;
  }
  incidentTypeArtwork = self->_incidentTypeArtwork;
  if ((unint64_t)incidentTypeArtwork | *((_QWORD *)v4 + 5))
    v15 = -[GEOPBTransitArtwork isEqual:](incidentTypeArtwork, "isEqual:");
  else
    v15 = 1;
LABEL_63:

  return v15;
}

- (unint64_t)hash
{
  $E153A9CD1B88FE5EE0CF7D8F2D9AD3E6 flags;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;

  -[GEOPBTransitIncident readAll:]((uint64_t)self, 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v4 = 2654435761 * self->_incidentIndex;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_incidentMuid;
      if ((*(_BYTE *)&flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_iconEnum;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_startDatetime;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_endDatetime;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_creationDatetime;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_updatedDatetime;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = -[NSMutableArray hash](self->_affectedEntitys, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v12 = 2654435761 * self->_blocking;
  else
    v12 = 0;
  v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
  v14 = -[NSString hash](self->_longDescriptionString, "hash");
  v15 = v13 ^ v14 ^ -[NSString hash](self->_shortDescriptionString, "hash");
  v16 = -[NSString hash](self->_titleString, "hash");
  v17 = v16 ^ -[NSString hash](self->_messageString, "hash");
  v18 = v15 ^ v17 ^ -[NSString hash](self->_messageForAllBlocking, "hash");
  v19 = -[NSString hash](self->_messageForIncidentType, "hash");
  return v18 ^ v19 ^ -[GEOPBTransitArtwork hash](self->_incidentTypeArtwork, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 136) |= 0x100u;
    *(_DWORD *)(a1 + 136) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPBTransitIncident readAll:](a1, 0);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[GEOPBTransitIncidentEntity clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1, (_QWORD)v10);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_shortDescriptionString, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_messageForIncidentType, 0);
  objc_storeStrong((id *)&self->_messageForAllBlocking, 0);
  objc_storeStrong((id *)&self->_longDescriptionString, 0);
  objc_storeStrong((id *)&self->_incidentTypeArtwork, 0);
  objc_storeStrong((id *)&self->_affectedEntitys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
