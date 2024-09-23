@implementation CalDAVCalendarInfoTaskGroup

- (CalDAVCalendarInfoTaskGroup)initWithAccountInfoProvider:(id)a3 containerURLs:(id)a4 taskManager:(id)a5
{
  CalDAVCalendarInfoTaskGroup *v5;
  CalDAVCalendarInfoTaskGroup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarInfoTaskGroup;
  v5 = -[CoreDAVContainerInfoTaskGroup initWithAccountInfoProvider:containerURLs:taskManager:](&v8, sel_initWithAccountInfoProvider_containerURLs_taskManager_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)((char *)&v5->super.super.super.isa + (int)*MEMORY[0x24BE1ABF0]), (id)*MEMORY[0x24BE1ACF8]);
    objc_storeStrong((id *)((char *)&v6->super.super.super.isa + (int)*MEMORY[0x24BE1ABE8]), (id)*MEMORY[0x24BE1ACB0]);
    v6->_fetchSharees = 0;
  }
  return v6;
}

- (id)_copyContainerParserMappings
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)CalDAVCalendarInfoTaskGroup;
  v3 = -[CoreDAVContainerInfoTaskGroup _copyContainerParserMappings](&v26, sel__copyContainerParserMappings);
  v4 = +[CalDAVContainer copyPropertyMappingsForParser](CalDAVContainer, "copyPropertyMappingsForParser");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v3);
  if (-[CalDAVCalendarInfoTaskGroup fetchSharees](self, "fetchSharees"))
    objc_msgSend(v5, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], CFSTR("invite"), objc_opt_class());
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v7)
  {

    v17 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v19 = v4;
  v20 = v3;
  v21 = 0;
  v9 = *(_QWORD *)v23;
  v10 = *MEMORY[0x24BE1AE30];
  v11 = *MEMORY[0x24BE1AF18];
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v13, "nameSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v10))
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v11);

        if (!v16)
          continue;
        v14 = v21;
        v21 = v13;
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  }
  while (v8);

  v4 = v19;
  v3 = v20;
  v17 = v21;
  if (v21)
    objc_msgSend(v6, "removeObject:", v21);
LABEL_17:
  objc_msgSend(v6, "unionSet:", v4);

  return v6;
}

- (id)_copyContainerWithURL:(id)a3 andProperties:(id)a4
{
  id v5;
  id v6;
  CalDAVContainer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CoreDAVContainer initWithURL:andProperties:]([CalDAVContainer alloc], "initWithURL:andProperties:", v6, v5);

  return v7;
}

- (id)containerForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSlashIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v4;
  objc_msgSend(v4, "URLWithoutUsername");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendSlashIfNeeded");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1ABF8]);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v9)
  {
    v13 = 0;
    goto LABEL_23;
  }
  v10 = v9;
  v11 = *(_QWORD *)v35;
  v29 = v6;
  while (2)
  {
    v12 = 0;
    v30 = v10;
    do
    {
      if (*(_QWORD *)v35 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      objc_msgSend(v13, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendSlashIfNeeded");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "isEqualToString:", v6))
      {
        v25 = v13;
LABEL_21:

        goto LABEL_23;
      }
      objc_msgSend(v16, "stringByRemovingPercentEncoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", v6))
      {
        v26 = v13;

        goto LABEL_21;
      }
      objc_msgSend(v6, "stringByRemovingPercentEncoding");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", v18))
      {
        v31 = v13;
        v19 = 1;
      }
      else
      {
        v20 = v11;
        objc_msgSend(v13, "url");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URLWithoutUsername");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appendSlashIfNeeded");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "isEqualToString:", v32))
        {
          v31 = v13;
          v19 = 1;
        }
        else
        {
          v19 = 0;
        }
        v11 = v20;
        v10 = v30;

        v6 = v29;
      }

      if (v19)
      {
        v13 = v31;
        goto LABEL_23;
      }
      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v13 = 0;
    if (v10)
      continue;
    break;
  }
LABEL_23:

  return v13;
}

- (BOOL)fetchSharees
{
  return self->_fetchSharees;
}

- (void)setFetchSharees:(BOOL)a3
{
  self->_fetchSharees = a3;
}

@end
