@implementation FCHeadlineFeatureArticleWithVideoContent

+ (id)articleWithVideoContentFeature
{
  if (qword_1ED0F7AC0 != -1)
    dispatch_once(&qword_1ED0F7AC0, &__block_literal_global_128);
  return (id)qword_1ED0F7AB8;
}

void __74__FCHeadlineFeatureArticleWithVideoContent_articleWithVideoContentFeature__block_invoke()
{
  FCHeadlineFeatureArticleWithVideoContent *v0;
  void *v1;

  v0 = objc_alloc_init(FCHeadlineFeatureArticleWithVideoContent);
  v1 = (void *)qword_1ED0F7AB8;
  qword_1ED0F7AB8 = (uint64_t)v0;

}

- (FCHeadlineFeatureArticleWithVideoContent)init
{
  FCHeadlineFeatureArticleWithVideoContent *v2;
  FCHeadlineFeatureArticleWithVideoContent *v3;
  NSString *personalizationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleWithVideoContent;
  v2 = -[FCPersonalizationFeature init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)CFSTR("f7");

  }
  return v3;
}

@end
