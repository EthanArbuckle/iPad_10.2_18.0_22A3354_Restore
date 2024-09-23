@implementation NWConcrete_nw_activity

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_DWORD *)self + 18) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

- (NSString)description
{
  void (**v3)(void **__return_ptr, void *);
  unfair_mutex *p_mutex;
  NSString *m_obj;
  void **v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _QWORD v12[5];
  void *__p[2];
  char v14;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__NWConcrete_nw_activity_description__block_invoke;
  v12[3] = &unk_1E14A5458;
  v12[4] = self;
  v3 = (void (**)(void **__return_ptr, void *))_Block_copy(v12);
  p_mutex = &self->description_cache.mutex;
  os_unfair_lock_lock(&self->description_cache.mutex.m_mutex);
  m_obj = self->description_cache.description.m_obj;
  if (!m_obj)
  {
    v3[2](__p, v3);
    if (v14 >= 0)
      v6 = __p;
    else
      v6 = (void **)__p[0];
    v7 = (NSString *)CFStringCreateWithCString(0, (const char *)v6, 0x8000100u);
    v8 = self->description_cache.description.m_obj;
    if ((*((_BYTE *)&self->description_cache.description + 8) & 1) != 0 && v8)
    {
      self->description_cache.description.m_obj = 0;

      v8 = self->description_cache.description.m_obj;
    }
    self->description_cache.description.m_obj = 0;

    v9 = self->description_cache.description.m_obj;
    self->description_cache.description.m_obj = v7;

    *((_BYTE *)&self->description_cache.description + 8) |= 1u;
    if (v14 < 0)
      operator delete(__p[0]);
    m_obj = self->description_cache.description.m_obj;
  }
  v10 = m_obj;
  os_unfair_lock_unlock(&p_mutex->m_mutex);

  return v10;
}

- (void).cxx_destruct
{
  NSString *m_obj;
  NWConcrete_nw_activity *v4;

  m_obj = self->description_cache.description.m_obj;
  if ((*((_BYTE *)&self->description_cache.description + 8) & 1) != 0 && m_obj)
  {
    self->description_cache.description.m_obj = 0;

    m_obj = self->description_cache.description.m_obj;
  }
  self->description_cache.description.m_obj = 0;

  v4 = self->parent.m_obj;
  if ((*((_BYTE *)&self->parent + 8) & 1) != 0 && v4)
  {
    self->parent.m_obj = 0;

    v4 = self->parent.m_obj;
  }
  self->parent.m_obj = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_activity;
  -[NWConcrete_nw_activity dealloc](&v2, sel_dealloc);
}

- (char)initWithToken:(void *)a1
{
  char *v3;
  char *v4;
  NSObject *v5;
  void *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  char *backtrace_string;
  os_log_type_t v12;
  _BOOL4 v13;
  os_log_type_t v14;
  char v15;
  os_log_type_t type;
  objc_super v17;
  uint8_t buf[4];
  _BYTE v19[18];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v17.receiver = a1;
  v17.super_class = (Class)NWConcrete_nw_activity;
  v3 = (char *)objc_msgSendSuper2(&v17, sel_init);
  v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v15 = 0;
    if (__nwlog_fault(v8, &type, &v15))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = type;
        if (os_log_type_enabled(v9, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v13 = os_log_type_enabled(v9, type);
        if (backtrace_string)
        {
          if (v13)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
            *(_WORD *)&v19[8] = 2082;
            *(_QWORD *)&v19[10] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_26;
        }
        if (v13)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        v14 = type;
        if (os_log_type_enabled(v9, type))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_26:
    if (v8)
      free(v8);
    return 0;
  }
  *(_OWORD *)(v3 + 8) = *a2;
  v3[132] |= 6u;
  if (nw_activity_should_log(v3))
  {
    if (__nwlog_activity_log::onceToken != -1)
      dispatch_once(&__nwlog_activity_log::onceToken, &__block_literal_global_15_44172);
    v5 = (id)gactivityLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)v19 = 16;
      *(_WORD *)&v19[4] = 2098;
      *(_QWORD *)&v19[6] = v4 + 8;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Create activity <nw_activity [%{public,uuid_t}.16P] (lightweight)>", buf, 0x12u);
    }

  }
  return v4;
}

@end
