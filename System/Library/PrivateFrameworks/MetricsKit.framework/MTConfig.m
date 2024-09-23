@implementation MTConfig

id __37__MTConfig_computeWithConfigSources___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __19__MTConfig_sources__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil objectAsDictionary:](MTReflectUtil, "objectAsDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDelegate:(id)a3
{
  MTConfigDelegate **p_delegate;
  id v5;
  char isKindOfClass;
  id WeakRetained;
  id v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MTObject metricsKit](self, "metricsKit");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "setMetricsKit:", v8);

  }
}

- (void)removeDenylistedFields:(id)a3 sources:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTConfig denylistedFieldsForSources:](self, "denylistedFieldsForSources:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsForKeys:", v7);

  }
}

- (BOOL)metricsDisabledOrDenylistedEvent:(id)a3 sources:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[MTConfig disabledForSources:](self, "disabledForSources:", v7))
  {
    v8 = 1;
  }
  else if (v6)
  {
    -[MTConfig denylistedEventsForSources:](self, "denylistedEventsForSources:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)disabledForSources:(id)a3
{
  void *v3;
  BOOL v4;

  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("disabled"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MTReflectUtil objectAsBool:](MTReflectUtil, "objectAsBool:", v3);

  return v4;
}

- (void)applyDeRes:(id)a3 sources:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[MTConfig deResFieldsForSources:](self, "deResFieldsForSources:", a4);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          +[MTReflectUtil objectAsDictionary:](MTReflectUtil, "objectAsDictionary:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fieldName"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("magnitude"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("significantDigits"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[MTNumberUtil deResNumber:magnitude:significantDigits:](MTNumberUtil, "deResNumber:magnitude:significantDigits:", v14, v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
}

- (id)deResFieldsForSources:(id)a3
{
  void *v3;
  void *v4;

  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("deResFields"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __28__MTConfig_eventDataTimeout__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  char isKindOfClass;
  double v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(WeakRetained, "_isEventDataTimeoutUnset");

  if (v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "configValueForKeyPath:sources:", CFSTR("eventDataTimeout"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = 0.0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v7, "doubleValue", 0.0);
    if (v9 == 0.0)
      v9 = 10000.0;
    v10 = (uint64_t)v9;
    v11 = objc_loadWeakRetained(v3);
    objc_msgSend(v11, "setEventDataTimeout:", v10);

  }
}

- (void)setEventDataTimeout:(int64_t)a3
{
  self->_eventDataTimeout = a3;
}

- (int64_t)eventDataTimeout
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  if (-[MTConfig _isEventDataTimeoutUnset](self, "_isEventDataTimeoutUnset"))
  {
    objc_initWeak(&location, self);
    -[MTConfig sources](self, "sources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __28__MTConfig_eventDataTimeout__block_invoke;
    v8 = &unk_24C7A0268;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "addFinishBlock:", &v5);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (-[MTConfig _isEventDataTimeoutUnset](self, "_isEventDataTimeoutUnset", v5, v6, v7, v8))
    return 10000;
  else
    return self->_eventDataTimeout;
}

- (BOOL)_isEventDataTimeoutUnset
{
  return self->_eventDataTimeout == 0;
}

- (id)computeWithConfigSources:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MTConfig sources](self, "sources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__MTConfig_computeWithConfigSources___block_invoke;
  v9[3] = &unk_24C7A0290;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)denylistedFieldsForSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("blacklistedFields"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("denylistedFields"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)configValueForKeyPath:(id)a3 sources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[MTConfig delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MTConfig delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configValueForKeyPath:sources:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = objc_msgSend(v7, "count");
    if (v12 - 1 < 0)
    {
LABEL_7:
      v11 = 0;
    }
    else
    {
      v13 = v12;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndex:", --v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mt_nullableValueForKeyPath:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          break;
        if (v13 <= 0)
          goto LABEL_7;
      }
    }
  }

  return v11;
}

- (id)sources
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  -[MTConfig delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTConfig delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTConfig delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MTObject metricsKit](self, "metricsKit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __19__MTConfig_sources__block_invoke;
      v25[3] = &unk_24C7A0240;
      v26 = v16;
      v17 = v16;
      objc_msgSend(v12, "thenWithBlock:", v25);
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v18;
    }
  }
  else
  {
    MTConfigurationError(101, CFSTR("The method \"%s\" must be implemented in MTConfigDelegate."), v5, v6, v7, v8, v9, v10, (uint64_t)"-[MTConfig sources]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MTConfig injectedSource](self, "injectedSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __19__MTConfig_sources__block_invoke_2;
    v23[3] = &unk_24C7A0240;
    v24 = v20;
    objc_msgSend(v12, "thenWithBlock:", v23);
    v21 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v21;
  }

  return v12;
}

- (MTConfigDelegate)delegate
{
  return (MTConfigDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)injectedSource
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[MTConfig debugSource](self, "debugSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("MetricsKitConfigOverrides"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD1608];
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v2)
    {
      v8 = (void *)objc_msgSend(v2, "mutableCopy");
      objc_msgSend(v8, "addEntriesFromDictionary:", v4);
      v9 = objc_msgSend(v8, "copy");

      v2 = (id)v9;
    }
    else
    {
      v2 = v4;
    }
  }

  return v2;
}

- (NSDictionary)debugSource
{
  return self->_debugSource;
}

- (id)denylistedEventsForSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("blacklistedEvents"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTConfig configValueForKeyPath:sources:](self, "configValueForKeyPath:sources:", CFSTR("denylistedEvents"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTReflectUtil objectAsArray:](MTReflectUtil, "objectAsArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __19__MTConfig_sources__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configValueForKeyPath:(id)a3 default:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[MTConfig sources](self, "sources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__MTConfig_configValueForKeyPath_default___block_invoke;
  v18[3] = &unk_24C7A02B8;
  v18[4] = self;
  v19 = v6;
  v10 = v7;
  v20 = v10;
  v11 = v6;
  objc_msgSend(v8, "thenWithBlock:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __42__MTConfig_configValueForKeyPath_default___block_invoke_2;
  v16[3] = &unk_24C7A02E0;
  v17 = v10;
  v13 = v10;
  objc_msgSend(v12, "catchWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __42__MTConfig_configValueForKeyPath_default___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "configValueForKeyPath:sources:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3;
  else
    v4 = *(void **)(a1 + 48);
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MTPromise *__42__MTConfig_configValueForKeyPath_default___block_invoke_2(uint64_t a1)
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

- (void)setDebugSource:(id)a3
{
  objc_storeStrong((id *)&self->_debugSource, a3);
}

@end
