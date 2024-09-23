@implementation MADVSKClient

- (MADVSKClient)initWithConfig:(id)a3 error:(id *)a4
{
  id v6;
  MADVSKClient *v7;
  uint64_t v8;
  VSKClient *client;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVSKClient;
  v7 = -[MADVSKClient init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6860]), "initWithConfig:error:", v6, a4);
    client = v7->_client;
    v7->_client = (VSKClient *)v8;

  }
  return v7;
}

- (void)warmup
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (!self->_isPrewarmed)
  {
    VCPSignPostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    VCPSignPostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MAD_VSKClientWarmup", ", buf, 2u);
    }

    -[VSKClient warmup](self->_client, "warmup");
    VCPSignPostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v4, "MAD_VSKClientWarmup", ", v9, 2u);
    }

    self->_isPrewarmed = 1;
  }
}

- (void)cooldown
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_isPrewarmed)
  {
    VCPSignPostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    VCPSignPostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MAD_VSKClientCooldown", ", buf, 2u);
    }

    -[VSKClient cooldown](self->_client, "cooldown");
    VCPSignPostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v4, "MAD_VSKClientCooldown", ", v9, 2u);
    }

    self->_isPrewarmed = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[MADVSKClient cooldown](self, "cooldown");
  v3.receiver = self;
  v3.super_class = (Class)MADVSKClient;
  -[MADVSKClient dealloc](&v3, sel_dealloc);
}

- (BOOL)isPrewarmed
{
  return self->_isPrewarmed;
}

- (VSKClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
