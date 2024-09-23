@implementation MSPSenderLiveStrategy

- (MSPSenderLiveStrategy)initWithGroupSession:(id)a3
{
  MSPSenderLiveStrategy *v3;
  NSMutableSet *v4;
  NSMutableSet *participantsNeedingRoute;
  NSMutableDictionary *v6;
  NSMutableDictionary *tokensByHandle;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSPSenderLiveStrategy;
  v3 = -[MSPSenderIDSStrategy initWithGroupSession:](&v9, sel_initWithGroupSession_, a3);
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    participantsNeedingRoute = v3->_participantsNeedingRoute;
    v3->_participantsNeedingRoute = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tokensByHandle = v3->_tokensByHandle;
    v3->_tokensByHandle = v6;

  }
  return v3;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  double result;

  GEOConfigGetDouble();
  return result;
}

- (void)addParticipants:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSPSenderLiveStrategy;
  -[MSPSenderIDSStrategy addParticipants:](&v14, sel_addParticipants_, v4);
  -[NSMutableSet addObjectsFromArray:](self->_participantsNeedingRoute, "addObjectsFromArray:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[MSPSenderLiveStrategy _recordTokenForHandle:](self, "_recordTokenForHandle:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[MSPSenderLiveStrategy _sendInitialRouteIfNeeded](self, "_sendInitialRouteIfNeeded");
}

- (void)_recordTokenForHandle:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  MSPSenderLiveStrategy *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)IDSCopyAddressDestinationForDestination();
  v6 = (unint64_t)v4;
  v7 = v5;
  if (v6 | v7)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_tokensByHandle, "objectForKeyedSubscript:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokensByHandle, "setObject:forKeyedSubscript:", v9, v7);
      }
      MSPGetSharedTripLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = self;
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543875;
        v15 = v13;
        v16 = 2113;
        v17 = v6;
        v18 = 2113;
        v19 = v7;
        _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "[%{public}@] adding token %{private}@ for %{private}@", buf, 0x20u);

      }
      objc_msgSend(v9, "addObject:", v6);

    }
  }

}

- (void)removeParticipants:(id)a3
{
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MSPSenderLiveStrategy removeParticipant:](self, "removeParticipant:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)removeParticipant:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  BOOL v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSPSenderLiveStrategy;
  v5 = -[MSPSenderStrategy removeParticipant:](&v10, sel_removeParticipant_, v4);
  if (v5)
    -[NSMutableSet removeObject:](self->_participantsNeedingRoute, "removeObject:", v4);
  v6 = (void *)IDSCopyAddressDestinationForDestination();
  if (objc_msgSend(v4, "isEqualToString:", v6))
    v7 = -[MSPSenderLiveStrategy _removeAllTokensForParticipant:](self, "_removeAllTokensForParticipant:", v6);
  else
    v7 = -[MSPSenderLiveStrategy _removeToken:](self, "_removeToken:", v4);
  v8 = v5 | v7;

  return v8;
}

- (BOOL)_removeToken:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  MSPSenderLiveStrategy *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  MSPSenderLiveStrategy *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)IDSCopyAddressDestinationForDestination();
  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_tokensByHandle, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "containsObject:", v4))
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = self;
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543875;
        v19 = v12;
        v20 = 2113;
        v21 = v4;
        v22 = 2113;
        v23 = v5;
        _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_INFO, "[%{public}@] removing token %{private}@ for %{private}@", buf, 0x20u);

      }
      objc_msgSend(v8, "removeObject:", v4);
      -[NSMutableSet removeObject:](self->_participantsNeedingRoute, "removeObject:", v4);
      if (!objc_msgSend(v8, "count"))
      {
        MSPGetSharedTripLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = self;
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543619;
          v19 = v16;
          v20 = 2113;
          v21 = v5;
          _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_INFO, "[%{public}@] clearing token storage for %{private}@", buf, 0x16u);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokensByHandle, "setObject:forKeyedSubscript:", 0, v5);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_removeAllTokensForParticipant:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  MSPSenderLiveStrategy *v9;
  __CFString *v10;
  BOOL v11;
  void *v12;
  MSPSenderLiveStrategy *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)IDSCopyAddressDestinationForDestination();
    if (v5)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_tokensByHandle, "objectForKeyedSubscript:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        MSPGetSharedTripLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = self;
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v9);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138543619;
          v17 = v10;
          v18 = 2113;
          v19 = v5;
          _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[%{public}@] removing all tokens for %{private}@", buf, 0x16u);

        }
        -[NSMutableSet minusSet:](self->_participantsNeedingRoute, "minusSet:", v6);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokensByHandle, "setObject:forKeyedSubscript:", 0, v5);
        v11 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
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
        v17 = v14;
        v18 = 2113;
        v19 = v4;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_FAULT, "[%{public}@] unable to get handle from participant %{private}@", buf, 0x16u);

      }
    }
    v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)_setState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSPSenderLiveStrategy;
  -[MSPSenderStrategy _setState:](&v4, sel__setState_, a3);
  -[MSPSenderLiveStrategy _sendInitialRouteIfNeeded](self, "_sendInitialRouteIfNeeded");
}

