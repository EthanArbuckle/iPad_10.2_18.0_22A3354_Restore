@implementation FCHeadlineFeatureArticleTypeNonFlint

+ (id)articleTypeNonFlintFeature
{
  if (qword_1ED0F7B10 != -1)
    dispatch_once(&qword_1ED0F7B10, &__block_literal_global_180);
  return (id)qword_1ED0F7B08;
}

void __66__FCHeadlineFeatureArticleTypeNonFlint_articleTypeNonFlintFeature__block_invoke()
{
  FCHeadlineFeatureArticleTypeNonFlint *v0;
  void *v1;

  v0 = objc_alloc_init(FCHeadlineFeatureArticleTypeNonFlint);
  v1 = (void *)qword_1ED0F7B08;
  qword_1ED0F7B08 = (uint64_t)v0;

}

- (FCHeadlineFeatureArticleTypeNonFlint)init
{
  FCHeadlineFeatureArticleTypeNonFlint *v2;
  FCHeadlineFeatureArticleTypeNonFlint *v3;
  NSString *personalizationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleTypeNonFlint;
  v2 = -[FCPersonalizationFeature init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)CFSTR("f2");

  }
  return v3;
}

@end
