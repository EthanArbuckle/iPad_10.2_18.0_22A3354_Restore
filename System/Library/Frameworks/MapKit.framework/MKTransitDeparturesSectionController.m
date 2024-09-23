@implementation MKTransitDeparturesSectionController

- (MKTransitDeparturesSectionController)init
{
  MKTransitDeparturesSectionController *result;

  result = (MKTransitDeparturesSectionController *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4
{
  return -[MKTransitDeparturesSectionController initWithMapItem:system:departureSequenceContainer:](self, "initWithMapItem:system:departureSequenceContainer:", a3, a4, 0);
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 direction:(id)a5
{
  id v8;
  MKTransitDeparturesSectionController *v9;
  uint64_t v10;
  NSString *direction;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitDeparturesSectionController;
  v9 = -[MKTransitSectionController initWithMapItem:system:](&v13, sel_initWithMapItem_system_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    direction = v9->_direction;
    v9->_direction = (NSString *)v10;

    -[MKTransitDeparturesSectionController _sharedSetup](v9, "_sharedSetup");
  }

  return v9;
}

- (MKTransitDeparturesSectionController)initWithMapItem:(id)a3 system:(id)a4 departureSequenceContainer:(id)a5
{
  id v9;
  MKTransitDeparturesSectionController *v10;
  MKTransitDeparturesSectionController *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MKTransitDeparturesSectionController;
  v10 = -[MKTransitSectionController initWithMapItem:system:](&v13, sel_initWithMapItem_system_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_departureSequenceContainer, a5);
    -[MKTransitDeparturesSectionController _sharedSetup](v11, "_sharedSetup");
  }

  return v11;
}

- (void)_sharedSetup
{
  self->_needsFindDeparturesAreVehicleSpecific = 1;
  self->_needsFindRowForServiceGap = 1;
}

- (BOOL)departuresAreVehicleSpecific
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_needsFindDeparturesAreVehicleSpecific)
  {
    self->_needsFindDeparturesAreVehicleSpecific = 0;
    -[MKMapItem _transitInfo](self->super._mapItem, "_transitInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitSectionController system](self, "system");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allSequencesForSystem:container:", v4, self->_departureSequenceContainer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    self->_departuresAreVehicleSpecific = 1;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "line", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "departuresAreVehicleSpecific");

          if ((v12 & 1) == 0)
          {
            self->_departuresAreVehicleSpecific = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return self->_departuresAreVehicleSpecific;
}

- (id)sequences
{
  NSArray *sequences;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[5];

  sequences = self->_sequences;
  if (!sequences)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__MKTransitDeparturesSectionController_sequences__block_invoke;
    v11[3] = &unk_1E20DA950;
    v11[4] = self;
    v4 = (void *)MEMORY[0x18D778DB8](v11, a2);
    -[MKMapItem _transitInfo](self->super._mapItem, "_transitInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitSectionController system](self, "system");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitSectionController incidentEntitiesToExclude](self, "incidentEntitiesToExclude");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "departureSequencesForSystem:excludingIncidentEntities:container:validForDateFromBlock:", v6, v7, self->_departureSequenceContainer, v4);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sequences;
    self->_sequences = v8;

    sequences = self->_sequences;
  }
  return sequences;
}

id __49__MKTransitDeparturesSectionController_sequences__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && !objc_msgSend(*(id *)(a1 + 32), "departuresAreVehicleSpecific"))
  {
    objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "departureCutoffDate");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (id)sequenceForRow:(int64_t)a3 outIsNewLine:(BOOL *)a4 outNextLineIsSame:(BOOL *)a5
{
  void *v9;
  int64_t v10;
  void *v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  char v26;
  id v27;
  BOOL *v29;
  BOOL *v30;
  id v31;
  char v32;

  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitDeparturesSectionController _buildRows](self, "_buildRows");
  -[MKTransitDeparturesSectionController sequences](self, "sequences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v12 = 0;
    v16 = 0;
    v25 = 0;
    v26 = 1;
    if (a4)
      goto LABEL_27;
    goto LABEL_28;
  }
  v29 = a4;
  v30 = a5;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 1;
  v32 = 1;
  while (1)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v13 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_sequencesToInclude, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      break;
LABEL_20:

    if (v13++ >= objc_msgSend(v9, "count"))
    {
      v25 = 0;
      v16 = v11;
      goto LABEL_26;
    }
  }
  objc_msgSend(v14, "line");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 1;
  if (v11)
  {
    v17 = objc_msgSend(v11, "muid");
    if (v17 == objc_msgSend(v16, "muid"))
      v18 = 0;
  }
  v32 = v18;
  if (v10 != a3)
  {
    ++v10;

    v11 = v16;
    goto LABEL_20;
  }
  v19 = v14;
  if (v13 == objc_msgSend(v9, "count"))
  {
    v12 = 0;
  }
  else
  {
    -[MKTransitDeparturesSectionController sequenceForRow:outIsNewLine:outNextLineIsSame:](self, "sequenceForRow:outIsNewLine:outNextLineIsSame:", a3 + 1, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "line");
      v31 = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "muid");
      v12 = v23 == objc_msgSend(v16, "muid");

      v19 = v31;
    }
    else
    {
      v12 = 0;
    }

  }
  if (!v19)
  {
    v11 = v16;
    v10 = a3;
    goto LABEL_20;
  }
  v25 = v19;