- (void)_sendInitialRouteIfNeeded
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  MSPSenderLiveStrategy *v8;
  void *v9;
  NSMutableSet *participantsNeedingRoute;
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
  MSPSenderLiveStrategy *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  MSPSenderLiveStrategy *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->super.super._participants, "count")
    && -[NSMutableSet count](self->_participantsNeedingRoute, "count")
    && -[GEOSharedNavState hasRouteInfo](self->super.super._state, "hasRouteInfo"))
  {
    v3 = (void *)-[GEOSharedNavState copy](self->super.super._state, "copy");
    v4 = objc_msgSend((id)objc_opt_class(), "_validateState:forEvent:", v3, 5);
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
    {
      v35 = v3;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = self;
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        participantsNeedingRoute = self->_participantsNeedingRoute;
        v11 = v9;
        v12 = -[NSMutableSet count](participantsNeedingRoute, "count");
        v13 = self->_participantsNeedingRoute;

        *(_DWORD *)buf = 138543874;
        v42 = v9;
        v43 = 2048;
        v44 = v12;
        v45 = 2112;
        v46 = (uint64_t)v13;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Need to send route to %lu participants: %@", buf, 0x20u);

      }
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_participantsNeedingRoute, "count"));
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v14 = self->_participantsNeedingRoute;
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v37 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            -[MSPSenderIDSStrategy capabilitiesByParticipant](self, "capabilitiesByParticipant");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22)
              -[NSObject addObject:](v6, "addObject:", v19);
          }
          v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v16);
      }

      v23 = -[NSObject count](v6, "count");
      v3 = v35;
      if (v23 != -[NSMutableSet count](self->_participantsNeedingRoute, "count"))
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
          v29 = -[NSObject count](v6, "count");
          v30 = -[NSMutableSet count](self->_participantsNeedingRoute, "count");

          *(_DWORD *)buf = 138543874;
          v42 = v27;
          v43 = 2048;
          v44 = v29;
          v45 = 2048;
          v46 = v30;
          _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_INFO, "[%{public}@] only %lu/%lu participants are currently reachable for route", buf, 0x20u);

        }
      }
      if (-[NSObject count](v6, "count"))
      {
        -[NSMutableSet minusSet:](self->_participantsNeedingRoute, "minusSet:", v6);
        -[MSPSenderIDSStrategy _sendRouteUpdate:to:](self, "_sendRouteUpdate:to:", v35, v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = self;
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = -[NSMutableSet count](self->_participantsNeedingRoute, "count");
      *(_DWORD *)buf = 138543618;
      v42 = v33;
      v43 = 2048;
      v44 = v34;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Need to send route to %lu participants, but state doesn't have routeInfo", buf, 0x16u);

    }
  }
}

- (void)didFetchCapabilitiesForParticipants:(id)a3
{
  id v4;
  NSMutableSet *participantsNeedingRoute;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPSenderLiveStrategy;
  v4 = a3;
  -[MSPSenderIDSStrategy didFetchCapabilitiesForParticipants:](&v7, sel_didFetchCapabilitiesForParticipants_, v4);
  participantsNeedingRoute = self->_participantsNeedingRoute;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4, v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(participantsNeedingRoute) = -[NSMutableSet intersectsSet:](participantsNeedingRoute, "intersectsSet:", v6);
  if ((_DWORD)participantsNeedingRoute)
    -[MSPSenderLiveStrategy _sendInitialRouteIfNeeded](self, "_sendInitialRouteIfNeeded");
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return (a3 < 7) & (0x76u >> a3);
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSPSenderLiveStrategy;
  -[MSPSenderIDSStrategy _filteredParticipantsForState:event:](&v8, sel__filteredParticipantsForState_event_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "minusSet:", self->_participantsNeedingRoute);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByHandle, 0);
  objc_storeStrong((id *)&self->_participantsNeedingRoute, 0);
}

@end
