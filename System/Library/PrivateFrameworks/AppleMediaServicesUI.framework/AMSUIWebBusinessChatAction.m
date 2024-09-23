@implementation AMSUIWebBusinessChatAction

- (AMSUIWebBusinessChatAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebBusinessChatAction *v7;
  void *v8;
  NSString *v9;
  NSString *body;
  void *v11;
  NSString *v12;
  NSString *businessID;
  void *v14;
  NSString *v15;
  NSString *businessGroupID;
  void *v17;
  NSString *v18;
  NSString *intentID;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebBusinessChatAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v21, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    body = v7->_body;
    v7->_body = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("businessID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    businessID = v7->_businessID;
    v7->_businessID = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("businessGroupID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    businessGroupID = v7->_businessGroupID;
    v7->_businessGroupID = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intentID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    intentID = v7->_intentID;
    v7->_intentID = v18;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebBusinessChatAction;
  v3 = -[AMSUIWebAction runAction](&v13, sel_runAction);
  -[AMSUIWebBusinessChatAction businessID](self, "businessID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "promiseWithError:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[AMSUIWebBusinessChatAction makeBusinessChatDeeplink](self, "makeBusinessChatDeeplink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = (void *)MEMORY[0x24BE08340];
    goto LABEL_8;
  }
  v6 = objc_msgSend(MEMORY[0x24BE082E8], "openStandardURL:", v5);
  v7 = (void *)MEMORY[0x24BE08340];
  if (!v6)
  {
LABEL_8:
    AMSError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "promiseWithError:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", &unk_24CB8C708);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v8;
LABEL_9:

  return v10;
}

- (id)makeBusinessChatDeeplink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("https://bcrw.apple.com/sms:open?service=iMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebBusinessChatAction businessID](self, "businessID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[AMSUIWebBusinessChatAction businessID](self, "businessID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("urn:biz:%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("recipient"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  -[AMSUIWebBusinessChatAction businessGroupID](self, "businessGroupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1838];
    -[AMSUIWebBusinessChatAction businessGroupID](self, "businessGroupID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryItemWithName:value:", CFSTR("bizgroup-id"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  -[AMSUIWebBusinessChatAction intentID](self, "intentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1838];
    -[AMSUIWebBusinessChatAction intentID](self, "intentID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("biz-intent-id"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

  }
  -[AMSUIWebBusinessChatAction body](self, "body");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD1838];
    -[AMSUIWebBusinessChatAction body](self, "body");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryItemWithName:value:", CFSTR("body"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v21);

  }
  objc_msgSend(v3, "setQueryItems:", v4);
  objc_msgSend(v3, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(id)a3
{
  objc_storeStrong((id *)&self->_businessID, a3);
}

- (NSString)businessGroupID
{
  return self->_businessGroupID;
}

- (void)setBusinessGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_businessGroupID, a3);
}

- (NSString)intentID
{
  return self->_intentID;
}

- (void)setIntentID:(id)a3
{
  objc_storeStrong((id *)&self->_intentID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_businessGroupID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
