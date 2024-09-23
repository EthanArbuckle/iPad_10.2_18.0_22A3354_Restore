@implementation GEOMapItemTransitInfo

uint64_t __135___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_ignoreDirectionFilter_direction_validForDateFromBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "line");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "muid");
  if (v6 != (void *)objc_msgSend(*(id *)(a1 + 32), "muid"))
    goto LABEL_27;
  v7 = *(_BYTE *)(a1 + 72) == 0;
  if (*(_BYTE *)(a1 + 72))
    goto LABEL_3;
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
  {
    objc_msgSend(v3, "direction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      goto LABEL_26;
    if (*(_BYTE *)(a1 + 72) || *(_QWORD *)(a1 + 40))
    {
LABEL_3:
      v8 = 0;
      v9 = *(_QWORD *)(a1 + 64);
      if (!v9)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(v3, "direction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

    if (!v17)
    {
LABEL_27:

LABEL_28:
      v16 = 0;
      goto LABEL_29;
    }
LABEL_26:

    goto LABEL_27;
  }
  v9 = *(_QWORD *)(a1 + 64);
  if (!v9)
  {
    if (v17)

    goto LABEL_8;
  }
  v7 = v17 != 0;
LABEL_4:
  (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isValidForDate:inTimeZone:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48)) ^ 1;

LABEL_5:
  if (v7)

  if ((v8 & 1) != 0)
    goto LABEL_28;
LABEL_8:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = *(id *)(a1 + 56);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        if ((GEOTransitIncidentEntityAffectsSequence(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v15), v3) & 1) != 0)
        {
          v16 = 0;
          goto LABEL_23;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_23:

LABEL_29:
  return v16;
}

uint64_t __113___GEOMapItemTransitInfo__departureSequencesForSystem_excludingIncidentEntities_container_validForDateFromBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 56);
  if (!v5)
  {
    v6 = (id *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_9;
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id))(v5 + 16))(*(_QWORD *)(a1 + 56), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isValidForDate:inTimeZone:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)) & 1) == 0)
  {

    goto LABEL_19;
  }
  v6 = (id *)(a1 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
LABEL_6:
    objc_msgSend(v4, "line");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "system");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "muid");
    v10 = objc_msgSend(*v6, "muid");

    if (v5)
    if (v9 == v10)
      goto LABEL_9;
LABEL_19:
    v16 = 0;
    goto LABEL_22;
  }

LABEL_9:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        if ((GEOTransitIncidentEntityAffectsSequence(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v15), v4) & 1) != 0)
        {
          v16 = 0;
          goto LABEL_21;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_21:

LABEL_22:
  return v16;
}

void __111___GEOMapItemTransitInfo_departureSequenceContainersForSystem_excludingIncidentEntities_validForDateFromBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v4);
    if (v5[4])
    {
      -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v5);
      if (v5[4])
      {
        v27 = 0;
        v6 = 0;
        do
        {
          v7 = -[GEOPDDepartureSequenceContainer departureSequenceIndexAtIndex:]((uint64_t)v5, v6);
          if (v7 < objc_msgSend(*(id *)(a1 + 32), "count"))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = *(_QWORD *)(a1 + 72);
            if (v9)
            {
              (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v8, "isValidForDate:inTimeZone:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));

              if (v11)
              {
                v30 = 0u;
                v31 = 0u;
                v28 = 0u;
                v29 = 0u;
                v12 = *(id *)(a1 + 48);
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
                if (v13)
                {
                  v14 = v13;
                  v15 = *(_QWORD *)v29;
                  while (2)
                  {
                    for (i = 0; i != v14; ++i)
                    {
                      if (*(_QWORD *)v29 != v15)
                        objc_enumerationMutation(v12);
                      if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v8))
                      {

                        v27 = 0;
                        goto LABEL_18;
                      }
                    }
                    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
                    if (v14)
                      continue;
                    break;
                  }
                }
LABEL_18:

                objc_msgSend(v8, "line");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "system");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "muid");
                v20 = objc_msgSend(*(id *)(a1 + 56), "muid");

                if (v19 == v20)
                {
                  v21 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v8, "containerDisplayName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@_%@"), v22, v23);
                  v24 = objc_claimAutoreleasedReturnValue();

                  v27 = (void *)v24;
                }
              }
            }

          }
          ++v6;
          -[GEOPDDepartureSequenceContainer _readDepartureSequenceIndexs]((uint64_t)v5);
        }
        while (v6 < v5[4]);
        v25 = v27;
        if (v27)
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v27);
      }
      else
      {
        v25 = 0;
      }

    }
  }

}

void __106___GEOMapItemTransitInfo_serviceResumesResultForLine_excludingIncidentEntities_afterDate_usingContainers___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "line");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "muid");
  v7 = objc_msgSend(*(id *)(a1 + 32), "muid");

  if (v6 != v7)
    goto LABEL_27;
  objc_msgSend(v4, "firstDepartureOnOrAfterDate:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = *(id *)(a1 + 48);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        if (GEOTransitIncidentEntityAffectsSequence(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v4))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_26;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "departureDate", (_QWORD)v25);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstDepartureFrequencyOnOrAfterDate:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "firstTimeInFrequency");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v9)
    {
      objc_msgSend(v9, "earlierDate:", v16);
      v18 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v18;
    }
    else
    {
      v9 = (id)v16;
    }
  }
  objc_msgSend(v4, "firstOpenOperatingDateOnOrAfterDate:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
LABEL_18:
    if (!v9)
      goto LABEL_25;
    goto LABEL_21;
  }
  if (v9)
  {
    objc_msgSend(v9, "earlierDate:", v19);
    v21 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v21;
    goto LABEL_18;
  }
  v9 = v19;
LABEL_21:
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v23 = *(void **)(v22 + 40);
  if (v23)
  {
    objc_msgSend(v23, "earlierDate:", v9);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24 != v9)
      goto LABEL_25;
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  objc_storeStrong((id *)(v22 + 40), v9);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
LABEL_25:

LABEL_26:
LABEL_27:

}

@end
