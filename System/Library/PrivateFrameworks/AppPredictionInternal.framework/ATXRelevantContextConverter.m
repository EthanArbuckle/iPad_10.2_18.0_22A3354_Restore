@implementation ATXRelevantContextConverter

+ (id)contextFromRelevanceProvider:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = sub_1C9E10968(v3);

  return v4;
}

+ (id)contextFromRelevantContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = sub_1C9E10968(v3);

  return v4;
}

- (ATXRelevantContextConverter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RelevantContextConverter();
  return -[ATXRelevantContextConverter init](&v3, sel_init);
}

@end
