@implementation SUUIURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  objc_super v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, &__block_literal_global_47);
  v9[1] = 3221225472;
  v9[2] = __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
  v9[3] = &unk_2511FBA30;
  v10 = v5;
  v11 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SUUIURLConnectionRequest;
  v9[0] = MEMORY[0x24BDAC760];
  v6 = v4;
  v7 = v5;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](&v8, sel_startWithConnectionResponseBlock_, v9);

}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BEB2B30], 0);

}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __61__SUUIURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BEB2B38], 0);

}

@end
