@implementation ATXHeuristicCacheNotificationExpirer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (unint64_t)hash
{
  _BOOL8 isLocal;

  isLocal = self->_isLocal;
  return -[NSString hash](self->_notificationName, "hash") - isLocal + 32 * isLocal;
}

- (void)_stop
{
  id token;
  id v4;

  token = self->_token;
  if (token)
  {
    if (self->_isLocal)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:", self->_token);

    }
    else
    {
      notify_cancel(objc_msgSend(token, "intValue"));
    }
  }
}

- (id)initLocal:(id)a3
{
  id v6;
  ATXHeuristicCacheNotificationExpirer *v7;
  ATXHeuristicCacheNotificationExpirer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicResultCache.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationName"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  v7 = -[ATXHeuristicCacheExpirer init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    v8->_isLocal = 1;
  }

  return v8;
}

- (id)initDarwin:(id)a3
{
  id v6;
  ATXHeuristicCacheNotificationExpirer *v7;
  ATXHeuristicCacheNotificationExpirer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicResultCache.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationName"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  v7 = -[ATXHeuristicCacheExpirer init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    v8->_isLocal = 0;
  }

  return v8;
}

- (void)_start
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "Starting ATXHeuristicCacheNotificationExpirer for %@. We will now expire heuristics for this notification.", (uint8_t *)&v3, 0xCu);
}

void __46__ATXHeuristicCacheNotificationExpirer__start__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_heuristic();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[10];
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_DEFAULT, "Received local notification: %@. Expiring heuristics.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "expire");
  }

}

void __46__ATXHeuristicCacheNotificationExpirer__start__block_invoke_66(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_heuristic();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[10];
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_DEFAULT, "Received Darwin notification: %@. Expiring heuristics.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "expire");
  }

}

- (BOOL)isEqual:(id)a3
{
  ATXHeuristicCacheNotificationExpirer *v4;
  ATXHeuristicCacheNotificationExpirer *v5;
  NSString *notificationName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;

  v4 = (ATXHeuristicCacheNotificationExpirer *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      notificationName = self->_notificationName;
      v7 = v5->_notificationName;
      if (notificationName == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = notificationName;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v11 = self->_isLocal == v5->_isLocal;
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *notificationName;
  id v5;

  notificationName = self->_notificationName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", notificationName, CFSTR("notificationName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocal, CFSTR("isLocal"));

}

- (ATXHeuristicCacheNotificationExpirer)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicCacheNotificationExpirer *v5;
  uint64_t v6;
  NSString *notificationName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  v5 = -[ATXHeuristicCacheExpirer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationName"));
    v6 = objc_claimAutoreleasedReturnValue();
    notificationName = v5->_notificationName;
    v5->_notificationName = (NSString *)v6;

    v5->_isLocal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocal"));
  }

  return v5;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_isLocal)
    v4 = "local";
  else
    v4 = "darwin";
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<expire after %s notification %@ (watching: %i)>"), v4, self->_notificationName, self->_token != 0);
}

@end
