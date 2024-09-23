@implementation GEOPDPlaceQuestionnaireResult

- (GEOPDPlaceQuestionnaireResult)init
{
  GEOPDPlaceQuestionnaireResult *v2;
  GEOPDPlaceQuestionnaireResult *v3;
  GEOPDPlaceQuestionnaireResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  v2 = -[GEOPDPlaceQuestionnaireResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceQuestionnaireResult)initWithData:(id)a3
{
  GEOPDPlaceQuestionnaireResult *v3;
  GEOPDPlaceQuestionnaireResult *v4;
  GEOPDPlaceQuestionnaireResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  v3 = -[GEOPDPlaceQuestionnaireResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readScorecardLayout
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScorecardLayout_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)scorecardLayout
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceQuestionnaireResult _readScorecardLayout]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setScorecardLayout:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x100u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_104);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)setMapsId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x40u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readHistoricalMapsIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHistoricalMapsIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)historicalMapsIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds]((uint64_t)a1);
    a1 = (id *)v1[2];
  }
  return a1;
}

- (void)addHistoricalMapsId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds](a1);
    -[GEOPDPlaceQuestionnaireResult _addNoFlagsHistoricalMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 68) |= 0x200u;
  }
}

- (void)_addNoFlagsHistoricalMapsId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (BOOL)collectPhotos
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    return (v2 & 4) == 0 || *(_BYTE *)(v1 + 65) != 0;
  }
  return result;
}

