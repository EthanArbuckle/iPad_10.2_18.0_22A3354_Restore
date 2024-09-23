@implementation MPModelGroup

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyKeyGroupTitle");
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MPModelObject identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("group %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyKeyGroupTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelGroup title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

+ (id)kind
{
  return +[MPModelGroupKind identityKind](MPModelGroupKind, "identityKind");
}

+ (void)__MPModelPropertyKeyGroupTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGroup.m"), 38, CFSTR("Translator was missing mapping for MPModelPropertyKeyGroupTitle"));

}

+ (int64_t)genericObjectType
{
  return 21;
}

@end
