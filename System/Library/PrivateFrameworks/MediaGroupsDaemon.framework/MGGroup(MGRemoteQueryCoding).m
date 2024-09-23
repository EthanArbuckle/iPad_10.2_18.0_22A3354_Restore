@implementation MGGroup(MGRemoteQueryCoding)

- (id)rq_codedProperties
{
  return objc_alloc_init(MEMORY[0x24BDBCE70]);
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  return objc_alloc_init(MEMORY[0x24BDBCE70]);
}

- (id)rq_coded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rq_coded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rq_coded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rq_coded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "memberIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rq_coded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rq_codedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("identifier"));
  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("name"));
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("member_identifiers"));
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("properties"));

  return v2;
}

+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "rq_stringForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = MGClassForMGGroupType(v5);
    if (v6)
    {
      objc_msgSend(v4, "rq_decodedObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rq_stringForKey:", CFSTR("name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rq_arrayOfDecodedClass:forKey:", objc_opt_class(), CFSTR("member_identifiers"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("properties"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      if (v11)
      {
        objc_msgSend(v6, "rq_decodedProperties:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        if (v7 && v9 && v12)
          v13 = (void *)objc_msgSend(objc_alloc((Class)v6), "initWithConnectionProvider:type:identifier:name:properties:memberIdentifiers:", 0, v5, v7, v8, v12, v9);
      }
      else
      {
        v12 = 0;
        v13 = 0;
      }
      v6 = v13;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
