@implementation IDSQuickSwitchAcknowledgementTracker

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_delegateIdentifiersMutex);
  v3.receiver = self;
  v3.super_class = (Class)IDSQuickSwitchAcknowledgementTracker;
  -[IDSQuickSwitchAcknowledgementTracker dealloc](&v3, sel_dealloc);
}

- (IDSQuickSwitchAcknowledgementTracker)init
{
  NSObject *v3;
  IDSQuickSwitchAcknowledgementTracker *v4;
  IDSQuickSwitchAcknowledgementTracker *v5;
  NSMutableSet *v6;
  NSMutableSet *delegateIdentifiers;
  objc_super v9;

  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "watchPairing");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSQuickSwitchAcknowledgementTracker;
    v5 = -[IDSQuickSwitchAcknowledgementTracker init](&v9, sel_init);
    if (v5)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      delegateIdentifiers = v5->_delegateIdentifiers;
      v5->_delegateIdentifiers = v6;

      pthread_mutex_init(&v5->_delegateIdentifiersMutex, 0);
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateIdentifiers, 0);
}

- (BOOL)isAwaitingAcknowledgement
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -86;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19074FA78;
  v4[3] = &unk_1E2C62C08;
  v4[4] = &v5;
  -[IDSQuickSwitchAcknowledgementTracker _accessDelegateIdentifiersInCriticalSectionWithBlock:](self, "_accessDelegateIdentifiersInCriticalSectionWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)awaitAcknowledgementFromServiceDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "watchPairing");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v13 = (id)objc_opt_class();
    v14 = 2080;
    v15 = "-[IDSQuickSwitchAcknowledgementTracker awaitAcknowledgementFromServiceDelegate:]";
    v16 = 2112;
    v17 = v4;
    v6 = v13;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s  (serviceDelegate: %@)", buf, 0x20u);

  }
  if (v4)
  {
    -[IDSQuickSwitchAcknowledgementTracker identifierForServiceDelegate:](self, "identifierForServiceDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_19074FC0C;
    v10[3] = &unk_1E2C62C30;
    v8 = v7;
    v11 = v8;
    -[IDSQuickSwitchAcknowledgementTracker _accessDelegateIdentifiersInCriticalSectionWithBlock:](self, "_accessDelegateIdentifiersInCriticalSectionWithBlock:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)identifierForServiceDelegate:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "watchPairing");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v11 = (id)objc_opt_class();
    v12 = 2080;
    v13 = "-[IDSQuickSwitchAcknowledgementTracker identifierForServiceDelegate:]";
    v14 = 2112;
    v15 = v3;
    v5 = v11;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s  (serviceDelegate: %@)", buf, 0x20u);

  }
  if (v3)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%p)"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "watchPairing");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v10 = (id)objc_opt_class();
    v11 = 2080;
    v12 = "-[IDSQuickSwitchAcknowledgementTracker stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier:]";
    v13 = 2112;
    v14 = v4;
    v6 = v10;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s  (delegateIdentifier: %@)", buf, 0x20u);

  }
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_19074FF90;
    v7[3] = &unk_1E2C62C30;
    v8 = v4;
    -[IDSQuickSwitchAcknowledgementTracker _accessDelegateIdentifiersInCriticalSectionWithBlock:](self, "_accessDelegateIdentifiersInCriticalSectionWithBlock:", v7);

  }
}

- (void)stopAwaitingAcknowledgementFromAllServiceDelegates
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "watchPairing");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = (id)objc_opt_class();
    v7 = 2080;
    v8 = "-[IDSQuickSwitchAcknowledgementTracker stopAwaitingAcknowledgementFromAllServiceDelegates]";
    v4 = v6;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v5, 0x16u);

  }
  -[IDSQuickSwitchAcknowledgementTracker _accessDelegateIdentifiersInCriticalSectionWithBlock:](self, "_accessDelegateIdentifiersInCriticalSectionWithBlock:", &unk_1E2C5FA50);
}

- (void)_accessDelegateIdentifiersInCriticalSectionWithBlock:(id)a3
{
  _opaque_pthread_mutex_t *p_delegateIdentifiersMutex;
  void (**v5)(id, NSMutableSet *);

  p_delegateIdentifiersMutex = &self->_delegateIdentifiersMutex;
  v5 = (void (**)(id, NSMutableSet *))a3;
  pthread_mutex_lock(p_delegateIdentifiersMutex);
  v5[2](v5, self->_delegateIdentifiers);

  pthread_mutex_unlock(p_delegateIdentifiersMutex);
}

@end
