@implementation DSSourceDescriptor

+ (id)descriptorCache
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)_descriptorCache;
  if (!_descriptorCache)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_descriptorCache;
    _descriptorCache = v1;

    v0 = (void *)_descriptorCache;
  }
  return v0;
}

+ (void)setDescriptorCache:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = v5;
  if ((id)_descriptorCache != v5)
  {
    v3 = objc_msgSend(v5, "copy");
    v4 = (void *)_descriptorCache;
    _descriptorCache = v3;

    v2 = v5;
  }

}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSourceDescriptor");
    v3 = (void *)DSLogSourceDescriptor;
    DSLogSourceDescriptor = (uint64_t)v2;

  }
}

- (id)initWithSourceName:(void *)a3 localizationBundle:
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v13;
  id v14;
  objc_super v15;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSourceName_localizationBundle_, a1, CFSTR("DSSourceDescriptor.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceName.length"));

    }
    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("No source name provided"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    v15.receiver = a1;
    v15.super_class = (Class)DSSourceDescriptor;
    v8 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(a1[2], "URLForResource:withExtension:", CFSTR("SourceDescriptors"), CFSTR("plist"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[3];
      a1[3] = (id)v10;

    }
  }

  return a1;
}

- (void)setSourceName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)setLocalizationBundle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (uint64_t)localizationBundle
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setSourceProperties:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

+ (id)sourceDescriptorForSource:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "dssd_bundleForSourceDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sourceDescriptorForSource:localizationBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sourceDescriptorForSource:(id)a3 localizationBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  +[DSSourceDescriptor descriptorCache]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[DSSourceDescriptor initWithSourceName:localizationBundle:]((id *)[DSSourceDescriptor alloc], v5, v6);
    +[DSSourceDescriptor descriptorCache]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  }
  v10 = v8;

  return v10;
}

- (__CFString)resourceTypeFromResource:(uint64_t)a1
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;

  if (a1)
  {
    objc_msgSend(a2, "displayDetail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("RESOURCE");
    if (v3)
    {
      v5 = *(void **)(a1 + 24);
      v6 = *(_QWORD *)(a1 + 8);
      v7 = v5;
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RESOURCE_TYPES"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", v3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (__CFString *)v10;
      else
        v12 = CFSTR("RESOURCE");
      v4 = v12;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)sourceProperties
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)sourceName
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (id)sharedResourcesByResourceType:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v17 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[DSSourceDescriptor resourceTypeFromResource:](a1, v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("RESOURCE")))
          {

            v11 = CFSTR("RESOURCES");
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = v12;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v15 = v14;

          objc_msgSend(v15, "addObject:", v10);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v11);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)peopleByResourceType:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "allPeople");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v29;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(obj);
          v23 = v6;
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v7, "sharedResourcesForSourceName:", *(_QWORD *)(a1 + 8));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v25 != v11)
                  objc_enumerationMutation(v8);
                -[DSSourceDescriptor resourceTypeFromResource:](a1, *(void **)(*((_QWORD *)&v24 + 1) + 8 * i));
                v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RESOURCE")))
                {

                  v13 = CFSTR("RESOURCES");
                }
                objc_msgSend(v5, "objectForKeyedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v14;
                if (v14)
                {
                  v16 = v14;
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                  v16 = (id)objc_claimAutoreleasedReturnValue();
                }
                v17 = v16;

                objc_msgSend(v17, "addObject:", v7);
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v13);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v10);
          }

          v6 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v22);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resourceTypeOrder
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(id *)(a1 + 24);
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RESOURCE_TYPE_ORDER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9[0] = CFSTR("RESOURCES");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)orderedResourceTypes:(id)a1
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSourceDescriptor resourceTypeOrder]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__DSSourceDescriptor_orderedResourceTypes___block_invoke;
    v7[3] = &unk_24F081C98;
    v8 = v4;
    v5 = v4;
    objc_msgSend(v3, "sortUsingComparator:", v7);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t __43__DSSourceDescriptor_orderedResourceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 > v8)
    return 1;
  else
    return v9;
}

