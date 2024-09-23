@implementation AMSUIWebAction

- (AMSUIWebAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebAction *v8;
  void *v9;
  id v10;
  AMSUIWebMetricsEvent *v11;
  AMSMetricsEvent *actionEvent;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = -[AMSUIWebAction _initWithContext:](self, "_initWithContext:", v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionEvent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      v11 = -[AMSUIWebMetricsEvent initWithJSObject:context:]([AMSUIWebMetricsEvent alloc], "initWithJSObject:context:", v10, v7);
      actionEvent = v8->_actionEvent;
      v8->_actionEvent = &v11->super;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("acceptedResponseVersions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    if (v14)
      objc_storeStrong((id *)&v8->_acceptedResponseVersions, v14);

  }
  return v8;
}

- (id)_initWithContext:(id)a3
{
  id v5;
  AMSUIWebAction *v6;
  AMSUIWebAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebAction;
  v6 = -[AMSUIWebAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)runAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSUIWebAction actionEvent](self, "actionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIWebAction context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebAction actionEvent](self, "actionEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueEvent:", v6);

  }
  return (id)objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
}

- (NSString)presentingSceneBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebAction context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      AMSLogKey();
      self = (AMSUIWebAction *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, self);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using scene bundle identifier: %{public}@", buf, 0x16u);
    if (v8)
    {

      v12 = self;
    }

  }
  return (NSString *)v5;
}

- (id)presentingSceneBundleIdentifierPromise
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x24BE082B0]);
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__AMSUIWebAction_presentingSceneBundleIdentifierPromise__block_invoke;
  v12[3] = &unk_24CB4F4C0;
  v12[4] = self;
  v5 = v3;
  v13 = v5;
  v6 = v12;
  AMSLogKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_24CB4F3C0;
  v15 = v7;
  v16 = v6;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v9 = v13;
  v10 = v5;

  return v10;
}

void __56__AMSUIWebAction_presentingSceneBundleIdentifierPromise__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presentingSceneBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v5 = (id)v2;
  if (v2)
    objc_msgSend(MEMORY[0x24BE082F0], "optionalWithValue:", v2);
  else
    objc_msgSend(MEMORY[0x24BE082F0], "optionalWithNil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

}

- (NSString)presentingSceneIdentifier
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  const char *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebAction context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = objc_opt_class();
      v30 = a2;
      if (v14)
      {
        AMSLogKey();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v16, v17, v29);
      }
      else
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@ "), v16, v17);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Found scene identifier %{public}@ in %{public}@", buf, 0x20u);
      if (v14)
      {

        v18 = (void *)v29;
      }

      a2 = v30;
    }

  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = objc_opt_class();
    if (v22)
    {
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v24, v25, v5);
    }
    else
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: %@ "), v24, v25);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    v33 = 2114;
    v34 = v27;
    _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Using scene identifier: %{public}@", buf, 0x16u);
    if (v22)
    {

      v26 = v5;
    }

  }
  return (NSString *)v11;
}

- (id)presentingSceneIdentifierPromise
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v3 = objc_alloc_init(MEMORY[0x24BE082B0]);
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__AMSUIWebAction_presentingSceneIdentifierPromise__block_invoke;
  v12[3] = &unk_24CB4F4C0;
  v12[4] = self;
  v5 = v3;
  v13 = v5;
  v6 = v12;
  AMSLogKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_24CB4F3C0;
  v15 = v7;
  v16 = v6;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v9 = v13;
  v10 = v5;

  return v10;
}

void __50__AMSUIWebAction_presentingSceneIdentifierPromise__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presentingSceneIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v5 = (id)v2;
  if (v2)
    objc_msgSend(MEMORY[0x24BE082F0], "optionalWithValue:", v2);
  else
    objc_msgSend(MEMORY[0x24BE082F0], "optionalWithNil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

}

- (NSArray)acceptedResponseVersions
{
  return self->_acceptedResponseVersions;
}

- (void)setAcceptedResponseVersions:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedResponseVersions, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AMSMetricsEvent)actionEvent
{
  return self->_actionEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionEvent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_acceptedResponseVersions, 0);
}

@end
