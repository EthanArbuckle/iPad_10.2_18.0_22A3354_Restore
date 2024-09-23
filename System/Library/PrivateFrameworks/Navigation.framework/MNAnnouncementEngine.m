@implementation MNAnnouncementEngine

- (void)planForEvents:(id)a3 distance:(double)a4 speed:(double)a5 previousEvent:(id)a6 timeSinceLastEvent:(double)a7 durations:(id)a8
{
  id v15;
  id v16;
  id v17;
  MNAnnouncementPlan *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  double v35;
  int v36;
  double v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a8;
  objc_storeStrong((id *)&self->_events, a3);
  self->_distance = a4;
  self->_speed = a5;
  objc_storeStrong((id *)&self->_durations, a8);
  v18 = -[MNAnnouncementPlan initWithEvents:distance:speed:durations:]([MNAnnouncementPlan alloc], "initWithEvents:distance:speed:durations:", v15, v17, a4, a5);
  -[MNAnnouncementEngine setPlan:](self, "setPlan:", v18);

  if (v16)
  {
    -[MNAnnouncementEngine plan](self, "plan");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "plannedEvents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (a7 > 0.0)
    {
      if (v21)
      {
        -[MNAnnouncementEngine plan](self, "plan");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "plannedEvents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = objc_claimAutoreleasedReturnValue();

        +[MNAnnouncementPlan desiredTimeGapBetweenEvent:andEvent:](MNAnnouncementPlan, "desiredTimeGapBetweenEvent:andEvent:", v16, v24);
        if (v25 > a7)
        {
          v31 = v25;
          -[MNAnnouncementEngine _canDelayEvent:](self, "_canDelayEvent:", v24);
          v33 = v32;
          -[NSObject setTriggerDistance:](v24, "setTriggerDistance:", 0.0);
          GetAudioLogForMNAnnouncementEngineCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v35 = v31 - a7;
            if (v31 - a7 >= v33)
              v35 = v33;
            v36 = 134218243;
            v37 = v35;
            v38 = 2113;
            v39 = v24;
            _os_log_impl(&dword_1B0AD7000, v34, OS_LOG_TYPE_DEBUG, "ⓐ Delaying event %.2f seconds due to recent announcement: %{private}@", (uint8_t *)&v36, 0x16u);
          }

LABEL_24:
          goto LABEL_25;
        }

      }
    }
  }
  -[MNAnnouncementEngine plan](self, "plan");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "nextConflict");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = -100;
    do
    {
      if (!v28)
      {

        goto LABEL_17;
      }
      if (!-[MNAnnouncementEngine _advanceToResolveConflict:](self, "_advanceToResolveConflict:", v27)
        || !-[MNAnnouncementEngine _delayToResolveConflict:](self, "_delayToResolveConflict:", v27)
        || !-[MNAnnouncementEngine _compressToResolveConflict:](self, "_compressToResolveConflict:", v27))
      {
        -[MNAnnouncementEngine _dropToResolveConflict:](self, "_dropToResolveConflict:", v27);
      }
      -[MNAnnouncementEngine plan](self, "plan");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "nextConflict");
      v30 = objc_claimAutoreleasedReturnValue();

      ++v28;
      v27 = (void *)v30;
    }
    while (v30);
    if (v28)
      goto LABEL_25;
LABEL_17:
    GetAudioLogForMNAnnouncementEngineCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "⒜ Infinite loop in resolving guidance event conflicts", (uint8_t *)&v36, 2u);
    }
    goto LABEL_24;
  }
LABEL_25:

}

