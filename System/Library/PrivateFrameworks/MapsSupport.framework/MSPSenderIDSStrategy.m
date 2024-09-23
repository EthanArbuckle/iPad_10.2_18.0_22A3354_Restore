@implementation MSPSenderIDSStrategy

- (MSPSenderIDSStrategy)initWithGroupSession:(id)a3
{
  id v5;
  MSPSenderIDSStrategy *v6;
  MSPSenderIDSStrategy *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lastETAUpdateDates;
  NSMutableDictionary *v10;
  NSMutableDictionary *participantsByCapabilities;
  NSMutableDictionary *v12;
  NSMutableDictionary *capabilitiesByParticipant;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSPSenderIDSStrategy;
  v6 = -[MSPSenderStrategy init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupSession, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastETAUpdateDates = v7->_lastETAUpdateDates;
    v7->_lastETAUpdateDates = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    participantsByCapabilities = v7->_participantsByCapabilities;
    v7->_participantsByCapabilities = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    capabilitiesByParticipant = v7->_capabilitiesByParticipant;
    v7->_capabilitiesByParticipant = v12;

  }
  return v7;
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  return (id)-[NSMutableSet copy](self->super._participants, "copy", a3, a4);
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  MSPSenderIDSStrategy *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  MSPSenderIDSStrategy *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  MSPSenderIDSStrategy *v19;
  __CFString *v20;
  NSMutableSet *participants;
  __CFString *v22;
  uint64_t v23;
  NSMutableSet *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t v39[128];
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  NSMutableSet *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MSPSenderIDSStrategy;
  if (-[MSPSenderStrategy setState:forEvent:](&v38, sel_setState_forEvent_, v6, a4))
  {
    -[MSPSenderIDSStrategy _filteredParticipantsForState:event:](self, "_filteredParticipantsForState:event:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      switch(a4)
      {
        case 0uLL:
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            if (self)
            {
              v14 = (void *)MEMORY[0x1E0CB3940];
              v15 = self;
              objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v16 = CFSTR("<nil>");
            }
            *(_DWORD *)buf = 138543362;
            v41 = v16;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_INFO, "[%{public}@] - will immediately attempt to send initial state waypoints/route", buf, 0xCu);

          }
          if (objc_msgSend((id)objc_opt_class(), "_supportsEvent:", 3))
            -[MSPSenderIDSStrategy _sendUpdatedWaypoints:to:](self, "_sendUpdatedWaypoints:to:", v6, v7);
          if (objc_msgSend((id)objc_opt_class(), "_supportsEvent:", 5))
            goto LABEL_26;
          break;
        case 1uLL:
          MSPGetSharedTripLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            if (self)
            {
              v18 = (void *)MEMORY[0x1E0CB3940];
              v19 = self;
              objc_msgSend(v18, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19);
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v20 = CFSTR("<nil>");
            }
            participants = self->super._participants;
            v22 = v20;
            v23 = -[NSMutableSet count](participants, "count");
            v24 = self->super._participants;

            *(_DWORD *)buf = 138543875;
            v41 = v20;
            v42 = 2048;
            v43 = v23;
            v44 = 2113;
            v45 = v24;
            _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "[%{public}@] - restoring state, resetting lastETAUpdateDate for %lu participants (%{private}@)", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v26 = v7;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v35 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
                -[MSPSenderIDSStrategy lastETAUpdateDates](self, "lastETAUpdateDates");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v25, v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
            }
            while (v28);
          }

          break;
        case 2uLL:
        case 4uLL:
          -[MSPSenderIDSStrategy _sendETAUpdateIfNeededTo:](self, "_sendETAUpdateIfNeededTo:", v7);
          break;
        case 3uLL:
          -[MSPSenderIDSStrategy _sendUpdatedWaypoints:to:](self, "_sendUpdatedWaypoints:to:", v6, v7);
          break;
        case 5uLL:
LABEL_26:
          -[MSPSenderIDSStrategy _sendRouteUpdate:to:](self, "_sendRouteUpdate:to:", v6, v7);
          break;
        case 6uLL:
          -[MSPSenderIDSStrategy _sendTrafficUpdate:to:](self, "_sendTrafficUpdate:to:", v6, v7);
          break;
        case 7uLL:
          -[MSPSenderIDSStrategy _sendDestinationReachedUpdate:to:](self, "_sendDestinationReachedUpdate:to:", v6, v7);
          break;
        case 8uLL:
          -[MSPSenderIDSStrategy _sendResumingToNextDestinationUpdate:to:](self, "_sendResumingToNextDestinationUpdate:to:", v6, v7);
          break;
        case 9uLL:
          -[MSPSenderIDSStrategy _sendStoppedUpdate:to:](self, "_sendStoppedUpdate:to:", v6, v7);
          break;
        default:
          break;
      }
    }
    else if (-[NSMutableSet count](self->super._participants, "count"))
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = self;
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v41 = v12;
        _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] - no participants left for event after filtering", buf, 0xCu);

      }
      v8 = 0;
      goto LABEL_38;
    }
    v8 = 1;
