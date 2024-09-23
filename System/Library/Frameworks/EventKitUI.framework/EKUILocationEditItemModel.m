@implementation EKUILocationEditItemModel

- (EKUILocationEditItemModel)init
{
  EKUILocationEditItemModel *v2;
  uint64_t v3;
  NSMutableDictionary *conferenceRoomInfos;
  uint64_t v5;
  NSMutableArray *rowModels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKUILocationEditItemModel;
  v2 = -[EKUILocationEditItemModel init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    conferenceRoomInfos = v2->_conferenceRoomInfos;
    v2->_conferenceRoomInfos = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    rowModels = v2->_rowModels;
    v2->_rowModels = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)reset
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_conferenceRoomInfos, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_11);
  -[NSMutableArray removeAllObjects](self->_rowModels, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_conferenceRoomInfos, "removeAllObjects");
}

void __34__EKUILocationEditItemModel_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "availabilityRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)rebuild:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  EKUIConferenceRoomInfo *v11;
  NSMutableDictionary *conferenceRoomInfos;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  EKUILocationRowModel *v27;
  NSMutableArray *rowModels;
  EKUILocationRowModel *v29;
  void *v30;
  NSMutableArray *v31;
  EKUILocationRowModel *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  void *v36;
  int v37;
  NSMutableArray *v38;
  EKUILocationRowModel *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  EKUILocationRowModel *v48;
  id v49;
  EKUILocationRowModel *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
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
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKUILocationEditItemModel reset](self, "reset");
  v51 = v4;
  objc_msgSend(v4, "event");
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (objc_msgSend(v10, "participantType") == 2)
        {
          v11 = objc_alloc_init(EKUIConferenceRoomInfo);
          conferenceRoomInfos = self->_conferenceRoomInfos;
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](conferenceRoomInfos, "setObject:forKey:", v11, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "structuredLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "preferredLocationWithoutPrediction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("; "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)v14;
  v63 = 0u;
  v61 = 0u;
  v62 = 0u;
  v60 = 0u;
  obj = v19;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  v53 = (void *)v14;
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v61 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_conferenceRoomInfos, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = -[EKUILocationRowModel initWithConferenceRoom:]([EKUILocationRowModel alloc], "initWithConferenceRoom:", v25);
          objc_msgSend(v15, "addObject:", v27);

          objc_msgSend(v20, "addObject:", v26);
        }
        else if (v16)
        {
          if (objc_msgSend(v16, "isPrediction"))
          {
            rowModels = self->_rowModels;
            v29 = -[EKUILocationRowModel initWithSuggestedLocation:]([EKUILocationRowModel alloc], "initWithSuggestedLocation:", v25);
            -[NSMutableArray addObject:](rowModels, "addObject:", v29);

          }
          else
          {
            v30 = (void *)objc_msgSend(v16, "copy");
            objc_msgSend(v30, "setTitle:", v25);
            v31 = self->_rowModels;
            v32 = -[EKUILocationRowModel initWithStructuredLocation:]([EKUILocationRowModel alloc], "initWithStructuredLocation:", v30);
            -[NSMutableArray addObject:](v31, "addObject:", v32);

          }
          v20 = v53;
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v22);
  }

  -[NSMutableDictionary allValues](self->_conferenceRoomInfos, "allValues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v20, "count");
  if (v34 != objc_msgSend(v33, "count"))
  {
    v35 = self->_conferenceRoomInfos;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __37__EKUILocationEditItemModel_rebuild___block_invoke;
    v57[3] = &unk_1E60195A8;
    v58 = v20;
    v59 = v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v35, "enumerateKeysAndObjectsUsingBlock:", v57);

  }
  objc_msgSend(v52, "preferredLocation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "isStructured") && !obj)
  {
    v37 = objc_msgSend(v36, "isPrediction");
    v38 = self->_rowModels;
    v39 = [EKUILocationRowModel alloc];
    if (v37)
    {
      objc_msgSend(v36, "title");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[EKUILocationRowModel initWithSuggestedLocation:](v39, "initWithSuggestedLocation:", v40);
    }
    else
    {
      v40 = (void *)objc_msgSend(v36, "copy");
      v41 = -[EKUILocationRowModel initWithStructuredLocation:](v39, "initWithStructuredLocation:", v40);
    }
    v42 = (void *)v41;
    -[NSMutableArray addObject:](v38, "addObject:", v41);

    v20 = v53;
  }
  objc_msgSend(v52, "virtualConference");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    v45 = (void *)MEMORY[0x1E0CB3880];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __37__EKUILocationEditItemModel_rebuild___block_invoke_2;
    v55[3] = &unk_1E60195D0;
    v46 = v43;
    v56 = v46;
    objc_msgSend(v45, "predicateWithBlock:", v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filterUsingPredicate:", v47);

    v48 = [EKUILocationRowModel alloc];
    v49 = v46;
    v20 = v53;
    v50 = -[EKUILocationRowModel initWithVirtualConference:](v48, "initWithVirtualConference:", v49);
    -[NSMutableArray addObject:](self->_rowModels, "addObject:", v50);

  }
  -[NSMutableArray addObjectsFromArray:](self->_rowModels, "addObjectsFromArray:", v15);
  -[EKUILocationEditItemModel reorderRowModels](self, "reorderRowModels");
  -[EKUILocationEditItemModel updateAvailabilityInformation:](self, "updateAvailabilityInformation:", v51);

}