- (id)nextEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double distance;
  double v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MNAnnouncementEngine plan](self, "plan", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plannedEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "includeInPlan"))
        {
          distance = self->_distance;
          objc_msgSend(v9, "triggerDistance");
          if (distance <= v11)
          {
            v12 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)_advanceToResolveConflict:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double speed;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  int v23;
  double v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "announcementsAreSimilar") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "desiredTimeGap");
    v7 = v6;
    objc_msgSend(v4, "timeGap");
    v9 = v7 - v8 + 1.0;
    objc_msgSend(v4, "firstEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNAnnouncementEngine _canAdvanceEvent:](self, "_canAdvanceEvent:", v10);
    v12 = v11;

    if (v9 >= v12)
      v13 = v12;
    else
      v13 = v9;
    if (v13 > 0.0)
    {
      speed = self->_speed;
      v15 = v12 * speed;
      v16 = v13 * (speed + 5.0);
      if (v15 >= v16)
        v17 = v16;
      else
        v17 = v15;
      objc_msgSend(v4, "firstEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "triggerDistance");
      objc_msgSend(v18, "setTriggerDistance:", v19 + v17);

      GetAudioLogForMNAnnouncementEngineCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "firstEvent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 134218243;
        v24 = v13;
        v25 = 2113;
        v26 = v21;
        _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEBUG, "ⓐ Advancing first event %.2f seconds : %{private}@", (uint8_t *)&v23, 0x16u);

      }
    }
    v5 = v12 >= v9;
  }

  return v5;
}

- (double)_canAdvanceEvent:(id)a3
{
  id v4;
  double distance;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v4 = a3;
  distance = self->_distance;
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startValidDistance");
  v8 = v7;

  if (distance < v8)
    v8 = distance;
  objc_msgSend(v4, "triggerDistance");
  v10 = (v8 - v9) / self->_speed;
  -[MNAnnouncementEngine plan](self, "plan");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "plannedEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v4);

  if (v13 >= 1)
  {
    v14 = v13 + 1;
    while (1)
    {
      -[MNAnnouncementEngine plan](self, "plan");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "plannedEvents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v14 - 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "includeInPlan"))
      {
        objc_msgSend(v17, "event");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "announcements");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
          break;
      }

      if ((unint64_t)--v14 <= 1)
        goto LABEL_13;
    }
    if (v17)
    {
      objc_msgSend(v17, "completionDistance");
      v22 = v21;
      objc_msgSend(v4, "triggerDistance");
      v24 = (v22 - v23) / self->_speed;
      +[MNAnnouncementPlan desiredTimeGapBetweenEvent:andEvent:](MNAnnouncementPlan, "desiredTimeGapBetweenEvent:andEvent:", v17, v4);
      v26 = v24 - v25;
      if (v26 < v10)
        v10 = v26;

    }
  }
LABEL_13:

  return fmax(v10, 0.0);
}

