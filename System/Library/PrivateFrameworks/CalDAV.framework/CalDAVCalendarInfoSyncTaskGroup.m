@implementation CalDAVCalendarInfoSyncTaskGroup

- (Class)containerItemClass
{
  return (Class)objc_opt_class();
}

- (id)copyContainerParserMappings
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
  v26.super_class = (Class)CalDAVCalendarInfoSyncTaskGroup;
  v3 = -[CoreDAVContainerInfoSyncTaskGroup copyContainerParserMappings](&v26, sel_copyContainerParserMappings);
  v4 = +[CalDAVContainer copyPropertyMappingsForParser](CalDAVContainer, "copyPropertyMappingsForParser");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v3);
  if (-[CalDAVCalendarInfoSyncTaskGroup fetchSharees](self, "fetchSharees"))
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

- (BOOL)fetchSharees
{
  return self->_fetchSharees;
}

- (void)setFetchSharees:(BOOL)a3
{
  self->_fetchSharees = a3;
}

@end
