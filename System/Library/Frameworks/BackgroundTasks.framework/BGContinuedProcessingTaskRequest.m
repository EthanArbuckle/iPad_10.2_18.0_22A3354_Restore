@implementation BGContinuedProcessingTaskRequest

- (BGContinuedProcessingTaskRequest)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGContinuedProcessingTaskRequest;
  return (BGContinuedProcessingTaskRequest *)-[BGTaskRequest _initWithIdentifier:](&v4, sel__initWithIdentifier_, a3);
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
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "launchReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2E288]);

  if (v6)
  {
    v7 = objc_alloc((Class)a1);
    objc_msgSend(v4, "clientProvidedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentifier:", v8);

    objc_msgSend(v4, "clientProvidedStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEarliestBeginDate:", v10);

    objc_msgSend(v4, "clientProvidedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v11);

    objc_msgSend(v4, "clientProvidedReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReason:", v12);

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
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGContinuedProcessingTaskRequest title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<BGContinuedProcessingTaskRequest: %@, title: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BGTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bgContinuedProcessing-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE2E218];
  v8 = *MEMORY[0x24BE2E2B8];
  v9 = *MEMORY[0x24BE2E238];
  v21[0] = CFSTR("clientProvidedTitle");
  -[BGContinuedProcessingTaskRequest title](self, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_24CC627B0;
  v21[1] = CFSTR("clientProvidedReason");
  v22[0] = v12;
  -[BGContinuedProcessingTaskRequest reason](self, "reason");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_24CC627B0;
  v22[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityWithName:priority:duration:startingAfter:startingBefore:userInfo:", v5, v8, v9, v6, v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setLaunchReason:", *MEMORY[0x24BE2E288]);
  -[BGTaskRequest identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClientProvidedIdentifier:", v18);

  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClientProvidedStartDate:", v19);

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[BGTaskRequest identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));
  -[BGContinuedProcessingTaskRequest title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (4 * objc_msgSend(v7, "hash"));
  -[BGContinuedProcessingTaskRequest reason](self, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ (8 * objc_msgSend(v9, "hash"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BGContinuedProcessingTaskRequest *v4;
  BGContinuedProcessingTaskRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (BGContinuedProcessingTaskRequest *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BGTaskRequest identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[BGTaskRequest identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = 0;
          goto LABEL_32;
        }
        v28 = v9;
        v29 = v8;
      }
      -[BGTaskRequest earliestBeginDate](v5, "earliestBeginDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[BGTaskRequest earliestBeginDate](v5, "earliestBeginDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v10 = 0;
LABEL_30:

LABEL_31:
          v9 = v28;
          v8 = v29;
          if (v6 == v7)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v26 = v14;
        v27 = v13;
      }
      -[BGContinuedProcessingTaskRequest title](v5, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGContinuedProcessingTaskRequest title](self, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {
        -[BGContinuedProcessingTaskRequest reason](v5, "reason", v23);
      }
      else
      {
        -[BGContinuedProcessingTaskRequest title](v5, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGContinuedProcessingTaskRequest title](self, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v10 = 0;
LABEL_28:

LABEL_29:
          v14 = v26;
          v13 = v27;
          if (v11 == v12)
            goto LABEL_31;
          goto LABEL_30;
        }
        -[BGContinuedProcessingTaskRequest reason](v5, "reason", v17);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        && (-[BGContinuedProcessingTaskRequest reason](self, "reason"),
            (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v10 = 1;
      }
      else
      {
        -[BGContinuedProcessingTaskRequest reason](v5, "reason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {

          v10 = 0;
          if (!v18)
          {
LABEL_27:
            v17 = v24;
            if (v15 == v16)
              goto LABEL_29;
            goto LABEL_28;
          }
        }
        else
        {
          -[BGContinuedProcessingTaskRequest reason](self, "reason");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v21 == 0;

          if (!v18)
            goto LABEL_27;
        }
        v19 = 0;
      }

      goto LABEL_27;
    }
    v10 = 0;
  }
LABEL_34:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BGContinuedProcessingTaskRequest;
  v4 = -[BGTaskRequest copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[BGTaskRequest earliestBeginDate](self, "earliestBeginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEarliestBeginDate:", v5);

  -[BGContinuedProcessingTaskRequest title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  -[BGContinuedProcessingTaskRequest reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReason:", v7);

  return v4;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