- (BOOL)_delayToResolveConflict:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double speed;
  double v51;
  NSObject *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  NSObject *v58;
  void *v60;
  int v62;
  double v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "announcementsAreSimilar") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "firstEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startValidDistance");
    v9 = v8;
    objc_msgSend(v4, "firstEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endValidDistance");
    v13 = v9 - v12;

    objc_msgSend(v4, "secondEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startValidDistance");
    v17 = v16;
    objc_msgSend(v4, "secondEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "event");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endValidDistance");
    v21 = v17 - v20;

    if (v13 <= v21 + 300.0)
      goto LABEL_9;
    objc_msgSend(v4, "secondEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "announcementDurations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    objc_msgSend(v4, "secondEvent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "triggerDistance");
    v29 = v28;
    objc_msgSend(v4, "firstEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "triggerDistance");
    v32 = (v29 - v31) * self->_speed;

    objc_msgSend(v4, "desiredTimeGap");
    v34 = v26 + v32 + v33;
    objc_msgSend(v4, "secondEvent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setIncludeInPlan:", 0);

    objc_msgSend(v4, "firstEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNAnnouncementEngine _canDelayEvent:](self, "_canDelayEvent:", v36);
    v38 = v37;

    objc_msgSend(v4, "secondEvent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setIncludeInPlan:", 1);

    if (v34 <= 0.0 || v38 < v34)
    {
LABEL_9:
      objc_msgSend(v4, "desiredTimeGap");
      v42 = v41;
      objc_msgSend(v4, "timeGap");
      v44 = v42 - v43;
      objc_msgSend(v4, "secondEvent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNAnnouncementEngine _canDelayEvent:](self, "_canDelayEvent:", v45);
      v47 = v46;

      if (v44 >= v47)
        v48 = v47;
      else
        v48 = v44;
      if (v48 > 0.0)
      {
        objc_msgSend(v4, "secondEvent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        speed = self->_speed;
        objc_msgSend(v49, "triggerDistance");
        objc_msgSend(v49, "setTriggerDistance:", v51 - v48 * speed);

        GetAudioLogForMNAnnouncementEngineCategory();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "secondEvent");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 134218243;
          v63 = v48;
          v64 = 2113;
          v65 = v53;
          _os_log_impl(&dword_1B0AD7000, v52, OS_LOG_TYPE_DEBUG, "ⓐ Delaying second event %.2f seconds : %{private}@", (uint8_t *)&v62, 0x16u);

        }
      }
      v5 = v47 >= v44;
    }
    else
    {
      objc_msgSend(v4, "firstEvent");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = self->_speed;
      objc_msgSend(v54, "triggerDistance");
      objc_msgSend(v54, "setTriggerDistance:", v56 - v34 * v55);

      -[MNAnnouncementEngine plan](self, "plan");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "sortEvents");

      GetAudioLogForMNAnnouncementEngineCategory();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "firstEvent");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 134218243;
        v63 = v34;
        v64 = 2113;
        v65 = v60;
        _os_log_impl(&dword_1B0AD7000, v58, OS_LOG_TYPE_DEBUG, "ⓐ Delaying first event %.2f seconds : %{private}@", (uint8_t *)&v62, 0x16u);

      }
      v5 = 1;
    }
  }

  return v5;
}

- (double)_canDelayEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v4 = a3;
  objc_msgSend(v4, "completionDistance");
  v6 = v5;
  objc_msgSend(v4, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endValidDistance");
  v9 = v6 - v8;

  v10 = v9 / self->_speed;
  -[MNAnnouncementEngine plan](self, "plan");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "plannedEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v4);

  for (i = v13 + 1; ; ++i)
  {
    -[MNAnnouncementEngine plan](self, "plan");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "plannedEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (i >= v17)
      break;
    -[MNAnnouncementEngine plan](self, "plan");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "plannedEvents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "includeInPlan"))
    {
      objc_msgSend(v20, "event");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "announcements");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        if (v20)
        {
          objc_msgSend(v4, "completionDistance");
          v25 = v24;
          objc_msgSend(v20, "triggerDistance");
          v27 = (v25 - v26) / self->_speed;
          +[MNAnnouncementPlan desiredTimeGapBetweenEvent:andEvent:](MNAnnouncementPlan, "desiredTimeGapBetweenEvent:andEvent:", v4, v20);
          v29 = v27 - v28;
          if (v29 < v10)
            v10 = v29;

        }
        break;
      }
    }

  }
  return fmax(v10, 0.0);
}

