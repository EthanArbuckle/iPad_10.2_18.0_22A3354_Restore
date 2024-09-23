@implementation NWAccumulatorOverrideState

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)name
{
  return self->_name;
}

- (NWAccumulatorOverrideState)init
{
  NWAccumulatorOverrideState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWAccumulatorOverrideState;
  result = -[NWAccumulatorOverrideState init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NWAccumulatorOverrideState name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulatorOverrideState state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<NWAccumulatorOverrideState %@, state: %@>"), v4, v5);

  return v6;
}

- (void)updateWithState:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  char *backtrace_string;
  _BOOL4 v14;
  _QWORD v15[6];
  char v16;
  os_log_type_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    p_lock = &self->_lock;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__NWAccumulatorOverrideState_updateWithState___block_invoke;
    v15[3] = &unk_1E14ACE68;
    v15[4] = self;
    v7 = v4;
    v15[5] = v7;
    os_unfair_lock_lock(p_lock);
    __46__NWAccumulatorOverrideState_updateWithState___block_invoke((uint64_t)v15);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_3;
  }
  __nwlog_obj();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWAccumulatorOverrideState updateWithState:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  v17 = OS_LOG_TYPE_ERROR;
  v16 = 0;
  if (__nwlog_fault(v9, &v17, &v16))
  {
    if (v17 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v17;
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v10, v11, v12, buf, 0xCu);
      }
    }
    else
    {
      if (v16)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v17;
        v14 = os_log_type_enabled(v10, v17);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            v19 = "-[NWAccumulatorOverrideState updateWithState:]";
            v20 = 2082;
            v21 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s called with null state, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v14)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v17;
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWAccumulatorOverrideState updateWithState:]";
        v12 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v9)
    free(v9);
LABEL_3:

}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

void __46__NWAccumulatorOverrideState_updateWithState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

@end