- (void)_readPhotoConstraints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoConstraints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)photoConstraints
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceQuestionnaireResult _readPhotoConstraints]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setPhotoConstraints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 68) |= 0x80u;
  *(_WORD *)(a1 + 68) |= 0x200u;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDPlaceQuestionnaireResult;
  -[GEOPDPlaceQuestionnaireResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceQuestionnaireResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnaireResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPlaceQuestionnaireResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 68) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  -[GEOPDPlaceQuestionnaireResult scorecardLayout]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("scorecardLayout");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("scorecard_layout");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDPlaceQuestionnaireResult _readMapsId](a1);
  v11 = *(id *)(a1 + 24);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if ((*(_WORD *)(a1 + 68) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("isOverride");
    else
      v16 = CFSTR("is_override");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = *(id *)(a1 + 16);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("historicalMapsId");
    else
      v25 = CFSTR("historical_maps_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  v26 = *(_WORD *)(a1 + 68);
  if ((v26 & 0x10) == 0)
  {
    if ((v26 & 2) == 0)
      goto LABEL_53;
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("alwaysPositionInitialRatingCtaTowardsTop");
    else
      v36 = CFSTR("always_position_initial_rating_cta_towards_top");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

    if ((*(_WORD *)(a1 + 68) & 4) == 0)
      goto LABEL_58;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 67));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("suppressOnExistingRichData");
  else
    v34 = CFSTR("suppress_on_existing_rich_data");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  v26 = *(_WORD *)(a1 + 68);
  if ((v26 & 2) != 0)
    goto LABEL_65;
LABEL_53:
  if ((v26 & 4) != 0)
  {
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("collectPhotos");
    else
      v28 = CFSTR("collect_photos");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
LABEL_58:
  -[GEOPDPlaceQuestionnaireResult photoConstraints]((id *)a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("photoConstraints");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("photo_constraints");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceQuestionnaireResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_137_2;
      else
        v6 = (int *)&readAll__nonRecursiveTag_138_2;
      GEOPDPlaceQuestionnaireResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPlaceQuestionnaireResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  GEOPDScorecardLayout *v11;
  GEOPDScorecardLayout *v12;
  id v13;
  GEOPDScorecardLayout *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  GEOPDRatingCategory *v25;
  GEOPDRatingCategory *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  GEOLocalizedString *v39;
  GEOLocalizedString *v40;
  GEOLocalizedString *v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  GEOPDMapsIdentifier *v45;
  GEOPDMapsIdentifier *v46;
  GEOPDMapsIdentifier *v47;
  const __CFString *v48;
  void *v49;
  char v50;
  const __CFString *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  GEOPDMapsIdentifier *v60;
  GEOPDMapsIdentifier *v61;
  GEOPDMapsIdentifier *v62;
  const __CFString *v63;
  void *v64;
  char v65;
  const __CFString *v66;
  void *v67;
  char v68;
  const __CFString *v69;
  void *v70;
  char v71;
  const __CFString *v72;
  void *v73;
  GEOPDPhotoConstraints *v74;
  GEOPDPhotoConstraints *v75;
  id v76;
  uint64_t v77;
  const __CFString *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t k;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  int v89;
  const __CFString *v90;
  void *v91;
  uint64_t v92;
  const __CFString *v93;
  void *v94;
  uint64_t v95;
  const __CFString *v96;
  void *v97;
  int v98;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  uint64_t v108;
  uint64_t v109;
  id obj;
  void *v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1 || (v112 = objc_msgSend(a1, "init")) == 0)
  {
    v112 = 0;
    goto LABEL_166;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v8 = 50;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v8 = 60;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_27:
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 1u;
    *(_DWORD *)(v112 + 60) = v8;
  }

  if (a3)
    v9 = CFSTR("scorecardLayout");
  else
    v9 = CFSTR("scorecard_layout");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDScorecardLayout alloc];
    if (v11)
    {
      v12 = v11;
      v13 = v10;
      v14 = -[GEOPDScorecardLayout init](v12, "init");
      if (v14)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("version"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v105 = (uint64_t)v14;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = (void *)objc_msgSend(v15, "copy");
          -[GEOPDScorecardLayout setVersion:](v105, v16);

          v14 = (GEOPDScorecardLayout *)v105;
        }

        if (a3)
          v17 = CFSTR("ratingCategory");
        else
          v17 = CFSTR("rating_category");
        objc_msgSend(v13, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v101 = v13;
          v102 = v10;
          v103 = v5;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v100 = v18;
          obj = v18;
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, &v126, 16);
          if (v19)
          {
            v20 = v19;
            v21 = CFSTR("localized_name");
            v22 = *(_QWORD *)v118;
            if (a3)
              v21 = CFSTR("localizedName");
            v107 = v21;
            v108 = *(_QWORD *)v118;
            do
            {
              v23 = 0;
              v109 = v20;
              do
              {
                if (*(_QWORD *)v118 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v23);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v25 = [GEOPDRatingCategory alloc];
                  if (v25)
                  {
                    v26 = v25;
                    v27 = v24;
                    v28 = -[GEOPDRatingCategory init](v26, "init");
                    if (v28)
                    {
                      v111 = v27;
                      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("key"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v30 = (void *)objc_msgSend(v29, "copy");
                        v31 = v30;
                        *(_BYTE *)(v28 + 44) |= 1u;
                        *(_BYTE *)(v28 + 44) |= 4u;
                        objc_storeStrong((id *)(v28 + 16), v30);

                        v22 = v108;
                      }

                      v27 = v111;
                      objc_msgSend(v111, "objectForKeyedSubscript:", v107);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v123 = 0u;
                        v124 = 0u;
                        v121 = 0u;
                        v122 = 0u;
                        v106 = v32;
                        v33 = v32;
                        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
                        if (v34)
                        {
                          v35 = v34;
                          v36 = *(_QWORD *)v122;
                          do
                          {
                            for (i = 0; i != v35; ++i)
                            {
                              if (*(_QWORD *)v122 != v36)
                                objc_enumerationMutation(v33);
                              v38 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v39 = [GEOLocalizedString alloc];
                                if ((a3 & 1) != 0)
                                  v40 = -[GEOLocalizedString initWithJSON:](v39, "initWithJSON:", v38);
                                else
                                  v40 = -[GEOLocalizedString initWithDictionary:](v39, "initWithDictionary:", v38);
                                v41 = v40;
                                -[GEOPDRatingCategory addLocalizedName:](v28, v40);

                              }
                            }
                            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
                          }
                          while (v35);
                        }

                        v14 = (GEOPDScorecardLayout *)v105;
                        v32 = v106;
                        v22 = v108;
                        v27 = v111;
                      }

                    }
                  }
                  else
                  {
                    v28 = 0;
                  }
                  -[GEOPDScorecardLayout addRatingCategory:]((uint64_t)v14, (void *)v28);

                  v20 = v109;
                }
                ++v23;
              }
              while (v23 != v20);
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, &v126, 16);
              v20 = v42;
            }
            while (v42);
          }

          v10 = v102;
          v5 = v103;
          v18 = v100;
          v13 = v101;
        }

      }
    }
    else
    {
      v14 = 0;
    }
    -[GEOPDPlaceQuestionnaireResult setScorecardLayout:](v112, v14);

  }
  if (a3)
    v43 = CFSTR("mapsId");
  else
    v43 = CFSTR("maps_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43, v100, v101, v102);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v46 = -[GEOPDMapsIdentifier initWithJSON:](v45, "initWithJSON:", v44);
    else
      v46 = -[GEOPDMapsIdentifier initWithDictionary:](v45, "initWithDictionary:", v44);
    v47 = v46;
    -[GEOPDPlaceQuestionnaireResult setMapsId:](v112, v46);

  }
  if (a3)
    v48 = CFSTR("isOverride");
  else
    v48 = CFSTR("is_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = objc_msgSend(v49, "BOOLValue");
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 8u;
    *(_BYTE *)(v112 + 66) = v50;
  }

  if (a3)
    v51 = CFSTR("historicalMapsId");
  else
    v51 = CFSTR("historical_maps_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = v5;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v54 = v52;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v114;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v114 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = [GEOPDMapsIdentifier alloc];
            if ((a3 & 1) != 0)
              v61 = -[GEOPDMapsIdentifier initWithJSON:](v60, "initWithJSON:", v59);
            else
              v61 = -[GEOPDMapsIdentifier initWithDictionary:](v60, "initWithDictionary:", v59);
            v62 = v61;
            -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](v112, v61);

          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
      }
      while (v56);
    }

    v5 = v53;
  }

  if (a3)
    v63 = CFSTR("suppressOnExistingRichData");
  else
    v63 = CFSTR("suppress_on_existing_rich_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = objc_msgSend(v64, "BOOLValue");
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 0x10u;
    *(_BYTE *)(v112 + 67) = v65;
  }

  if (a3)
    v66 = CFSTR("alwaysPositionInitialRatingCtaTowardsTop");
  else
    v66 = CFSTR("always_position_initial_rating_cta_towards_top");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = objc_msgSend(v67, "BOOLValue");
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 2u;
    *(_BYTE *)(v112 + 64) = v68;
  }

  if (a3)
    v69 = CFSTR("collectPhotos");
  else
    v69 = CFSTR("collect_photos");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = objc_msgSend(v70, "BOOLValue");
    *(_WORD *)(v112 + 68) |= 0x200u;
    *(_WORD *)(v112 + 68) |= 4u;
    *(_BYTE *)(v112 + 65) = v71;
  }

  if (a3)
    v72 = CFSTR("photoConstraints");
  else
    v72 = CFSTR("photo_constraints");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = [GEOPDPhotoConstraints alloc];
    if (v74)
    {
      v75 = v74;
      v76 = v73;
      v77 = -[GEOPDPhotoConstraints init](v75, "init");
      if (v77)
      {
        if (a3)
          v78 = CFSTR("mediaTypes");
        else
          v78 = CFSTR("media_types");
        objc_msgSend(v76, "objectForKeyedSubscript:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v104 = v5;
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v80 = v79;
          v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
          if (v81)
          {
            v82 = v81;
            v83 = *(_QWORD *)v127;
            do
            {
              for (k = 0; k != v82; ++k)
              {
                if (*(_QWORD *)v127 != v83)
                  objc_enumerationMutation(v80);
                v85 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v86 = (void *)objc_msgSend(v85, "copy");
                  -[GEOPDPhotoConstraints addMediaTypes:](v77, v86);

                }
              }
              v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
            }
            while (v82);
          }

          v5 = v104;
        }

        if (a3)
          v87 = CFSTR("maxNumberOfPhotos");
        else
          v87 = CFSTR("max_number_of_photos");
        objc_msgSend(v76, "objectForKeyedSubscript:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = objc_msgSend(v88, "unsignedIntValue");
          *(_BYTE *)(v77 + 40) |= 8u;
          *(_DWORD *)(v77 + 36) = v89;
        }

        if (a3)
          v90 = CFSTR("maxPixels");
        else
          v90 = CFSTR("max_pixels");
        objc_msgSend(v76, "objectForKeyedSubscript:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v92 = objc_msgSend(v91, "unsignedLongLongValue");
          *(_BYTE *)(v77 + 40) |= 1u;
          *(_QWORD *)(v77 + 8) = v92;
        }

        if (a3)
          v93 = CFSTR("minPixels");
        else
          v93 = CFSTR("min_pixels");
        objc_msgSend(v76, "objectForKeyedSubscript:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v95 = objc_msgSend(v94, "unsignedLongLongValue");
          *(_BYTE *)(v77 + 40) |= 2u;
          *(_QWORD *)(v77 + 24) = v95;
        }

        if (a3)
          v96 = CFSTR("maxAspectRatio");
        else
          v96 = CFSTR("max_aspect_ratio");
        objc_msgSend(v76, "objectForKeyedSubscript:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v97, "floatValue");
          *(_BYTE *)(v77 + 40) |= 4u;
          *(_DWORD *)(v77 + 32) = v98;
        }

      }
    }
    else
    {
      v77 = 0;
    }
    -[GEOPDPlaceQuestionnaireResult setPhotoConstraints:](v112, (void *)v77);

  }
