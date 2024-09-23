@implementation IKPlayerStateChangeEventUserInfo

- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3
{
  IKPlayerStateChangeEventUserInfo *v4;
  uint64_t v5;
  NSMutableDictionary *mutableProperties;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IKPlayerStateChangeEventUserInfo;
  v4 = -[IKPlayerStateChangeEventUserInfo init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    mutableProperties = v4->_mutableProperties;
    v4->_mutableProperties = (NSMutableDictionary *)v5;

    objc_msgSend((id)objc_opt_class(), "stateNameForState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[NSMutableDictionary setObject:forKey:](v4->_mutableProperties, "setObject:forKey:", v7, CFSTR("state"));
    v4->_state = a3;

  }
  return v4;
}

- (IKPlayerStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4
{
  IKPlayerStateChangeEventUserInfo *v5;
  void *v6;

  v5 = -[IKPlayerStateChangeEventUserInfo initWithState:](self, "initWithState:", a3);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "stateNameForState:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSMutableDictionary setObject:forKey:](v5->_mutableProperties, "setObject:forKey:", v6, CFSTR("oldState"));
    v5->_oldState = a4;

  }
  return v5;
}

- (void)setDuration:(double)a3
{
  NSMutableDictionary *mutableProperties;
  id v4;

  mutableProperties = self->_mutableProperties;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mutableProperties, "setObject:forKey:", v4, CFSTR("duration"));

}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKey:](self->_mutableProperties, "objectForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setElapsedTime:(double)a3
{
  NSMutableDictionary *mutableProperties;
  id v4;

  mutableProperties = self->_mutableProperties;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mutableProperties, "setObject:forKey:", v4, CFSTR("elapsedTime"));

}

- (double)elapsedTime
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKey:](self->_mutableProperties, "objectForKey:", CFSTR("elapsedTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (double)rate
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKey:](self->_mutableProperties, "objectForKey:", CFSTR("rate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setRate:(double)a3
{
  NSMutableDictionary *mutableProperties;
  id v4;

  mutableProperties = self->_mutableProperties;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mutableProperties, "setObject:forKey:", v4, CFSTR("rate"));

}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_mutableProperties, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  NSMutableDictionary *mutableProperties;

  mutableProperties = self->_mutableProperties;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](mutableProperties, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](mutableProperties, "removeObjectForKey:", a4);
}

- (NSDictionary)properties
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mutableProperties, "copy");
}

+ (id)stateNameForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return off_1E9F4CA20[a3 - 1];
}

+ (int64_t)stateForStateName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int64_t v6;

  v3 = stateForStateName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stateForStateName__onceToken, &__block_literal_global_4);
  objc_msgSend((id)stateForStateName__statesByName, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

void __54__IKPlayerStateChangeEventUserInfo_stateForStateName___block_invoke()
{
  void *v0;

  v0 = (void *)stateForStateName__statesByName;
  stateForStateName__statesByName = (uint64_t)&unk_1E9F8C908;

}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)oldState
{
  return self->_oldState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProperties, 0);
}

@end
