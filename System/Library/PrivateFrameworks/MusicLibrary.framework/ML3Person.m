@implementation ML3Person

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = CFSTR("person_pid");
    v7[1] = CFSTR("cloud_id");
    v7[2] = CFSTR("handle");
    v7[3] = CFSTR("name");
    v7[4] = CFSTR("image_url");
    v7[5] = CFSTR("image_token");
    v7[6] = CFSTR("lightweight_profile");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ML3PersonAllProperties;
    ML3PersonAllProperties = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3PersonAllProperties, v5);
    v6 = (void *)ML3PersonPredisambiguatedPropertyForProperties;
    ML3PersonPredisambiguatedPropertyForProperties = (uint64_t)v5;

  }
}

+ (id)databaseTable
{
  return CFSTR("person");
}

+ (int64_t)revisionTrackingCode
{
  return 10;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3PersonPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3PersonAllProperties;
}

@end
