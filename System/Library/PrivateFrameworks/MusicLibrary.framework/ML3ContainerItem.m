@implementation ML3ContainerItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("position"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ML3ContainerItemDefaultOrderingTerms;
    ML3ContainerItemDefaultOrderingTerms = v3;

  }
}

+ (id)databaseTable
{
  return CFSTR("container_item");
}

+ (int64_t)revisionTrackingCode
{
  return 9;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ContainerItemDefaultOrderingTerms;
}

@end
