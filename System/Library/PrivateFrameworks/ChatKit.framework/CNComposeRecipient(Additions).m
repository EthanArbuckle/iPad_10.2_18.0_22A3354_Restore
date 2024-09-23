@implementation CNComposeRecipient(Additions)

- (BOOL)isEmail
{
  return objc_msgSend(a1, "kind") == 0;
}

- (BOOL)isPhone
{
  return objc_msgSend(a1, "kind") == 1;
}

- (BOOL)isNamedGroup
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isGroup"))
    return 0;
  objc_msgSend(a1, "displayString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (uint64_t)isNotAChildOfUnifiedRecipient
{
  void *v2;
  char v3;

  objc_msgSend(a1, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(a1, "isGroup");

    if ((v3 & 1) == 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (BOOL)isUnnamedGroup
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isGroup"))
    return 0;
  objc_msgSend(a1, "displayString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "displayString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") == 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (uint64_t)copyPhoneNumber
{
  uint64_t v2;
  void *v3;
  const void *v4;
  uint64_t v5;

  if (!objc_msgSend(a1, "isPhone"))
    return 0;
  objc_msgSend(a1, "address");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = (const void *)MEMORY[0x193FF31C8](1);
  v5 = CFPhoneNumberCreate();
  if (v4)
    CFRelease(v4);

  return v5;
}

- (id)rawAddress
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "uncommentedAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "uncommentedAddress");
  else
    objc_msgSend(a1, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCanonicalAddress:()Additions
{
  objc_setAssociatedObject(a1, "CKMessageComposeCanonicalFormKey", a3, (void *)1);
}

- (id)canonicalAddress
{
  return objc_getAssociatedObject(a1, "CKMessageComposeCanonicalFormKey");
}

- (id)IDSCanonicalAddress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "rawAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMStripFormattingFromAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "IDSCanonicalAddressForAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)IDSCanonicalAddressForAddress:()Additions
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(a1, "kind") == 1 || objc_msgSend(a1, "isPhone"))
  {
    v5 = IDSCopyIDForPhoneNumber();
LABEL_8:
    v7 = (void *)v5;

    goto LABEL_9;
  }
  if (!objc_msgSend(a1, "kind") || objc_msgSend(a1, "kind") == 2 || (v6 = objc_msgSend(a1, "isEmail"), v7 = v4, v6))
  {
    v5 = MEMORY[0x193FF32B8](v4);
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

@end
