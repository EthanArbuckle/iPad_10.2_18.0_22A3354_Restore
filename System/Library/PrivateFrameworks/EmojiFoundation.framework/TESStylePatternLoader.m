@implementation TESStylePatternLoader

- (TESStylePatternLoader)initWithLocaleIdentifier:(id)a3
{
  TESStylePatternLoader *v3;
  TESStylePatternLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TESStylePatternLoader;
  v3 = -[TESLocalizedPListLoader initWithLocaleIdentifier:](&v6, sel_initWithLocaleIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[TESLocalizedPListLoader setResourceName:](v3, "setResourceName:", CFSTR("TextEffectsStylePatterns"));
  return v4;
}

@end
