@implementation MTCallerSuppliedFields

- (MTCallerSuppliedFields)initWithEventData:(id)a3
{
  id v4;
  MTCallerSuppliedFields *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTCallerSuppliedFields;
  v5 = -[MTCallerSuppliedFields init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mt_verifyEventData");
    objc_msgSend(v4, "mt_deepCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCallerSuppliedFields setEventData:](v5, "setEventData:", v6);

  }
  return v5;
}

- (id)valueForCallerSuppliedField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MTCallerSuppliedFields eventData](self, "eventData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 - 1 >= 0)
  {
    do
    {
      --v6;
      -[MTCallerSuppliedFields eventData](self, "eventData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 != v10)
          {

            goto LABEL_8;
          }
        }

      }
    }
    while (v6 > 0);
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMergedFields, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
}

- (MTCallerSuppliedFields)initWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  MTCallerSuppliedFields *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("pageId"));
  if (v11)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("pageType"));
  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("pageContext"));
  if (objc_msgSend(v15, "count"))
  {
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v13);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v17;
    }
  }
  else
  {
    v16 = v13;
  }
  v18 = -[MTCallerSuppliedFields initWithEventData:](self, "initWithEventData:", v16);

  return v18;
}

- (id)mergedFields
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[MTCallerSuppliedFields cachedMergedFields](self, "cachedMergedFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTCallerSuppliedFields cachedMergedFields](self, "cachedMergedFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    -[MTCallerSuppliedFields eventData](self, "eventData");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __38__MTCallerSuppliedFields_mergedFields__block_invoke;
    v13[3] = &unk_24C7A0DD8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "thenWithBlock:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

    return v12;
  }
}

id __38__MTCallerSuppliedFields_mergedFields__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  void *v5;

  +[MTReflectUtil mergeAndCleanDictionaries:](MTReflectUtil, "mergeAndCleanDictionaries:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedMergedFields:", v3);

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)cachedMergedFields
{
  return self->_cachedMergedFields;
}

- (void)setCachedMergedFields:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMergedFields, a3);
}

@end
