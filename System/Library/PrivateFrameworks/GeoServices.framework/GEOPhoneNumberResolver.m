@implementation GEOPhoneNumberResolver

+ (id)sharedResolver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEOPhoneNumberResolver_sharedResolver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBCD68 != -1)
    dispatch_once(&qword_1ECDBCD68, block);
  return (id)_MergedGlobals_349;
}

void __40__GEOPhoneNumberResolver_sharedResolver__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_349;
  _MergedGlobals_349 = (uint64_t)v1;

}

- (GEOPhoneNumberResolver)init
{
  GEOPhoneNumberResolver *v2;
  void *v3;
  objc_class *v4;
  PNRPhoneNumberResolver *v5;
  PNRPhoneNumberResolver *resolver;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)GEOPhoneNumberResolver;
  v2 = -[GEOPhoneNumberResolver init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)qword_1ECDBCD70;
    v13 = qword_1ECDBCD70;
    if (!qword_1ECDBCD70)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPNRPhoneNumberResolverClass_block_invoke;
      v9[3] = &unk_1E1C03348;
      v9[4] = &v10;
      __getPNRPhoneNumberResolverClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (PNRPhoneNumberResolver *)objc_alloc_init(v4);
    resolver = v2->_resolver;
    v2->_resolver = v5;

  }
  return v2;
}

- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  NSObject *v12;
  id *v13;
  id v14;
  PNRPhoneNumberResolver *resolver;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = GeoServicesConfig_PNRDisabled;
  v11 = off_1EDF4DEA8;
  v12 = a5;
  if (GEOConfigGetBOOL(v10, (uint64_t)v11))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke;
    block[3] = &unk_1E1C01F48;
    v13 = &v20;
    v20 = v9;
    v14 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    resolver = self->_resolver;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke_2;
    v17[3] = &unk_1E1C23B10;
    v13 = &v18;
    v18 = v9;
    v16 = v9;
    -[PNRPhoneNumberResolver resolvePhoneNumbers:queue:handler:](resolver, "resolvePhoneNumbers:queue:handler:", v8, v12, v17);
  }

}

uint64_t __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__GEOPhoneNumberResolver_resolvePhoneNumbers_handler_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  GEOPhoneNumberResolutionResultSet *v4;

  v3 = a2;
  v4 = -[GEOPhoneNumberResolutionResultSet initWithPNRResultSet:]([GEOPhoneNumberResolutionResultSet alloc], "initWithPNRResultSet:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
