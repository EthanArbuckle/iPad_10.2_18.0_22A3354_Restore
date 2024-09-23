@implementation NTKUpNextNewsSampleDataSource

+ (id)_newCircularTemplate
{
  if (_newCircularTemplate_onceToken != -1)
    dispatch_once(&_newCircularTemplate_onceToken, &__block_literal_global_50);
  return (id)objc_msgSend((id)_newCircularTemplate_template, "copy");
}

void __53__NTKUpNextNewsSampleDataSource__newCircularTemplate__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  Class (*v9)(uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!NewsServicesLibraryCore_frameworkLibrary_0)
  {
    v8 = xmmword_1E6BD22A8;
    v9 = 0;
    NewsServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (NewsServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x2050000000;
    v0 = (void *)getNSSComplicationDataSourceClass_softClass_0;
    v7 = getNSSComplicationDataSourceClass_softClass_0;
    if (!getNSSComplicationDataSourceClass_softClass_0)
    {
      *(_QWORD *)&v8 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v8 + 1) = 3221225472;
      v9 = __getNSSComplicationDataSourceClass_block_invoke_0;
      v10 = &unk_1E6BCF200;
      v11 = &v4;
      __getNSSComplicationDataSourceClass_block_invoke_0((uint64_t)&v8);
      v0 = (void *)v5[3];
    }
    v1 = objc_retainAutorelease(v0);
    _Block_object_dispose(&v4, 8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1, "nss_newsComplicationTemplateForFamily:compact:", 10, 0, v4);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)_newCircularTemplate_template;
      _newCircularTemplate_template = v2;

    }
  }
}

+ (id)bundleIdentifier
{
  return +[NTKUpNextNewsDataSource bundleIdentifier](NTKUpNextNewsDataSource, "bundleIdentifier");
}

- (id)supportedSections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D843D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sampleContent
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_alloc_init(MEMORY[0x1E0D842D8]);
  v3 = (void *)MEMORY[0x1E0C944E8];
  NTKImageNamed(CFSTR("SG_news"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProviderWithOnePieceImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderImageProvider:", v5);

  v6 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("UP_NEXT_SAMPLE_NEWS_HEADLINE"), CFSTR("Editors’ Picks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textProviderWithText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderTextProvider:", v8);

  v9 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("UP_NEXT_SAMPLE_NEWS_STORY"), CFSTR("New Planets Found"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProviderWithText:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDescription1TextProvider:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294, 0.301960784, 0.37254902, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v12);

  v13 = +[NTKUpNextNewsSampleDataSource _newCircularTemplate](NTKUpNextNewsSampleDataSource, "_newCircularTemplate");
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("REUICircularTemplateKey"));

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a4;
  REUISampleRelevanceProviderForSamplePosition();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D842E8]);
  +[NTKUpNextNewsSampleDataSource sampleContent](NTKUpNextNewsSampleDataSource, "sampleContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:content:action:relevanceProviders:", CFSTR("news.sample"), v7, 0, v8);

  v11 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v10);

}

@end
