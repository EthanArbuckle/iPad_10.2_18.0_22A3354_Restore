@implementation IRServiceToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceIdentifier;
  id v5;
  id v6;

  serviceIdentifier = self->_serviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_servicePackage);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("servicePackage"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRServiceToken serviceIdentifier](self, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRServiceToken serviceIdentifier](self, "serviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v11 = -[IRServiceToken servicePackage](self, "servicePackage");
    v8 = v11 == objc_msgSend(v5, "servicePackage");
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceIdentifier:servicePackage:", self->_serviceIdentifier, self->_servicePackage);
  v6 = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = -[IRServiceToken servicePackage](self, "servicePackage");
  return v5;
}

- (IRServiceToken)initWithServiceIdentifier:(id)a3 servicePackage:(int64_t)a4
{
  id v7;
  IRServiceToken *v8;
  IRServiceToken *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRServiceToken;
  v8 = -[IRServiceToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceIdentifier, a3);
    v9->_servicePackage = a4;
  }

  return v9;
}

- (IRServiceToken)initWithCoder:(id)a3
{
  id v4;
  IRServiceToken *v5;
  IRServiceToken *v6;
  uint64_t v7;
  NSString *serviceIdentifier;
  IRServiceToken *v9;
  int64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRServiceToken;
  v5 = -[IRServiceToken init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v6 = (IRServiceToken *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("servicePackage"));
      v9 = (IRServiceToken *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        v10 = (int)-[IRServiceToken intValue](v9, "intValue");

        v5->_servicePackage = v10;
        v6 = v5;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)serviceTokenForServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IRServiceToken *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_serviceIdentifiersMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = -[IRServiceToken initWithServiceIdentifier:servicePackage:]([IRServiceToken alloc], "initWithServiceIdentifier:servicePackage:", v4, objc_msgSend(v6, "servicePackage"));
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isServiceTokenValid:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_serviceIdentifiersMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "observerClientIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v7);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", servicePackage: %ld"), self->_servicePackage);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceIdentifier: %@"), self->_serviceIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (unint64_t)hash
{
  return self->_servicePackage ^ -[NSString hash](self->_serviceIdentifier, "hash");
}

- (IRServiceToken)init
{
  __assert_rtn("-[IRServiceToken init]", "IRServiceToken.m", 156, "NO");
}

+ (id)new
{
  __assert_rtn("+[IRServiceToken new]", "IRServiceToken.m", 161, "NO");
}

+ (id)_serviceIdentifiersMapping
{
  IRServiceIdentifierMapping *v2;
  IRServiceIdentifierMapping *v3;
  IRServiceIdentifierMapping *v4;
  IRServiceIdentifierMapping *v5;
  IRServiceIdentifierMapping *v6;
  IRServiceIdentifierMapping *v7;
  IRServiceIdentifierMapping *v8;
  void *v9;
  IRServiceIdentifierMapping *v10;
  IRServiceIdentifierMapping *v11;
  void *v12;
  IRServiceIdentifierMapping *v13;
  IRServiceIdentifierMapping *v14;
  void *v15;
  IRServiceIdentifierMapping *v16;
  IRServiceIdentifierMapping *v17;
  void *v18;
  IRServiceIdentifierMapping *v19;
  void *v20;
  IRServiceIdentifierMapping *v22;
  void *v23;
  IRServiceIdentifierMapping *v24;
  void *v25;
  IRServiceIdentifierMapping *v26;
  void *v27;
  IRServiceIdentifierMapping *v28;
  void *v29;
  IRServiceIdentifierMapping *v30;
  void *v31;
  IRServiceIdentifierMapping *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  _QWORD v37[2];
  _QWORD v38[6];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[5];
  _QWORD v44[10];
  _QWORD v45[12];

  v45[10] = *MEMORY[0x24BDAC8D0];
  v44[0] = CFSTR("com.apple.mediaremoted");
  v2 = [IRServiceIdentifierMapping alloc];
  v43[0] = CFSTR("com.apple.mediaremoted");
  v43[1] = CFSTR("com.apple.MusicUIService");
  v43[2] = CFSTR("com.apple.springboard");
  v43[3] = CFSTR("com.apple.APSUIApp");
  v43[4] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v2, "initWithServicePackage:observerClientIdentifiers:", 0, v33);
  v45[0] = v32;
  v44[1] = CFSTR("com.apple.Music");
  v3 = [IRServiceIdentifierMapping alloc];
  v42[0] = CFSTR("com.apple.Music");
  v42[1] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v3, "initWithServicePackage:observerClientIdentifiers:", 0, v31);
  v45[1] = v30;
  v44[2] = CFSTR("com.apple.TelephonyUtilities");
  v4 = [IRServiceIdentifierMapping alloc];
  v41[0] = CFSTR("com.apple.TelephonyUtilities");
  v41[1] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v4, "initWithServicePackage:observerClientIdentifiers:", 0, v29);
  v45[2] = v28;
  v44[3] = CFSTR("com.apple.controlcenter");
  v5 = [IRServiceIdentifierMapping alloc];
  v40[0] = CFSTR("com.apple.controlcenter");
  v40[1] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v5, "initWithServicePackage:observerClientIdentifiers:", 0, v27);
  v45[3] = v26;
  v44[4] = CFSTR("com.apple.AVKit.RoutePickerViewService");
  v6 = [IRServiceIdentifierMapping alloc];
  v39[0] = CFSTR("com.apple.AVKit.RoutePickerViewService");
  v39[1] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v6, "initWithServicePackage:observerClientIdentifiers:", 0, v25);
  v45[4] = v24;
  v44[5] = CFSTR("com.apple.tvremoted");
  v7 = [IRServiceIdentifierMapping alloc];
  v38[0] = CFSTR("com.apple.tvremoted");
  v38[1] = CFSTR("com.apple.mediaremoted");
  v38[2] = CFSTR("com.apple.MusicUIService");
  v38[3] = CFSTR("com.apple.springboard");
  v38[4] = CFSTR("com.apple.APSUIApp");
  v38[5] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v7, "initWithServicePackage:observerClientIdentifiers:", 1, v23);
  v45[5] = v22;
  v44[6] = CFSTR("com.apple.NeighborhoodActivityConduitService");
  v8 = [IRServiceIdentifierMapping alloc];
  v37[0] = CFSTR("com.apple.NeighborhoodActivityConduitService");
  v37[1] = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v8, "initWithServicePackage:observerClientIdentifiers:", 1, v9);
  v45[6] = v10;
  v44[7] = CFSTR("com.apple.intelligentroutingclient.Media");
  v11 = [IRServiceIdentifierMapping alloc];
  v36 = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v11, "initWithServicePackage:observerClientIdentifiers:", 0, v12);
  v45[7] = v13;
  v44[8] = CFSTR("com.apple.intelligentroutingclient.AppleTVControl");
  v14 = [IRServiceIdentifierMapping alloc];
  v35 = CFSTR("com.apple.intelligentroutingclient");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v14, "initWithServicePackage:observerClientIdentifiers:", 1, v15);
  v45[8] = v16;
  v44[9] = CFSTR("com.apple.IntelligentRoutingHostTests.xctrunner");
  v17 = [IRServiceIdentifierMapping alloc];
  v34 = CFSTR("com.apple.IntelligentRoutingHostTests.xctrunner");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IRServiceIdentifierMapping initWithServicePackage:observerClientIdentifiers:](v17, "initWithServicePackage:observerClientIdentifiers:", 0, v18);
  v45[9] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
