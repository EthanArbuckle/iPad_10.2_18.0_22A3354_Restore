@implementation WFDisclosureWarning

- (NSString)localizedMessage
{
  NSString *result;

  result = (NSString *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFDisclosureWarning localizedMessage] must be overridden"));
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  WFDisclosureWarning *v4;
  WFDisclosureWarning *v5;
  WFDisclosureWarning *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WFDisclosureWarning *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFDisclosureWarning localizedMessage](self, "localizedMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDisclosureWarning localizedMessage](v6, "localizedMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFDisclosureWarning localizedMessage](self, "localizedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (NSSet)allDisclosureWarningClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
