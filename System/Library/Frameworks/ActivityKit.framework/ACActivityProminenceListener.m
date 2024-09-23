@implementation ACActivityProminenceListener

- (ACActivityProminenceListener)init
{
  ACActivityProminenceListener *v2;
  _TtC11ActivityKit35ActivityProminenceObservationClient *v3;
  _TtC11ActivityKit35ActivityProminenceObservationClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACActivityProminenceListener;
  v2 = -[ACActivityProminenceListener init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit35ActivityProminenceObservationClient);
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (id)listenForActivityProminence:(id)a3 withHandler:(id)a4
{
  id v6;
  uint64_t v7;
  _TtC11ActivityKit35ActivityProminenceObservationClient *client;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  client = self->_client;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke;
  v18[3] = &unk_25042A7B8;
  v19 = v6;
  v9 = v6;
  v10 = a3;
  -[ActivityProminenceObservationClient listenForActivityProminenceWithActivityIdentifier:handler:](client, "listenForActivityProminenceWithActivityIdentifier:handler:", v10, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE0BE98]);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke_2;
  v16[3] = &unk_25042A790;
  v17 = v11;
  v13 = v11;
  v14 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("ACActivityProminenceListener"), v10, v16);

  return v14;
}

uint64_t __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__ACActivityProminenceListener_listenForActivityProminence_withHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (_TtC11ActivityKit35ActivityProminenceObservationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