void __37__EKUILocationEditItemModel_rebuild___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  EKUILocationRowModel *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a3) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    v6 = -[EKUILocationRowModel initWithConferenceRoom:]([EKUILocationRowModel alloc], "initWithConferenceRoom:", v7);
    objc_msgSend(v5, "addObject:", v6);

  }
}

uint64_t __37__EKUILocationEditItemModel_rebuild___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serializationBlockTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6) ^ 1;

  return v7;
}

- (BOOL)hasVirtualConference
{
  void *v2;
  BOOL v3;

  -[EKUILocationEditItemModel virtualConferenceRowModel](self, "virtualConferenceRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (EKUILocationRowModel)virtualConferenceRowModel
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_rowModels;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "locationType", (_QWORD)v8) == 2)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (EKUILocationRowModel *)v3;
}

- (BOOL)hasMapLocation
{
  void *v2;
  BOOL v3;

  -[EKUILocationEditItemModel mapLocationRowModel](self, "mapLocationRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (EKUILocationRowModel)mapLocationRowModel
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_rowModels;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "locationType", (_QWORD)v8) == 1)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (EKUILocationRowModel *)v3;
}

- (BOOL)displaysPlaceholder
{
  BOOL v3;
  uint64_t v4;
  BOOL result;

  v3 = -[EKUILocationEditItemModel hasVirtualConference](self, "hasVirtualConference");
  v4 = -[NSMutableArray count](self->_rowModels, "count");
  result = v4 == 0;
  if (v4)
  {
    if (!v3)
      return !-[EKUILocationEditItemModel hasMapLocation](self, "hasMapLocation");
  }
  return result;
}

- (NSString)placeholderCellText
{
  void *v2;
  void *v3;

  if (-[EKUILocationEditItemModel displaysPlaceholder](self, "displaysPlaceholder"))
  {
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location or Video Call"), &stru_1E601DFA8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)_updateConferenceDataOnEvent:(id)a3 forNewLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKUILocationEditItemModel _conferenceRoomNameForLocation:](self, "_conferenceRoomNameForLocation:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_conferenceRoomInfos, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "setClientLocation:", 0);
    objc_msgSend(v6, "travelStartLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Clearing start location and travel time on event: [%@]", (uint8_t *)&v11, 0xCu);
      }
      objc_msgSend(v6, "setTravelStartLocation:", 0);
      objc_msgSend(v6, "setTravelTime:", 0.0);
    }
  }

}

- (void)_removeConferenceAttendeeOnEvent:(id)a3 forRowModel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUILocationEditItemModel _conferenceRoomNameForLocation:](self, "_conferenceRoomNameForLocation:", v8);
  }
  else
  {
    objc_msgSend(v6, "conference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "serializationBlockTitle");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUILocationEditItemModel _participantForConferenceRoomName:event:](self, "_participantForConferenceRoomName:event:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v11, "removeAttendee:", v10);
    -[NSMutableDictionary removeObjectForKey:](self->_conferenceRoomInfos, "removeObjectForKey:", v9);
  }

}

