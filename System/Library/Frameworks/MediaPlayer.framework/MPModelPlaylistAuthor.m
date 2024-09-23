@implementation MPModelPlaylistAuthor

+ (id)__socialProfile_KEY
{
  return CFSTR("MPModelRelationshipPlaylistAuthorSocialProfile");
}

+ (id)__role_KEY
{
  return CFSTR("MPModelPropertyPlaylistAuthorRole");
}

+ (id)__position_KEY
{
  return CFSTR("MPModelPropertyPlaylistAuthorPosition");
}

+ (id)__playlist_KEY
{
  return CFSTR("MPModelRelationshipPlaylistAuthorPlaylist");
}

+ (id)__isPendingApproval_KEY
{
  return CFSTR("MPModelPropertyPlaylistAuthorIsPendingApproval");
}

+ (void)__MPModelRelationshipPlaylistAuthorPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistAuthor.m"), 47, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistAuthorPlaylist"));

}

+ (void)__MPModelRelationshipPlaylistAuthorSocialProfile__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistAuthor.m"), 48, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistAuthorSocialProfile"));

}

+ (void)__MPModelPropertyPlaylistAuthorRole__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistAuthor.m"), 49, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistAuthorRole"));

}

+ (void)__MPModelPropertyPlaylistAuthorIsPendingApproval__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistAuthor.m"), 50, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistAuthorIsPendingApproval"));

}

+ (void)__MPModelPropertyPlaylistAuthorPosition__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistAuthor.m"), 51, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistAuthorPosition"));

}

+ (id)kindWithVariants:(unint64_t)a3
{
  return +[MPModelPlaylistAuthorKind kindWithVariants:](MPModelPlaylistAuthorKind, "kindWithVariants:", a3);
}

@end