- (_QWORD)localizableKey:(_QWORD *)a1
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), a1[1], a2);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (NSString)localizedName
{
  NSBundle *localizationBundle;
  NSBundle *v4;
  void *v5;
  void *v6;

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v4 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("NAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)localizedAppName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSBundle *v7;
  NSBundle *v8;
  NSBundle *localizationBundle;
  NSBundle *v10;
  id v12;

  -[DSSourceDescriptor correspondingApplicationIdentifier](self, "correspondingApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithApplicationIdentifier:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v4)
  {
    if (self)
      localizationBundle = self->_localizationBundle;
    else
      localizationBundle = 0;
    v10 = localizationBundle;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("APP_NAME"));
    v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v8, &stru_24F082380, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_4:
    if (self)
      v7 = self->_localizationBundle;
    else
      v7 = 0;
    v8 = v7;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("APP_NAME"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  return (NSString *)v6;
}

- (NSString)localizedAlertButtonLabel
{
  NSBundle *localizationBundle;
  NSBundle *v4;
  void *v5;
  void *v6;

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v4 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("ALERT_BUTTON_LABEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)localizedAlertDetailForSelectedPeople:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *sourceName;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  NSBundle *localizationBundle;
  NSBundle *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSBundle *v43;
  NSBundle *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v52;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v6);
        if (self)
          sourceName = self->_sourceName;
        else
          sourceName = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v10), "sharedResourcesForSourceName:", sourceName);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      v8 = v13;
    }
    while (v13);
  }

  -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v6, "count");
  v18 = CFSTR("ALERT_DETAIL_%@");
  if (v17 == 1)
    v18 = CFSTR("ALERT_DETAIL_SINGLE_PERSON_%@");
  v19 = (void *)MEMORY[0x24BDD17C8];
  v20 = v18;
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("_"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("ALERT_DETAIL_SINGLE_PERSON_%@"));
  if (v23)
  {
    objc_msgSend(v6, "firstObject");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v50 = v14;
    if (self)
      localizationBundle = self->_localizationBundle;
    else
      localizationBundle = 0;
    v26 = localizationBundle;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedAttributedStringForKey:value:table:](v26, "localizedAttributedStringForKey:value:table:", v27, &stru_24F082380, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc(MEMORY[0x24BDD1458]);
    v56 = *MEMORY[0x24BDD0DE8];
    objc_msgSend(v24, "termsOfAddress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v29, "initWithFormat:options:locale:context:", v28, 0, 0, v32);

    objc_msgSend(v33, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = objc_msgSend(v34, "containsString:", CFSTR("@"));

    if ((_DWORD)v30)
    {
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v33, "string");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "displayGivenName");
      v37 = v28;
      v38 = v22;
      v39 = v16;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", v36, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v39;
      v22 = v38;
      v28 = v37;

    }
    else
    {
      objc_msgSend(v33, "string");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v50;

  }
  else
  {
    v42 = v16;
    if (self)
      v43 = self->_localizationBundle;
    else
      v43 = 0;
    v44 = v43;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v22);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v44, "localizedStringForKey:value:table:", v45, &stru_24F082380, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "containsString:", CFSTR("@")))
    {
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "displayGivenName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v24, v48, objc_msgSend(v6, "count") - 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = v24;
      v41 = v24;
    }
    v16 = v42;
  }

  return v41;
}

