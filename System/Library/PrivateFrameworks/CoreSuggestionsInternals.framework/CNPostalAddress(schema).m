@implementation CNPostalAddress(schema)

- (id)schema
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/PostalAddress"), CFSTR("@type"));
  objc_msgSend(a1, "street");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(a1, "street");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E7DB83A8);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(a1, "street");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("streetAddress"));

    }
  }
  objc_msgSend(a1, "city");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(a1, "city");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", &stru_1E7DB83A8);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(a1, "city");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("addressLocality"));

    }
  }
  objc_msgSend(a1, "state");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(a1, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", &stru_1E7DB83A8);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(a1, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("addressRegion"));

    }
  }
  objc_msgSend(a1, "postalCode");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(a1, "postalCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", &stru_1E7DB83A8);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(a1, "postalCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("postalCode"));

    }
  }
  objc_msgSend(a1, "country");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(a1, "country");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", &stru_1E7DB83A8);

    if ((v26 & 1) == 0)
    {
      objc_msgSend(a1, "country");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("addressCountry"));

    }
  }
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
    v28 = 0;
  else
    v28 = v2;

  return v28;
}

+ (id)fromSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("streetAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("streetAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStreet:", v6);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressLocality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCity:", v8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressRegion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressRegion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:", v10);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("postalCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("postalCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPostalCode:", v12);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressCountry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("addressCountry"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCountry:", v14);

  }
  return v4;
}

@end
