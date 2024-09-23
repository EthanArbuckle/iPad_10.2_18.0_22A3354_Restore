@implementation ML3Booklet

+ (id)databaseTable
{
  return CFSTR("booklet");
}

+ (int64_t)revisionTrackingCode
{
  return 12;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ML3Booklet_predisambiguatedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predisambiguatedProperties___predisambiguatedPropertiesOnceToken != -1)
    dispatch_once(&predisambiguatedProperties___predisambiguatedPropertiesOnceToken, block);
  return (id)predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties;
}

+ (id)allProperties
{
  if (allProperties___allPropertiesOnceToken != -1)
    dispatch_once(&allProperties___allPropertiesOnceToken, &__block_literal_global_13238);
  return (id)allProperties___ML3BookletAllProperties;
}

void __27__ML3Booklet_allProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("booklet_pid");
  v2[1] = CFSTR("item_pid");
  v2[2] = CFSTR("name");
  v2[3] = CFSTR("store_item_id");
  v2[4] = CFSTR("redownload_params");
  v2[5] = CFSTR("file_size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allProperties___ML3BookletAllProperties;
  allProperties___ML3BookletAllProperties = v0;

}

void __40__ML3Booklet_predisambiguatedProperties__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "predisambiguateProperties:toDictionary:", v4, v2);
  v3 = (void *)predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties;
  predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties = (uint64_t)v2;

}

@end
