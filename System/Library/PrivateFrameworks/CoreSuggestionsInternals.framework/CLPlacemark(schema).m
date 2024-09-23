@implementation CLPlacemark(schema)

- (id)schema
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Place"), CFSTR("@type"));
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  }
  objc_msgSend(a1, "postalAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("address"));
  objc_msgSend(a1, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  if (v8 != 0.0)
  {

    goto LABEL_9;
  }
  objc_msgSend(a1, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v11 = v10;

  if (v11 != 0.0)
  {
LABEL_9:
    objc_msgSend(a1, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("geo"));

  }
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
    v14 = 0;
  else
    v14 = v2;

  return v14;
}

+ (id)fromSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0C973A8];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fromSchema:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_10;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postalAddressFromString:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v5 = 0;
  }
LABEL_10:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("geo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C9E3B8];
  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("geo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromSchema:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", 0.0, 0.0);
  }
  objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", v16, v4, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
