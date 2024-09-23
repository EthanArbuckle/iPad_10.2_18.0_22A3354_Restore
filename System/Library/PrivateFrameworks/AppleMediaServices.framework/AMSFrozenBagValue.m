@implementation AMSFrozenBagValue

- (AMSBagDataSourceProtocol)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (AMSFrozenBagValue)initWithKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t i;
  void *v13;
  id v14;
  AMSBagFrozenDataSourceBuilder *v15;
  void *v16;
  void *v17;
  AMSFrozenBagValue *v18;
  AMSFrozenBagValue *v19;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v8)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    for (i = 0; i < objc_msgSend(v10, "count"); ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (i == objc_msgSend(v10, "count") - 1)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v13);
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v13);

        v11 = v14;
      }

    }
  }
  v15 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagFrozenDataSourceBuilder setExpirationDate:](v15, "setExpirationDate:", v16);

  -[AMSBagFrozenDataSourceBuilder setData:](v15, "setData:", MEMORY[0x1E0C9AA70]);
  -[AMSBagFrozenDataSourceBuilder setProfile:](v15, "setProfile:", CFSTR("AMSFrozenBagValue"));
  -[AMSBagFrozenDataSourceBuilder setProfileVersion:](v15, "setProfileVersion:", CFSTR("1"));
  if (v8)
    -[AMSBagFrozenDataSourceBuilder setData:](v15, "setData:", v9);
  -[AMSBagFrozenDataSourceBuilder createFrozenDataSource](v15, "createFrozenDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AMSBagValue initWithDataSource:key:valueType:](self, "initWithDataSource:key:valueType:", v17, v7, a5);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_dataSource, v17);

  return v19;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

@end
