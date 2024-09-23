@implementation MPModelPerson

+ (id)__name_KEY
{
  return CFSTR("MPModelPropertyPersonName");
}

+ (id)__hasSocialPosts_KEY
{
  return CFSTR("MPModelPropertyPersonHasSocialPosts");
}

+ (void)__MPModelPropertyPersonName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPerson.m"), 17, CFSTR("Translator was missing mapping for MPModelPropertyPersonName"));

}

+ (void)__MPModelPropertyPersonHasSocialPosts__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPerson.m"), 18, CFSTR("Translator was missing mapping for MPModelPropertyPersonHasSocialPosts"));

}

@end