LABEL_38:

    goto LABEL_39;
  }
  v8 = 0;
LABEL_39:

  return v8;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return -1.0;
}

- (BOOL)_needToSendETARefreshFor:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  MSPSenderIDSStrategy *v13;
  __CFString *v14;
  BOOL v15;
  void *v16;
  MSPSenderIDSStrategy *v17;
  __CFString *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  MSPSenderIDSStrategy *v25;
  void *v26;
  MSPSenderIDSStrategy *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint32_t v34;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MSPSenderIDSStrategy lastETAUpdateDates](self, "lastETAUpdateDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_etaRefreshIntervalForState:", v7);
    if (v10 < 0.0)
    {
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          v13 = self;
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = CFSTR("<nil>");
        }
        *(_DWORD *)buf = 138543619;
        v37 = v14;
        v38 = 2113;
        v39 = v6;
        v31 = "[%{public}@] _needToSendETARefresh for %{private}@: NO, interval is < 0";
        v32 = v11;
        v33 = OS_LOG_TYPE_INFO;
        v34 = 22;
LABEL_25:
        _os_log_impl(&dword_1B39C0000, v32, v33, v31, buf, v34);

        goto LABEL_26;
      }
      goto LABEL_26;
    }
    v19 = v10;
    objc_msgSend(v9, "timeIntervalSinceNow");
    v21 = -v20;
    v22 = v19 + v20;
    MSPGetSharedTripLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v11 = v23;
    if (v22 > 0.0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (self)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = self;
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v27);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = CFSTR("<nil>");
        }
        *(_DWORD *)buf = 138544131;
        v37 = v14;
        v38 = 2113;
        v39 = v6;
        v40 = 2048;
        v41 = v21;
        v42 = 2048;
        v43 = v22;
        v31 = "[%{public}@] _needToSendETARefresh for %{private}@: NO, too soon since previous (%#.1lfs since last update"
              ", %#.1lfs to go)";
        v32 = v11;
        v33 = OS_LOG_TYPE_DEFAULT;
        v34 = 42;
        goto LABEL_25;
      }
LABEL_26:
      v15 = 0;
      goto LABEL_27;
    }
    v15 = 1;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = self;
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v25);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543875;
      v37 = v18;
      v38 = 2113;
      v39 = v6;
      v40 = 2048;
      v41 = v21;
      v28 = "[%{public}@] _needToSendETARefresh for %{private}@: YES, last update %#.1lfs ago";
      v15 = 1;
      v29 = v11;
      v30 = 32;
LABEL_22:
      _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);

    }
  }
  else
  {
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v15 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = self;
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543619;
      v37 = v18;
      v38 = 2113;
      v39 = v6;
      v28 = "[%{public}@] _needToSendETARefresh for %{private}@: YES, no ETA updates sent at all yet";
      v15 = 1;
      v29 = v11;
      v30 = 22;
      goto LABEL_22;
    }
  }
LABEL_27:

  return v15;
}

- (void)_sendETAUpdateIfNeededTo:(id)a3
{
  id v4;
  GEOSharedNavState *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  MSPSenderIDSStrategy *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  __CFString *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->super._state;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[MSPSenderIDSStrategy _needToSendETARefreshFor:state:](self, "_needToSendETARefreshFor:state:", v12, v5))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = self;
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = CFSTR("<nil>");
      }
      v17 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2048;
      v26 = v17;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] %lu participants need an ETA update", buf, 0x16u);

    }
    v18 = (void *)objc_msgSend(v6, "copy");
    -[MSPSenderIDSStrategy _sendETAUpdate:to:](self, "_sendETAUpdate:to:", v5, v18);

  }
}

- (void)addParticipants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MSPSenderIDSStrategy *v12;
  __CFString *v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[MSPSenderIDSStrategy capabilitiesByParticipant](self, "capabilitiesByParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v9);

  if (objc_msgSend(v5, "count"))
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = self;
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543875;
      v18 = v13;
      v19 = 2048;
      v20 = objc_msgSend(v5, "count");
      v21 = 2113;
      v22 = v5;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Need to fetch capabilities for %lu handles: %{private}@", buf, 0x20u);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__MSPSenderIDSStrategy_addParticipants___block_invoke;
    v15[3] = &unk_1E6651CF8;
    v15[4] = self;
    v16 = v4;
    -[MSPSenderIDSStrategy fetchCapabilitiesForParticipants:completion:](self, "fetchCapabilitiesForParticipants:completion:", v5, v15);

  }
  v14.receiver = self;
  v14.super_class = (Class)MSPSenderIDSStrategy;
  -[MSPSenderStrategy addParticipants:](&v14, sel_addParticipants_, v4);

}

