@implementation BGHealthResearchTaskRequest

+ (id)_requestFromActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2E298]);

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
    objc_msgSend(v4, "fileProtection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protectionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProtectionTypeOfRequiredData:", v12);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower");
  v7 = -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity");
  -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGHealthResearchTaskRequest: %@, earliestBeginDate: %@, requiresExternalPower=%u, requiresNetworkConnectivity=%u, protectionTypeOfRequiredData=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
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
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bgHealthResearch-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE2E218];
  v7 = *MEMORY[0x24BE2E2C0];
  v8 = *MEMORY[0x24BE2E240];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityWithName:priority:duration:startingAfter:startingBefore:", v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setLaunchReason:", *MEMORY[0x24BE2E298]);
  -[BGTaskRequest identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedIdentifier:", v12);

  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientProvidedStartDate:", v13);

  objc_msgSend(v11, "setRequiresPlugin:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v11, "setRequiresNetwork:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  v14 = (void *)MEMORY[0x24BE2E220];
  -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "protectionWithType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFileProtection:", v16);

  return v11;
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
  uint64_t v10;
  void *v11;
  unint64_t v12;

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
  -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ (16 * objc_msgSend(v11, "hash"));

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  BGHealthResearchTaskRequest *v6;
  BGHealthResearchTaskRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = (BGHealthResearchTaskRequest *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[BGTaskRequest identifier](v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[BGTaskRequest identifier](v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_25;
        }
        v24 = v10;
      }
      -[BGTaskRequest earliestBeginDate](v7, "earliestBeginDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13
        || (-[BGTaskRequest earliestBeginDate](v7, "earliestBeginDate"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = v14,
            objc_msgSend(v14, "isEqual:", v4)))
      {
        if ((-[BGProcessingTaskRequest requiresNetworkConnectivity](v7, "requiresNetworkConnectivity")
           && -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity")
           || !-[BGProcessingTaskRequest requiresNetworkConnectivity](v7, "requiresNetworkConnectivity")
           && !-[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"))
          && (-[BGProcessingTaskRequest requiresExternalPower](v7, "requiresExternalPower")
           && -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower")
           || !-[BGProcessingTaskRequest requiresExternalPower](v7, "requiresExternalPower")
           && !-[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower")))
        {
          -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](v7, "protectionTypeOfRequiredData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v17 == (void *)v18)
          {

            v11 = 1;
            v15 = 1;
          }
          else
          {
            v22 = (void *)v18;
            -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](v7, "protectionTypeOfRequiredData");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v17;
            -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v20, "isEqual:");

            v15 = v11;
          }
        }
        else
        {
          v11 = 0;
          v15 = 0;
        }
        if (v12 == v13)
        {

          v11 = v15;
LABEL_24:
          v10 = v24;
          if (v8 == v9)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_24;
    }
    v11 = 0;
  }
LABEL_27:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BGHealthResearchTaskRequest;
  v4 = -[BGProcessingTaskRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBeginDate:", v5);

  objc_msgSend(v4, "setRequiresNetworkConnectivity:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v4, "setRequiresExternalPower:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  -[BGHealthResearchTaskRequest protectionTypeOfRequiredData](self, "protectionTypeOfRequiredData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtectionTypeOfRequiredData:", v6);

  return v4;
}

- (NSFileProtectionType)protectionTypeOfRequiredData
{
  return self->_protectionTypeOfRequiredData;
}

- (void)setProtectionTypeOfRequiredData:(NSFileProtectionType)protectionTypeOfRequiredData
{
  self->_protectionTypeOfRequiredData = protectionTypeOfRequiredData;
}

@end
