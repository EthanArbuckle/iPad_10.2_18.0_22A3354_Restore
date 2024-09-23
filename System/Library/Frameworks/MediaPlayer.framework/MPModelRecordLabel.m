@implementation MPModelRecordLabel

+ (id)__shortDescriptionText_KEY
{
  return CFSTR("MPModelPropertyRecordLabelShortDescriptionText");
}

+ (id)__name_KEY
{
  return CFSTR("MPModelPropertyRecordLabelName");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyRecordLabelEditorialArtwork");
}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyRecordLabelDescriptionText");
}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyRecordLabelArtwork");
}

+ (int64_t)genericObjectType
{
  return 19;
}

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRecordLabel artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRecordLabel *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRecordLabel editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRecordLabel *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyRecordLabelName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRecordLabel.m"), 27, CFSTR("Translator was missing mapping for MPModelPropertyRecordLabelName"));

}

+ (void)__MPModelPropertyRecordLabelDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRecordLabel.m"), 28, CFSTR("Translator was missing mapping for MPModelPropertyRecordLabelDescriptionText"));

}

+ (void)__MPModelPropertyRecordLabelShortDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRecordLabel.m"), 29, CFSTR("Translator was missing mapping for MPModelPropertyRecordLabelShortDescriptionText"));

}

+ (void)__MPModelPropertyRecordLabelArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRecordLabel.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyRecordLabelArtwork"));

}

+ (void)__MPModelPropertyRecordLabelEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRecordLabel.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyRecordLabelEditorialArtwork"));

}

@end
