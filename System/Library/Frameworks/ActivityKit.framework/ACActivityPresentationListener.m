@implementation ACActivityPresentationListener

- (ACActivityPresentationListener)init
{
  ACActivityPresentationListener *v2;
  _TtC11ActivityKit37ActivityPresentationObservationClient *v3;
  _TtC11ActivityKit37ActivityPresentationObservationClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACActivityPresentationListener;
  v2 = -[ACActivityPresentationListener init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit37ActivityPresentationObservationClient);
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (id)listenForActivityPresentation:(id)a3 presenterBundleIdentifier:(id)a4 withHandler:(id)a5
{
  id v8;
  uint64_t v9;
  _TtC11ActivityKit37ActivityPresentationObservationClient *client;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  client = self->_client;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke;
  v20[3] = &unk_25042A768;
  v21 = v8;
  v11 = v8;
  v12 = a3;
  -[ActivityPresentationObservationClient listenForActivityPresentationWithActivityIdentifier:presenterBundleIdentifier:handler:](client, "listenForActivityPresentationWithActivityIdentifier:presenterBundleIdentifier:handler:", v12, a4, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BE0BE98]);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke_2;
  v18[3] = &unk_25042A790;
  v19 = v13;
  v15 = v13;
  v16 = (void *)objc_msgSend(v14, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("ACActivityPresentationListener"), v12, v18);

  return v16;
}

uint64_t __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 > 6)
      v3 = 1;
    else
      v3 = qword_232E70830[a2];
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __102__ACActivityPresentationListener_listenForActivityPresentation_presenterBundleIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (_TtC11ActivityKit37ActivityPresentationObservationClient)client
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
