@implementation HIDAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

- (HIDAnalyticsEvent)initWithAttributes:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  HIDAnalyticsEvent *v8;
  HIDAnalyticsEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HIDAnalyticsEvent;
  v8 = -[HIDAnalyticsEvent init](&v11, sel_init);
  if (v8)
  {
    if (initWithAttributes_description__once != -1)
      dispatch_once(&initWithAttributes_description__once, &__block_literal_global);
    -[HIDAnalyticsEvent setName:](v8, "setName:", v6);
    -[HIDAnalyticsEvent setDesc:](v8, "setDesc:", v7);
    v9 = v8;
  }

  return v8;
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  NSMutableDictionary *v8;
  NSMutableDictionary *fields;
  HIDAnalyticsHistogramEventField *v10;
  id v11;

  v11 = a3;
  if (!self->_fields)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fields = self->_fields;
    self->_fields = v8;

  }
  v10 = -[HIDAnalyticsHistogramEventField initWithAttributes:segments:count:]([HIDAnalyticsHistogramEventField alloc], "initWithAttributes:segments:count:", v11, a4, a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fields, "setObject:forKeyedSubscript:", v10, v11);

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)desc
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

void __26__HIDAnalyticsEvent_value__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("Name"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = &unk_24D3F4248;
  else
    v8 = &unk_24D3F4260;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Type"));
  objc_msgSend(v10, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Value"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

- (BOOL)isLogged
{
  return self->_isLogged;
}

- (id)value
{
  id v3;
  NSMutableDictionary *fields;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  if (!self->_isUpdated)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  fields = self->_fields;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __26__HIDAnalyticsEvent_value__block_invoke;
  v9[3] = &unk_24D3F30D8;
  v10 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fields, "enumerateKeysAndObjectsUsingBlock:", v9);
  self->_isUpdated = 0;
  self->_isLogged |= objc_msgSend(v5, "count") == 0;
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)setIntegerValue:(unint64_t)a3 forField:(id)a4
{
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;

  -[NSMutableDictionary objectForKey:](self->_fields, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9 = v6;
    objc_msgSend(v6, "setIntegerValue:", a3);
    self->_isUpdated = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend((id)__hidAnalyticsReporter, "dispatchAnalyticsForEvent:", self);
      v7 = v9;
    }
  }

}

- (void)activate
{
  objc_msgSend((id)__hidAnalyticsReporter, "registerEvent:", self);
}

- (void)cancel
{
  objc_msgSend((id)__hidAnalyticsReporter, "unregisterEvent:", self);
}

uint64_t __52__HIDAnalyticsEvent_initWithAttributes_description___block_invoke()
{
  HIDAnalyticsReporter *v0;
  void *v1;

  v0 = objc_alloc_init(HIDAnalyticsReporter);
  v1 = (void *)__hidAnalyticsReporter;
  __hidAnalyticsReporter = (uint64_t)v0;

  return objc_msgSend((id)__hidAnalyticsReporter, "start");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HIDAnalyticsEvent desc](self, "desc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("EventDescription"));

  -[HIDAnalyticsEvent value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EventValue"));

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);

  return v7;
}

- (void)addField:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *fields;
  HIDAnalyticsEventField *v6;
  id v7;

  v7 = a3;
  if (!self->_fields)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fields = self->_fields;
    self->_fields = v4;

  }
  v6 = -[HIDAnalyticsEventField initWithName:]([HIDAnalyticsEventField alloc], "initWithName:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fields, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setStringValue:(id)a3 forField:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKey:](self->_fields, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setStringValue:", v8);
    self->_isUpdated = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend((id)__hidAnalyticsReporter, "dispatchAnalyticsForEvent:", self);
  }

}

- (void)setValue:(id)a3
{
  id v4;
  NSMutableDictionary *fields;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  fields = self->_fields;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__HIDAnalyticsEvent_setValue___block_invoke;
  v7[3] = &unk_24D3F30D8;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fields, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __30__HIDAnalyticsEvent_setValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setValue:", *(_QWORD *)(a1 + 32));
}

- (void)setIsLogged:(BOOL)a3
{
  self->_isLogged = a3;
}

@end
