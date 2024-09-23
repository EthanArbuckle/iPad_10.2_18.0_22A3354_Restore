@implementation ECSMTPAccount

+ (id)standardPorts
{
  return &unk_1E7135EE8;
}

+ (id)standardSSLPorts
{
  return &unk_1E7135F00;
}

- (int64_t)defaultPortNumber
{
  return 25;
}

- (id)_hostnameFromParentAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)usesSSLObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ECSMTPAccount;
  -[ECAccount usesSSLObject](&v9, sel_usesSSLObject);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ECAccount systemAccount](self, "systemAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "BOOLValue"))
      v3 = v7;
    else
      v3 = 0;

  }
  return v3;
}

- (id)portNumberObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ECSMTPAccount;
  -[ECAccount portNumberObject](&v12, sel_portNumberObject);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ECAccount systemAccount](self, "systemAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFF0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ECAccount standardPorts](self, "standardPorts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", v7))
      {

      }
      else
      {
        -[ECAccount standardSSLPorts](self, "standardSSLPorts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v7);

        if ((v10 & 1) == 0)
        {
          v3 = v7;
          goto LABEL_7;
        }
      }
    }
    v3 = 0;
LABEL_7:

  }
  return v3;
}

@end
