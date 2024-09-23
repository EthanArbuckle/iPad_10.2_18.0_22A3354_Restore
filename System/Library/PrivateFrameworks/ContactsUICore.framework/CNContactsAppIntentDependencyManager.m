@implementation CNContactsAppIntentDependencyManager

+ (void)setupAppIntentDependencies
{
  sub_1DD1A0B50(0);
}

+ (void)setupAppIntentDependenciesWithActionPerformer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1DD1A0B50((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (CNContactsAppIntentDependencyManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactsAppIntentDependencyManager;
  return -[CNContactsAppIntentDependencyManager init](&v3, sel_init);
}

@end
