@implementation FIAnalyticsRecord

- (FIAnalyticsRecord)initWithEventName:(id)a3
{
  id v5;
  FIAnalyticsRecord *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *eventDict;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FIAnalyticsRecord;
  v6 = -[FIAnalyticsRecord init](&v10, sel_init);
  objc_storeStrong((id *)&v6->_eventName, a3);
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  eventDict = v6->_eventDict;
  v6->_eventDict = v7;

  return v6;
}

- (BOOL)validate
{
  return self->_eventName != 0;
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[FIAnalyticsRecord objectForKey:](self, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventDict, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventDict, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventDict, "setObject:forKeyedSubscript:", v6, v7);

}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSMutableDictionary)eventDict
{
  return self->_eventDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDict, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