LABEL_26:
  a4 = v29;
  a5 = v30;
  v26 = v32;
  if (v29)
LABEL_27:
    *a4 = v26 & 1;
LABEL_28:
  if (a5)
    *a5 = v12;
  v27 = v25;

  return v27;
}

- (BOOL)showOperatingHours
{
  void *v2;
  void *v3;

  -[MKTransitDeparturesSectionController sequences](self, "sequences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "departureTimeDisplayStyle") == 3;
  return (char)v2;
}

- (id)_pagingFilter
{
  MKTransitSectionPagingFilter *pagingFilter;
  MKTransitSectionPagingFilter *v4;
  MKTransitSectionPagingFilter *v5;

  pagingFilter = self->super.__pagingFilter;
  if (!pagingFilter)
  {
    +[MKTransitSectionPagingFilter defaultFilterForDepartures](MKTransitSectionPagingFilter, "defaultFilterForDepartures");
    v4 = (MKTransitSectionPagingFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->super.__pagingFilter;
    self->super.__pagingFilter = v4;

    pagingFilter = self->super.__pagingFilter;
  }
  return pagingFilter;
}

- (void)_setNeedsBuildRows
{
  NSArray *sequences;
  NSDictionary *serviceGapStrings;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesSectionController;
  -[MKTransitSectionController _setNeedsBuildRows](&v5, sel__setNeedsBuildRows);
  sequences = self->_sequences;
  self->_sequences = 0;

  serviceGapStrings = self->_serviceGapStrings;
  self->_serviceGapStrings = 0;

  self->_needsFindRowForServiceGap = 1;
}

- (void)_buildRows
{
  NSMapTable *v3;
  NSMapTable *sequencesToInclude;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  NSSet *v23;
  NSSet *linesToShow;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSDictionary *v34;
  NSDictionary *serviceGapStrings;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[5];
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  objc_super v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
  {
    v86.receiver = self;
    v86.super_class = (Class)MKTransitDeparturesSectionController;
    -[MKTransitSectionController _buildRows](&v86, sel__buildRows);
    -[MKTransitDeparturesSectionController sequences](self, "sequences");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    sequencesToInclude = self->_sequencesToInclude;
    self->_sequencesToInclude = v3;

    -[MKTransitDeparturesSectionController _pagingFilter](self, "_pagingFilter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__14;
    v84 = __Block_byref_object_dispose__14;
    v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v38, "count"));
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x3032000000;
    v74[3] = __Block_byref_object_copy__14;
    v74[4] = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__14;
    v72 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v73 = (id)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__14;
    v66 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __50__MKTransitDeparturesSectionController__buildRows__block_invoke;
    v61[3] = &unk_1E20DA950;
    v61[4] = self;
    v36 = (void *)MEMORY[0x18D778DB8](v61);
    v5 = objc_msgSend(v39, "limitNumLines");
    v6 = objc_msgSend(v39, "numLinesFallbackValue");
    if (v5)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v7 = v38;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v89, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v58 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            v12 = objc_msgSend((id)v81[5], "count");
            if (v12 == objc_msgSend(v39, "numLinesFallbackThreshold"))
            {
              LOBYTE(v5) = 1;
              goto LABEL_13;
            }
            v13 = (void *)v81[5];
            objc_msgSend(v11, "line");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v14);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v89, 16);
          if (v8)
            continue;
          break;
        }
      }
      LOBYTE(v5) = 0;
