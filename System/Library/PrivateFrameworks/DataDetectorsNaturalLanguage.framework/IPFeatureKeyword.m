@implementation IPFeatureKeyword

+ (id)featureKeywordWithType:(unint64_t)a3 string:(id)a4 matchRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  IPFeatureKeyword *v9;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  v9 = objc_alloc_init(IPFeatureKeyword);
  -[IPFeatureKeyword setKeywordString:](v9, "setKeywordString:", v8);

  -[IPFeature setMatchRange:](v9, "setMatchRange:", location, length);
  -[IPFeatureKeyword setEventTypes:](v9, "setEventTypes:", MEMORY[0x24BDBD1A8]);
  -[IPFeatureKeyword setType:](v9, "setType:", a3);
  return v9;
}

- (NSMutableDictionary)contextDictionary
{
  NSMutableDictionary *contextDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  contextDictionary = self->_contextDictionary;
  if (!contextDictionary)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contextDictionary;
    self->_contextDictionary = v4;

    contextDictionary = self->_contextDictionary;
  }
  return contextDictionary;
}

- (void)addEventType:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IPFeatureKeyword eventTypes](self, "eventTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    -[IPFeatureKeyword eventTypes](self, "eventTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureKeyword setEventTypes:](self, "setEventTypes:", v7);

  }
}

- (id)typeDescription
{
  unint64_t v2;

  v2 = -[IPFeatureKeyword type](self, "type");
  if (v2 > 3)
    return CFSTR("None");
  else
    return off_24DAA5A28[v2];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureKeyword;
  -[IPFeature description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureKeyword humandReadableEventTypes](self, "humandReadableEventTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureKeyword typeDescription](self, "typeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Type: %@ Event Types: <%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)humandReadableEventTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IPFeatureKeyword eventTypes](self, "eventTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)keywordString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeywordString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)eventTypes
{
  return self->_eventTypes;
}

- (void)setEventTypes:(id)a3
{
  objc_storeStrong((id *)&self->_eventTypes, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypes, 0);
  objc_storeStrong((id *)&self->_keywordString, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end
