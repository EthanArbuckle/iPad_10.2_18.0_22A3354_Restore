@implementation BMDSLJSONUnarchiver

+ (id)unarchiveDSLFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unarchiveDSLFromData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)unarchiveDSLFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "unarchiveObjectFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unarchiveObjectFromString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unarchiveObjectFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unarchiveObjectFromData:(id)a3
{
  id v3;
  BMDSLJSONCoder *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(BMDSLJSONCoder);
  -[BMDSLJSONCoder decodeRootObjectFromData:](v4, "decodeRootObjectFromData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