- (void)_deleteVirtualConferenceOnEvent:(id)a3 forRowModel:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a4, "locationType") == 2)
    objc_msgSend(v5, "setVirtualConference:", 0);

}

- (void)_updateLocationsOnEvent:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *conferenceRoomInfos;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_rowModels, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_rowModels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v5)
  {
    v7 = 0;
    v27 = 0;
    goto LABEL_20;
  }
  v6 = v5;
  v7 = 0;
  v27 = 0;
  v8 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "locationType");
      if (v11 > 1)
      {
        if (v11 != 2)
          continue;
        if (-[EKUILocationEditItemModel rowModelRepresentsConferenceRoom:onEvent:](self, "rowModelRepresentsConferenceRoom:onEvent:", v10, v26))
        {
          objc_msgSend(v10, "conference");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "serializationBlockTitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v23);

        }
        objc_msgSend(v10, "conference");
        v20 = v7;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v10, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v10, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v15);

      }
      conferenceRoomInfos = self->_conferenceRoomInfos;
      objc_msgSend(v10, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](conferenceRoomInfos, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v10, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "duplicate");
        v21 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v21;
LABEL_15:

        continue;
      }
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v6);
LABEL_20:

  objc_msgSend(MEMORY[0x1E0CAA060], "_locationStringForLocations:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v27;
  if (!v27)
  {
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
  }
  objc_msgSend(v25, "setTitle:", v24);
  objc_msgSend(v26, "setStructuredLocation:", v25);
  objc_msgSend(v26, "setVirtualConference:", v7);
  if (v7)
    +[EKUIDiscoverabilityUtilities sendDiscoverabilitySignalForConference:](EKUIDiscoverabilityUtilities, "sendDiscoverabilitySignalForConference:", v7);

}

- (void)removeRowModel:(id)a3 event:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = -[NSMutableArray indexOfObject:](self->_rowModels, "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[EKUILocationEditItemModel removeRowModelAtIndex:event:](self, "removeRowModelAtIndex:event:", v6, v7);

}

- (void)removeRowModelAtIndex:(unint64_t)a3 event:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[NSMutableArray objectAtIndex:](self->_rowModels, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILocationEditItemModel _removeConferenceAttendeeOnEvent:forRowModel:](self, "_removeConferenceAttendeeOnEvent:forRowModel:", v7, v6);
  if (objc_msgSend(v6, "locationType") == 1)
    -[EKUILocationEditItemModel _updateConferenceDataOnEvent:forNewLocation:](self, "_updateConferenceDataOnEvent:forNewLocation:", v7, 0);
  -[EKUILocationEditItemModel _deleteVirtualConferenceOnEvent:forRowModel:](self, "_deleteVirtualConferenceOnEvent:forRowModel:", v7, v6);
  -[NSMutableArray removeObjectAtIndex:](self->_rowModels, "removeObjectAtIndex:", a3);
  -[EKUILocationEditItemModel _updateLocationsOnEvent:](self, "_updateLocationsOnEvent:", v7);

}

