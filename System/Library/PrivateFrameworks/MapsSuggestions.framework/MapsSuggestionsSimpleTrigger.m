@implementation MapsSuggestionsSimpleTrigger

- (MapsSuggestionsSimpleTrigger)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsSimpleTrigger;
  return -[MapsSuggestionsBaseTrigger initWithName:](&v4, sel_initWithName_, a3);
}

- (MapsSuggestionsSimpleTrigger)initWithName:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsSimpleTrigger;
  return -[MapsSuggestionsBaseTrigger initWithName:queue:](&v5, sel_initWithName_queue_, a3, a4);
}

@end