- (BOOL)_compressToResolveConflict:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  __int128 v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  NSObject *v59;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "announcementsAreSimilar") & 1) != 0)
  {
    v5 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v4, "desiredTimeGap");
  v7 = v6;
  objc_msgSend(v4, "timeGap");
  v9 = v7 - v8;
  objc_msgSend(v4, "firstEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "triggerDistanceForSpeed:andDuration:", &__block_literal_global_3, self->_speed);
  v14 = v13;
  objc_msgSend(v11, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "triggerDistanceForSpeed:andDuration:", &__block_literal_global_4, self->_speed);
  v17 = v16;

  v19 = 0.0;
  if (v9 <= 0.0)
    goto LABEL_23;
  *(_QWORD *)&v18 = 138477827;
  v61 = v18;
  while (1)
  {
    v20 = v10;
    v21 = v20;
    if (v14 >= v17)
      goto LABEL_17;
    v22 = objc_msgSend(v20, "variantIndex") + 1;
    objc_msgSend(v21, "announcementDurations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v22 == v24)
    {
LABEL_7:
      v25 = v11;

      v21 = v25;
      goto LABEL_17;
    }
    v26 = objc_msgSend(v11, "variantIndex") + 1;
    objc_msgSend(v11, "announcementDurations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v26 != v28)
    {
      v29 = 1.0;
      v30 = 1.0;
      if (objc_msgSend(v21, "variantIndex"))
      {
        objc_msgSend(v21, "announcementDurations");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;
        objc_msgSend(v21, "announcementDurations");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v30 = v34 / v37;

      }
      if (objc_msgSend(v11, "variantIndex", v61))
      {
        objc_msgSend(v11, "announcementDurations");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", objc_msgSend(v11, "variantIndex"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;
        objc_msgSend(v11, "announcementDurations");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleValue");
        v29 = v41 / v44;

      }
      if (v30 == v29)
      {
        objc_msgSend(v21, "event");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "event");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "comparePriority:", v46);

        if (v47 == -1)
          goto LABEL_7;
      }
      else if (v30 < v29)
      {
        goto LABEL_7;
      }
    }
LABEL_17:
    v48 = objc_msgSend(v21, "variantIndex", v61) + 1;
    objc_msgSend(v21, "announcementDurations");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (v48 >= v50)
      break;
    objc_msgSend(v21, "announcementDurations");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v54 = v53;
    objc_msgSend(v21, "announcementDurations");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex") + 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    v58 = v57;

    objc_msgSend(v21, "setVariantIndex:", objc_msgSend(v21, "variantIndex") + 1);
    GetAudioLogForMNAnnouncementEngineCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v61;
      v63 = v21;
      _os_log_impl(&dword_1B0AD7000, v59, OS_LOG_TYPE_DEBUG, "ⓐ Compressing event : %{private}@", buf, 0xCu);
    }
    v19 = v19 + v54 - v58;

    if (v19 >= v9)
      goto LABEL_23;
  }

LABEL_23:
  v5 = v19 >= v9;

LABEL_24:
  return v5;
}

double __51__MNAnnouncementEngine__compressToResolveConflict___block_invoke()
{
  return 1.0;
}

double __51__MNAnnouncementEngine__compressToResolveConflict___block_invoke_2()
{
  return 10.0;
}

- (void)_dropToResolveConflict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double speed;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  double (*v23)(uint64_t);
  void *v24;
  MNAnnouncementEngine *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GetAudioLogForMNAnnouncementEngineCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "firstEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v28 = v8;
    v29 = 2113;
    v30 = v9;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓐ Comparing events : %{private}@, %{private}@", buf, 0x16u);

  }
  objc_msgSend(v4, "firstEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "comparePriority:", v13);

  if (v14 == -1)
  {
    objc_msgSend(v4, "secondEvent");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstEvent");
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
    v5 = (void *)v15;
  }
  objc_msgSend(v5, "setIncludeInPlan:", 0);
  objc_msgSend(v6, "setVariantIndex:", 0);
  objc_msgSend(v6, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  speed = self->_speed;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __47__MNAnnouncementEngine__dropToResolveConflict___block_invoke;
  v24 = &unk_1E61D1C90;
  v25 = self;
  v19 = v6;
  v26 = v19;
  objc_msgSend(v17, "triggerDistanceForSpeed:andDuration:", &v21, speed);
  objc_msgSend(v19, "setTriggerDistance:", v21, v22, v23, v24, v25);

  GetAudioLogForMNAnnouncementEngineCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v28 = v5;
    _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEBUG, "ⓐ Dropping event : %{private}@", buf, 0xCu);
  }

}

double __47__MNAnnouncementEngine__dropToResolveConflict___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (MNAnnouncementPlan)plan
{
  return self->_plan;
}

- (void)setPlan:(id)a3
{
  objc_storeStrong((id *)&self->_plan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