- (int64_t)indexOfPredictedLocation
{
  int64_t v3;
  void *v4;
  uint64_t v5;

  if (!-[NSMutableArray count](self->_rowModels, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_rowModels, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "locationType");

    if (v5 == 3)
      break;
    if (++v3 >= (unint64_t)-[NSMutableArray count](self->_rowModels, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)_rowModelForCell:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "tag");
  if (v4 >= -[NSMutableArray count](self->_rowModels, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_rowModels, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)updateRowModel:(id)a3 withMapLocation:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  EKUILocationRowModel *v12;
  int64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new map location: [%@]", (uint8_t *)&v14, 0x16u);
  }
  if (v8 || !v9)
  {
    if (v8 && v9)
    {
      -[EKUILocationEditItemModel removeConferenceRoomAttendeeIfNeeded:event:](self, "removeConferenceRoomAttendeeIfNeeded:event:", v8, v10);
      objc_msgSend(v8, "setLocationType:", 1);
      objc_msgSend(v8, "setLocation:", v9);
      objc_msgSend(v8, "setConference:", 0);
      objc_msgSend(v8, "setCell:", 0);
    }
  }
  else
  {
    v12 = -[EKUILocationRowModel initWithStructuredLocation:]([EKUILocationRowModel alloc], "initWithStructuredLocation:", v9);
    -[NSMutableArray addObject:](self->_rowModels, "addObject:", v12);

  }
  v13 = -[EKUILocationEditItemModel indexOfPredictedLocation](self, "indexOfPredictedLocation");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    -[EKUILocationEditItemModel removeRowModelAtIndex:event:](self, "removeRowModelAtIndex:event:", v13, v10);
  -[EKUILocationEditItemModel _updateConferenceDataOnEvent:forNewLocation:](self, "_updateConferenceDataOnEvent:forNewLocation:", v10, v9);
  -[EKUILocationEditItemModel _updateLocationsOnEvent:](self, "_updateLocationsOnEvent:", v10);
  CalAnalyticsSendEvent();

}

- (void)updateRowModel:(id)a3 withVirtualConference:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  EKUILocationRowModel *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new virtual conference: [%@]", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    -[EKUILocationEditItemModel removeConferenceRoomAttendeeIfNeeded:event:](self, "removeConferenceRoomAttendeeIfNeeded:event:", v8, v10);
    objc_msgSend(v8, "setLocationType:", 2);
    objc_msgSend(v8, "setConference:", v9);
    objc_msgSend(v8, "setLocation:", 0);
    objc_msgSend(v8, "setCell:", 0);
  }
  else
  {
    v12 = [EKUILocationRowModel alloc];
    if (v9)
      v13 = -[EKUILocationRowModel initWithVirtualConference:](v12, "initWithVirtualConference:", v9);
    else
      v13 = -[EKUILocationRowModel initWithPendingConference:](v12, "initWithPendingConference:", 0);
    v8 = (id)v13;
    -[NSMutableArray addObject:](self->_rowModels, "addObject:", v13);
  }
  -[EKUILocationEditItemModel _updateLocationsOnEvent:](self, "_updateLocationsOnEvent:", v10);

}

- (void)updateRowModel:(id)a3 withConferenceRoom:(id)a4 editItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  EKUIConferenceRoomInfo *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  EKUILocationRowModel *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Updating old row model [%@] with new conference room: [%@]", buf, 0x16u);
  }
  CalAnalyticsSendEvent();
  objc_msgSend(v9, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v26 = v10;
    objc_msgSend(v9, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA9FD0], "attendeeWithName:url:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setParticipantType:", 2);
    objc_msgSend(v14, "addAttendee:", v17);
    v18 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_DEBUG, "Added conference room as attendee: [%@]", buf, 0xCu);
    }
    v19 = objc_alloc_init(EKUIConferenceRoomInfo);
    -[NSMutableDictionary setObject:forKey:](self->_conferenceRoomInfos, "setObject:forKey:", v19, v16);
    if (v8)
    {
      -[EKUILocationEditItemModel removeConferenceRoomAttendeeIfNeeded:event:](self, "removeConferenceRoomAttendeeIfNeeded:event:", v8, v14);
      objc_msgSend(v8, "setLocationType:", 0);
      objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocation:", v20);

      objc_msgSend(v8, "setConference:", 0);
      objc_msgSend(v8, "setCell:", 0);
      objc_msgSend(v8, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = -[EKUILocationRowModel initWithConferenceRoom:]([EKUILocationRowModel alloc], "initWithConferenceRoom:", v16);
      -[NSMutableArray addObject:](self->_rowModels, "addObject:", v23);
      -[EKUILocationRowModel location](v23, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKUILocationEditItemModel _updateConferenceDataOnEvent:forNewLocation:](self, "_updateConferenceDataOnEvent:forNewLocation:", v14, v21);
    -[EKUILocationEditItemModel _updateLocationsOnEvent:](self, "_updateLocationsOnEvent:", v14);
    v24 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1AF84D000, v24, OS_LOG_TYPE_DEBUG, "Set structured location based on the new conference room.  Location: [%@]", buf, 0xCu);
    }

    v10 = v26;
  }
  else
  {
    v22 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_ERROR, "Could not find conference room's preferred address.  Will not update location.  Conference room: [%@]", buf, 0xCu);
    }
  }
  -[EKUILocationEditItemModel updateAvailabilityInformation:](self, "updateAvailabilityInformation:", v10);

}

- (void)reorderRowModels
{
  -[NSMutableArray sortUsingComparator:](self->_rowModels, "sortUsingComparator:", &__block_literal_global_93);
}

