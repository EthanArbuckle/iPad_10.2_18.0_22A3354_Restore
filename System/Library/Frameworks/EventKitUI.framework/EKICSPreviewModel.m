@implementation EKICSPreviewModel

- (EKICSPreviewModel)initWithICSData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  EKICSPreviewModel *v10;
  EKICSPreviewModel *v11;
  uint64_t v12;
  NSData *data;
  uint64_t v14;
  EKEventStore *tempStore;
  EKEventStore *v16;
  NSData *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *importedEvents;
  uint64_t v22;
  NSMutableArray *unimportedEvents;
  uint64_t v24;
  NSMutableSet *eventsAllowingUpdate;
  uint64_t v26;
  NSMutableSet *eventsAllowingDelete;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSMutableArray *v38;
  void *v39;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v47.receiver = self;
  v47.super_class = (Class)EKICSPreviewModel;
  v10 = -[EKICSPreviewModel init](&v47, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_destStore, a4);
    v41 = v8;
    v12 = objc_msgSend(v8, "copy");
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v11->_options = a5;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 48);
    tempStore = v11->_tempStore;
    v11->_tempStore = (EKEventStore *)v14;

    v17 = v11->_data;
    v16 = v11->_tempStore;
    -[EKEventStore defaultCalendarForNewEvents](v16, "defaultCalendarForNewEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore importICSData:intoCalendar:options:](v16, "importICSData:intoCalendar:options:", v17, v18, *MEMORY[0x1E0D0BEA0] | *MEMORY[0x1E0D0BE90] | v11->_options);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    importedEvents = v11->_importedEvents;
    v11->_importedEvents = (NSMutableArray *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    unimportedEvents = v11->_unimportedEvents;
    v11->_unimportedEvents = (NSMutableArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    eventsAllowingUpdate = v11->_eventsAllowingUpdate;
    v11->_eventsAllowingUpdate = (NSMutableSet *)v24;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    eventsAllowingDelete = v11->_eventsAllowingDelete;
    v11->_eventsAllowingDelete = (NSMutableSet *)v26;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v19;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (!v28)
      goto LABEL_16;
    v29 = v28;
    v30 = *(_QWORD *)v44;
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if ((a5 & 1) != 0)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "notes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("=0D=0A"), &stru_1E601DFA8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setNotes:", v34);

        }
        objc_msgSend(v32, "uniqueID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore eventWithUniqueId:](v11->_destStore, "eventWithUniqueId:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
          goto LABEL_12;
        -[NSMutableSet addObject:](v11->_eventsAllowingDelete, "addObject:", v35);
        v37 = objc_msgSend(v36, "sequenceNumber");
        if (v37 < (int)objc_msgSend(v32, "sequenceNumber"))
        {
          -[NSMutableSet addObject:](v11->_eventsAllowingUpdate, "addObject:", v35);
LABEL_12:
          v38 = v11->_unimportedEvents;
          v39 = v32;
          goto LABEL_14;
        }
        v38 = v11->_importedEvents;
        v39 = v36;
LABEL_14:
        -[NSMutableArray addObject:](v38, "addObject:", v39);
        v11->_actionsState = objc_msgSend(v32, "actionsState");

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (!v29)
      {
LABEL_16:

        v8 = v41;
        break;
      }
    }
  }

  return v11;
}

- (EKEventStore)eventStore
{
  return self->_destStore;
}

- (unint64_t)totalEventCount
{
  uint64_t v3;

  v3 = -[NSMutableArray count](self->_importedEvents, "count");
  return -[NSMutableArray count](self->_unimportedEvents, "count") + v3;
}

- (unint64_t)importedEventCount
{
  return -[NSMutableArray count](self->_importedEvents, "count");
}

- (unint64_t)unimportedEventCount
{
  return -[NSMutableArray count](self->_unimportedEvents, "count");
}

- (unint64_t)actionsState
{
  return self->_actionsState;
}

- (NSArray)importedEvents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_importedEvents, "copy");
}

- (NSArray)unimportedEvents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_unimportedEvents, "copy");
}

