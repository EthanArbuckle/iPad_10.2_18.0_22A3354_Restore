@implementation NSString(IDSDestinationParsing)

- (uint64_t)fkMessageDestinationType
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "containsString:", CFSTR("@")) & 1) != 0
    || (objc_msgSend(a1, "containsString:", CFSTR("mailto:")) & 1) != 0)
  {
    return 2;
  }
  if ((objc_msgSend(a1, "containsString:", CFSTR("tel:")) & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3);

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)fkMessageIDSIdentifier
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "fkMessageIsIDSIdentifier"))
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    v3 = objc_msgSend(a1, "fkMessageDestinationType");
    if (v3 == 2)
    {
      v2 = (void *)MEMORY[0x212BE4BE8](a1);
    }
    else if (v3 == 1)
    {
      v2 = (void *)IDSCopyIDForPhoneNumber();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)fkMessageRawAddress
{
  void *v2;

  if (objc_msgSend(a1, "fkMessageIsRawAddress"))
    v2 = (void *)objc_msgSend(a1, "copy");
  else
    v2 = (void *)IDSCopyRawAddressForDestination();
  return v2;
}

- (BOOL)fkMessageIsRawAddress
{
  return (objc_msgSend(a1, "containsString:", CFSTR("tel:")) & 1) == 0
      && (objc_msgSend(a1, "containsString:", CFSTR("mailto:")) & 1) == 0
      && objc_msgSend(a1, "fkMessageDestinationType") != 0;
}

- (uint64_t)fkMessageIsIDSIdentifier
{
  if ((objc_msgSend(a1, "containsString:", CFSTR("tel:")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "containsString:", CFSTR("mailto:"));
}

- (id)fkMessageCanonicalRawAddress
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "fkMessageRawAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "fkMessageDestinationType") == 1)
  {
    v4 = (void *)MEMORY[0x212BE4C00](v2, 0, 1);
    objc_msgSend(v4, "fkMessageRawAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

@end
