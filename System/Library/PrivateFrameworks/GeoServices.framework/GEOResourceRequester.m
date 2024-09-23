@implementation GEOResourceRequester

+ (GEOResourceRequester)sharedRequester
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GEOResourceRequester_sharedRequester__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC678 != -1)
    dispatch_once(&qword_1ECDBC678, block);
  return (GEOResourceRequester *)(id)qword_1ECDBC670;
}

+ (void)setProxyClass:(Class)a3
{
  if (!_MergedGlobals_292)
    _MergedGlobals_292 = (uint64_t)a3;
}

void __39__GEOResourceRequester_sharedRequester__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!_MergedGlobals_292)
    objc_msgSend(*(id *)(a1 + 32), "setProxyClass:", objc_opt_class());
  v2 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_alloc_init((Class)_MergedGlobals_292);
  v3 = objc_msgSend(v2, "initWithProxy:", v5);
  v4 = (void *)qword_1ECDBC670;
  qword_1ECDBC670 = v3;

}

- (GEOResourceRequester)init
{
  GEOResourceRequester *result;

  result = (GEOResourceRequester *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOResourceRequester)initWithProxy:(id)a3
{
  id v5;
  GEOResourceRequester *v6;
  GEOResourceRequester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResourceRequester;
  v6 = -[GEOResourceRequester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxy, a3);

  return v7;
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 auditToken:(id)a6 queue:(id)a7 handler:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v11 = a4;
  v14 = a8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__GEOResourceRequester_fetchResources_force_manifestConfiguration_auditToken_queue_handler___block_invoke;
  v16[3] = &unk_1E1C129A0;
  v17 = v14;
  v15 = v14;
  -[GEOResourceRequester fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:](self, "fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:", a3, v11, 0, a5, a6, 0, a7, v16);

}

uint64_t __92__GEOResourceRequester_fetchResources_force_manifestConfiguration_auditToken_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 queue:(id)a8 handler:(id)a9
{
  -[GEOResourceRequester fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:](self, "fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:", a3, a4, a5, a6, a7, 0, a8, a9);
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  -[GEOResourceRequesterProxy fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:](self->_proxy, "fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
