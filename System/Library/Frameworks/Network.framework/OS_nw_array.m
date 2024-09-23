@implementation OS_nw_array

- (void)dealloc
{
  void *v4;
  objc_class *isa;
  Class v6;
  Class v7;
  Class v8;
  void *v9;
  void *v10;
  int *v11;
  int v12;
  objc_super v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!atomic_load((unsigned __int8 *)&self[5]))
  {
    isa = self[2].super.super.isa;
    if (isa)
    {
      v6 = self[3].super.super.isa;
      v7 = self[2].super.super.isa;
      if (v6 != isa)
      {
        v8 = self[3].super.super.isa;
        do
        {
          v10 = (void *)*((_QWORD *)v8 - 1);
          v8 = (Class)((char *)v8 - 8);
          v9 = v10;
          if (v10)
            os_release(v9);
          *((_QWORD *)v6 - 1) = 0;
          v6 = v8;
        }
        while (v8 != isa);
        v7 = self[2].super.super.isa;
      }
      self[3].super.super.isa = isa;
      operator delete(v7);
    }
    goto LABEL_12;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_ERROR);
  v14 = 136446210;
  v15 = "nw_array_dispose";
  v12 = 12;
  v11 = &v14;
  v4 = (void *)_os_log_send_and_compose_impl();
  if (!__nwlog_abort((uint64_t)v4))
  {
    free(v4);
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)OS_nw_array;
    -[OS_nw_array dealloc](&v13, sel_dealloc, v11, v12);
    return;
  }
  __break(1u);
}

- (id)redactedDescription
{
  int64_t v3;
  __CFString *Mutable;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  if (nwlog_get_sensitive_redacted::onceToken != -1)
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    if (self && (v3 = self[3].super.super.isa - self[2].super.super.isa, (unint64_t)v3 >= 8))
    {
      v5 = v3 >> 3;
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      nw_array_get_object_at_index((uint64_t)self, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("<redacted>");
      if (v5 == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "redactedDescription");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        CFStringAppendFormat(Mutable, 0, CFSTR("[%zu - %@]"), 0, v7);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "redactedDescription");
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        CFStringAppendFormat(Mutable, 0, CFSTR("[%zu - %@"), 0, v7);

        v8 = 0;
        do
        {
          nw_array_get_object_at_index((uint64_t)self, v8 + 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("<redacted>");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "redactedDescription");
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (v5 - 2 == v8)
            CFStringAppendFormat(Mutable, 0, CFSTR(", %zu - %@]"), v8 + 1, v10);
          else
            CFStringAppendFormat(Mutable, 0, CFSTR(", %zu - %@"), v8 + 1, v10);

          ++v8;
        }
        while (v5 - 1 != v8);
      }
    }
    else
    {
      Mutable = CFSTR("[]");
    }
  }
  else
  {
    -[OS_nw_array description](self, "description");
    Mutable = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return Mutable;
}

- (id)description
{
  int64_t v3;
  __CFString *Mutable;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  if (self && (v3 = self[3].super.super.isa - self[2].super.super.isa, (unint64_t)v3 >= 8))
  {
    v6 = v3 >> 3;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    nw_array_get_object_at_index((uint64_t)self, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = v6 - 1;
    if (v6 == 1)
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("[%zu - %@]"), 0, v7);

    }
    else
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("[%zu - %@"), 0, v7);

      v10 = 0;
      do
      {
        if (v6 - 2 == v10)
        {
          nw_array_get_object_at_index((uint64_t)self, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CFStringAppendFormat(Mutable, 0, CFSTR(", %zu - %@]"), v9, v11);
        }
        else
        {
          nw_array_get_object_at_index((uint64_t)self, v10 + 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CFStringAppendFormat(Mutable, 0, CFSTR(", %zu - %@"), v10 + 1, v11);
        }

        ++v10;
      }
      while (v9 != v10);
    }
  }
  else
  {
    Mutable = CFSTR("[]");
  }
  return Mutable;
}

@end
