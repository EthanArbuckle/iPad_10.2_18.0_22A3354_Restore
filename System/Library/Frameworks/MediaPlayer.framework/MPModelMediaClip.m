@implementation MPModelMediaClip

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyMediaClipTitle");
}

+ (id)__staticAssets_KEY
{
  return CFSTR("MPModelRelationshipMediaClipStaticAssets");
}

+ (id)__previewArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyMediaClipPreviewArtwork");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mediaClip %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", CFSTR("MPModelPropertyMediaClipTitle")))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MPModelMediaClip title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("“%@” "), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", v9, 0);
  }
  return v6;
}

- (id)previewArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelMediaClip previewArtworkCatalogBlock](self, "previewArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelMediaClip *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)classesForSecureCoding
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)kind
{
  return +[MPModelKind kindWithModelClass:](MPModelMediaClipKind, "kindWithModelClass:", objc_opt_class());
}

+ (void)__MPModelPropertyMediaClipPreviewArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMediaClip.m"), 46, CFSTR("Translator was missing mapping for MPModelPropertyMediaClipPreviewArtwork"));

}

+ (void)__MPModelRelationshipMediaClipStaticAssets__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMediaClip.m"), 47, CFSTR("Translator was missing mapping for MPModelRelationshipMediaClipStaticAssets"));

}

+ (void)__MPModelPropertyMediaClipTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelMediaClip.m"), 48, CFSTR("Translator was missing mapping for MPModelPropertyMediaClipTitle"));

}

+ (int64_t)genericObjectType
{
  return 10;
}

@end
