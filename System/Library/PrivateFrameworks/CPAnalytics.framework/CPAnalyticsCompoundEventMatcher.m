@implementation CPAnalyticsCompoundEventMatcher

- (CPAnalyticsCompoundEventMatcher)init
{
  return -[CPAnalyticsCompoundEventMatcher initWithType:subEventMatchers:](self, "initWithType:subEventMatchers:", 1, MEMORY[0x24BDBD1A8]);
}

- (CPAnalyticsCompoundEventMatcher)initWithType:(unint64_t)a3 subEventMatchers:(id)a4
{
  id v6;
  CPAnalyticsCompoundEventMatcher *v7;
  CPAnalyticsCompoundEventMatcher *v8;
  uint64_t v9;
  NSArray *subEventMatchers;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPAnalyticsCompoundEventMatcher;
  v7 = -[CPAnalyticsCompoundEventMatcher init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    subEventMatchers = v8->_subEventMatchers;
    v8->_subEventMatchers = (NSArray *)v9;

  }
  return v8;
}

- (BOOL)doesMatch:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CPAnalyticsCompoundEventMatcher type](self, "type");
  switch(v5)
  {
    case 3uLL:
      -[CPAnalyticsCompoundEventMatcher subEventMatchers](self, "subEventMatchers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v12, "doesMatch:", v4) ^ 1;

      goto LABEL_25;
    case 2uLL:
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[CPAnalyticsCompoundEventMatcher subEventMatchers](self, "subEventMatchers", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (!v11)
        goto LABEL_25;
      v13 = *(_QWORD *)v17;
LABEL_16:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "doesMatch:", v4) & 1) != 0)
          goto LABEL_12;
        if (v11 == ++v14)
        {
          v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
            goto LABEL_16;
          goto LABEL_25;
        }
      }
    case 1uLL:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[CPAnalyticsCompoundEventMatcher subEventMatchers](self, "subEventMatchers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v6);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "doesMatch:", v4))
            {
              LOBYTE(v11) = 0;
              goto LABEL_25;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_12:
      LOBYTE(v11) = 1;
LABEL_25:

      goto LABEL_26;
  }
  LOBYTE(v11) = 0;
LABEL_26:

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)subEventMatchers
{
  return self->_subEventMatchers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subEventMatchers, 0);
}

+ (id)andEventMatcherWithSubEventMatchers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:subEventMatchers:", 1, v4);

  return v5;
}

+ (id)orEventMatcherWithSubEventMatchers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:subEventMatchers:", 2, v4);

  return v5;
}

+ (id)notEventMatcherWithSubEventMatcher:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithType:subEventMatchers:", 3, v6);
  return v7;
}

@end