uint64_t __45__EKUILocationEditItemModel_reorderRowModels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "locationType");
  v7 = objc_msgSend(v5, "locationType");
  if (v6 | v7)
  {
    if (v6 >= v7)
      v13 = 0;
    else
      v13 = -1;
    if (v6 <= v7)
      v12 = v13;
    else
      v12 = 1;
  }
  else
  {
    objc_msgSend(v4, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "caseInsensitiveCompare:", v11);

  }
  return v12;
}

- (void)updateAvailabilityInformation:(id)a3
{
  id v4;
  NSMutableDictionary *conferenceRoomInfos;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  conferenceRoomInfos = self->_conferenceRoomInfos;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke;
  v7[3] = &unk_1E60195A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](conferenceRoomInfos, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id location;
  _QWORD v62[4];
  id v63;
  id v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "setAvailabilitySpans:", 0);
  objc_msgSend(v6, "availabilityRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  objc_msgSend(v6, "setAvailabilityRequest:", 0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "locationType"))
      {
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_conferenceRoomNameForLocation:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if (v13)
          break;
      }

      if (++v8 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
        goto LABEL_6;
    }
    objc_msgSend(v9, "cell");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
      v42 = (id)objc_msgSend(*(id *)(a1 + 40), "cellForSubitemAtIndex:", v8);
    objc_msgSend(v9, "cell");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v55 = v43;
    else
      v55 = 0;

  }
  else
  {
LABEL_6:
    v55 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_participantForConferenceRoomName:event:", v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    v37 = kEKUILogEventEditorHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v38 = "There is no conference room on this event.  Will not issue an availability request.";
    v39 = v37;
    v40 = 2;
LABEL_18:
    _os_log_impl(&dword_1AF84D000, v39, OS_LOG_TYPE_DEBUG, v38, buf, v40);
    goto LABEL_30;
  }
  v17 = objc_msgSend(v15, "needsResponse");
  v18 = kEKUILogEventEditorHandle;
  v19 = os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG);
  if ((v17 & 1) == 0)
  {
    if (!v19)
      goto LABEL_30;
    *(_DWORD *)buf = 138412290;
    v67 = v16;
    v38 = "The conference room has already responded.  Will not issue an availability request.  Room: [%@]";
    v39 = v18;
    v40 = 12;
    goto LABEL_18;
  }
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = v18;
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v16, "participantStatus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v22;
    v68 = 2112;
    v69 = v16;
    _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "This event's room's participation status is [%@].  It is a candidate for an availability request.  Room: [%@]", buf, 0x16u);

  }
  objc_msgSend(v16, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "event");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "calendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraints");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "supportsAvailabilityRequests");

  if ((v28 & 1) != 0)
  {
    if (v54)
    {
      objc_msgSend(v14, "calendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "source");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "startDate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endDateUnadjustedForLegacyClients");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc(MEMORY[0x1E0CAA130]);
      v65 = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = MEMORY[0x1E0C809B0];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_97;
      v62[3] = &unk_1E6019638;
      v63 = v54;
      v33 = v6;
      v64 = v33;
      v34 = (void *)objc_msgSend(v30, "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v53, v52, v51, v14, v31, v62);
      objc_msgSend(v33, "setAvailabilityRequest:", v34);

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_initWeak(&location, v33);
      v56[0] = v32;
      v56[1] = 3221225472;
      v56[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_3;
      v56[3] = &unk_1E6019660;
      objc_copyWeak(&v59, (id *)buf);
      objc_copyWeak(&v60, &location);
      v57 = v55;
      v58 = v14;
      objc_msgSend(v33, "availabilityRequest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCompletionBlock:", v56);

      objc_msgSend(v33, "availabilityRequest");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "start");

      objc_destroyWeak(&v60);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v48 = (void *)kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        v49 = v48;
        objc_msgSend(v16, "URL");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v50;
        _os_log_impl(&dword_1AF84D000, v49, OS_LOG_TYPE_DEBUG, "The conference room's address is nil.  Will not issue an availability request.  URL: [%@]", buf, 0xCu);

      }
    }
  }
  else
  {
    v44 = (void *)kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      v45 = v44;
      objc_msgSend(v14, "calendar");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "source");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v47;
      _os_log_impl(&dword_1AF84D000, v45, OS_LOG_TYPE_DEBUG, "This event's source does not support availability requests.  Will not send out an availability request.  Source: [%@]", buf, 0xCu);

    }
  }