- (NSString)localizedStopAllLabel
{
  NSBundle *localizationBundle;
  NSBundle *v4;
  void *v5;
  void *v6;

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v4 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("STOP_ALL_LABEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)localizedStopAllAlertLabel
{
  NSBundle *localizationBundle;
  NSBundle *v4;
  void *v5;
  void *v6;

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v4 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("STOP_ALL_SHARING_ALERT_LABEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)localizedStopAllAlertDetail
{
  NSBundle *localizationBundle;
  NSBundle *v4;
  void *v5;
  void *v6;

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v4 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("STOP_ALL_SHARING_ALERT_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_24F082380, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)localizedDetailTextByType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *sourceName;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSBundle *localizationBundle;
  NSBundle *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSBundle *v49;
  NSBundle *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  NSBundle *v63;
  NSBundle *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  _QWORD v82[2];
  _QWORD v83[2];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "allPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v4, "allPeople");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v78;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v78 != v10)
          objc_enumerationMutation(v7);
        if (self)
          sourceName = self->_sourceName;
        else
          sourceName = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v11), "sharedResourcesForSourceName:", sourceName);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v13);

        ++v11;
      }
      while (v9 != v11);
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      v9 = v14;
    }
    while (v14);
  }

  -[DSSourceDescriptor peopleByResourceType:]((uint64_t)self, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count") == 1)
  {
    v76 = v5;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    v75 = v4;
    v72 = (void *)v19;
    if (v21 == 1)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "anyObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSourceDescriptor resourceTypeFromResource:]((uint64_t)self, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("DETAIL_TEXT_SINGLE_%@_WITH_NAME"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (self)
        localizationBundle = self->_localizationBundle;
      else
        localizationBundle = 0;
      v27 = localizationBundle;
      -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSBundle localizedStringForKey:value:table:](v27, "localizedStringForKey:value:table:", v28, &stru_24F082380, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = objc_msgSend(v29, "isEqualToString:", v30);

      objc_msgSend(v6, "anyObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "displayName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v28 & 1) == 0 && objc_msgSend(v32, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v29, objc_msgSend(v76, "count"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

        v58 = v72;
LABEL_38:

        v4 = v75;
        v5 = v76;
        goto LABEL_39;
      }

      v59 = CFSTR("SINGLE");
      v19 = (uint64_t)v72;
    }
    else
    {
      v59 = CFSTR("MULTIPLE");
    }
    v60 = (void *)MEMORY[0x24BDD17C8];
    v83[0] = v59;
    v83[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "componentsJoinedByString:", CFSTR("_"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("DETAIL_TEXT_%@"), v62);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      v63 = self->_localizationBundle;
    else
      v63 = 0;
    v64 = v63;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v25);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v64, "localizedStringForKey:value:table:", v65, &stru_24F082380, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v32);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringWithFormat:", v29, objc_msgSend(v67, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  if (objc_msgSend(v16, "count") == 2)
  {
    v74 = v15;
    v75 = v4;
    v76 = v5;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count") == 1)
      v36 = CFSTR("SINGLE");
    else
      v36 = CFSTR("MULTIPLE");
    v82[0] = v36;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "count") == 1)
      v39 = CFSTR("SINGLE");
    else
      v39 = CFSTR("MULTIPLE");
    v82[1] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v42;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v43;
    v71 = v40;
    objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v44;
    v73 = v18;
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "componentsJoinedByString:", CFSTR("_"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("DETAIL_TEXT_%@"), v47);
    v48 = objc_claimAutoreleasedReturnValue();

    if (self)
      v49 = self->_localizationBundle;
    else
      v49 = 0;
    v50 = v49;
    -[DSSourceDescriptor localizableKey:](self, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v50, "localizedStringForKey:value:table:", v51, &stru_24F082380, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = (void *)v48;
    v52 = (void *)MEMORY[0x24BDD17C8];
    v18 = v73;
    objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v74;
    objc_msgSend(v74, "objectForKeyedSubscript:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count");
    objc_msgSend(v73, "objectAtIndexedSubscript:", 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringWithFormat:", v69, v55, objc_msgSend(v57, "count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v71;
    goto LABEL_38;
  }
  if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
    -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
  v33 = 0;
LABEL_39:

  return v33;
}

- (id)localizedPublicSharingDetailTextByType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSBundle *localizationBundle;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;

  objc_msgSend(a3, "allPublicResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor orderedResourceTypes:](self, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("PUBLIC_SHARING_DETAIL_TEXT_%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v13 = localizationBundle;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", v14, &stru_24F082380, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v15, objc_msgSend(v4, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "count") == 2)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v15, v19, objc_msgSend(v21, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
      -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
    v16 = 0;
  }

  return v16;
}

