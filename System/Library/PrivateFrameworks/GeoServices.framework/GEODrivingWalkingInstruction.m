@implementation GEODrivingWalkingInstruction

- (GEODrivingWalkingInstruction)init
{
  GEODrivingWalkingInstruction *v2;
  GEODrivingWalkingInstruction *v3;
  GEODrivingWalkingInstruction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODrivingWalkingInstruction;
  v2 = -[GEODrivingWalkingInstruction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODrivingWalkingInstruction)initWithData:(id)a3
{
  GEODrivingWalkingInstruction *v3;
  GEODrivingWalkingInstruction *v4;
  GEODrivingWalkingInstruction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODrivingWalkingInstruction;
  v3 = -[GEODrivingWalkingInstruction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_1216);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEODrivingWalkingInstruction _readTitle]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setTitle:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 84) |= 0x20u;
  *(_BYTE *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readNormalCommands
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNormalCommands_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)normalCommands
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEODrivingWalkingInstruction _readNormalCommands]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addNormalCommand:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEODrivingWalkingInstruction _readNormalCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsNormalCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsNormalCommand:(uint64_t)a1
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

- (void)_readContinueCommands
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContinueCommands_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)continueCommands
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEODrivingWalkingInstruction _readContinueCommands]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addContinueCommand:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEODrivingWalkingInstruction _readContinueCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsContinueCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsContinueCommand:(uint64_t)a1
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

