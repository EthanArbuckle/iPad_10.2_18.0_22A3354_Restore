@implementation CSInternalSearchableIndex

- (CSInternalSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSInternalSearchableIndex;
  return -[CSSearchableIndex initWithName:protectionClass:bundleIdentifier:options:](&v7, sel_initWithName_protectionClass_bundleIdentifier_options_, a3, a4, a5, a6);
}

@end