- (id)_localizedStopByPerson:(void *)a3 detailTextForDirectlySharedResources:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  _QWORD v151[3];

  v151[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = objc_msgSend(v6, "count");
    if (v8)
    {
      v9 = v8;
      -[DSSourceDescriptor sharedResourcesByResourceType:](a1, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSourceDescriptor orderedResourceTypes:]((id)a1, (uint64_t)v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v5, "shareDirectionForSourceName:", *(_QWORD *)(a1 + 8));
      v130 = v12;
      if ((~v13 & 3) == 0)
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        if (v9 != 1)
        {
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR("_"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("STOP_BY_PERSON_BOTH_MULTIPLE_%@"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = *(id *)(a1 + 16);
          -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, (uint64_t)v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedAttributedStringForKey:value:table:", v27, &stru_24F082380, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "count") == 1)
          {
            v124 = objc_alloc(MEMORY[0x24BDD1458]);
            v150 = *MEMORY[0x24BDD0DE8];
            objc_msgSend(v5, "termsOfAddress");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v149 = v29;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v151[0] = v30;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
            v31 = v10;
            v32 = v25;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayGivenName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v124, "initWithFormat:options:locale:context:", v28, 0, 0, v33, v34, v9);

            v25 = v32;
            v10 = v31;

            objc_msgSend(v35, "string");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else if (objc_msgSend(v10, "count") == 2)
          {
            v115 = objc_alloc(MEMORY[0x24BDD1458]);
            v147 = *MEMORY[0x24BDD0DE8];
            objc_msgSend(v5, "termsOfAddress");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = v121;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v146, 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v148 = v118;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayGivenName");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v112);
            v126 = v25;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "count");
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (void *)objc_msgSend(v115, "initWithFormat:options:locale:context:", v28, 0, 0, v110, v73, v75, objc_msgSend(v77, "count"));

            v25 = v126;
            objc_msgSend(v78, "string");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
              -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
            v23 = 0;
          }

          goto LABEL_41;
        }
        objc_msgSend(v7, "anyObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DSSourceDescriptor resourceTypeFromResource:](a1, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("STOP_BY_PERSON_BOTH_SINGLE_%@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = *(id *)(a1 + 16);
        -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, (uint64_t)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_24F082380, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "displayGivenName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      if ((v13 & 1) != 0)
      {
        v36 = (void *)MEMORY[0x24BDD17C8];
        if (v9 == 1)
        {
          objc_msgSend(v7, "anyObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSSourceDescriptor resourceTypeFromResource:](a1, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("STOP_BY_PERSON_INCOMING_SINGLE_%@"), v38);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = *(id *)(a1 + 16);
          -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, (uint64_t)v17);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedAttributedStringForKey:value:table:", v40, &stru_24F082380, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = objc_alloc(MEMORY[0x24BDD1458]);
          v144 = *MEMORY[0x24BDD0DE8];
          objc_msgSend(v5, "termsOfAddress");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = v43;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v143, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = v44;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayGivenName");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(v42, "initWithFormat:options:locale:context:", v41, 0, 0, v45, v46);

          objc_msgSend(v47, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
          goto LABEL_41;
        }
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("_"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("STOP_BY_PERSON_INCOMING_MULTIPLE_%@"), v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = *(id *)(a1 + 16);
        -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, (uint64_t)v80);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringForKey:value:table:", v82, &stru_24F082380, 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "count") == 1)
        {
          v84 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "displayGivenName");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "localizedStringWithFormat:", v83, v9, v85);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
          goto LABEL_41;
        }
        if (objc_msgSend(v10, "count") == 2)
        {
          v122 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v128);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v12;
          v97 = objc_msgSend(v95, "count");
          objc_msgSend(v5, "displayGivenName");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "objectAtIndexedSubscript:", 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "localizedStringWithFormat:", v83, v97, v98, objc_msgSend(v100, "count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_40;
        }
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
          goto LABEL_38;
      }
      else
      {
        if ((v13 & 2) == 0)
        {
          v23 = 0;
LABEL_41:

          goto LABEL_42;
        }
        v48 = (void *)MEMORY[0x24BDD17C8];
        if (v9 == 1)
        {
          objc_msgSend(v7, "anyObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSSourceDescriptor resourceTypeFromResource:](a1, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("STOP_BY_PERSON_OUTGOING_SINGLE_%@"), v50);
          v51 = objc_claimAutoreleasedReturnValue();

          v52 = *(id *)(a1 + 16);
          v120 = (void *)v51;
          -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "localizedAttributedStringForKey:value:table:", v53, &stru_24F082380, 0);
          v114 = objc_claimAutoreleasedReturnValue();

          v54 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "anyObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSSourceDescriptor resourceTypeFromResource:](a1, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("STOP_BY_PERSON_OUTGOING_SINGLE_%@_WITH_NAME"), v56);
          v57 = objc_claimAutoreleasedReturnValue();

          v58 = *(id *)(a1 + 16);
          -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "localizedAttributedStringForKey:value:table:", v59, &stru_24F082380, 0);
          v60 = objc_claimAutoreleasedReturnValue();

          v125 = (void *)v60;
          objc_msgSend((id)v60, "string");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = (void *)v57;
          -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, v57);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v60) = objc_msgSend(v61, "isEqualToString:", v62);

          objc_msgSend(v7, "anyObject");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "displayName");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v60 & 1) != 0 || !objc_msgSend(v64, "length"))
          {
            v70 = v64;
            v101 = objc_alloc(MEMORY[0x24BDD1458]);
            v138 = *MEMORY[0x24BDD0DE8];
            objc_msgSend(v5, "termsOfAddress");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = v66;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v137, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = v67;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayGivenName");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v101;
            v72 = (void *)v114;
            v71 = (void *)objc_msgSend(v102, "initWithFormat:options:locale:context:", v114, 0, 0, v68, v69);
          }
          else
          {
            v65 = objc_alloc(MEMORY[0x24BDD1458]);
            v141 = *MEMORY[0x24BDD0DE8];
            objc_msgSend(v5, "termsOfAddress");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = v66;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v140, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = v67;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "displayGivenName");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v64;
            v71 = (void *)objc_msgSend(v65, "initWithFormat:options:locale:context:", v125, 0, 0, v68, v69, v64);
            v72 = (void *)v114;
          }

          objc_msgSend(v71, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_41;
        }
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("_"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("STOP_BY_PERSON_OUTGOING_MULTIPLE_%@"), v86);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = *(id *)(a1 + 16);
        -[DSSourceDescriptor localizableKey:]((_QWORD *)a1, (uint64_t)v80);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "localizedAttributedStringForKey:value:table:", v88, &stru_24F082380, 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "count") == 1)
        {
          v89 = objc_alloc(MEMORY[0x24BDD1458]);
          v135 = *MEMORY[0x24BDD0DE8];
          objc_msgSend(v5, "termsOfAddress");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = v127;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v134, 1);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = v90;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayGivenName");
          v92 = v80;
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (void *)objc_msgSend(v89, "initWithFormat:options:locale:context:", v83, 0, 0, v91, v93, v9);

          v80 = v92;
          objc_msgSend(v94, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_40;
        }
        if (objc_msgSend(v10, "count") == 2)
        {
          v116 = objc_alloc(MEMORY[0x24BDD1458]);
          v132 = *MEMORY[0x24BDD0DE8];
          objc_msgSend(v5, "termsOfAddress");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = v123;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 1);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v119;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayGivenName");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v113);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = v80;
          v105 = objc_msgSend(v104, "count");
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)objc_msgSend(v116, "initWithFormat:options:locale:context:", v83, 0, 0, v111, v103, v105, objc_msgSend(v107, "count"));

          objc_msgSend(v108, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v80 = v129;
          goto LABEL_40;
        }
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
LABEL_38:
          -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
      }
      v23 = 0;
      goto LABEL_40;
    }
  }
  v23 = 0;
