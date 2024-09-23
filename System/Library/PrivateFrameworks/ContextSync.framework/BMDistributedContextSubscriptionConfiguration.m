@implementation BMDistributedContextSubscriptionConfiguration

- (BMDistributedContextSubscriptionConfiguration)initWithOptions:(unint64_t)a3 lastChangedDate:(id)a4
{
  unsigned int v5;
  id v7;
  BMDistributedContextSubscriptionConfiguration *v8;
  uint64_t v9;
  NSNumber *oneOffSubscription;
  uint64_t v11;
  NSNumber *wakeState;
  objc_super v14;

  v5 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMDistributedContextSubscriptionConfiguration;
  v8 = -[BMDistributedContextSubscriptionConfiguration init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v5 >> 1) & 1);
    v9 = objc_claimAutoreleasedReturnValue();
    oneOffSubscription = v8->_oneOffSubscription;
    v8->_oneOffSubscription = (NSNumber *)v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 & 1);
    v11 = objc_claimAutoreleasedReturnValue();
    wakeState = v8->_wakeState;
    v8->_wakeState = (NSNumber *)v11;

    objc_storeStrong((id *)&v8->_lastChangedDate, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "oneOffSubscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", self->_oneOffSubscription))
    {
      objc_msgSend(v5, "wakeState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_wakeState);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_oneOffSubscription, "hash");
  return -[NSNumber hash](self->_wakeState, "hash") ^ v3;
}

- (NSNumber)oneOffSubscription
{
  return self->_oneOffSubscription;
}

- (void)setOneOffSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_oneOffSubscription, a3);
}

- (NSNumber)wakeState
{
  return self->_wakeState;
}

- (void)setWakeState:(id)a3
{
  objc_storeStrong((id *)&self->_wakeState, a3);
}

- (NSDate)lastChangedDate
{
  return self->_lastChangedDate;
}

- (void)setLastChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastChangedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangedDate, 0);
  objc_storeStrong((id *)&self->_wakeState, 0);
  objc_storeStrong((id *)&self->_oneOffSubscription, 0);
}

@end
