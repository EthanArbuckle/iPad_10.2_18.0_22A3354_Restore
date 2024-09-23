@implementation _GEOTransitNearbySchedule

- (_GEOTransitNearbySchedule)initWithNearbySchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6 stopInfo:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _GEOTransitNearbySchedule *v15;
  uint64_t v16;
  NSArray *categories;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_GEOTransitNearbySchedule;
  v15 = -[_GEOTransitNearbySchedule init](&v19, sel_init);
  if (v15)
  {
    +[_GEOTransitNearbySchedule nearbyScheduleCategoriesFromSchedule:departureSequenceContainers:scheduledDepartureSequences:incidents:](_GEOTransitNearbySchedule, "nearbyScheduleCategoriesFromSchedule:departureSequenceContainers:scheduledDepartureSequences:incidents:", v11, v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    categories = v15->_categories;
    v15->_categories = (NSArray *)v16;

  }
  return v15;
}

+ (id)nearbyScheduleCategoriesFromSchedule:(id)a3 departureSequenceContainers:(id)a4 scheduledDepartureSequences:(id)a5 incidents:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _GEOTransitNearbyScheduleGroup *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  void *v24;
  _GEOTransitNearbyScheduleCategory *v25;
  void *v26;
  _GEOTransitNearbyScheduleCategory *v27;
  void *v28;
  id v30;
  id *v31;
  id obj;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v31 = (id *)a3;
  v36 = a4;
  v35 = a5;
  v30 = a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__73;
  v50 = __Block_byref_object_dispose__73;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __132___GEOTransitNearbySchedule_nearbyScheduleCategoriesFromSchedule_departureSequenceContainers_scheduledDepartureSequences_incidents___block_invoke;
  v45[3] = &unk_1E1C124E8;
  v45[4] = &v46;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v45);
  v34 = (void *)objc_msgSend((id)v47[5], "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[GEOPDTransitNearbySchedule groups](v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v10);
        v14 = -[_GEOTransitNearbyScheduleGroup initWithTransitScheduleGroup:departureSequenceContainers:scheduledDepartureSequences:incidentsMap:]([_GEOTransitNearbyScheduleGroup alloc], "initWithTransitScheduleGroup:departureSequenceContainers:scheduledDepartureSequences:incidentsMap:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v36, v35, v34);
        objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[GEOPDTransitNearbySchedule categorys](v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v38;
    obj = v15;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        if (v19)
        {
LABEL_14:
          -[GEOPDTransitScheduleCategory _readGroupIndexs](v19);
          v22 = *(_QWORD *)(v19 + 32);
          goto LABEL_15;
        }
        while (1)
        {
          v22 = 0;
LABEL_15:
          if (v21 >= v22)
            break;
          v23 = -[GEOPDTransitScheduleCategory groupIndexAtIndex:](v19, v21);
          if (objc_msgSend(v9, "count") > (unint64_t)v23)
          {
            objc_msgSend(v9, "objectAtIndex:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v24);

          }
          ++v21;
          if (v19)
            goto LABEL_14;
        }
        v25 = [_GEOTransitNearbyScheduleCategory alloc];
        -[GEOPDTransitScheduleCategory artwork]((id *)v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[_GEOTransitNearbyScheduleCategory initWithTransitScheduleCategory:nearbyScheduleGroups:categoryArtwork:](v25, "initWithTransitScheduleCategory:nearbyScheduleGroups:categoryArtwork:", v19, v20, v26);
        objc_msgSend(v33, "addObject:", v27);

      }
      v15 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    }
    while (v16);
  }

  v28 = (void *)objc_msgSend(v33, "copy");
  _Block_object_dispose(&v46, 8);

  return v28;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
