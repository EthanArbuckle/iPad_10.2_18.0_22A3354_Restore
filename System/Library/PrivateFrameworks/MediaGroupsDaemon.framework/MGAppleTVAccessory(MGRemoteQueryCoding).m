@implementation MGAppleTVAccessory(MGRemoteQueryCoding)

- (id)rq_codedProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_255322C90;
  objc_msgSendSuper2(&v8, sel_rq_codedProperties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "rq_coded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("deviceIdentifier"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

+ (id)rq_decodedProperties:()MGRemoteQueryCoding
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "rq_stringForKey:", CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_255322AE8;
    objc_msgSendSuper2(&v9, sel_rq_decodedProperties_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("deviceIdentifier"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