LABEL_13:

      objc_msgSend((id)v81[5], "removeAllObjects");
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __50__MKTransitDeparturesSectionController__buildRows__block_invoke_2;
    v48[3] = &unk_1E20DA978;
    v37 = v36;
    v48[4] = self;
    v49 = v37;
    v50 = v74;
    v51 = &v68;
    v56 = v5;
    v52 = &v62;
    v53 = &v80;
    v54 = &v76;
    v55 = v6;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v48);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[MKTransitDeparturesSectionController sequences](self, "sequences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v88, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          -[NSMapTable objectForKey:](self->_sequencesToInclude, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v20, "line");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v88, 16);
      }
      while (v17);
    }

    v23 = (NSSet *)objc_msgSend(v15, "copy");
    linesToShow = self->super._linesToShow;
    self->super._linesToShow = v23;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v69[5], "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend((id)v69[5], "keyEnumerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v87, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
          objc_msgSend((id)v69[5], "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v63[5], "objectForKey:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v31, "copy");
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, v32);

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v87, 16);
      }
      while (v27);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v25);
    v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    serviceGapStrings = self->_serviceGapStrings;
    self->_serviceGapStrings = v34;

    self->super._numberOfRows = v77[3];
    _Block_object_dispose(&v62, 8);

    _Block_object_dispose(&v68, 8);
    _Block_object_dispose(v74, 8);

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v80, 8);

  }
}

id __50__MKTransitDeparturesSectionController__buildRows__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && !objc_msgSend(*(id *)(a1 + 32), "departuresAreVehicleSpecific"))
  {
    objc_msgSend(*(id *)(a1 + 32), "expiredHighFrequencyCutoffDate");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "departureCutoffDate");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

void __50__MKTransitDeparturesSectionController__buildRows__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _MKSortedDepartureCollection *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "departuresValidForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "line");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v24 = 0;
  v25 = 0;
  objc_msgSend(v9, "_serviceGapDate:string:forSequence:withDepartureIndex:", &v25, &v24, v5, 0);
  v10 = v25;
  v11 = v24;
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_5;
      v14 = (void *)v13;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "laterDate:", v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 == v10)
      {
LABEL_5:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v10, v8);
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v18 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v17, "setObject:forKey:", v18, v8);

        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v20, v8);

      }
    }
  }
  if (*(_BYTE *)(a1 + 96)
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") == *(_QWORD *)(a1 + 88))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v8);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v21 = objc_alloc_init(_MKSortedDepartureCollection);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v5, 0);
    -[_MKSortedDepartureCollection setGroupedSequences:](v21, "setGroupedSequences:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
    -[_MKSortedDepartureCollection setSortedDepartures:](v21, "setSortedDepartures:", v23);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKey:", v21, v5);
  }

}

