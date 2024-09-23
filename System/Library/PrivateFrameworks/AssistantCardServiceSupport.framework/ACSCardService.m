@implementation ACSCardService

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "format") == 1)
  {
    objc_msgSend(v3, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "content");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "underlyingInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (v7)
  {
    if (-[ACSCardService canSatisfyCardRequest:](self, "canSatisfyCardRequest:", v6))
    {
      v8 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_215D4D000, v8, OS_LOG_TYPE_INFO, "Assistant Card Service attempting to satisfy request: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "content");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "underlyingInteraction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v10, "intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (v14)
      {
        objc_msgSend(v14, "requestCard:reply:", v6, v7);
      }
      else
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BE15488];
        v20 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No intent available for card request %@"), v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 400, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v19);

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BE15488];
      v24 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Card service %@ is unable to satisfy card request %@"), self, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 400, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v13);
    }

  }
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "underlyingInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v8 = objc_msgSend(v7, "servicePriorityForCardRequest:", v3);
    v4 = v7;
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACSCardService)initWithCoder:(id)a3
{

  return 0;
}

- (NSString)serviceIdentifier
{
  return (NSString *)CFSTR("com.apple.AssistantCardService");
}

@end
