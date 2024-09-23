@implementation CBSUIAlert

- (CBSUIAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v9;
  id v10;
  CBSUIAlert *v11;
  CBSUIAlert *v12;
  uint64_t v13;
  NSMutableArray *actions;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CBSUIAlert;
  v11 = -[CBSUIAlert init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_message, a4);
    v12->_preferredStyle = a5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    actions = v12->_actions;
    v12->_actions = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v16;

  }
  return v12;
}

+ (id)alertWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:preferredStyle:", v9, v8, a5);

  return v10;
}

- (void)addAction:(id)a3
{
  -[NSMutableArray addObject:](self->_actions, "addObject:", a3);
}

- (void)activate
{
  if (!-[CBSUIAlert isActive](self, "isActive"))
  {
    -[CBSUIAlert setIsActive:](self, "setIsActive:", 1);
    -[CBSUIAlert _sendCreate](self, "_sendCreate");
  }
}

- (void)deactivate
{
  if (-[CBSUIAlert isActive](self, "isActive"))
  {
    -[CBSUIAlert _sendDismiss](self, "_sendDismiss");
    -[CBSUIAlert setIsActive:](self, "setIsActive:", 0);
  }
}

- (id)alertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF67F0];
  -[CBSUIAlert title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSUIAlert message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, -[CBSUIAlert preferredStyle](self, "preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CBSUIAlert actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "style");
        v19[0] = v10;
        v19[1] = 3221225472;
        v19[2] = __29__CBSUIAlert_alertController__block_invoke;
        v19[3] = &unk_24FCB11E0;
        v19[4] = v12;
        objc_msgSend(v13, "actionWithTitle:style:handler:", v14, v15, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addAction:", v16);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v6;
}

void __29__CBSUIAlert_alertController__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)_sendCreate
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  id location;

  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteAlertServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__CBSUIAlert__sendCreate__block_invoke;
  v7[3] = &unk_24FCB1208;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "createAlert:timeout:completion:", self, 0, v7);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  -[CBSUIAlert _receiveResponse](self, "_receiveResponse");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __25__CBSUIAlert__sendCreate__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CheckerBoardLogHandleForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_22F698000, v5, OS_LOG_TYPE_DEFAULT, "Alert creation request for [%@] succeeded: %d", (uint8_t *)&v7, 0x12u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_receiveResponse
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  id location;

  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  +[CBSClient defaultClient](CBSClient, "defaultClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteAlertServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSUIAlert identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__CBSUIAlert__receiveResponse__block_invoke;
  v8[3] = &unk_24FCB1230;
  objc_copyWeak(&v10, &location);
  v7 = v3;
  v9 = v7;
  objc_msgSend(v5, "receiveResponseFromAlertWithIdentifier:timeout:completion:", v6, v8, 0.0);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __30__CBSUIAlert__receiveResponse__block_invoke(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CheckerBoardLogHandleForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v6;
    v17 = 2048;
    v18 = a2;
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_22F698000, v5, OS_LOG_TYPE_DEFAULT, "Alert [%@] received response: %lu/%lu", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(WeakRetained, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a2)
  {
    objc_msgSend(WeakRetained, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CheckerBoardLogHandleForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_22F698000, v12, OS_LOG_TYPE_DEFAULT, "Invoking action: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v11, "handler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "handler");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSUIAlert)initWithCoder:(id)a3
{
  id v4;
  CBSUIAlert *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *message;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *actions;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBSUIAlert;
  v5 = -[CBSUIAlert init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    v5->_preferredStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredStyle"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("actions"));
    v13 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CBSUIAlert title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[CBSUIAlert message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("message"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CBSUIAlert preferredStyle](self, "preferredStyle"), CFSTR("preferredStyle"));
  -[CBSUIAlert actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("actions"));

  -[CBSUIAlert identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
