@implementation ACUISOpenApplicationAction

- (ACUISOpenApplicationAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACUISOpenApplicationAction;
  return -[ACUISOpenApplicationAction initWithInfo:responder:](&v3, sel_initWithInfo_responder_, 0, 0);
}

- (ACUISOpenApplicationAction)initWithURL:(id)a3
{
  id v4;
  void *v5;
  ACUISOpenApplicationAction *v6;
  objc_super v8;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forSetting:", v4, 0);

  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ACUISOpenApplicationAction;
  v6 = -[ACUISOpenApplicationAction initWithInfo:responder:](&v8, sel_initWithInfo_responder_, v5, 0);

  return v6;
}

- (ACUISOpenApplicationAction)initWithNSUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  ACUISOpenApplicationAction *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  _QWORD v15[6];
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy_;
  v17[3] = __Block_byref_object_dispose_;
  v18 = 0;
  objc_msgSend(v4, "setNeedsSave:", 0);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__ACUISOpenApplicationAction_initWithNSUserActivity___block_invoke;
  v15[3] = &unk_24F949A18;
  v15[4] = &v19;
  v15[5] = &v16;
  objc_msgSend(v4, "_createUserActivityDataWithOptions:completionHandler:", 0, v15);
  if (*(_QWORD *)(v17[0] + 40))
  {
    _logger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ACUISOpenApplicationAction initWithNSUserActivity:].cold.1((uint64_t)v17, v5);

    v14.receiver = self;
    v14.super_class = (Class)ACUISOpenApplicationAction;
    v6 = -[ACUISOpenApplicationAction initWithInfo:responder:](&v14, sel_initWithInfo_responder_, 0, 0);
  }
  else
  {
    v7 = v20[5];
    v25 = &unk_24F9572E8;
    v26[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD390]), "initWithSettings:", v8);
    if (v9)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setObject:forSetting:", v9, 1);
      v13.receiver = self;
      v13.super_class = (Class)ACUISOpenApplicationAction;
      v6 = -[ACUISOpenApplicationAction initWithInfo:responder:](&v13, sel_initWithInfo_responder_, v10, 0);

    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)ACUISOpenApplicationAction;
      v6 = -[ACUISOpenApplicationAction initWithInfo:responder:](&v12, sel_initWithInfo_responder_, 0, 0);
    }

  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

void __53__ACUISOpenApplicationAction_initWithNSUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSSet)launchActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ACUISOpenApplicationAction info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7C0]), "initWithURL:", v4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[ACUISOpenApplicationAction info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForSetting:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v8);
  }
  v9 = (void *)objc_msgSend(v6, "copy");

  return (NSSet *)v9;
}

- (void)initWithNSUserActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_22D80B000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize NSUserActivity: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
