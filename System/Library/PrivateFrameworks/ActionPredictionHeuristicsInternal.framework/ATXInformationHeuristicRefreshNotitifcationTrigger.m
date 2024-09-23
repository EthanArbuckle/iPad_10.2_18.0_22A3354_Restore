@implementation ATXInformationHeuristicRefreshNotitifcationTrigger

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4
{
  return -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:coalescingInterval:](self, "initWithNotification:type:coalescingInterval:", a3, a4, 0.0);
}

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4 coalescingInterval:(double)a5
{
  id v9;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v10;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  v10 = -[ATXInformationHeuristicRefreshTrigger init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_notificationType = a4;
    objc_storeStrong((id *)&v10->_notificationName, a3);
    v11->_coalescingInterval = a5;
    -[ATXInformationHeuristicRefreshNotitifcationTrigger _createCoalescingTimer](v11, "_createCoalescingTimer");
  }

  return v11;
}

- (void)_createCoalescingTimer
{
  id v3;
  void *v4;
  _PASSimpleCoalescingTimer *v5;
  _PASSimpleCoalescingTimer *coalescingTimer;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D81618]);
  dispatch_get_global_queue(17, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__ATXInformationHeuristicRefreshNotitifcationTrigger__createCoalescingTimer__block_invoke;
  v7[3] = &unk_1E82C4900;
  objc_copyWeak(&v8, &location);
  v5 = (_PASSimpleCoalescingTimer *)objc_msgSend(v3, "initWithQueue:operation:", v4, v7);
  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __76__ATXInformationHeuristicRefreshNotitifcationTrigger__createCoalescingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerRefresh");

}

- (void)_scheduleTriggerRefresh
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescingTimer, "runAfterDelaySeconds:coalescingBehavior:", 0, self->_coalescingInterval);
}

- (void)_triggerRefresh
{
  void *v3;
  id v4;

  -[ATXInformationHeuristicRefreshTrigger delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXInformationHeuristicRefreshTrigger registeredHeuristics](self, "registeredHeuristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informationHeuristicRefreshTrigger:didTriggerRefreshForHeuristics:", self, v3);

}

- (void)_start
{
  NSObject *v3;
  NSString *notificationName;
  int64_t notificationType;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  id observerToken;
  _QWORD handler[4];
  id v15;
  int out_token;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_observerToken)
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      notificationName = self->_notificationName;
      *(_DWORD *)buf = 138412290;
      v20 = notificationName;
      _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "Starting ATXInformationHeuristicRefreshNotitifcationTrigger for %@. We will now refresh heuristics when seeing this notification.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      out_token = 0;
      v10 = -[NSString UTF8String](self->_notificationName, "UTF8String");
      dispatch_get_global_queue(9, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke_85;
      handler[3] = &unk_1E82C4950;
      objc_copyWeak(&v15, (id *)buf);
      notify_register_dispatch(v10, &out_token, v11, handler);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      observerToken = self->_observerToken;
      self->_observerToken = v12;

      objc_destroyWeak(&v15);
    }
    else if (!notificationType)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_notificationName;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke;
      v17[3] = &unk_1E82C4928;
      objc_copyWeak(&v18, (id *)buf);
      objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, 0, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_observerToken;
      self->_observerToken = v8;

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak((id *)buf);
  }
}

void __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_gi();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[4];
      v4 = 134218242;
      v5 = WeakRetained;
      v6 = 2114;
      v7 = v3;
      _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshNotitifcationTrigger (%p): Received local notification: %{public}@. Triggering heuristics refresh.", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(WeakRetained, "_scheduleTriggerRefresh");
  }

}

void __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke_85(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_gi();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[4];
      v4 = 134218242;
      v5 = WeakRetained;
      v6 = 2114;
      v7 = v3;
      _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshNotitifcationTrigger (%p): Received Darwin notification: %{public}@. Triggering heuristics refresh.", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(WeakRetained, "_scheduleTriggerRefresh");
  }

}

- (void)_stop
{
  id observerToken;
  int64_t notificationType;
  void *v5;
  id v6;

  observerToken = self->_observerToken;
  if (observerToken)
  {
    notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      notify_cancel(objc_msgSend(observerToken, "intValue"));
    }
    else if (!notificationType)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:", self->_observerToken);

    }
    v6 = self->_observerToken;
    self->_observerToken = 0;

  }
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_notificationName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_notificationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v5;
  NSString *v6;
  NSString *notificationName;
  BOOL v8;

  v4 = (ATXInformationHeuristicRefreshNotitifcationTrigger *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5->_notificationName;
      notificationName = self->_notificationName;
      v8 = (notificationName == v6 || -[NSString isEqual:](notificationName, "isEqual:", v6))
        && self->_notificationType == v5->_notificationType;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("InfoHeuristicRefreshNotitifcationTrigger for %@"), self->_notificationName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  v4 = a3;
  -[ATXInformationHeuristicRefreshTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_notificationType, CFSTR("notificationType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_notificationName, CFSTR("notificationName"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("coalescingInterval"), self->_coalescingInterval);

}

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v5;
  void *v6;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v7;
  uint64_t v9;
  uint64_t v10;
  NSString *notificationName;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationType"));
      v5->_notificationType = v9;
      if (v9 || (objc_msgSend(v4, "error"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("notificationName"), v4, 1);
        v10 = objc_claimAutoreleasedReturnValue();
        notificationName = v5->_notificationName;
        v5->_notificationName = (NSString *)v10;

        if (v5->_notificationName)
        {
          objc_msgSend(v4, "error");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("coalescingInterval"));
            v5->_coalescingInterval = v13;
            -[ATXInformationHeuristicRefreshNotitifcationTrigger _createCoalescingTimer](v5, "_createCoalescingTimer");
            v7 = v5;
            goto LABEL_4;
          }
        }
      }
      else
      {
        __atxlog_handle_gi();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithCoder:].cold.1(v4);

      }
    }
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1C99DF000, v1, v2, "ATXInformationHeuristicRefreshNotitifcationTrigger: error decoding %@ - %@", v3, v4, v5, v6, 2u);

}

@end
