@implementation MKAnalytics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MKAnalytics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __29__MKAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (MKAnalytics)init
{
  MKAnalytics *v2;
  MKAnalytics *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKAnalytics;
  v2 = -[MKAnalytics init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKAnalytics createPayload](v2, "createPayload");
  return v3;
}

- (void)createPayload
{
  MKPayload *v3;

  v3 = objc_alloc_init(MKPayload);
  -[MKAnalytics setPayload:](self, "setPayload:", v3);

}

- (void)send
{
  id v3;

  -[MKPayload dictionary](self->_payload, "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAnalytics send:payload:](self, "send:payload:", CFSTR("com.apple.welcomemat"), v3);

}

- (void)send:(id)a3 payload:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __28__MKAnalytics_send_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MKPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
