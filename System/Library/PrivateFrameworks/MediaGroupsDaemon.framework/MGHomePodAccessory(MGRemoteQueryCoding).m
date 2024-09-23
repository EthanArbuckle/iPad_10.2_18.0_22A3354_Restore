@implementation MGHomePodAccessory(MGRemoteQueryCoding)

- (id)rq_codedProperties
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
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&off_255322FB0;
  objc_msgSendSuper2(&v12, sel_rq_codedProperties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(a1, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_coded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("deviceIdentifier"));

  objc_msgSend(a1, "productColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rq_coded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("productColor"));

  objc_msgSend(a1, "HomePodVariant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rq_coded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("HomePodVariant"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "rq_stringForKey:", CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_numberForKey:", CFSTR("productColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_numberForKey:", CFSTR("HomePodVariant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v5, "length") && v6 && v7)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_255322EA0;
    objc_msgSendSuper2(&v11, sel_rq_decodedProperties_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("deviceIdentifier"));
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("productColor"));
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("HomePodVariant"));
  }

  return v8;
}

@end
