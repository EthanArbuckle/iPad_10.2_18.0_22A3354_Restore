@implementation MSPSenderStrategy

- (MSPSenderStrategy)init
{
  MSPSenderStrategy *v2;
  NSMutableSet *v3;
  NSMutableSet *participants;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPSenderStrategy;
  v2 = -[MSPSenderStrategy init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    participants = v2->_participants;
    v2->_participants = v3;

  }
  return v2;
}

- (void)_setState:(id)a3
{
  GEOSharedNavState *v4;
  GEOSharedNavState *state;

  v4 = (GEOSharedNavState *)objc_msgSend(a3, "copy");
  state = self->_state;
  self->_state = v4;

}

- (void)addParticipants:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MSPSenderStrategy *v7;
  __CFString *v8;
  uint8_t buf[4];
  __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543875;
    v10 = v8;
    v11 = 2048;
    v12 = objc_msgSend(v4, "count");
    v13 = 2113;
    v14 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[%{public}@] add %lu participants: %{private}@", buf, 0x20u);

  }
  -[NSMutableSet addObjectsFromArray:](self->_participants, "addObjectsFromArray:", v4);

}

- (void)removeParticipants:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  MSPSenderStrategy *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  MSPSenderStrategy *v13;
  __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 != objc_msgSend(v4, "count"))
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      if (self)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = self;
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543619;
      v17 = v10;
      v18 = 2113;
      v19 = (uint64_t)v4;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_FAULT, "[%{public}@] - found duplicate handles in array to remove: %{private}@", buf, 0x16u);

    }
  }
  if (-[NSMutableSet intersectsSet:](self->_participants, "intersectsSet:", v5))
  {
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = self;
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 138543875;
      v17 = v14;
      v18 = 2048;
      v19 = v15;
      v20 = 2113;
      v21 = v5;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_INFO, "[%{public}@] remove %lu participants: %{private}@", buf, 0x20u);

    }
    -[NSMutableSet minusSet:](self->_participants, "minusSet:", v5);
  }

}

- (BOOL)removeParticipant:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  MSPSenderStrategy *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_participants, "containsObject:", v4);
  if (v5)
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543619;
      v12 = v9;
      v13 = 2113;
      v14 = v4;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[%{public}@] remove participant: %{private}@", buf, 0x16u);

    }
    -[NSMutableSet removeObject:](self->_participants, "removeObject:", v4);
  }

  return v5;
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)_validateState:(id)a3 forEvent:(unint64_t)a4
{
  id v5;
  BOOL v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "hasGroupIdentifier"))
  {
    v6 = 1;
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if (!objc_msgSend(v5, "hasEtaInfo") || !objc_msgSend(v5, "hasWaypointInfos"))
          goto LABEL_13;
        v7 = objc_msgSend(v5, "hasTransportType");
        goto LABEL_15;
      case 5uLL:
        if (!objc_msgSend(v5, "hasRouteInfo"))
          goto LABEL_13;
        objc_msgSend(v5, "routeInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "coordinatesCount"))
        {
          objc_msgSend(v5, "routeInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v9, "routingPathLegsCount") != 0;

        }
        break;
      case 7uLL:
        v7 = objc_msgSend(v5, "hasArrived");
        goto LABEL_15;
      case 8uLL:
        if (!objc_msgSend(v5, "hasEtaInfo"))
          goto LABEL_13;
        v7 = objc_msgSend(v5, "hasWaypointInfos");
        goto LABEL_15;
      case 9uLL:
        v7 = objc_msgSend(v5, "hasClosed");
LABEL_15:
        v6 = v7;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_13:
    v6 = 0;
  }

  return v6;
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  MSPSenderStrategy *v9;
  __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  MSPSenderStrategy *v14;
  __CFString *v15;
  const __CFString *v16;
  BOOL v17;
  uint64_t v18;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "_supportsEvent:", a4))
  {
LABEL_16:
    v17 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_validateState:forEvent:", v6, a4) & 1) == 0)
  {
    MSPGetSharedTripLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = self;
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v14);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = CFSTR("<nil>");
      }
      if (a4 > 9)
        v16 = CFSTR("(none)");
      else
        v16 = off_1E6651D68[a4];
      *(_DWORD *)buf = 138543875;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2113;
      v25 = (uint64_t)v6;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@: incoming state failed validation: %{private}@", buf, 0x20u);

    }
    goto LABEL_16;
  }
  if (-[NSMutableSet count](self->_participants, "count"))
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = self;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (a4 > 9)
        v11 = CFSTR("(none)");
      else
        v11 = off_1E6651D68[a4];
      v18 = -[NSMutableSet count](self->_participants, "count");
      *(_DWORD *)buf = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2048;
      v25 = v18;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ (%lu participants)", buf, 0x20u);

    }
  }
  -[MSPSenderStrategy _setState:](self, "_setState:", v6);
  v17 = 1;
LABEL_21:

  return v17;
}

- (NSSet)participants
{
  return &self->_participants->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
