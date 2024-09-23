@implementation MPModelLyrics

+ (id)__text_KEY
{
  return CFSTR("MPModelPropertyLyricsText");
}

+ (id)__hasTimeSyncedLyrics_KEY
{
  return CFSTR("MPModelPropertyLyricsHasTimeSyncedLyrics");
}

+ (id)__hasStoreLyrics_KEY
{
  return CFSTR("MPModelPropertyLyricsHasStoreLyrics");
}

+ (id)__hasLibraryLyrics_KEY
{
  return CFSTR("MPModelPropertyLyricsHasLibraryLyrics");
}

+ (id)__TTML_KEY
{
  return CFSTR("MPModelPropertyLyricsTTML");
}

+ (void)__MPModelPropertyLyricsText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelLyrics.m"), 27, CFSTR("Translator was missing mapping for MPModelPropertyLyricsText"));

}

+ (void)__MPModelPropertyLyricsTTML__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelLyrics.m"), 28, CFSTR("Translator was missing mapping for MPModelPropertyLyricsTTML"));

}

+ (void)__MPModelPropertyLyricsHasStoreLyrics__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelLyrics.m"), 29, CFSTR("Translator was missing mapping for MPModelPropertyLyricsHasStoreLyrics"));

}

+ (void)__MPModelPropertyLyricsHasLibraryLyrics__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelLyrics.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyLyricsHasLibraryLyrics"));

}

+ (void)__MPModelPropertyLyricsHasTimeSyncedLyrics__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelLyrics.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyLyricsHasTimeSyncedLyrics"));

}

@end
