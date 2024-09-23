@implementation MapsSuggestionsFirstUnlockBase

- (MapsSuggestionsFirstUnlockBase)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsFirstUnlockBase;
  return -[MapsSuggestionsBaseTrigger initWithName:](&v4, sel_initWithName_, a3);
}

- (BOOL)hasDeviceBeenUnlocked
{
  BOOL result;

  result = -[MapsSuggestionsFirstUnlockBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)triggerFired:(id)a3
{
  id v5;

  v5 = a3;
  -[MapsSuggestionsFirstUnlockBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
}

@end