LABEL_166:

  return v112;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnaireResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 flags;
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
  if (self->_reader && (_GEOPDPlaceQuestionnaireResultIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_scorecardLayout)
      PBDataWriterWriteSubmessage();
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_historicalMapsIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_photoConstraints)
      PBDataWriterWriteSubmessage();
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDPlaceQuestionnaireResult _readHistoricalMapsIds](result);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(v3 + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (_QWORD)v9) & 1) != 0)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOPDPlaceQuestionnaireResult _readMapsId](v3);
    return objc_msgSend(*(id *)(v3 + 24), "hasGreenTeaWithValue:", a2);
  }
  return result;
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int16 flags;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_status;
      *(_WORD *)(v5 + 68) |= 1u;
    }
    v9 = -[GEOPDScorecardLayout copyWithZone:](self->_scorecardLayout, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v11 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v11;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_BYTE *)(v5 + 66) = self->_isOverride;
      *(_WORD *)(v5 + 68) |= 8u;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = self->_historicalMapsIds;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
          -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](v5, v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_BYTE *)(v5 + 67) = self->_suppressOnExistingRichData;
      *(_WORD *)(v5 + 68) |= 0x10u;
      flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_18:
        if ((flags & 4) == 0)
        {
LABEL_20:
          v19 = -[GEOPDPhotoConstraints copyWithZone:](self->_photoConstraints, "copyWithZone:", a3, (_QWORD)v21);
          v8 = *(id *)(v5 + 32);
          *(_QWORD *)(v5 + 32) = v19;
          goto LABEL_21;
        }
