@implementation NWConcrete_nw_protocol_instance_registrar

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  NWConcrete_nw_protocol_instance_registrar *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gLogDatapath)
  {
    __nwlog_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "-[NWConcrete_nw_protocol_instance_registrar dealloc]";
      v7 = 2048;
      v8 = self;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s <nw_protocol_instance_registrar %p> dealloc", buf, 0x16u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_protocol_instance_registrar;
  -[NWConcrete_nw_protocol_instance_registrar dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_protocol_instance_registrar %p %s>"), self, (char *)self + 24);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
