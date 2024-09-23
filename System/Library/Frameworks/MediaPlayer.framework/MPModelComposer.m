@implementation MPModelComposer

+ (id)__libraryAddedDate_KEY
{
  return CFSTR("MPModelPropertyComposerLibraryAddedDate");
}

+ (id)kindWithAlbumKind:(id)a3
{
  return +[MPModelComposerKind kindWithAlbumKind:](MPModelComposerKind, "kindWithAlbumKind:", a3);
}

+ (void)__MPModelPropertyComposerLibraryAddedDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelComposer.m"), 70, CFSTR("Translator was missing mapping for MPModelPropertyComposerLibraryAddedDate"));

}

+ (int64_t)genericObjectType
{
  return 14;
}

@end
