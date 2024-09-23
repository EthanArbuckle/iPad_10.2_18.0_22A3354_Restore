@implementation MTJSContextEventFilter

- (MTJSContextEventFilter)initWithScript:(id)a3 functionName:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTJSContextEventFilter *v11;
  MTJSContextEventFilter *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MTJSContextEventFilter;
  v11 = -[MTJSContextEventFilter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MTJSContextEventFilter setScript:](v11, "setScript:", v8);
    -[MTJSContextEventFilter setFunctionName:](v12, "setFunctionName:", v9);
    -[MTJSContextEventFilter setOperationQueue:](v12, "setOperationQueue:", v10);
  }

  return v12;
}

- (MTJSContextEventFilter)initWithJSContext:(id)a3 functionName:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTJSContextEventFilter *v11;
  MTJSContextEventFilter *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MTJSContextEventFilter;
  v11 = -[MTJSContextEventFilter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MTJSContextEventFilter setJsContext:](v11, "setJsContext:", v8);
    -[MTJSContextEventFilter setFunctionName:](v12, "setFunctionName:", v9);
    -[MTJSContextEventFilter setOperationQueue:](v12, "setOperationQueue:", v10);
  }

  return v12;
}

- (JSContext)jsContext
{
  JSContext *jsContext;
  JSContext *v4;
  JSContext *v5;
  JSContext *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  JSContext *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id location;

  jsContext = self->_jsContext;
  if (!jsContext)
  {
    v4 = (JSContext *)objc_alloc_init(MEMORY[0x24BDDA718]);
    v5 = self->_jsContext;
    self->_jsContext = v4;

    objc_initWeak(&location, self);
    v6 = self->_jsContext;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __35__MTJSContextEventFilter_jsContext__block_invoke;
    v18 = &unk_24C7A1E50;
    objc_copyWeak(&v19, &location);
    -[JSContext setExceptionHandler:](v6, "setExceptionHandler:", &v15);
    v7 = -[JSContext evaluateScript:](self->_jsContext, "evaluateScript:", CFSTR("var console = {}"), v15, v16, v17, v18);
    -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("console"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__block_literal_global_24, CFSTR("warn"));
    -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("console"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &__block_literal_global_24, CFSTR("error"));
    -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("console"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__block_literal_global_24, CFSTR("log"));

    v11 = self->_jsContext;
    -[MTJSContextEventFilter script](self, "script");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[JSContext evaluateScript:](v11, "evaluateScript:", v12);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    jsContext = self->_jsContext;
  }
  return jsContext;
}

void __35__MTJSContextEventFilter_jsContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MTError(200, CFSTR("JS Exception: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLastError:", v11);

  MTMetricsKitOSLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_20D758000, v13, OS_LOG_TYPE_ERROR, "MetricsKit: MTJSContextBridge error: %@", buf, 0xCu);
  }

}

void __35__MTJSContextEventFilter_jsContext__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  MTMetricsKitOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_20D758000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: JSContext console: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_applyFilter:(id)a3 promise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MTJSContextEventFilter jsContext](self, "jsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTJSContextEventFilter functionName](self, "functionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isObject"))
  {
    v48[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callWithArguments:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isNull"))
    {
      -[MTJSContextEventFilter functionName](self, "functionName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MTError(301, CFSTR("The JS function \"%@\" returned a null value."), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "finishWithError:", v20);
    }
    else
    {
      objc_msgSend(v12, "toDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v29;
      if (v29)
      {
        if (objc_msgSend(v29, "count"))
        {
          objc_msgSend(v7, "finishWithResult:", v20);
        }
        else
        {
          -[MTJSContextEventFilter functionName](self, "functionName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          MTError(301, CFSTR("The JS function \"%@\" returned an empty object."), v34, v35, v36, v37, v38, v39, (uint64_t)v33);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "finishWithError:", v40);
        }
      }
      else
      {
        -[MTJSContextEventFilter lastError](self, "lastError");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
        }
        else
        {
          -[MTJSContextEventFilter functionName](self, "functionName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          MTError(200, CFSTR("The JS context failed in function named \"%@\"."), v42, v43, v44, v45, v46, v47, (uint64_t)v41);
          v32 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v7, "finishWithError:", v32);

      }
    }

  }
  else
  {
    -[MTJSContextEventFilter functionName](self, "functionName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MTError(200, CFSTR("The JS context doesn't have any global function named \"%@\"."), v22, v23, v24, v25, v26, v27, (uint64_t)v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "finishWithError:", v28);
  }

}

- (id)apply:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__MTJSContextEventFilter_apply___block_invoke;
  v4[3] = &unk_24C7A03D0;
  v4[4] = self;
  objc_msgSend(a3, "thenWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __32__MTJSContextEventFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __32__MTJSContextEventFilter_apply___block_invoke_2;
    v9[3] = &unk_24C7A08F8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v3;
    v11 = v4;
    objc_msgSend(v7, "addOperationWithBlock:", v9);

  }
  else
  {
    objc_msgSend(v6, "_applyFilter:promise:", v3, v4);
  }

  return v4;
}

uint64_t __32__MTJSContextEventFilter_apply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyFilter:promise:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
  objc_storeStrong((id *)&self->_script, a3);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_storeStrong((id *)&self->_functionName, a3);
}

- (void)setJsContext:(id)a3
{
  objc_storeStrong((id *)&self->_jsContext, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_script, 0);
}

@end
