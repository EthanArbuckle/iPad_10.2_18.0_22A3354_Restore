@implementation HMDHomeNFCReaderKeyTransformer

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "dictionaryRepresentation");
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    +[HMDHomeNFCReaderKey createWithDictionaryRepresentation:](HMDHomeNFCReaderKey, "createWithDictionaryRepresentation:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
