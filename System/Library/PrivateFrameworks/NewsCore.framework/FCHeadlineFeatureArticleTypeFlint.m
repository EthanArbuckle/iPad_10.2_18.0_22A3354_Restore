@implementation FCHeadlineFeatureArticleTypeFlint

+ (id)articleTypeFlintFeature
{
  if (qword_1ED0F7B00 != -1)
    dispatch_once(&qword_1ED0F7B00, &__block_literal_global_174);
  return (id)qword_1ED0F7AF8;
}

void __60__FCHeadlineFeatureArticleTypeFlint_articleTypeFlintFeature__block_invoke()
{
  FCHeadlineFeatureArticleTypeFlint *v0;
  void *v1;

  v0 = objc_alloc_init(FCHeadlineFeatureArticleTypeFlint);
  v1 = (void *)qword_1ED0F7AF8;
  qword_1ED0F7AF8 = (uint64_t)v0;

}

- (FCHeadlineFeatureArticleTypeFlint)init
{
  FCHeadlineFeatureArticleTypeFlint *v2;
  FCHeadlineFeatureArticleTypeFlint *v3;
  NSString *personalizationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCHeadlineFeatureArticleTypeFlint;
  v2 = -[FCPersonalizationFeature init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)CFSTR("f1");

  }
  return v3;
}

@end
