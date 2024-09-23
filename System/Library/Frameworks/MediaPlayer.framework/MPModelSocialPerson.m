@implementation MPModelSocialPerson

+ (id)__verified_KEY
{
  return CFSTR("MPModelPropertySocialPersonIsVerified");
}

+ (id)__uncensoredName_KEY
{
  return CFSTR("MPModelPropertySocialPersonUncensoredName");
}

+ (id)__privatePerson_KEY
{
  return CFSTR("MPModelPropertySocialPersonIsPrivate");
}

+ (id)__pendingRequestsCount_KEY
{
  return CFSTR("MPModelPropertySocialPersonPendingRequestsCount");
}

+ (id)__hasLightweightProfile_KEY
{
  return CFSTR("MPModelPropertySocialPersonHasLightweightProfile");
}

+ (id)__handle_KEY
{
  return CFSTR("MPModelPropertySocialPersonHandle");
}

+ (id)__biography_KEY
{
  return CFSTR("MPModelPropertySocialPersonBiography");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertySocialPersonArtwork");
}

+ (id)kind
{
  return +[MPModelKind kindWithModelClass:](MPModelSocialPersonKind, "kindWithModelClass:", objc_opt_class());
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelSocialPerson artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelSocialPerson *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)genericObjectType
{
  return 17;
}

+ (void)__MPModelPropertySocialPersonUncensoredName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 29, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonUncensoredName"));

}

+ (void)__MPModelPropertySocialPersonHandle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonHandle"));

}

+ (void)__MPModelPropertySocialPersonBiography__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonBiography"));

}

+ (void)__MPModelPropertySocialPersonIsPrivate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 32, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonIsPrivate"));

}

+ (void)__MPModelPropertySocialPersonIsVerified__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 33, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonIsVerified"));

}

+ (void)__MPModelPropertySocialPersonPendingRequestsCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 34, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonPendingRequestsCount"));

}

+ (void)__MPModelPropertySocialPersonArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 35, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonArtwork"));

}

+ (void)__MPModelPropertySocialPersonHasLightweightProfile__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelSocialPerson.m"), 36, CFSTR("Translator was missing mapping for MPModelPropertySocialPersonHasLightweightProfile"));

}

@end
