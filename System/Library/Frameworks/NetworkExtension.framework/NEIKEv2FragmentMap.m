@implementation NEIKEv2FragmentMap

- (NEIKEv2FragmentMap)init
{
  NEIKEv2FragmentMap *v2;
  id v3;
  SEL v4;
  SEL v5;
  NEIKEv2FragmentMap *v6;
  NSObject *v7;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2FragmentMap;
  v2 = -[NEIKEv2FragmentMap init](&v12, sel_init);
  if (!v2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_WORD *)buf = 0;
    v9 = "[super init] failed";
    v10 = v7;
    v11 = 2;
    goto LABEL_8;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_setProperty_atomic(v2, v4, v3, 16);

  if (!objc_getProperty(v2, v5, 16, 1))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_5:

      v6 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v14 = "-[NEIKEv2FragmentMap init]";
    v9 = "%s called with null self.fragments";
    v10 = v7;
    v11 = 12;
LABEL_8:
    _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, v9, buf, v11);
    goto LABEL_5;
  }
  v6 = v2;
LABEL_6:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
}

@end
