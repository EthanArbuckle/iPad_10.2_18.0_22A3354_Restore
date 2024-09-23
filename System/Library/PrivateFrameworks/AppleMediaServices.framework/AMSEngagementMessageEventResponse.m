@implementation AMSEngagementMessageEventResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageActions, 0);
}

- (NSArray)messageActions
{
  return self->_messageActions;
}

- (AMSEngagementMessageEventResponse)initWithEnqueueResult:(id)a3
{
  id v4;
  AMSEngagementMessageEventResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSEngagementMessageEventResponse;
  v5 = -[AMSEngagementMessageEventResponse init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementEnqueueResult setData:](v5, "setData:", v6);

    objc_msgSend(v4, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementEnqueueResult setActions:](v5, "setActions:", v7);

    objc_msgSend(v4, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementMessageEventResponse _processActions:](v5, "_processActions:", v8);

  }
  return v5;
}

- (void)_processActions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  AMSEngagementMessageEventServiceResponse *v12;
  uint64_t v13;
  NSArray *messageActions;
  AMSEngagementMessageEventResponse *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v15 = self;
  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("actionClass"), v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("MessageAction"));

        if (v11)
        {
          v12 = -[AMSEngagementMessageEventServiceResponse initWithJSObject:]([AMSEngagementMessageEventServiceResponse alloc], "initWithJSObject:", v9);
          if (v12)
            objc_msgSend(v16, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v13 = objc_claimAutoreleasedReturnValue();
    messageActions = v15->_messageActions;
    v15->_messageActions = (NSArray *)v13;

  }
}

@end
