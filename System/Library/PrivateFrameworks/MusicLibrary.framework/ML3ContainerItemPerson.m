@implementation ML3ContainerItemPerson

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = CFSTR("container_item_person_pid");
    v7[1] = CFSTR("container_item_pid");
    v7[2] = CFSTR("person_pid");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ML3ContainerItemPersonAllProperties;
    ML3ContainerItemPersonAllProperties = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3ContainerItemPersonAllProperties, v5);
    v6 = (void *)ML3ContainerItemPersonPredisambiguatedPropertyForProperties;
    ML3ContainerItemPersonPredisambiguatedPropertyForProperties = (uint64_t)v5;

  }
}

+ (id)databaseTable
{
  return CFSTR("container_item_person");
}

+ (int64_t)revisionTrackingCode
{
  return 11;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3ContainerItemPersonPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3ContainerItemPersonAllProperties;
}

@end
