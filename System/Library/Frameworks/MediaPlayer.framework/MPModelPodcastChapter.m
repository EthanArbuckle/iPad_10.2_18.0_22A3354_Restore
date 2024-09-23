@implementation MPModelPodcastChapter

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyPodcastChapterTitle");
}

+ (void)__MPModelPropertyPodcastChapterTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastChapter.m"), 16, CFSTR("Translator was missing mapping for MPModelPropertyPodcastChapterTitle"));

}

+ (id)__URL_KEY
{
  return CFSTR("MPModelPropertyPodcastChapterURL");
}

+ (void)__MPModelPropertyPodcastChapterURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastChapter.m"), 17, CFSTR("Translator was missing mapping for MPModelPropertyPodcastChapterURL"));

}

+ (id)__duration_KEY
{
  return CFSTR("MPModelPropertyPodcastChapterDuration");
}

+ (void)__MPModelPropertyPodcastChapterDuration__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastChapter.m"), 18, CFSTR("Translator was missing mapping for MPModelPropertyPodcastChapterDuration"));

}

+ (id)__startTime_KEY
{
  return CFSTR("MPModelPropertyPodcastChapterStartTime");
}

+ (void)__MPModelPropertyPodcastChapterStartTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPodcastChapter.m"), 19, CFSTR("Translator was missing mapping for MPModelPropertyPodcastChapterStartTime"));

}

@end