- (MKTransitDepartureServiceGapFormatter)serviceGapFormatter
{
  MKTransitDepartureServiceGapFormatter *serviceGapFormatter;
  MKTransitDepartureServiceGapFormatter *v4;
  void *v5;
  void *v6;
  MKTransitDepartureServiceGapFormatter *v7;
  MKTransitDepartureServiceGapFormatter *v8;

  serviceGapFormatter = self->_serviceGapFormatter;
  if (!serviceGapFormatter)
  {
    v4 = [MKTransitDepartureServiceGapFormatter alloc];
    -[MKMapItem timeZone](self->super._mapItem, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitSectionController departureCutoffDate](self, "departureCutoffDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MKTransitDepartureServiceGapFormatter initWithTimeZone:departureCutoffDate:](v4, "initWithTimeZone:departureCutoffDate:", v5, v6);
    v8 = self->_serviceGapFormatter;
    self->_serviceGapFormatter = v7;

    serviceGapFormatter = self->_serviceGapFormatter;
  }
  return serviceGapFormatter;
}

- (void)setDepartureCutoffDate:(id)a3
{
  MKTransitDepartureServiceGapFormatter *serviceGapFormatter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesSectionController;
  -[MKTransitSectionController setDepartureCutoffDate:](&v5, sel_setDepartureCutoffDate_, a3);
  serviceGapFormatter = self->_serviceGapFormatter;
  self->_serviceGapFormatter = 0;

}

- (BOOL)_isDateLastDeparture:(id)a3 withNextDepartureDate:(id)a4 forSequence:(id)a5
{
  id v8;
  id v9;
  char v10;
  MKMapItem *mapItem;
  id v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;

  v8 = a5;
  if (a4)
  {
    v9 = a3;
    v10 = objc_msgSend(v8, "isDepartureDateInactive:withReferenceDate:", a4, v9);
  }
  else
  {
    mapItem = self->super._mapItem;
    v12 = a3;
    -[MKMapItem _transitInfo](mapItem, "_transitInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastFullScheduleValidDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timeIntervalSinceDate:", v12);
    v15 = v14;

    if (v15 >= 0.0)
    {
      v10 = 1;
    }
    else
    {
      v16 = objc_msgSend(v8, "numberOfDeparturesAfterDate:", v9);
      -[MKMapItem _transitInfo](self->super._mapItem, "_transitInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16 < objc_msgSend(v17, "numAdditionalDeparturesForSequence:", v8);

    }
  }

  return v10;
}

- (id)_nextLastDepartureDateForSequence:(id)a3 afterDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend(v6, "firstDepartureAfterDate:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "departureDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstDepartureAfterDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "departureDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    while (!-[MKTransitDeparturesSectionController _isDateLastDeparture:withNextDepartureDate:forSequence:](self, "_isDateLastDeparture:withNextDepartureDate:forSequence:", v8, v10, v6))
    {
      v11 = v10;

      objc_msgSend(v6, "firstDepartureAfterDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "departureDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11;
      if (!v11)
        goto LABEL_4;
    }
    v13 = v8;
  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (void)_serviceGapDate:(id *)a3 string:(id *)a4 forSequence:(id)a5 withDepartureIndex:(unint64_t)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  id *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (objc_msgSend(v9, "departureTimeDisplayStyle") == 5)
  {
    if (a3)
      *a3 = 0;
    if (a4)
      *a4 = 0;
    goto LABEL_46;
  }
  v60 = a3;
  -[MKTransitSectionController expiredHighFrequencyCutoffDate](self, "expiredHighFrequencyCutoffDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && !-[MKTransitDeparturesSectionController departuresAreVehicleSpecific](self, "departuresAreVehicleSpecific"))
  {
    -[MKTransitSectionController expiredHighFrequencyCutoffDate](self, "expiredHighFrequencyCutoffDate");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKTransitSectionController departureCutoffDate](self, "departureCutoffDate");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  objc_msgSend(v9, "departuresValidForDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v62 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v20, "departureDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "departureDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v17);
  }

  -[MKTransitSectionController departureCutoffDate](self, "departureCutoffDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKTransitDeparturesCell displayableCountdowDepartureDatesFromDates:withReferenceDate:](MKTransitDeparturesCell, "displayableCountdowDepartureDatesFromDates:withReferenceDate:", v14, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v9, "firstDepartureAfterDate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "departureDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[MKTransitDeparturesSectionController _isDateLastDeparture:withNextDepartureDate:forSequence:](self, "_isDateLastDeparture:withNextDepartureDate:forSequence:", v25, v27, v9);

    v59 = v26;
    if (v28)
    {
      v29 = v25;
      v57 = a4;
      if (objc_msgSend(v24, "count") != 1)
      {
        -[MKTransitDeparturesSectionController serviceGapFormatter](self, "serviceGapFormatter");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastDepartureAtStringFromDate:", v29);
        v41 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v32 = (void *)v41;
        goto LABEL_32;
      }
      -[MKTransitDeparturesSectionController serviceGapFormatter](self, "serviceGapFormatter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v30;
      if (!v26)
      {
        objc_msgSend(v30, "lastDepartureString");
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      objc_msgSend(v26, "departureDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastDepartureUntilStringFromDate:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v26, "departureDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesSectionController _nextLastDepartureDateForSequence:afterDate:](self, "_nextLastDepartureDateForSequence:afterDate:", v9, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35
        || (-[MKTransitSectionController departureCutoffDate](self, "departureCutoffDate"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v35, "timeIntervalSinceDate:", v36),
            v38 = v37,
            v36,
            v38 >= 3600.0))
      {
        v29 = 0;
        v58 = 0;
        v33 = 0;
        goto LABEL_36;
      }
      v57 = a4;
      v40 = v35;
      -[MKTransitDeparturesSectionController serviceGapFormatter](self, "serviceGapFormatter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastDepartureAtStringFromDate:", v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v40;
    }
LABEL_32:

    if (!v32)
    {
      v58 = 0;
      v33 = 0;
      a4 = v57;
      goto LABEL_38;
    }
    v55 = v29;
    v56 = v24;
    v42 = objc_alloc(MEMORY[0x1E0CB3778]);
    v58 = v32;
    objc_msgSend(v32, "formattedString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v42, "initWithString:", v43);

    -[MKTransitDeparturesSectionController serviceGapFormatter](self, "serviceGapFormatter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastDepartureString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "formattedString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "string");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "lowercaseString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lowercaseString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "rangeOfString:", v48);
    v54 = v50;

    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v51 = *MEMORY[0x1E0CEA098];
      +[MKTransitDeparturesCell strongSecondaryFont](MKTransitDeparturesCell, "strongSecondaryFont");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addAttribute:value:range:", v51, v52, v49, v54);

    }
    v24 = v56;
    a4 = v57;
    v29 = v55;
LABEL_36:

LABEL_38:
    goto LABEL_39;
  }
  v33 = 0;
  v29 = 0;
LABEL_39:
  if (v60)
    *v60 = objc_retainAutorelease(v29);
  if (a4)
  {
    if (v33)
    {
      v53 = objc_retainAutorelease((id)objc_msgSend(v33, "copy"));
      *a4 = v53;

    }
    else
    {
      *a4 = 0;
    }
  }

LABEL_46:
}

- (id)serviceGapDescriptionForRow:(int64_t)a3
{
  NSDictionary *serviceGapStrings;
  void *v6;
  void *v7;

  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitDeparturesSectionController _buildRows](self, "_buildRows");
  serviceGapStrings = self->_serviceGapStrings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](serviceGapStrings, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setServiceGapFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGapFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGapFormatter, 0);
  objc_storeStrong((id *)&self->_serviceGapStrings, 0);
  objc_storeStrong((id *)&self->_sequencesToInclude, 0);
  objc_storeStrong((id *)&self->_sequences, 0);
  objc_storeStrong((id *)&self->_departureSequenceContainer, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

@end
