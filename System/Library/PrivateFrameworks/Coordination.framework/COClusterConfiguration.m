@implementation COClusterConfiguration

- (id)_initWithPrefix:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7
{
  id v12;
  id v13;
  id v14;
  COClusterConfiguration *v15;
  uint64_t v16;
  NSString *prefix;
  uint64_t v18;
  COClusterRealm *realm;
  uint64_t v20;
  NSString *globalServiceName;
  objc_super v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)COClusterConfiguration;
  v15 = -[COClusterConfiguration init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    prefix = v15->_prefix;
    v15->_prefix = (NSString *)v16;

    v15->_requiredServices = a4;
    v15->_options = a5;
    v18 = objc_msgSend(v13, "copy");
    realm = v15->_realm;
    v15->_realm = (COClusterRealm *)v18;

    v20 = objc_msgSend(v14, "copy");
    globalServiceName = v15->_globalServiceName;
    v15->_globalServiceName = (NSString *)v20;

  }
  return v15;
}

+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  objc_msgSend(a1, "_prefixFromDomain:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(a1, "_validateServices:options:", a4, a5))
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPrefix:requiredServices:options:realm:globalServiceName:", v11, a4, a5, v10, 0);
  else
    v12 = 0;

  return (COClusterConfiguration *)v12;
}

+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v12 = a6;
  v13 = a7;
  objc_msgSend(a1, "_prefixFromDomain:", a3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 0;
  if (!(a4 & 3 | a5 & 1) && v14)
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPrefix:requiredServices:options:realm:globalServiceName:", v14, a4, a5, v12, v13);

  return (COClusterConfiguration *)v16;
}

+ (id)configurationForExplicitClusterIdentifier:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "domainPermittedCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invertedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "rangeOfCharacterFromSet:", v10) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(a1, "_validateServices:options:", a4, a5))
      {
        +[_COClusterRealmExplicitMembership realmWithClusterIdentifier:](_COClusterRealmExplicitMembership, "realmWithClusterIdentifier:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPrefix:requiredServices:options:realm:globalServiceName:", &stru_24CD40EB0, a4, a5, v11, 0);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      COLogForCategory(7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[COClusterConfiguration configurationForExplicitClusterIdentifier:requiredServices:options:].cold.1();

    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (COClusterConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  COClusterConfiguration *v12;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prefix"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiredServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("realm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("globalService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && v6 && v8 && v10)
    {
      v12 = -[COClusterConfiguration _initWithPrefix:requiredServices:options:realm:globalServiceName:](self, "_initWithPrefix:requiredServices:options:realm:globalServiceName:", v5, v7, v9, v10, v11);
    }
    else
    {

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
    v5 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  -[COClusterConfiguration prefix](self, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("prefix"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[COClusterConfiguration requiredServices](self, "requiredServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requiredServices"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[COClusterConfiguration options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("options"));

  -[COClusterConfiguration realm](self, "realm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("realm"));

  -[COClusterConfiguration globalServiceName](self, "globalServiceName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("globalService"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterConfiguration prefix](self, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COClusterConfiguration requiredServices](self, "requiredServices");
  v8 = -[COClusterConfiguration options](self, "options");
  -[COClusterConfiguration realm](self, "realm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, pfx(%@) s(%#0lx) o(%#0lx) r(%@)>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COClusterConfiguration prefix](self, "prefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  COClusterConfiguration *v4;
  COClusterConfiguration *v5;
  BOOL v6;

  v4 = (COClusterConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[COClusterConfiguration isEqualToClusterConfiguration:](self, "isEqualToClusterConfiguration:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToClusterConfiguration:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  -[COClusterConfiguration prefix](self, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = -[COClusterConfiguration requiredServices](self, "requiredServices");
    if (v8 == objc_msgSend(v5, "requiredServices"))
    {
      v9 = -[COClusterConfiguration options](self, "options");
      if (v9 == objc_msgSend(v5, "options"))
      {
        -[COClusterConfiguration realm](self, "realm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "realm");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          v15 = 0;
LABEL_15:

          goto LABEL_10;
        }
        -[COClusterConfiguration globalServiceName](self, "globalServiceName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || (objc_msgSend(v5, "globalServiceName"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[COClusterConfiguration globalServiceName](self, "globalServiceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "globalServiceName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if (v12)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
          v15 = 1;
        }
        v12 = (void *)v3;
        goto LABEL_14;
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)domainPermittedCharacterSet
{
  if (domainPermittedCharacterSet_onceToken != -1)
    dispatch_once(&domainPermittedCharacterSet_onceToken, &__block_literal_global_3);
  return (id)domainPermittedCharacterSet_permitted;
}

void __53__COClusterConfiguration_domainPermittedCharacterSet__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v2);

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v3);

  objc_msgSend(v0, "addCharactersInString:", CFSTR("_"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("-"));
  objc_msgSend(v0, "addCharactersInString:", CFSTR("."));
  v4 = (void *)domainPermittedCharacterSet_permitted;
  domainPermittedCharacterSet_permitted = (uint64_t)v0;

}

+ (BOOL)_validateServices:(unint64_t)a3 options:(unint64_t)a4
{
  NSObject *v4;
  BOOL result;

  if (!a3)
  {
    COLogForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[COClusterConfiguration _validateServices:options:].cold.1(v4);
    goto LABEL_14;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFF0) != 0)
  {
    COLogForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[COClusterConfiguration _validateServices:options:].cold.4();
LABEL_14:

    return 0;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    COLogForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[COClusterConfiguration _validateServices:options:].cold.3();
    goto LABEL_14;
  }
  result = 1;
  if ((a3 & 3) != 0 && !a4)
  {
    COLogForCategory(7);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[COClusterConfiguration _validateServices:options:].cold.2();
    goto LABEL_14;
  }
  return result;
}

+ (id)_prefixFromDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "domainPermittedCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("d-cluster.%@"), v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      COLogForCategory(7);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[COClusterConfiguration _prefixFromDomain:].cold.1();

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)requiredServices
{
  return self->_requiredServices;
}

- (unint64_t)options
{
  return self->_options;
}

- (COClusterRealm)realm
{
  return self->_realm;
}

- (NSString)globalServiceName
{
  return self->_globalServiceName;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_globalServiceName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

+ (void)configurationForExplicitClusterIdentifier:requiredServices:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Invalid character in cluster identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_validateServices:(os_log_t)log options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21214B000, log, OS_LOG_TYPE_ERROR, "Invalid cluster configuration: at least one service required", v1, 2u);
}

+ (void)_validateServices:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Invalid cluster configuration: services %lX require Coordinator option", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_validateServices:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Invalid cluster configuration: unknown options %lX", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_validateServices:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Invalid cluster configuration: unknown services %lX", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_prefixFromDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Invalid character in cluster domain %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
