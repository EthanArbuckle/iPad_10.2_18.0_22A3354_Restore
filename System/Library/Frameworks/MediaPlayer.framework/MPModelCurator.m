@implementation MPModelCurator

+ (id)__shortName_KEY
{
  return CFSTR("MPModelPropertyCuratorShortName");
}

+ (id)__shortEditorNotes_KEY
{
  return CFSTR("MPModelPropertyCuratorShortEditorNotes");
}

+ (id)__handle_KEY
{
  return CFSTR("MPModelPropertyCuratorHandle");
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyCuratorEditorialArtwork");
}

+ (id)__editorNotes_KEY
{
  return CFSTR("MPModelPropertyCuratorEditorNotes");
}

+ (id)__curatorSubKind_KEY
{
  return CFSTR("MPModelPropertyCuratorSubKind");
}

+ (id)__curatorKind_KEY
{
  return CFSTR("MPModelPropertyCuratorKind");
}

+ (id)__brandLogoArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyCuratorBrandLogoArtwork");
}

- (id)editorialArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelCurator editorialArtworkCatalogBlock](self, "editorialArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelCurator *))(v3 + 16))(v3, self);
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
  return 16;
}

- (id)brandLogoArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelCurator brandLogoArtworkCatalogBlock](self, "brandLogoArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelCurator *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return +[MPModelCuratorActualKind kindWithVariants:](MPModelCuratorActualKind, "kindWithVariants:", a3);
}

+ (void)__MPModelPropertyCuratorShortName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 89, CFSTR("Translator was missing mapping for MPModelPropertyCuratorShortName"));

}

+ (void)__MPModelPropertyCuratorEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 90, CFSTR("Translator was missing mapping for MPModelPropertyCuratorEditorNotes"));

}

+ (void)__MPModelPropertyCuratorShortEditorNotes__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 91, CFSTR("Translator was missing mapping for MPModelPropertyCuratorShortEditorNotes"));

}

+ (void)__MPModelPropertyCuratorKind__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 92, CFSTR("Translator was missing mapping for MPModelPropertyCuratorKind"));

}

+ (void)__MPModelPropertyCuratorSubKind__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 93, CFSTR("Translator was missing mapping for MPModelPropertyCuratorSubKind"));

}

+ (void)__MPModelPropertyCuratorEditorialArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 94, CFSTR("Translator was missing mapping for MPModelPropertyCuratorEditorialArtwork"));

}

+ (void)__MPModelPropertyCuratorBrandLogoArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 95, CFSTR("Translator was missing mapping for MPModelPropertyCuratorBrandLogoArtwork"));

}

+ (void)__MPModelPropertyCuratorHandle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelCurator.m"), 96, CFSTR("Translator was missing mapping for MPModelPropertyCuratorHandle"));

}

@end