LABEL_42:

  return v23;
}

- (id)_localizedStopByPerson:(void *)a3 detailTextForIndirectlySharedResources:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = (void *)objc_msgSend(v6, "count");
    if (v8)
    {
      -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)a1, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSSourceDescriptor orderedResourceTypes:](a1, (uint64_t)v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("_"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("STOP_BY_PERSON_INDIRECT_%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = a1[2];
      -[DSSourceDescriptor localizableKey:](a1, (uint64_t)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24F082380, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "count") == 1)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "displayGivenName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v17, v19, v8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (objc_msgSend(v9, "count") == 2)
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "displayGivenName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v25, "count");
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringWithFormat:", v17, v20, v21, objc_msgSend(v23, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
          -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)localizedStopByPerson:(id)a3
{
  id v4;
  void *v5;
  NSString *sourceName;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self)
    sourceName = self->_sourceName;
  else
    sourceName = 0;
  objc_msgSend(v4, "sharedResourcesForSourceName:", sourceName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v5, "shareDirectionForSharedResource:", v15, (_QWORD)v23) & 4) != 0)
          v16 = v9;
        else
          v16 = v8;
        objc_msgSend(v16, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  -[DSSourceDescriptor _localizedStopByPerson:detailTextForDirectlySharedResources:]((uint64_t)self, v5, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor _localizedStopByPerson:detailTextForIndirectlySharedResources:]((id *)&self->super.isa, v5, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
    objc_msgSend(v19, "addObject:", v17);
  if (v18)
    objc_msgSend(v20, "addObject:", v18);
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "), (_QWORD)v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)localizedAlertTextForPerson:(id)a3
{
  NSBundle *localizationBundle;
  NSBundle *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (self)
    localizationBundle = self->_localizationBundle;
  else
    localizationBundle = 0;
  v6 = localizationBundle;
  v7 = a3;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)CFSTR("STOP_BY_PERSON_ALERT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedAttributedStringForKey:value:table:](v6, "localizedAttributedStringForKey:value:table:", v8, &stru_24F082380, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  v20 = *MEMORY[0x24BDD0DE8];
  objc_msgSend(v7, "termsOfAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v10, "initWithFormat:options:locale:context:", v9, 0, 0, v13, v14, v15);
  objc_msgSend(v16, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)supportsResourceTypes
{
  const __CFString *sourceName;

  if (self)
    sourceName = (const __CFString *)self->_sourceName;
  else
    sourceName = 0;
  return sourceName == CFSTR("com.apple.DigitalSeparation.Photos");
}

- (id)localizedStopAllAlertDetailForPeople:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSBundle *localizationBundle;
  NSBundle *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSBundle *v23;
  NSBundle *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor _sharedResourcesForPeople:isOwnedByUser:](self, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "addObject:", CFSTR("OUTGOING"));
    -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v6, CFSTR("STOP_ALL_SHARING_ALERT_DETAIL_TEXT_OUTGOING_%@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      localizationBundle = self->_localizationBundle;
    else
      localizationBundle = 0;
    v9 = localizationBundle;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_24F082380, 0);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v33 = (void *)v11;
  -[DSSourceDescriptor _sharedResourcesForPeople:isOwnedByUser:](self, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v5, "addObject:", CFSTR("INCOMING"));
    -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v12, CFSTR("STOP_ALL_SHARING_ALERT_DETAIL_TEXT_INCOMING_%@"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v14 = self->_localizationBundle;
    else
      v14 = 0;
    v15 = v14;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", v16, &stru_24F082380, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)MEMORY[0x24BDD17C8];
  v19 = v5;
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("STOP_ALL_SHARING_ALERT_DETAIL_%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v6;
  if (self)
    v23 = self->_localizationBundle;
  else
    v23 = 0;
  v24 = v23;
  -[DSSourceDescriptor localizableKey:](self, (uint64_t)v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", v25, &stru_24F082380, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v33;
  if (v33 && v17)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    v32 = v17;
LABEL_16:
    objc_msgSend(v28, "stringWithFormat:", v26, v33, v32);
LABEL_19:
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v26, v17, v32);
    goto LABEL_19;
  }
  if (v33)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    goto LABEL_16;
  }
  v31 = (void *)DSLogSourceDescriptor;
  if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
    -[DSSourceDescriptor localizedStopAllAlertDetailForPeople:].cold.1(self == 0, (uint64_t)self, v31);
  v29 = 0;
  v27 = 0;
LABEL_20:

  return v29;
}

- (_QWORD)_sharedResourcesForPeople:(int)a3 isOwnedByUser:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v20;
  id obj;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v23 = a1;
  v20 = v5;
  if (a1)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set", v5);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v10, "sharedResourcesForSourceName:", v23[1]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                v17 = objc_msgSend(v10, "shareDirectionForSharedResource:", v16);
                v18 = (v17 & 0xFFFFFFFFFFFFFFFELL) == 2;
                if (!a3)
                  v18 = v17 != 2;
                if (v18)
                  objc_msgSend(a1, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }

  }
  return a1;
}

