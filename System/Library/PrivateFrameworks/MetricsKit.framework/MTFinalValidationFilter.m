@implementation MTFinalValidationFilter

- (void)setShouldApplyDeRes:(BOOL)a3
{
  self->_shouldApplyDeRes = a3;
}

- (id)apply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTObject metricsKit](self, "metricsKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v7)
  {
    v20[0] = v7;
    v20[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__33__MTFinalValidationFilter_apply___block_invoke;
    v19[3] = (uint64_t)&unk_24C7A0240;
    v19[4] = (uint64_t)self;
    objc_msgSend(v15, "thenWithBlock:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MTError(301, 0, v8, v9, v10, v11, v12, v13, v19[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)validateFields:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = MTConfigurationError(108, CFSTR("The created metricsData contains a invalid field name %@"), v10, v11, v12, v13, v14, v15, v9);
          objc_msgSend(v3, "removeObjectForKey:", v9);
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "conformsToProtocol:", &unk_2549C7A48) & 1) == 0)
        {
          v18 = objc_opt_class();
          v25 = MTConfigurationError(108, CFSTR("The created metricsData value type '%@' for field name '%@' does not conform to NSCoding protocol"), v19, v20, v21, v22, v23, v24, v18);
          objc_msgSend(v3, "removeObjectForKey:", v9);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v17) & 1) == 0)
          {
            v32 = MTConfigurationError(108, CFSTR("The created metricsData value for field name %@ can't be serialized"), v26, v27, v28, v29, v30, v31, v9);
            objc_msgSend(v3, "removeObjectForKey:", v9);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }

}

id __33__MTFinalValidationFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "metricsDisabledOrDenylistedEvent:sources:", v6, v4);

  if (v9)
  {
    MTError(300, CFSTR("Metrics collection has been disabled or the event type %@ has been denylisted."), v10, v11, v12, v13, v14, v15, (uint64_t)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "metricsKit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "config");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeDenylistedFields:sources:", v16, v4);

    if (objc_msgSend(*(id *)(a1 + 32), "shouldApplyDeRes"))
    {
      objc_msgSend(*(id *)(a1 + 32), "metricsKit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "config");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "applyDeRes:sources:", v16, v4);

      objc_msgSend(v16, "mt_removeNaNValues");
    }
    objc_msgSend(*(id *)(a1 + 32), "validateFields:", v16);
    if (objc_msgSend(v16, "count"))
    {
      v28 = (void *)objc_msgSend(v16, "copy");
      +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v28);
    }
    else
    {
      MTError(302, CFSTR("Event data is empty because all fields have been denylisted."), v22, v23, v24, v25, v26, v27, v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v28);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (BOOL)shouldApplyDeRes
{
  return self->_shouldApplyDeRes;
}

@end
