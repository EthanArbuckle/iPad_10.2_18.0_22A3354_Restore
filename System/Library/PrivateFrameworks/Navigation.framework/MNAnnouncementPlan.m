@implementation MNAnnouncementPlan

- (MNAnnouncementPlan)initWithEvents:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6
{
  id v11;
  id v12;
  MNAnnouncementPlan *v13;
  MNAnnouncementPlan *v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  MNAnnouncementPlanEvent *v24;
  NSMutableArray *plannedEvents;
  MNAnnouncementPlan *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MNAnnouncementPlan;
  v13 = -[MNAnnouncementPlan init](&v32, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_events, a3);
    v14->_distance = a4;
    v14->_speed = a5;
    v27 = v14;
    v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "uniqueID", v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = -[MNAnnouncementPlanEvent initWithEvent:distance:speed:durations:]([MNAnnouncementPlanEvent alloc], "initWithEvent:distance:speed:durations:", v21, v23, a4, a5);
          if (v24)
            -[NSMutableArray addObject:](v15, "addObject:", v24);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

    v14 = v27;
    plannedEvents = v27->_plannedEvents;
    v27->_plannedEvents = v15;

    -[MNAnnouncementPlan sortEvents](v27, "sortEvents");
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MNAnnouncementPlan plannedEvents](self, "plannedEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%d events"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MNAnnouncementPlan plannedEvents](self, "plannedEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n  %@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)nextConflict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  MNAnnouncementConflict *v19;
  NSObject *v20;
  void *v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  MNAnnouncementConflict *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MNAnnouncementPlan plannedEvents](self, "plannedEvents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v9, "includeInPlan"))
        {
          if (v6)
          {
            objc_msgSend(v6, "completionDistance");
            v11 = v10;
            objc_msgSend(v9, "triggerDistance");
            v13 = v11 - v12;
            -[MNAnnouncementPlan speed](self, "speed");
            v15 = v13 / v14;
            +[MNAnnouncementPlan desiredTimeGapBetweenEvent:andEvent:](MNAnnouncementPlan, "desiredTimeGapBetweenEvent:andEvent:", v6, v9);
            if (v15 < v16)
            {
              v18 = v16;
              v19 = objc_alloc_init(MNAnnouncementConflict);
              -[MNAnnouncementConflict setFirstEvent:](v19, "setFirstEvent:", v6);
              -[MNAnnouncementConflict setSecondEvent:](v19, "setSecondEvent:", v9);
              -[MNAnnouncementConflict setTimeGap:](v19, "setTimeGap:", v15);
              -[MNAnnouncementConflict setDesiredTimeGap:](v19, "setDesiredTimeGap:", v18);
              -[MNAnnouncementConflict setAnnouncementsAreSimilar:](v19, "setAnnouncementsAreSimilar:", v18 > 0.0);
              GEOFindOrCreateLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v9, "event");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "stepIndex");
                *(_DWORD *)buf = 67109378;
                v29 = v22;
                v30 = 2112;
                v31 = v19;
                _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEBUG, "found announcement conflict in step %d: %@", buf, 0x12u);

              }
              goto LABEL_18;
            }
          }
          v17 = v9;

          v6 = v17;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (void)sortEvents
{
  -[NSMutableArray sortUsingComparator:](self->_plannedEvents, "sortUsingComparator:", &__block_literal_global_2);
}

uint64_t __32__MNAnnouncementPlan_sortEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "triggerDistance");
  v7 = v6;
  objc_msgSend(v5, "triggerDistance");
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "triggerDistance");
    v11 = v10;
    objc_msgSend(v5, "triggerDistance");
    if (v11 <= v12)
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

+ (double)desiredTimeGapBetweenEvent:(id)a3 andEvent:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "variantIndex");
  objc_msgSend(v6, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 < objc_msgSend(v8, "numChainedAnnouncements");

  objc_msgSend(v6, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "desiredTimeGapToEvent:chained:", v11, v9);
  v13 = v12;

  return v13;
}

- (NSMutableArray)plannedEvents
{
  return self->_plannedEvents;
}

- (void)setPlannedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_plannedEvents, a3);
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_plannedEvents, 0);
}

@end
