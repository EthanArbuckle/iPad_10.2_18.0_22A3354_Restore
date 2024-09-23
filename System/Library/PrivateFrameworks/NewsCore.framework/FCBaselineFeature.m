@implementation FCBaselineFeature

+ (id)baselineFeature
{
  if (qword_1ED0F7AB0 != -1)
    dispatch_once(&qword_1ED0F7AB0, &__block_literal_global_122);
  return (id)qword_1ED0F7AA8;
}

void __36__FCBaselineFeature_baselineFeature__block_invoke()
{
  FCBaselineFeature *v0;
  void *v1;

  v0 = objc_alloc_init(FCBaselineFeature);
  v1 = (void *)qword_1ED0F7AA8;
  qword_1ED0F7AA8 = (uint64_t)v0;

}

- (FCBaselineFeature)init
{
  FCBaselineFeature *v2;
  FCBaselineFeature *v3;
  NSString *personalizationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCBaselineFeature;
  v2 = -[FCPersonalizationFeature init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    personalizationIdentifier = v2->super._personalizationIdentifier;
    v2->super._personalizationIdentifier = (NSString *)CFSTR("f0");

  }
  return v3;
}

@end
