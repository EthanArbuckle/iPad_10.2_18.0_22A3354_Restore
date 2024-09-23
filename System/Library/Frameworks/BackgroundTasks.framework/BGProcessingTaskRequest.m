@implementation BGProcessingTaskRequest

- (BGProcessingTaskRequest)initWithIdentifier:(NSString *)identifier
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGProcessingTaskRequest;
  return (BGProcessingTaskRequest *)-[BGTaskRequest _initWithIdentifier:](&v4, sel__initWithIdentifier_, identifier);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bgProcessing-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE2E218];
  v7 = *MEMORY[0x24BE2E2A0];
  v8 = *MEMORY[0x24BE2E240];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityWithName:priority:duration:startingAfter:startingBefore:", v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setLaunchReason:", *MEMORY[0x24BE2E278]);
  -[BGTaskRequest identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedIdentifier:", v12);

  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedStartDate:", v13);

  objc_msgSend(v11, "setRequiresPlugin:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v11, "setRequiresNetwork:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));

  return v11;
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGProcessingTaskRequest: %@, earliestBeginDate: %@, requiresExternalPower=%u, requiresNetworkConnectivity=%u>"), v4, v5, -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"), -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

- (void)setRequiresNetworkConnectivity:(BOOL)requiresNetworkConnectivity
{
  self->_requiresNetworkConnectivity = requiresNetworkConnectivity;
}

- (void)setRequiresExternalPower:(BOOL)requiresExternalPower
{
  self->_requiresExternalPower = requiresExternalPower;
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
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2E278]);

  if (v6)
  {
    v7 = objc_alloc((Class)a1);
    objc_msgSend(v4, "clientProvidedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentifier:", v8);

    objc_msgSend(v4, "clientProvidedStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEarliestBeginDate:", v10);

    objc_msgSend(v9, "setRequiresExternalPower:", objc_msgSend(v4, "requiresPlugin"));
    objc_msgSend(v9, "setRequiresNetworkConnectivity:", objc_msgSend(v4, "requiresNetwork"));
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
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  unint64_t v10;

  -[BGTaskRequest identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));
  if (-[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"))
    v7 = 4;
  else
    v7 = 0;
  v8 = -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower");
  v9 = 8;
  if (!v8)
    v9 = 0;
  v10 = v6 ^ v7 ^ v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BGProcessingTaskRequest *v7;
  BGProcessingTaskRequest *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = (BGProcessingTaskRequest *)a3;
  if (self == v7)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[BGTaskRequest identifier](v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[BGTaskRequest identifier](v8, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest identifier](self, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          LOBYTE(v11) = 0;
          goto LABEL_24;
        }
        v15 = v3;
      }
      -[BGTaskRequest earliestBeginDate](v8, "earliestBeginDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[BGTaskRequest earliestBeginDate](v8, "earliestBeginDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v3))
        {
          LOBYTE(v11) = 0;
LABEL_22:

LABEL_23:
          v3 = v15;
          if (v9 == v10)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_24:

          goto LABEL_25;
        }
      }
      if ((!-[BGProcessingTaskRequest requiresNetworkConnectivity](v8, "requiresNetworkConnectivity")
         || !-[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"))
        && (-[BGProcessingTaskRequest requiresNetworkConnectivity](v8, "requiresNetworkConnectivity")
         || -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity")))
      {
        goto LABEL_20;
      }
      if (-[BGProcessingTaskRequest requiresExternalPower](v8, "requiresExternalPower")
        && -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"))
      {
        LOBYTE(v11) = 1;
        goto LABEL_21;
      }
      if (-[BGProcessingTaskRequest requiresExternalPower](v8, "requiresExternalPower"))
LABEL_20:
        LOBYTE(v11) = 0;
      else
        v11 = !-[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower");
LABEL_21:
      if (v12 == v13)
        goto LABEL_23;
      goto LABEL_22;
    }
    LOBYTE(v11) = 0;
  }
LABEL_26:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BGProcessingTaskRequest;
  v4 = -[BGTaskRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBeginDate:", v5);

  objc_msgSend(v4, "setRequiresNetworkConnectivity:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v4, "setRequiresExternalPower:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  return v4;
}

@end
