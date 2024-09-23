@implementation MSPSenderMinimalStrategy

- (MSPSenderMinimalStrategy)initWithGroupSession:(id)a3
{
  MSPSenderMinimalStrategy *v3;
  NSMutableSet *v4;
  NSMutableSet *participantsNeedingInitialState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  v3 = -[MSPSenderIDSStrategy initWithGroupSession:](&v7, sel_initWithGroupSession_, a3);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    participantsNeedingInitialState = v3->_participantsNeedingInitialState;
    v3->_participantsNeedingInitialState = v4;

  }
  return v3;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "etaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "etaTimestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceNow");
  GEOConfigGetDouble();
  GEOConfigGetDouble();
  v7 = v6;

  return v7;
}

- (void)_setState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSPSenderMinimalStrategy;
  -[MSPSenderStrategy _setState:](&v4, sel__setState_, a3);
  -[MSPSenderMinimalStrategy _sendInitialStateIfNeeded](self, "_sendInitialStateIfNeeded");
}

- (void)_sendInitialStateIfNeeded
{
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  MSPSenderMinimalStrategy *v8;
  void *v9;
  NSMutableSet *participantsNeedingInitialState;
  id v11;
  uint64_t v12;
  NSMutableSet *v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  MSPSenderMinimalStrategy *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  MSPSenderMinimalStrategy *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->super.super._participants, "count")
    && -[NSMutableSet count](self->_participantsNeedingInitialState, "count"))
  {
    v3 = (void *)-[GEOSharedNavState copy](self->super.super._state, "copy");
    v4 = objc_msgSend((id)objc_opt_class(), "_validateState:forEvent:", v3, 3);
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if ((v4 & 1) != 0)
    {
      v39 = v3;
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = self;
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        participantsNeedingInitialState = self->_participantsNeedingInitialState;
        v11 = v9;
        v12 = -[NSMutableSet count](participantsNeedingInitialState, "count");
        v13 = self->_participantsNeedingInitialState;

        *(_DWORD *)buf = 138543875;
        v46 = v9;
        v47 = 2048;
        v48 = v12;
        v49 = 2113;
        v50 = (__CFString *)v13;
        _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Need to send initial state to %lu participants: %{private}@", buf, 0x20u);

      }
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_participantsNeedingInitialState, "count"));
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v14 = self->_participantsNeedingInitialState;
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            -[MSPSenderIDSStrategy capabilitiesByParticipant](self, "capabilitiesByParticipant");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22)
              -[NSObject addObject:](v5, "addObject:", v19);
          }
          v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v16);
      }

      v23 = -[NSObject count](v5, "count");
      v3 = v39;
      if (v23 != -[NSMutableSet count](self->_participantsNeedingInitialState, "count"))
      {
        MSPGetSharedTripLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = self;
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v27;
          v29 = -[NSObject count](v5, "count");
          v30 = -[NSMutableSet count](self->_participantsNeedingInitialState, "count");

          *(_DWORD *)buf = 138543874;
          v46 = v27;
          v47 = 2048;
          v48 = v29;
          v49 = 2048;
          v50 = (__CFString *)v30;
          _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_INFO, "[%{public}@] only %lu/%lu participants are currently reachable for initial state", buf, 0x20u);

        }
      }
      if (-[NSObject count](v5, "count"))
      {
        -[NSMutableSet minusSet:](self->_participantsNeedingInitialState, "minusSet:", v5);
        -[MSPSenderIDSStrategy _sendUpdatedWaypoints:to:](self, "_sendUpdatedWaypoints:to:", v39, v5);
      }
    }
    else if (v6)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = self;
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = -[NSMutableSet count](self->_participantsNeedingInitialState, "count");
      if (objc_msgSend(v3, "waypointInfosCount"))
        v35 = CFSTR("YES");
      else
        v35 = CFSTR("NO");
      v36 = v35;
      if (objc_msgSend(v3, "etaInfosCount"))
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      v38 = v37;
      *(_DWORD *)buf = 138544130;
      v46 = v33;
      v47 = 2048;
      v48 = v34;
      v49 = 2114;
      v50 = v36;
      v51 = 2114;
      v52 = v38;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Need to send initial state to %lu participants, but initial state isn't ready (hasWaypoints: %{public}@, hasETAInfos: %{public}@)", buf, 0x2Au);

    }
  }
}

- (void)addParticipants:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSPSenderMinimalStrategy;
  v4 = a3;
  -[MSPSenderIDSStrategy addParticipants:](&v5, sel_addParticipants_, v4);
  -[NSMutableSet addObjectsFromArray:](self->_participantsNeedingInitialState, "addObjectsFromArray:", v4, v5.receiver, v5.super_class);

  -[MSPSenderMinimalStrategy _sendInitialStateIfNeeded](self, "_sendInitialStateIfNeeded");
}

- (void)removeParticipants:(id)a3
{
  id v4;
  NSMutableSet *participantsNeedingInitialState;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  v4 = a3;
  -[MSPSenderStrategy removeParticipants:](&v7, sel_removeParticipants_, v4);
  participantsNeedingInitialState = self->_participantsNeedingInitialState;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet minusSet:](participantsNeedingInitialState, "minusSet:", v6);
}

- (BOOL)removeParticipant:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  v5 = -[MSPSenderStrategy removeParticipant:](&v7, sel_removeParticipant_, v4);
  if (v5)
    -[NSMutableSet removeObject:](self->_participantsNeedingInitialState, "removeObject:", v4);

  return v5;
}

- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  MSPSenderMinimalStrategy *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_supportsEvent:", 9)
    && -[NSMutableSet containsObject:](self->super.super._participants, "containsObject:", v6))
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = self;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[%{public}@] will remove and send stopped with reason: %lu", buf, 0x16u);

    }
    v11 = (void *)-[GEOSharedNavState copy](self->super.super._state, "copy");
    objc_msgSend(v11, "setClosed:", 1);
    objc_msgSend(v11, "setClosureReason:", a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "setClosedTimestamp:");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSenderIDSStrategy _sendStoppedUpdate:to:](self, "_sendStoppedUpdate:to:", v11, v12);

  }
  v13 = -[MSPSenderMinimalStrategy removeParticipant:](self, "removeParticipant:", v6);

  return v13;
}

- (void)didFetchCapabilitiesForParticipants:(id)a3
{
  id v4;
  NSMutableSet *participantsNeedingInitialState;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMinimalStrategy;
  v4 = a3;
  -[MSPSenderIDSStrategy didFetchCapabilitiesForParticipants:](&v7, sel_didFetchCapabilitiesForParticipants_, v4);
  participantsNeedingInitialState = self->_participantsNeedingInitialState;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(participantsNeedingInitialState) = -[NSMutableSet intersectsSet:](participantsNeedingInitialState, "intersectsSet:", v6);
  if ((_DWORD)participantsNeedingInitialState)
    -[MSPSenderMinimalStrategy _sendInitialStateIfNeeded](self, "_sendInitialStateIfNeeded");
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return (a3 < 0xA) & (0x38Fu >> a3);
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSPSenderMinimalStrategy;
  -[MSPSenderIDSStrategy _filteredParticipantsForState:event:](&v8, sel__filteredParticipantsForState_event_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "minusSet:", self->_participantsNeedingInitialState);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsNeedingInitialState, 0);
}

@end
