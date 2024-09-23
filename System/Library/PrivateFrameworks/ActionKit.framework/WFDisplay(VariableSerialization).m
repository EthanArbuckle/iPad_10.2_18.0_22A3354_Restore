@implementation WFDisplay(VariableSerialization)

- (id)initWithSerializedRepresentation:()VariableSerialization variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __CFString *v21;
  char v22;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("serializationUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = v10;
  if (v10 == CFSTR("PrimaryDisplay"))
    goto LABEL_5;
  if (v10)
  {
    v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("PrimaryDisplay"));

    if (v12)
    {
LABEL_5:

      v11 = CFSTR("MainDisplay");
      goto LABEL_6;
    }
    v21 = v11;
    if (v21 == CFSTR("CurrentDisplay"))
    {
      v19 = 0;
      v11 = CFSTR("CurrentDisplay");
      goto LABEL_7;
    }
    v11 = v21;
    v22 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("CurrentDisplay"));

    if ((v22 & 1) != 0)
    {
      v19 = 0;
      goto LABEL_7;
    }
  }
LABEL_6:
  objc_msgSend(v6, "objectForKey:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("deviceName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  WFEnforceClass(v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  a1 = (id)objc_msgSend(a1, "initWithDisplayUUID:deviceName:name:", v11, v18, v15);
  v19 = a1;
LABEL_7:

LABEL_9:
  return v19;
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "serializationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("serializationUUID"));

  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("name"));

  objc_msgSend(a1, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("deviceName"));

  return v2;
}

@end
