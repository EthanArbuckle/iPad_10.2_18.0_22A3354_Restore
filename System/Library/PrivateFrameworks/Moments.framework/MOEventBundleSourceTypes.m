@implementation MOEventBundleSourceTypes

+ (id)all
{
  if (all_onceToken != -1)
    dispatch_once(&all_onceToken, &__block_literal_global_6);
  return (id)all_allowableSourceTypes;
}

void __31__MOEventBundleSourceTypes_all__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = MOEventBundleSourceTypeContact;
  v4[1] = MOEventBundleSourceTypeMedia;
  v4[2] = MOEventBundleSourceTypePeopleContext;
  v4[3] = MOEventBundleSourceTypePhoto;
  v4[4] = MOEventBundleSourceTypeStateOfMind;
  v4[5] = MOEventBundleSourceTypeReflectionPrompt;
  v4[6] = MOEventBundleSourceTypeThirdPartyMedia;
  v4[7] = MOEventBundleSourceTypeVisitLocation;
  v4[8] = MOEventBundleSourceTypeActivity;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)all_allowableSourceTypes;
  all_allowableSourceTypes = v2;

}

@end