LABEL_19:
        *(_BYTE *)(v5 + 65) = self->_collectPhotos;
        *(_WORD *)(v5 + 68) |= 4u;
        goto LABEL_20;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_18;
    }
    *(_BYTE *)(v5 + 64) = self->_alwaysPositionInitialRatingCtaTowardsTop;
    *(_WORD *)(v5 + 68) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDPlaceQuestionnaireResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_21:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDScorecardLayout *scorecardLayout;
  GEOPDMapsIdentifier *mapsId;
  __int16 flags;
  __int16 v9;
  NSMutableArray *historicalMapsIds;
  char v11;
  GEOPDPhotoConstraints *photoConstraints;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 34);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_status != *((_DWORD *)v4 + 15))
      goto LABEL_42;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_42;
  }
  scorecardLayout = self->_scorecardLayout;
  if ((unint64_t)scorecardLayout | *((_QWORD *)v4 + 5)
    && !-[GEOPDScorecardLayout isEqual:](scorecardLayout, "isEqual:"))
  {
    goto LABEL_42;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_42;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 34);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_42;
    if (self->_isOverride)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_42;
  }
  historicalMapsIds = self->_historicalMapsIds;
  if ((unint64_t)historicalMapsIds | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](historicalMapsIds, "isEqual:"))
      goto LABEL_42;
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 34);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0)
      goto LABEL_42;
    if (self->_suppressOnExistingRichData)
    {
      if (!*((_BYTE *)v4 + 67))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 67))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0)
      goto LABEL_42;
    if (self->_alwaysPositionInitialRatingCtaTowardsTop)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_42;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((flags & 4) == 0)
  {
    if ((v9 & 4) == 0)
      goto LABEL_48;
LABEL_42:
    v11 = 0;
    goto LABEL_43;
  }
  if ((v9 & 4) == 0)
    goto LABEL_42;
  if (!self->_collectPhotos)
  {
    if (!*((_BYTE *)v4 + 65))
      goto LABEL_48;
    goto LABEL_42;
  }
  if (!*((_BYTE *)v4 + 65))
    goto LABEL_42;
