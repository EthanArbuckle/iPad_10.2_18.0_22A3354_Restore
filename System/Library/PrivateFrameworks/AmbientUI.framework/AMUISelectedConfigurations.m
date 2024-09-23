@implementation AMUISelectedConfigurations

- (AMUISelectedConfigurations)init
{
  void *v3;
  void *v4;
  AMUISelectedConfigurations *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (AMUISelectedConfigurations *)-[AMUISelectedConfigurations _initWithLastUseDate:lastUpdateDate:selections:]((id *)&self->super.isa, v3, v3, v4);

  return v5;
}

- (id)_initWithLastUseDate:(void *)a3 lastUpdateDate:(void *)a4 selections:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)AMUISelectedConfigurations;
    v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      v12 = objc_msgSend(v10, "mutableCopy");
      v13 = a1[3];
      a1[3] = (id)v12;

    }
  }

  return a1;
}

- (AMUISelectedConfigurations)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  AMUISelectedConfigurations *v18;
  _QWORD v20[4];
  id v21;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("lastUseDate"), objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("lastUpdateDate"), objc_opt_class());
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v6;
  v14 = v13;

  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("selections"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__AMUISelectedConfigurations_initWithDictionaryRepresentation___block_invoke;
  v20[3] = &unk_250763848;
  v21 = v16;
  v17 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
  v18 = (AMUISelectedConfigurations *)-[AMUISelectedConfigurations _initWithLastUseDate:lastUpdateDate:selections:]((id *)&self->super.isa, v10, v14, v17);

  return v18;
}

void __63__AMUISelectedConfigurations_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class();
  v15 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v15;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = objc_opt_class();
  v11 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v9 && v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
    if (v14)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v9);

  }
}

+ (id)lastUsedDateFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("lastUseDate"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lastUpdatedDateFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("lastUpdateDate"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  NSDate *lastUseDate;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUseDate = self->_lastUseDate;
  self->_lastUseDate = v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_selections, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLastSelectedConfigurationUUID:(id)a3 forProviderBundleIdentifier:(id)a4
{
  void *v6;
  id v7;
  NSDate *v8;
  NSDate *lastUseDate;
  NSDate *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v11 = a3;
  objc_msgSend(v6, "date");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lastUpdateDate, v8);
  lastUseDate = self->_lastUseDate;
  self->_lastUseDate = v8;
  v10 = v8;

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_selections, "setObject:forKeyedSubscript:", v11, v7);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  NSMutableDictionary *selections;
  id v5;
  NSDate *lastUpdateDate;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_selections, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selections = self->_selections;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __54__AMUISelectedConfigurations_dictionaryRepresentation__block_invoke;
  v12 = &unk_250763870;
  v13 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](selections, "enumerateKeysAndObjectsUsingBlock:", &v9);
  v14[0] = CFSTR("lastUseDate");
  v14[1] = CFSTR("lastUpdateDate");
  lastUpdateDate = self->_lastUpdateDate;
  v15[0] = self->_lastUseDate;
  v15[1] = lastUpdateDate;
  v14[2] = CFSTR("selections");
  v15[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

void __54__AMUISelectedConfigurations_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_selections, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDate *lastUseDate;
  uint64_t v7;
  id v8;
  id v9;
  NSDate *lastUpdateDate;
  id v11;
  id v12;
  NSMutableDictionary *selections;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lastUseDate = self->_lastUseDate;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke;
  v21[3] = &unk_250763898;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", lastUseDate, v21);
  lastUpdateDate = self->_lastUpdateDate;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke_2;
  v19[3] = &unk_250763898;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", lastUpdateDate, v19);
  selections = self->_selections;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke_3;
  v17[3] = &unk_250763898;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", selections, v17);
  LOBYTE(selections) = objc_msgSend(v5, "isEqual");

  return (char)selections;
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

- (NSDate)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUseDate, a3);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateDate, a3);
}

- (NSMutableDictionary)selections
{
  return self->_selections;
}

- (void)setSelections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selections, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastUseDate, 0);
}

@end
