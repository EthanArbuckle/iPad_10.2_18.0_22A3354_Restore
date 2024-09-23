@implementation COTimerNotification

- (COTimerNotification)initWithTimers:(id)a3
{
  id v4;
  COTimerNotification *v5;
  uint64_t v6;
  NSArray *timers;

  v4 = a3;
  v5 = -[COMeshCommand init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timers = v5->_timers;
    v5->_timers = (NSArray *)v6;

  }
  return v5;
}

- (COTimerNotification)initWithCoder:(id)a3
{
  id v4;
  COTimerNotification *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *timers;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  COTimerNotification *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)COTimerNotification;
  v5 = -[COMeshCommand initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5 && objc_msgSend(v4, "containsValueForKey:", CFSTR("timers")))
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("timers"));
    v9 = objc_claimAutoreleasedReturnValue();
    timers = v5->_timers;
    v5->_timers = (NSArray *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v5->_timers;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v16 = 0;
              goto LABEL_15;
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v13)
            continue;
          break;
        }
      }
      v16 = v5;
    }
    else
    {
      v16 = 0;
      v11 = (NSArray *)v5;
    }
LABEL_15:

    v5 = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COTimerNotification;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COTimerNotification timers](self, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timers"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)timers
{
  return self->_timers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
}

@end