- (id)_locKeyForResources:(void *)a3 withDescriptorKey:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_19;
  }
  -[DSSourceDescriptor sharedResourcesByResourceType:]((uint64_t)a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSourceDescriptor orderedResourceTypes:](a1, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = CFSTR("MULTIPLE");
    if (v11 == 1)
      v12 = CFSTR("SINGLE");
    v13 = v12;

    v14 = (void *)MEMORY[0x24BDD17C8];
    v35[0] = v13;
    v35[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v5, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v6, "count") != 2)
    {
      if (os_log_type_enabled((os_log_t)DSLogSourceDescriptor, OS_LOG_TYPE_FAULT))
        -[DSSourceDescriptor localizedDetailTextByType:].cold.1();
      v17 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    if (objc_msgSend(v19, "count") == 1)
      v20 = CFSTR("SINGLE");
    else
      v20 = CFSTR("MULTIPLE");
    v34[0] = v20;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count") == 1)
      v23 = CFSTR("SINGLE");
    else
      v23 = CFSTR("MULTIPLE");
    v34[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v25;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v26;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v27;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", CFSTR("_"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v32, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v32;
  }

LABEL_18:
LABEL_19:

  return v17;
}

- (id)localizedStopByTypeSubtitleForSharingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *sourceName;
  void *v12;
  uint64_t v13;
  void *v14;
  NSBundle *localizationBundle;
  NSBundle *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "allPeople", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        if (self)
          sourceName = self->_sourceName;
        else
          sourceName = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "sharedResourcesForSourceName:", sourceName);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = v13;
    }
    while (v13);
  }

  -[DSSourceDescriptor _locKeyForResources:withDescriptorKey:](self, v5, CFSTR("STOP_BY_TYPE_SUBTITLE_%@"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (self)
      localizationBundle = self->_localizationBundle;
    else
      localizationBundle = 0;
    v16 = localizationBundle;
    -[DSSourceDescriptor localizableKey:](self, (uint64_t)v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v17, &stru_24F082380, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)priority
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  unint64_t v7;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PRIORITY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 <= 1)
    return 1;
  else
    return v7;
}