- (NSArray)allEvents
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[EKICSPreviewModel totalEventCount](self, "totalEventCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_importedEvents, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_importedEvents);
  if (-[NSMutableArray count](self->_unimportedEvents, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_unimportedEvents);
  return (NSArray *)v3;
}

- (id)importEvent:(id)a3 intoCalendar:(id)a4
{
  id v6;
  id v7;
  NSData *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  EKEventStore *destStore;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *eventsAllowingUpdate;
  void *v20;
  NSMutableSet *eventsAllowingDelete;
  void *v22;
  void *v24;
  id v25;
  NSData *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_data;
  if (v8)
  {
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    destStore = self->_destStore;
    v24 = (void *)v11;
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore importEventsWithExternalIDs:fromICSData:intoCalendars:options:batchSize:](destStore, "importEventsWithExternalIDs:fromICSData:intoCalendars:options:batchSize:", v13, v14, v15, *MEMORY[0x1E0D0BEA8] | *MEMORY[0x1E0D0BE90] | self->_options | 0x100000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[EKICSPreviewModel willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("unimportedEvents"));
      -[EKICSPreviewModel willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importedEvents"));
      -[NSMutableArray removeObject:](self->_unimportedEvents, "removeObject:", v6);
      -[NSMutableArray addObject:](self->_importedEvents, "addObject:", v18);
      -[EKICSPreviewModel didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("unimportedEvents"));
      -[EKICSPreviewModel didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importedEvents"));
      eventsAllowingUpdate = self->_eventsAllowingUpdate;
      objc_msgSend(v18, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](eventsAllowingUpdate, "removeObject:", v20);

      eventsAllowingDelete = self->_eventsAllowingDelete;
      objc_msgSend(v18, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](eventsAllowingDelete, "addObject:", v22);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)importAllIntoCalendar:(id)a3
{
  EKICSPreviewModel *v3;
  void *v4;
  uint64_t i;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSMutableSet *eventsAllowingUpdate;
  void *v17;
  NSMutableSet *eventsAllowingDelete;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  EKICSPreviewModel *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v3 = self;
  v35 = *MEMORY[0x1E0C80C00];
  -[EKEventStore importICSData:intoCalendar:options:](self->_destStore, "importICSData:intoCalendar:options:", v3->_data, a3, *MEMORY[0x1E0D0BEA8] | *MEMORY[0x1E0D0BE90] | v3->_options | 0x8100000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[EKICSPreviewModel willChangeValueForKey:](v3, "willChangeValueForKey:", CFSTR("unimportedEvents"));
    -[EKICSPreviewModel willChangeValueForKey:](v3, "willChangeValueForKey:", CFSTR("importedEvents"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v4;
    obj = v4;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v30;
      v24 = v3;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v7 = v3->_unimportedEvents;
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v26 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                objc_msgSend(v12, "uniqueID");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "uniqueID");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v13, "isEqualToString:", v14);

                if (v15)
                {
                  v3 = v24;
                  -[NSMutableArray removeObject:](v24->_unimportedEvents, "removeObject:", v12);
                  -[NSMutableArray addObject:](v24->_importedEvents, "addObject:", v6);
                  goto LABEL_17;
                }
              }
              v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              v3 = v24;
              if (v9)
                continue;
              break;
            }
          }
LABEL_17:

          eventsAllowingUpdate = v3->_eventsAllowingUpdate;
          objc_msgSend(v6, "uniqueID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet removeObject:](eventsAllowingUpdate, "removeObject:", v17);

          eventsAllowingDelete = v3->_eventsAllowingDelete;
          objc_msgSend(v6, "uniqueID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](eventsAllowingDelete, "addObject:", v19);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }

    -[EKICSPreviewModel didChangeValueForKey:](v3, "didChangeValueForKey:", CFSTR("unimportedEvents"));
    -[EKICSPreviewModel didChangeValueForKey:](v3, "didChangeValueForKey:", CFSTR("importedEvents"));
    v4 = v20;
  }

}

- (BOOL)shouldAllowDeleteEvent:(id)a3
{
  NSMutableSet *eventsAllowingDelete;
  void *v4;

  eventsAllowingDelete = self->_eventsAllowingDelete;
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(eventsAllowingDelete) = -[NSMutableSet containsObject:](eventsAllowingDelete, "containsObject:", v4);

  return (char)eventsAllowingDelete;
}

- (BOOL)shouldAllowUpdateEvent:(id)a3
{
  NSMutableSet *eventsAllowingUpdate;
  void *v4;

  eventsAllowingUpdate = self->_eventsAllowingUpdate;
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(eventsAllowingUpdate) = -[NSMutableSet containsObject:](eventsAllowingUpdate, "containsObject:", v4);

  return (char)eventsAllowingUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsAllowingDelete, 0);
  objc_storeStrong((id *)&self->_eventsAllowingUpdate, 0);
  objc_storeStrong((id *)&self->_unimportedEvents, 0);
  objc_storeStrong((id *)&self->_importedEvents, 0);
  objc_storeStrong((id *)&self->_destStore, 0);
  objc_storeStrong((id *)&self->_tempStore, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
