@implementation CIDCPayloadBuilder

- (CIDCPayloadBuilder)initWithDelegate:(id)a3
{
  id v4;
  CIDCPayloadBuilder *v5;
  _TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CIDCPayloadBuilder;
  v5 = -[CIDCPayloadBuilder init](&v8, sel_init);
  if (v5)
  {
    v6 = -[CIDCInternalPayloadBuilder initWithDelegate:payloadBuilder:]([_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder alloc], "initWithDelegate:payloadBuilder:", v4, v5);
    -[CIDCPayloadBuilder setPayloadBuilder:](v5, "setPayloadBuilder:", v6);

  }
  return v5;
}

- (void)buildPayloadWithDetails:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[CIDCPayloadBuilder payloadBuilder](self, "payloadBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CIDCPayloadBuilder_buildPayloadWithDetails_completion___block_invoke;
  v10[3] = &unk_24DBC0C48;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "buildPayloadWithDetails:completionHandler:", v7, v10);

}

uint64_t __57__CIDCPayloadBuilder_buildPayloadWithDetails_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)payloadBuilder
{
  return self->_payloadBuilder;
}

- (void)setPayloadBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_payloadBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadBuilder, 0);
}

@end
