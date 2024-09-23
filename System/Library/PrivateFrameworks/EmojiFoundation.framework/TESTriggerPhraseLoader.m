@implementation TESTriggerPhraseLoader

- (TESTriggerPhraseLoader)initWithLocaleIdentifier:(id)a3
{
  TESTriggerPhraseLoader *v3;
  TESTriggerPhraseLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TESTriggerPhraseLoader;
  v3 = -[TESLocalizedPListLoader initWithLocaleIdentifier:](&v6, sel_initWithLocaleIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[TESLocalizedPListLoader setResourceName:](v3, "setResourceName:", CFSTR("TextEffectsTriggerPhrases"));
  return v4;
}

@end
