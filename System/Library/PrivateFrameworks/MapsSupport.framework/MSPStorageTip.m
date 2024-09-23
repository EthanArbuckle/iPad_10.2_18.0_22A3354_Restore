@implementation MSPStorageTip

- (MSPStorageTip)initWithTitle:(id)a3 message:(id)a4 expectedSize:(int64_t)a5 enablementAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  MSPStorageTip *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *message;
  uint64_t v18;
  id enablementAction;
  MSPStorageTip *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MSPStorageTip;
  v13 = -[MSPStorageTip init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    message = v13->_message;
    v13->_message = (NSString *)v16;

    v13->_expectedSize = a5;
    v18 = objc_msgSend(v12, "copy");
    enablementAction = v13->_enablementAction;
    v13->_enablementAction = (id)v18;

    v20 = v13;
  }

  return v13;
}

- (NSString)representedApp
{
  return (NSString *)(id)*MEMORY[0x1E0D26D08];
}

- (void)enableWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *global_queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  global_queue = geo_get_global_queue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6653E38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(global_queue, v7);

}

void __45__MSPStorageTip_enableWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E66535A8;
  v4 = v1;
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E6653330;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __45__MSPStorageTip_enableWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)expectedSize
{
  return self->_expectedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_enablementAction, 0);
}

@end