LABEL_30:
  objc_msgSend(*(id *)(a1 + 32), "refreshConferenceRoomCell:event:", v55, v14);

}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_97(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_2;
  v5[3] = &unk_1E6018EC0;
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvailabilitySpans:", *(_QWORD *)(a1 + 40));
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_3(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_4;
  v2[3] = &unk_1E6019660;
  objc_copyWeak(&v5, a1 + 6);
  objc_copyWeak(&v6, a1 + 7);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __59__EKUILocationEditItemModel_updateAvailabilityInformation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = (void *)kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      objc_msgSend(v4, "availabilityRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Availability request completed: [%@]", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v4, "setAvailabilityRequest:", 0);
    v8 = (void *)MEMORY[0x1E0CA9FE8];
    objc_msgSend(v4, "availabilitySpans");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "summarizedAvailabilityTypeForSpans:", v9);

    objc_msgSend(v4, "setAvailabilityType:", v10);
    objc_msgSend(WeakRetained, "refreshConferenceRoomCell:event:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (id)_conferenceRoomNameForLocation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D0C328];
  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fullDisplayStringWithTitle:address:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_participantForConferenceRoomName:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "attendees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__EKUILocationEditItemModel__participantForConferenceRoomName_event___block_invoke;
  v11[3] = &unk_1E6019688;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __69__EKUILocationEditItemModel__participantForConferenceRoomName_event___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "participantType") == 2)
  {
    objc_msgSend(v9, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

- (void)refreshConferenceRoomCell:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[EKUILocationEditItemModel _rowModelForCell:](self, "_rowModelForCell:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "locationType"))
  {
    objc_msgSend(v8, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILocationEditItemModel _conferenceRoomNameForLocation:](self, "_conferenceRoomNameForLocation:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUILocationEditItemModel conferenceRoomInfos](self, "conferenceRoomInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "availabilityRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

    objc_msgSend(v6, "calendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithName:sourceSupportsAvailability:availabilityRequestInProgress:availabilityType:", v11, objc_msgSend(v18, "supportsAvailabilityRequests"), v15, objc_msgSend(v13, "availabilityType"));

  }
}

- (BOOL)shouldDisplayRowModelWithConferenceCell:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "locationType"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILocationEditItemModel _conferenceRoomNameForLocation:](self, "_conferenceRoomNameForLocation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_conferenceRoomInfos, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUILocationEditItemModel _participantForConferenceRoomName:event:](self, "_participantForConferenceRoomName:event:", v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v8 = 0;
    if (v11 && v12)
    {
      if ((EKUIAttendeeUtils_AttendeeHasResponded(v12) & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v7, "calendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraints");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v16, "supportsAvailabilityRequests");

      }
    }

  }
  return v8;
}

- (void)removeConferenceRoomAttendeeIfNeeded:(id)a3 event:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[EKUILocationEditItemModel rowModelRepresentsConferenceRoom:onEvent:](self, "rowModelRepresentsConferenceRoom:onEvent:", v7, v6))
  {
    -[EKUILocationEditItemModel _removeConferenceAttendeeOnEvent:forRowModel:](self, "_removeConferenceAttendeeOnEvent:forRowModel:", v6, v7);
  }

}

- (BOOL)rowModelRepresentsConferenceRoom:(id)a3 onEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "locationType"))
  {
    objc_msgSend(v6, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUILocationEditItemModel _conferenceRoomNameForLocation:](self, "_conferenceRoomNameForLocation:", v9);
    }
    else
    {
      objc_msgSend(v6, "conference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serializationBlockTitle");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUILocationEditItemModel _participantForConferenceRoomName:event:](self, "_participantForConferenceRoomName:event:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != 0;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (NSMutableArray)rowModels
{
  return self->_rowModels;
}

- (void)setRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_rowModels, a3);
}

- (NSMutableDictionary)conferenceRoomInfos
{
  return self->_conferenceRoomInfos;
}

- (void)setConferenceRoomInfos:(id)a3
{
  objc_storeStrong((id *)&self->_conferenceRoomInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceRoomInfos, 0);
  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end