void __40__MSPSenderIDSStrategy_addParticipants___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__MSPSenderIDSStrategy_addParticipants___block_invoke_2;
  v12[3] = &unk_1E6651CD0;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138543875;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    v17 = 2113;
    v18 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Did fetch capabilities for %lu handles: %{private}@", buf, 0x20u);

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didFetchCapabilitiesForParticipants:", v11);

}

void __40__MSPSenderIDSStrategy_addParticipants___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "capabilitiesByParticipant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v5);

        objc_msgSend(*(id *)(a1 + 32), "participantsByCapabilities");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(*(id *)(a1 + 32), "participantsByCapabilities");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

        }
        objc_msgSend(v14, "addObject:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__MSPSenderIDSStrategy_fetchCapabilitiesForParticipants_completion___block_invoke;
    v7[3] = &unk_1E6651D20;
    v8 = v6;
    +[MSPSharedTripReceiverCapabilities fetchReceiverCapabilitiesForDestinations:completion:](MSPSharedTripReceiverCapabilities, "fetchReceiverCapabilitiesForDestinations:completion:", v5, v7);

  }
}

uint64_t __68__MSPSenderIDSStrategy_fetchCapabilitiesForParticipants_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendCompatibleInstancesOfState:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  MSPSenderIDSStrategy *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  MSPSharedTripGroupSession *v26;
  MSPSharedTripGroupSession *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  MSPSenderIDSStrategy *v33;
  id v34;
  id v35;
  MSPSharedTripGroupSession *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    v29 = v8;
    v30 = v6;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[MSPSenderIDSStrategy capabilitiesByParticipant](self, "capabilitiesByParticipant");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            MSPGetSharedTripLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              if (self)
              {
                v18 = (void *)MEMORY[0x1E0CB3940];
                v19 = self;
                objc_msgSend(v18, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v20 = CFSTR("<nil>");
              }
              *(_DWORD *)buf = 138543619;
              v42 = v20;
              v43 = 2113;
              v44 = v14;
              _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_FAULT, "[%{public}@] have not yet fetched capabilties for %{private}@", buf, 0x16u);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v11);
    }

    -[MSPSenderIDSStrategy participantsByCapabilities](self, "participantsByCapabilities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    v23 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[MSPSenderIDSStrategy participantsByCapabilities](self, "participantsByCapabilities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    v26 = self->_groupSession;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__MSPSenderIDSStrategy__sendCompatibleInstancesOfState_to___block_invoke;
    v31[3] = &unk_1E6651D48;
    v32 = v9;
    v33 = self;
    v34 = v25;
    v6 = v30;
    v35 = v30;
    v36 = v26;
    v27 = v26;
    v28 = v25;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v31);

    v8 = v29;
  }

}

