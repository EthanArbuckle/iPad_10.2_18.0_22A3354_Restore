@implementation DNDContact(Sanitization)

- (BOOL)needsSanitization
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "phoneNumbers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(a1, "emailAddresses");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count") == 0;

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
