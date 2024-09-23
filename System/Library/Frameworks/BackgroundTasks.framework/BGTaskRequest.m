@implementation BGTaskRequest

- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate
{
  objc_setProperty_atomic_copy(self, a2, earliestBeginDate, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)_initWithIdentifier:(id)a3
{
  id v5;
  BGTaskRequest *v6;
  BGTaskRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGTaskRequest;
  v6 = -[BGTaskRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

+ (id)_requestFromActivity:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __objc2_class **v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "launchReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2E278]);

  if ((v5 & 1) != 0)
  {
    v6 = off_24CC61D38;
  }
  else
  {
    objc_msgSend(v3, "launchReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2E298]);

    if ((v8 & 1) != 0)
    {
      v6 = off_24CC61D28;
    }
    else
    {
      objc_msgSend(v3, "launchReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE2E288]);

      if ((v10 & 1) != 0)
      {
        v6 = off_24CC61D18;
      }
      else
      {
        objc_msgSend(v3, "launchReason");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE2E290]);

        if ((v12 & 1) != 0)
        {
          v6 = &off_24CC61DD0;
        }
        else
        {
          objc_msgSend(v3, "launchReason");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE2E280]);

          if (!v14)
          {
            v15 = 0;
            goto LABEL_12;
          }
          v6 = off_24CC61D08;
        }
      }
    }
  }
  -[__objc2_class _requestFromActivity:](*v6, "_requestFromActivity:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BGTaskRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithIdentifier:", v5);

  return v6;
}

@end