- (void)_readMergeCommands
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMergeCommands_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)mergeCommands
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEODrivingWalkingInstruction _readMergeCommands]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addMergeCommand:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEODrivingWalkingInstruction _readMergeCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsMergeCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsMergeCommand:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setArtwork:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 84) |= 2u;
  *(_BYTE *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setWaypointInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 84) |= 0x40u;
  *(_BYTE *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 64), a2);

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
  v8.super_class = (Class)GEODrivingWalkingInstruction;
  -[GEODrivingWalkingInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODrivingWalkingInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEODrivingWalkingInstruction readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v61 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("normalCommand");
    else
      v15 = CFSTR("normal_command");
    objc_msgSend(v4, "setObject:forKey:", v8, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v17 = *(id *)(a1 + 32);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("continueCommand");
    else
      v23 = CFSTR("continue_command");
    objc_msgSend(v4, "setObject:forKey:", v16, v23);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v25 = *(id *)(a1 + 40);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("mergeCommand");
    else
      v31 = CFSTR("merge_command");
    objc_msgSend(v4, "setObject:forKey:", v24, v31);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 2) == 0)
  {
    v32 = *(void **)(a1 + 8);
    if (v32)
    {
      v33 = v32;
      objc_sync_enter(v33);
      GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_1);
      objc_sync_exit(v33);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v34 = *(id *)(a1 + 24);
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v34, "jsonRepresentation");
    else
      objc_msgSend(v34, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("artwork"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
  {
    v37 = *(void **)(a1 + 8);
    if (v37)
    {
      v38 = v37;
      objc_sync_enter(v38);
      GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointInfo_tags);
      objc_sync_exit(v38);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v39 = *(id *)(a1 + 64);
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("waypointInfo");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("waypoint_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  v43 = *(void **)(a1 + 16);
  if (v43)
  {
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __58__GEODrivingWalkingInstruction__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E1C00600;
      v47 = v46;
      v51 = v47;
      objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v50);
      v48 = v47;

    }
    else
    {
      v48 = v44;
    }
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODrivingWalkingInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1235;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1236;
      GEODrivingWalkingInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEODrivingWalkingInstructionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __58__GEODrivingWalkingInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v7;
  GEOFormattedString *v8;
  GEOFormattedString *v9;
  GEOFormattedString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOFormattedString *v19;
  GEOFormattedString *v20;
  GEOFormattedString *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  GEOFormattedString *v30;
  GEOFormattedString *v31;
  GEOFormattedString *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  GEOFormattedString *v41;
  GEOFormattedString *v42;
  GEOFormattedString *v43;
  void *v44;
  GEOPBTransitArtwork *v45;
  GEOPBTransitArtwork *v46;
  GEOPBTransitArtwork *v47;
  const __CFString *v48;
  void *v49;
  GEOFormattedString *v50;
  GEOFormattedString *v51;
  GEOFormattedString *v52;
  id v54;
  __int128 v55;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
      else
        v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
      v10 = v9;
      -[GEODrivingWalkingInstruction setTitle:](v6, v9);

    }
    if (a3)
      v11 = CFSTR("normalCommand");
    else
      v11 = CFSTR("normal_command");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v64 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = [GEOFormattedString alloc];
              if ((a3 & 1) != 0)
                v20 = -[GEOFormattedString initWithJSON:](v19, "initWithJSON:", v18);
              else
                v20 = -[GEOFormattedString initWithDictionary:](v19, "initWithDictionary:", v18);
              v21 = v20;
              -[GEODrivingWalkingInstruction addNormalCommand:](v6, v20);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        }
        while (v15);
      }

      v5 = v54;
    }

    if (a3)
      v22 = CFSTR("continueCommand");
    else
      v22 = CFSTR("continue_command");
    objc_msgSend(v5, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v60 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = [GEOFormattedString alloc];
              if ((a3 & 1) != 0)
                v31 = -[GEOFormattedString initWithJSON:](v30, "initWithJSON:", v29);
              else
                v31 = -[GEOFormattedString initWithDictionary:](v30, "initWithDictionary:", v29);
              v32 = v31;
              -[GEODrivingWalkingInstruction addContinueCommand:](v6, v31);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        }
        while (v26);
      }

      v5 = v54;
    }

    if (a3)
      v33 = CFSTR("mergeCommand");
    else
      v33 = CFSTR("merge_command");
    objc_msgSend(v5, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v35 = v34;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v56 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = [GEOFormattedString alloc];
              if ((a3 & 1) != 0)
                v42 = -[GEOFormattedString initWithJSON:](v41, "initWithJSON:", v40);
              else
                v42 = -[GEOFormattedString initWithDictionary:](v41, "initWithDictionary:", v40);
              v43 = v42;
              -[GEODrivingWalkingInstruction addMergeCommand:](v6, v42);

            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        }
        while (v37);
      }

      v5 = v54;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = [GEOPBTransitArtwork alloc];
      if ((a3 & 1) != 0)
        v46 = -[GEOPBTransitArtwork initWithJSON:](v45, "initWithJSON:", v44);
      else
        v46 = -[GEOPBTransitArtwork initWithDictionary:](v45, "initWithDictionary:", v44);
      v47 = v46;
      -[GEODrivingWalkingInstruction setArtwork:](v6, v46);

    }
    if (a3)
      v48 = CFSTR("waypointInfo");
    else
      v48 = CFSTR("waypoint_info");
    objc_msgSend(v5, "objectForKeyedSubscript:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v51 = -[GEOFormattedString initWithJSON:](v50, "initWithJSON:", v49);
      else
        v51 = -[GEOFormattedString initWithDictionary:](v50, "initWithDictionary:", v49);
      v52 = v51;
      -[GEODrivingWalkingInstruction setWaypointInfo:](v6, v51);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEODrivingWalkingInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODrivingWalkingInstructionIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteSubmessage();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_normalCommands;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_continueCommands;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_mergeCommands;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    if (self->_artwork)
      PBDataWriterWriteSubmessage();
    if (self->_waypointInfo)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
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
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEODrivingWalkingInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 0);
  v8 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = self->_normalCommands;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "copyWithZone:", a3);
        -[GEODrivingWalkingInstruction addNormalCommand:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = self->_continueCommands;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v35;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v18), "copyWithZone:", a3);
        -[GEODrivingWalkingInstruction addContinueCommand:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v16);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_mergeCommands;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v30);
        -[GEODrivingWalkingInstruction addMergeCommand:](v5, v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v21);
  }

  v25 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v25;

  v27 = -[GEOFormattedString copyWithZone:](self->_waypointInfo, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v27;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *title;
  NSMutableArray *normalCommands;
  NSMutableArray *continueCommands;
  NSMutableArray *mergeCommands;
  GEOPBTransitArtwork *artwork;
  GEOFormattedString *waypointInfo;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 1),
         -[GEODrivingWalkingInstruction readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[7]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((normalCommands = self->_normalCommands, !((unint64_t)normalCommands | v4[6]))
     || -[NSMutableArray isEqual:](normalCommands, "isEqual:"))
    && ((continueCommands = self->_continueCommands, !((unint64_t)continueCommands | v4[4]))
     || -[NSMutableArray isEqual:](continueCommands, "isEqual:"))
    && ((mergeCommands = self->_mergeCommands, !((unint64_t)mergeCommands | v4[5]))
     || -[NSMutableArray isEqual:](mergeCommands, "isEqual:"))
    && ((artwork = self->_artwork, !((unint64_t)artwork | v4[3]))
     || -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")))
  {
    waypointInfo = self->_waypointInfo;
    if ((unint64_t)waypointInfo | v4[8])
      v11 = -[GEOFormattedString isEqual:](waypointInfo, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 1);
  v3 = -[GEOFormattedString hash](self->_title, "hash");
  v4 = -[NSMutableArray hash](self->_normalCommands, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_continueCommands, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_mergeCommands, "hash");
  v7 = -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  return v6 ^ v7 ^ -[GEOFormattedString hash](self->_waypointInfo, "hash");
}

- (void)mergeFrom:(_QWORD *)a1
{
  void **v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[GEODrivingWalkingInstruction readAll:]((uint64_t)v3, 0);
  v4 = (void *)a1[7];
  v5 = v3[7];
  if (v4)
  {
    if (v5)
      objc_msgSend(v4, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEODrivingWalkingInstruction setTitle:]((uint64_t)a1, v3[7]);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v3[6];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        -[GEODrivingWalkingInstruction addNormalCommand:]((uint64_t)a1, *(void **)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v3[4];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        -[GEODrivingWalkingInstruction addContinueCommand:]((uint64_t)a1, *(void **)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v3[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        -[GEODrivingWalkingInstruction addMergeCommand:]((uint64_t)a1, *(void **)(*((_QWORD *)&v25 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v18);
  }

  v21 = (void *)a1[3];
  v22 = v3[3];
  if (v21)
  {
    if (v22)
      objc_msgSend(v21, "mergeFrom:", (_QWORD)v25);
  }
  else if (v22)
  {
    -[GEODrivingWalkingInstruction setArtwork:]((uint64_t)a1, v3[3]);
  }
  v23 = (void *)a1[8];
  v24 = v3[8];
  if (v23)
  {
    if (v24)
      objc_msgSend(v23, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEODrivingWalkingInstruction setWaypointInfo:]((uint64_t)a1, v3[8]);
  }

}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v1 + 84) |= 1u;
    *(_BYTE *)(v1 + 84) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEODrivingWalkingInstruction readAll:](v1, 0);
    objc_msgSend(*(id *)(v1 + 56), "clearUnknownFields:", 1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v3 = *(id *)(v1 + 48);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v5);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *(id *)(v1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12++), "clearUnknownFields:", 1);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v10);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = *(id *)(v1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "clearUnknownFields:", 1, (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(*(id *)(v1 + 24), "clearUnknownFields:", 1);
    return objc_msgSend(*(id *)(v1 + 64), "clearUnknownFields:", 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_normalCommands, 0);
  objc_storeStrong((id *)&self->_mergeCommands, 0);
  objc_storeStrong((id *)&self->_continueCommands, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
