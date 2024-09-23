@implementation MPModelPlaylistEntryReaction

+ (id)__socialProfile_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntryReactionSocialProfile");
}

+ (id)__reactionText_KEY
{
  return CFSTR("MPModelPropertyPlaylistEntryReactionText");
}

+ (id)__playlistEntry_KEY
{
  return CFSTR("MPModelRelationshipPlaylistEntryReactionPlaylistEntry");
}

+ (id)__date_KEY
{
  return CFSTR("MPModelPropertyPlaylistEntryReactionDate");
}

+ (void)__MPModelRelationshipPlaylistEntryReactionPlaylistEntry__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntryReaction.m"), 28, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntryReactionPlaylistEntry"));

}

+ (void)__MPModelRelationshipPlaylistEntryReactionSocialProfile__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntryReaction.m"), 29, CFSTR("Translator was missing mapping for MPModelRelationshipPlaylistEntryReactionSocialProfile"));

}

+ (void)__MPModelPropertyPlaylistEntryReactionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntryReaction.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEntryReactionText"));

}

+ (void)__MPModelPropertyPlaylistEntryReactionDate__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaylistEntryReaction.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyPlaylistEntryReactionDate"));

}

@end
