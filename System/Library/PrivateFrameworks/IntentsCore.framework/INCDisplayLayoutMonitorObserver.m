@implementation INCDisplayLayoutMonitorObserver

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

- (void)updateDisplayLayout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_handler)
  {
    v5 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[INCDisplayLayoutMonitorObserver updateDisplayLayout:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1B727D000, v5, OS_LOG_TYPE_INFO, "%s Layout changed to: %@", buf, 0x16u);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "elements", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "_intents_isExpectedElement"))
            v9 |= objc_msgSend(v12, "_intents_isSiri");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    (*((void (**)(void))self->_handler + 2))();
  }

}

- (id)handler
{
  return self->_handler;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
