@implementation SAPersonAttribute(STContactAddress)

- (STContactAddress)st_contactAddressValue
{
  void *v2;
  void *v3;
  void *v4;
  STContactAddress *v5;
  void *v6;
  void *v7;
  STContactAddress *v8;

  objc_msgSend(a1, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length") || objc_msgSend(v4, "length"))
  {
    v5 = [STContactAddress alloc];
    objc_msgSend(a1, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[STContactAddress initWithType:stringValue:contactIdentifier:contactInternalGUID:](v5, "initWithType:stringValue:contactIdentifier:contactInternalGUID:", 0, v2, v7, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
