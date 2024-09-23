@implementation KCSRPContext

- (id)dataForPassword:(id)a3
{
  return (id)objc_msgSend(a3, "dataUsingEncoding:", 4);
}

- (const)userNameString
{
  id v2;
  const char *v3;

  -[KCSRPContext user](self, "user");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  return v3;
}

- (KCSRPContext)initWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v9;
  KCSRPContext *v10;
  uint64_t v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KCSRPContext;
  v10 = -[KCSRPContext init](&v13, sel_init);
  if (v10)
  {
    v11 = ccdh_ccn_size();
    -[KCSRPContext setContext:](v10, "setContext:", malloc_type_malloc(4 * (a4->var0 + v11) + 48, 0xF5D2908uLL));
    -[KCSRPContext context](v10, "context");
    ccsrp_ctx_init();
    -[KCSRPContext setUser:](v10, "setUser:", v9);
    -[KCSRPContext setRng:](v10, "setRng:", a6);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[KCSRPContext context](self, "context");
  ccdh_ccn_size();
  -[KCSRPContext context](self, "context");
  -[KCSRPContext context](self, "context");
  cc_clear();
  free(-[KCSRPContext context](self, "context"));
  v3.receiver = self;
  v3.super_class = (Class)KCSRPContext;
  -[KCSRPContext dealloc](&v3, sel_dealloc);
}

- (id)getKey
{
  void *session_key;

  -[KCSRPContext context](self, "context");
  session_key = (void *)ccsrp_get_session_key();
  if (session_key)
    session_key = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "_newZeroingDataWithBytes:length:", session_key, 0);
  return session_key;
}

- (BOOL)isAuthenticated
{
  -[KCSRPContext context](self, "context");
  return ccsrp_is_authenticated();
}

- (ccsrp_ctx)context
{
  return self->_context;
}

- (void)setContext:(ccsrp_ctx *)a3
{
  self->_context = a3;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (NSString)user
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

+ (id)createWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUser:digestInfo:group:randomSource:", v10, a4, a5, a6);

  return v11;
}

@end
