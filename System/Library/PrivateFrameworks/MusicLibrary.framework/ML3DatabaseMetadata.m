@implementation ML3DatabaseMetadata

+ (void)initialize
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("audio_language"), CFSTR("subtitle_language"), CFSTR("genius_cuid"), CFSTR("primary_container_pid"), 0);
    v4 = (void *)ML3DatabaseMetadataAllProperties;
    ML3DatabaseMetadataAllProperties = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "predisambiguateProperties:toDictionary:", ML3DatabaseMetadataAllProperties, v5);
    v6 = (void *)ML3DatabaseMetadataPredisambiguatedPropertyForProperties;
    ML3DatabaseMetadataPredisambiguatedPropertyForProperties = (uint64_t)v5;

  }
}

+ (id)databaseTable
{
  return CFSTR("db_info");
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3DatabaseMetadataPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  return (id)ML3DatabaseMetadataAllProperties;
}

@end
