@implementation CNContainerAccountIdentifierDescription

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (void)ABValueForABSource:(void *)a3
{
  const void *v3;

  ABRecordGetAddressBook();
  if (ABAddressBookGetAccountForSource() && (v3 = (const void *)ABAccountCopyIdentifier()) != 0)
    return (void *)CFAutorelease(v3);
  else
    return 0;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setAccountIdentifier:", a3);
}

- (id)key
{
  return CFSTR("accountIdentifier");
}

- (BOOL)isWritable
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "accountIdentifier");
}

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF62C8];
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
