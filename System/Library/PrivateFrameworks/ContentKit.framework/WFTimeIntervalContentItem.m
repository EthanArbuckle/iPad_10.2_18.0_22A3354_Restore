@implementation WFTimeIntervalContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Time interval"), CFSTR("Time interval"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Time intervals"), CFSTR("Time intervals"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Time intervals"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 7;
}

- (WFTimeInterval)timeInterval
{
  return (WFTimeInterval *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFTimeIntervalContentItem timeInterval](self, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteTimeString");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v9;
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[WFTimeIntervalContentItem timeInterval](self, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeInterval");
    objc_msgSend(v10, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v11 = (void *)MEMORY[0x24BDBCE60];
    -[WFTimeIntervalContentItem timeInterval](self, "timeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeInterval");
    objc_msgSend(v11, "dateWithTimeIntervalSinceNow:");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = 0;
  return v7;
}

@end
