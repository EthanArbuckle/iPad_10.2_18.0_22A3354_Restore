@implementation AMSUIWebEngagementAction

- (AMSUIWebEngagementAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebEngagementAction *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *event;
  void *v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *messageServiceType;
  void *v16;
  NSArray *v17;
  NSArray *messagePlacements;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebEngagementAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v20, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    event = v7->_event;
    v7->_event = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("serviceType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;

      messageServiceType = v7->_messageServiceType;
      v7->_messageServiceType = v14;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("placements"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;

      messagePlacements = v7->_messagePlacements;
      v7->_messagePlacements = v17;

    }
  }

  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
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
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE08148]);
  -[AMSUIWebEngagementAction messageServiceType](self, "messageServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    -[AMSUIWebEngagementAction messagePlacements](self, "messagePlacements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x24BE08158]);
      -[AMSUIWebEngagementAction messageServiceType](self, "messageServiceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDBCF20];
      -[AMSUIWebEngagementAction messagePlacements](self, "messagePlacements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithServiceType:placements:", v9, v12);

      objc_msgSend(v3, "enqueueMessageEvent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v5;
      v27[1] = 3221225472;
      v27[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke;
      v27[3] = &unk_24CB51038;
      v27[4] = self;
      objc_msgSend(v14, "thenWithBlock:", v27);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  -[AMSUIWebEngagementAction event](self, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSUIWebEngagementAction event](self, "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enqueueData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke_2;
    v26[3] = &unk_24CB51060;
    v26[4] = self;
    objc_msgSend(v17, "thenWithBlock:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)MEMORY[0x24BE08340];
  v20 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1B8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v20;
  v21 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1B8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "promiseWithAll:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {

    if (v4)
      goto LABEL_14;
LABEL_16:

    goto LABEL_14;
  }
  if (!v4)
    goto LABEL_16;
LABEL_14:
  objc_msgSend(v23, "thenWithBlock:", &__block_literal_global_21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "messageActions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_resultFromMessageResponse:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("messageActions"));
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("actions"));

  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("data"));

  objc_msgSend(v4, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateWebExportWithContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("engagementRequest"));

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __37__AMSUIWebEngagementAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __37__AMSUIWebEngagementAction_runAction__block_invoke_4;
        v13[3] = &unk_24CB4FB80;
        v14 = v3;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __37__AMSUIWebEngagementAction_runAction__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_resultFromMessageResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "fullScreenMessageRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeDialogRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateWebExport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("dialogRequest"));

  objc_msgSend(v5, "engagementRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateWebExportWithContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("engagementRequest"));

  objc_msgSend(v5, "serviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("serviceType"));

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "placements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__AMSUIWebEngagementAction__resultFromMessageResponse___block_invoke;
  v18[3] = &unk_24CB510C8;
  v19 = v14;
  v16 = v14;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("placements"));
  return v6;
}

void __55__AMSUIWebEngagementAction__resultFromMessageResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "generateWebExport");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (NSDictionary)event
{
  return self->_event;
}

- (NSArray)messagePlacements
{
  return self->_messagePlacements;
}

- (NSString)messageServiceType
{
  return self->_messageServiceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageServiceType, 0);
  objc_storeStrong((id *)&self->_messagePlacements, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
