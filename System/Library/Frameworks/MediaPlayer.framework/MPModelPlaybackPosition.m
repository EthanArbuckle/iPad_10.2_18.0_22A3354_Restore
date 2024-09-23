@implementation MPModelPlaybackPosition

+ (id)__userPlayCount_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionUserPlayCount");
}

+ (id)__storeUbiquitousIdentifier_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier");
}

+ (id)__stopTime_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionStopTime");
}

+ (id)__startTime_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionStartTime");
}

+ (id)__shouldRememberBookmarkTime_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionShouldRememberBookmarkTime");
}

+ (id)__hasBeenPlayed_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionHasBeenPlayed");
}

+ (id)__bookmarkTime_KEY
{
  return CFSTR("MPModelPropertyPlaybackPositionBookmarkTime");
}

+ (void)__MPModelPropertyPlaybackPositionBookmarkTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 18, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionBookmarkTime"));

}

+ (void)__MPModelPropertyPlaybackPositionShouldRememberBookmarkTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 19, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionShouldRememberBookmarkTime"));

}

+ (void)__MPModelPropertyPlaybackPositionHasBeenPlayed__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 20, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionHasBeenPlayed"));

}

+ (void)__MPModelPropertyPlaybackPositionStartTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 21, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionStartTime"));

}

+ (void)__MPModelPropertyPlaybackPositionStopTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 22, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionStopTime"));

}

+ (void)__MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 23, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionStoreUbiquitousIdentifier"));

}

+ (void)__MPModelPropertyPlaybackPositionUserPlayCount__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlaybackPosition.m"), 24, CFSTR("Translator was missing mapping for MPModelPropertyPlaybackPositionUserPlayCount"));

}

@end
