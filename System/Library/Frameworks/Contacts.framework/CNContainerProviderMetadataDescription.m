@implementation CNContainerProviderMetadataDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6328];
}

- (id)CNValueFromABValue:(void *)a3
{
  CNProviderMetadata *v3;
  CFTypeID v4;
  CNProviderMetadata *v5;

  v3 = (CNProviderMetadata *)a3;
  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      v3 = -[CNProviderMetadata initWithDataRepresentation:]([CNProviderMetadata alloc], "initWithDataRepresentation:", v5);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setProviderMetadata:", a3);
}

- (id)key
{
  return CFSTR("providerMetadata");
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
  return (id)objc_msgSend(a3, "providerMetadata");
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "dataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