LABEL_48:
  photoConstraints = self->_photoConstraints;
  if ((unint64_t)photoConstraints | *((_QWORD *)v4 + 4))
    v11 = -[GEOPDPhotoConstraints isEqual:](photoConstraints, "isEqual:");
  else
    v11 = 1;
LABEL_43:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 flags;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  v4 = -[GEOPDScorecardLayout hash](self->_scorecardLayout, "hash");
  v5 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v6 = 2654435761 * self->_isOverride;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_historicalMapsIds, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    v9 = 0;
    if ((flags & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v10 = 0;
    if ((flags & 4) != 0)
      goto LABEL_10;
LABEL_13:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ -[GEOPDPhotoConstraints hash](self->_photoConstraints, "hash");
  }
  v9 = 2654435761 * self->_suppressOnExistingRichData;
  if ((flags & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v10 = 2654435761 * self->_alwaysPositionInitialRatingCtaTowardsTop;
  if ((flags & 4) == 0)
    goto LABEL_13;
LABEL_10:
  v11 = 2654435761 * self->_collectPhotos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ -[GEOPDPhotoConstraints hash](self->_photoConstraints, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int16 v21;
  uint64_t v22;
  void *v23;
  id *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_56;
  -[GEOPDPlaceQuestionnaireResult readAll:]((uint64_t)v3, 0);
  if ((*((_WORD *)v4 + 34) & 1) != 0)
  {
    *(_DWORD *)(a1 + 60) = *((_DWORD *)v4 + 15);
    *(_WORD *)(a1 + 68) |= 1u;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)*((_QWORD *)v4 + 5);
  if (v5)
  {
    if (v6)
    {
      v7 = v6;
      -[GEOPDScorecardLayout readAll:]((uint64_t)v7, 0);
      v8 = (void *)*((_QWORD *)v7 + 3);
      if (v8)
        -[GEOPDScorecardLayout setVersion:](v5, v8);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v9 = *((id *)v7 + 2);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(v9);
            -[GEOPDScorecardLayout addRatingCategory:](v5, *(void **)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v11);
      }

    }
  }
  else if (v6)
  {
    -[GEOPDPlaceQuestionnaireResult setScorecardLayout:](a1, v6);
  }
  v14 = *(void **)(a1 + 24);
  v15 = *((_QWORD *)v4 + 3);
  if (v14)
  {
    if (v15)
      objc_msgSend(v14, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOPDPlaceQuestionnaireResult setMapsId:](a1, *((void **)v4 + 3));
  }
  if ((*((_WORD *)v4 + 34) & 8) != 0)
  {
    *(_BYTE *)(a1 + 66) = *((_BYTE *)v4 + 66);
    *(_WORD *)(a1 + 68) |= 8u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = *((id *)v4 + 2);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        -[GEOPDPlaceQuestionnaireResult addHistoricalMapsId:](a1, *(void **)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v18);
  }

  v21 = *((_WORD *)v4 + 34);
  if ((v21 & 0x10) != 0)
  {
    *(_BYTE *)(a1 + 67) = *((_BYTE *)v4 + 67);
    *(_WORD *)(a1 + 68) |= 0x10u;
    v21 = *((_WORD *)v4 + 34);
    if ((v21 & 2) == 0)
    {
LABEL_34:
      if ((v21 & 4) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_34;
  }
  *(_BYTE *)(a1 + 64) = *((_BYTE *)v4 + 64);
  *(_WORD *)(a1 + 68) |= 2u;
  if ((*((_WORD *)v4 + 34) & 4) != 0)
  {
LABEL_35:
    *(_BYTE *)(a1 + 65) = *((_BYTE *)v4 + 65);
    *(_WORD *)(a1 + 68) |= 4u;
  }
LABEL_36:
  v22 = *(_QWORD *)(a1 + 32);
  v23 = (void *)*((_QWORD *)v4 + 4);
  if (v22)
  {
    if (v23)
    {
      v24 = v23;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = v24[2];
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, (_QWORD)v31);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v36;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(v25);
            -[GEOPDPhotoConstraints addMediaTypes:](v22, *(void **)(*((_QWORD *)&v35 + 1) + 8 * k));
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v27);
      }

      v30 = *((_BYTE *)v24 + 40);
      if ((v30 & 8) != 0)
      {
        *(_DWORD *)(v22 + 36) = *((_DWORD *)v24 + 9);
        *(_BYTE *)(v22 + 40) |= 8u;
        v30 = *((_BYTE *)v24 + 40);
        if ((v30 & 1) == 0)
        {
LABEL_47:
          if ((v30 & 2) == 0)
            goto LABEL_48;
          goto LABEL_59;
        }
      }
      else if (((_BYTE)v24[5] & 1) == 0)
      {
        goto LABEL_47;
      }
      *(_QWORD *)(v22 + 8) = v24[1];
      *(_BYTE *)(v22 + 40) |= 1u;
      v30 = *((_BYTE *)v24 + 40);
      if ((v30 & 2) == 0)
      {
LABEL_48:
        if ((v30 & 4) == 0)
        {
LABEL_50:

          goto LABEL_56;
        }
LABEL_49:
        *(_DWORD *)(v22 + 32) = *((_DWORD *)v24 + 8);
        *(_BYTE *)(v22 + 40) |= 4u;
        goto LABEL_50;
      }
LABEL_59:
      *(_QWORD *)(v22 + 24) = v24[3];
      *(_BYTE *)(v22 + 40) |= 2u;
      if (((_BYTE)v24[5] & 4) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if (v23)
  {
    -[GEOPDPlaceQuestionnaireResult setPhotoConstraints:](a1, v23);
  }
LABEL_56:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecardLayout, 0);
  objc_storeStrong((id *)&self->_photoConstraints, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_historicalMapsIds, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
