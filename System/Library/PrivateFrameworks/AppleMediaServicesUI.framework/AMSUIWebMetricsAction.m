@implementation AMSUIWebMetricsAction

- (AMSUIWebMetricsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  AMSUIWebMetricsEvent *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSArray *events;
  NSArray *v31;
  void *v32;
  char v33;
  char v34;
  id v36;
  AMSUIWebMetricsAction *v37;
  NSArray *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AMSUIWebMetricsAction;
  v40 = a4;
  v37 = -[AMSUIWebAction initWithJSObject:context:](&v45, sel_initWithJSObject_context_, v6);
  if (v37)
  {
    v38 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("events"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    v36 = v6;
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      v39 = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;

          if (v14)
          {
            v15 = -[AMSUIWebMetricsEvent initWithJSObject:context:]([AMSUIWebMetricsEvent alloc], "initWithJSObject:context:", v14, v40);
            v16 = v15;
            if (v15)
            {
              -[AMSUIWebMetricsEvent account](v15, "account");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "iTunesAccountFromJSAccount:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setAccount:", v19);

                objc_msgSend(v16, "account");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v20)
                {
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "iTunesAccountFromJSDSID:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setAccount:", v22);

                }
              }
              -[NSArray addObject:](v38, "addObject:", v16);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v26, "OSLogObject");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = objc_opt_class();
                AMSLogKey();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v47 = v28;
                v48 = 2114;
                v49 = v29;
                v50 = 2112;
                v51 = v13;
                _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create metrics event from definition: %@", buf, 0x20u);

                v6 = v36;
              }

              v8 = v39;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "OSLogObject");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = objc_opt_class();
              AMSLogKey();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v47 = v24;
              v8 = v39;
              v48 = 2114;
              v49 = v25;
              v50 = 2112;
              v51 = v13;
              _os_log_impl(&dword_211102000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid metrics event: %@", buf, 0x20u);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v10);
    }

    events = v37->_events;
    v37->_events = v38;
    v31 = v38;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flush"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
      v34 = objc_msgSend(v32, "BOOLValue");
    else
      v34 = 0;
    v37->_shouldFlush = v34;

    v6 = v36;
  }

  return v37;
}

- (id)runAction
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebMetricsAction;
  v3 = -[AMSUIWebAction runAction](&v20, sel_runAction);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AMSUIWebMetricsAction events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[AMSUIWebAction context](self, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "metrics");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "enqueueEvent:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }

  if (-[AMSUIWebMetricsAction shouldFlush](self, "shouldFlush"))
  {
    -[AMSUIWebAction context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "flush");

  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BOOL)shouldFlush
{
  return self->_shouldFlush;
}

- (void)setShouldFlush:(BOOL)a3
{
  self->_shouldFlush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