void __59__MSPSenderIDSStrategy__sendCompatibleInstancesOfState_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  __CFString *v25;
  id v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E2B350]();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "intersectSet:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v8, "count"))
  {
    v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 56), "instanceCompatibleWithReceiverCapabilities:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v5);
      }
      v12 = *(_QWORD *)(a1 + 40);
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("TO:(%@)"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_msp_logWithCategory:type:object:prefix:", 0, 1, v12, v16);

    }
    else
    {
      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 56), "instanceCompatibleWithReceiverCapabilities:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v5);
      }
      v18 = *(void **)(a1 + 64);
      objc_msgSend(v5, "idsSendMessageOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v18, "sendChunkedMessage:to:options:error:", v11, v8, v19, &v26);
      v20 = v26;

      if (v20)
      {
        MSPGetSharedTripLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = *(void **)(a1 + 40);
          if (v22)
          {
            v23 = (void *)MEMORY[0x1E0CB3940];
            v24 = v22;
            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v24);
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = CFSTR("<nil>");
          }
          *(_DWORD *)buf = 138543618;
          v28 = v25;
          v29 = 2114;
          v30 = v20;
          _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] error sending compatible state: %{public}@", buf, 0x16u);

        }
      }

    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_sendUpdatedWaypoints:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  MSPSenderIDSStrategy *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v38 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendUpdatedWaypoints", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    if (objc_msgSend(v12, "hasWaypointInfos"))
    {
      objc_msgSend(v12, "stripForSendingUpdatedWaypoints");
      v13 = objc_alloc_init(MEMORY[0x1E0D27538]);
      objc_msgSend(v12, "setSenderInfo:", v13);

      -[MSPSharedTripGroupSession initiatorDisplayName](self->_groupSession, "initiatorDisplayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "senderInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromDisplayName:", v14);

      MSPGetSharedTripLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = self;
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mspDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      if (objc_msgSend(v6, "hasEtaInfo"))
      {
        objc_msgSend(v6, "etaInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "hasEtaTimestamp");

        if (v22)
        {
          v31 = v6;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v24 = v7;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v33;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v33 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v28);
                -[MSPSenderIDSStrategy lastETAUpdateDates](self, "lastETAUpdateDates");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v23, v29);

                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            }
            while (v26);
          }

          v6 = v31;
        }
      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (void)_sendDestinationReachedUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MSPSenderIDSStrategy *v16;
  __CFString *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendDestinationReachedUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v12, "destinationWaypointInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "stripForSendingArrival");
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = self;
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("<nil>");
        }
        objc_msgSend(v12, "mspDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (void)_sendResumingToNextDestinationUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MSPSenderIDSStrategy *v16;
  __CFString *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendResumingToNextDestinationUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v12, "destinationWaypointInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "stripForSendingResuming");
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = self;
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("<nil>");
        }
        objc_msgSend(v12, "mspDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (void)_sendStoppedUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  MSPSenderIDSStrategy *v18;
  __CFString *v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendStoppedUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    if (objc_msgSend(v12, "hasGroupIdentifier") && objc_msgSend(v12, "hasClosed"))
    {
      objc_msgSend(v12, "stripForSendingStoppedSharing");
      v13 = objc_alloc_init(MEMORY[0x1E0D27538]);
      objc_msgSend(v12, "setSenderInfo:", v13);

      -[MSPSharedTripGroupSession initiatorDisplayName](self->_groupSession, "initiatorDisplayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "senderInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromDisplayName:", v14);

      MSPGetSharedTripLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = self;
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mspDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (void)_sendETAUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  MSPSenderIDSStrategy *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v33 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendETAUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    if (objc_msgSend(v12, "etaInfosCount"))
    {
      objc_msgSend(v12, "stripForSendingUpdatedETA");
      MSPGetSharedTripLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = self;
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = CFSTR("<nil>");
        }
        objc_msgSend(v12, "mspDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543619;
        v33 = v16;
        v34 = 2113;
        v35 = v17;
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_INFO, "[%{public}@] will send state %{private}@", buf, 0x16u);

      }
      v26 = v6;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v19 = v7;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v28;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v28 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23);
            -[MSPSenderIDSStrategy lastETAUpdateDates](self, "lastETAUpdateDates");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v24);

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v21);
      }

      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v19);
      v6 = v26;
    }

  }
}

- (void)_sendRouteUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MSPSenderIDSStrategy *v16;
  __CFString *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendRouteUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v12, "routeInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "stripForSendingUpdatedRoute");
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = self;
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("<nil>");
        }
        objc_msgSend(v12, "mspDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (void)_sendTrafficUpdate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MSPSenderIDSStrategy *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MSPSenderIDSStrategy *v16;
  __CFString *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = self;
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendTrafficUpdate", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v12, "routeInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "stripForSendingUpdatedTraffic");
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = self;
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("<nil>");
        }
        objc_msgSend(v12, "mspDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);

      }
      -[MSPSenderIDSStrategy _sendCompatibleInstancesOfState:to:](self, "_sendCompatibleInstancesOfState:to:", v12, v7);
    }

  }
}

- (NSMutableDictionary)lastETAUpdateDates
{
  return self->_lastETAUpdateDates;
}

- (void)setLastETAUpdateDates:(id)a3
{
  objc_storeStrong((id *)&self->_lastETAUpdateDates, a3);
}

- (NSMutableDictionary)participantsByCapabilities
{
  return self->_participantsByCapabilities;
}

- (void)setParticipantsByCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_participantsByCapabilities, a3);
}

- (NSMutableDictionary)capabilitiesByParticipant
{
  return self->_capabilitiesByParticipant;
}

- (void)setCapabilitiesByParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_capabilitiesByParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesByParticipant, 0);
  objc_storeStrong((id *)&self->_participantsByCapabilities, 0);
  objc_storeStrong((id *)&self->_lastETAUpdateDates, 0);
  objc_storeStrong((id *)&self->_groupSession, 0);
}

@end
