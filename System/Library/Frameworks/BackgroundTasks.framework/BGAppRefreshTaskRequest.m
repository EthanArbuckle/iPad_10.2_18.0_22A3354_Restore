@implementation BGAppRefreshTaskRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGAppRefreshTaskRequest: %@, earliestBeginDate: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BGAppRefreshTaskRequest)initWithIdentifier:(NSString *)identifier
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGAppRefreshTaskRequest;
  return (BGAppRefreshTaskRequest *)-[BGTaskRequest _initWithIdentifier:](&v4, sel__initWithIdentifier_, identifier);
}

- (id)_activity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bgRefresh-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE2E218];
  v7 = *MEMORY[0x24BE2E2A0];
  v8 = *MEMORY[0x24BE2E248];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityWithName:priority:duration:startingAfter:startingBefore:", v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setLaunchReason:", *MEMORY[0x24BE2E280]);
  -[BGTaskRequest identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedIdentifier:", v12);

  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedStartDate:", v13);

  return v11;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

+ (id)_requestFromActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2E280]);

  if (v6)
  {
    v7 = objc_alloc((Class)a1);
    objc_msgSend(v4, "clientProvidedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentifier:", v8);

    objc_msgSend(v4, "clientProvidedStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEarliestBeginDate:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[BGTaskRequest identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  BGAppRefreshTaskRequest *v5;
  BGAppRefreshTaskRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (BGAppRefreshTaskRequest *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[BGTaskRequest identifier](v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[BGTaskRequest identifier](v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[BGTaskRequest earliestBeginDate](v6, "earliestBeginDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[BGTaskRequest earliestBeginDate](v6, "earliestBeginDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BGAppRefreshTaskRequest;
  v4 = -[BGTaskRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBeginDate:", v5);

  return v4;
}

@end