- (NSArray)darwinNotifications
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DARWIN_NOTIFICATIONS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v8 = v7;

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  DSSourceDescriptor *v4;
  NSDictionary *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = self;
  if (self)
  {
    v5 = self->_sourceProperties;
    v4 = (DSSourceDescriptor *)v4->_sourceName;
  }
  else
  {
    v5 = 0;
  }
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)ignoreErrors
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IGNORE_ERRORS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1B8];
  v8 = v7;

  return v8;
}

- (BOOL)shouldIgnoreError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[DSSourceDescriptor ignoreErrors](self, "ignoreErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v4, "code");

  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v7, "containsObject:", v10);

  return (char)v8;
}

- (NSString)dataUsageBundleIdentifier
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  void *v7;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("REQUIRED_DATA_USAGE_POLICY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle-identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)requiresWifi
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("REQUIRED_DATA_USAGE_POLICY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wifi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)requiresCellular
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("REQUIRED_DATA_USAGE_POLICY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (NSString)correspondingApplicationIdentifier
{
  NSDictionary *v3;
  NSString *sourceName;
  void *v5;
  void *v6;

  if (self)
  {
    v3 = self->_sourceProperties;
    sourceName = self->_sourceName;
  }
  else
  {
    v3 = 0;
    sourceName = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", sourceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("APPLICATION_IDENTIFIER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceProperties, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
}

- (void)localizedDetailTextByType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_227D24000, v0, v1, "More than 2 resource types are not supported: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)localizedStopAllAlertDetailForPeople:(void *)a3 .cold.1(char a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) != 0)
    v3 = 0;
  else
    v3 = *(_QWORD *)(a2 + 8);
  v5 = 138543362;
  v6 = v3;
  v4 = a3;
  _os_log_fault_impl(&dword_227D24000, v4, OS_LOG_TYPE_FAULT, "Could not support resource specific alert detail for source: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
