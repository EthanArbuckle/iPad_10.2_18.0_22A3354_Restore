@implementation DateRangeRelevanceProviderManager

+ (NSArray)_features
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  sub_1BBFDA924(0, (unint64_t *)&qword_1ED69BA48, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BC08B600;
  if (qword_1ED69DA20 != -1)
    swift_once();
  v3 = (void *)qword_1ED6A0630;
  *(_QWORD *)(v2 + 32) = qword_1ED6A0630;
  sub_1BC08A4E0();
  sub_1BBFDA8B0();
  v4 = v3;
  v5 = (void *)sub_1BC08A4BC();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

+ (Class)_relevanceProviderClass
{
  type metadata accessor for DateRangeRelevanceProvider();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18HealthPlatformCore33DateRangeRelevanceProviderManager *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_1BBFDA588(v8, a4);

  return v12;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return -[DateRangeRelevanceProviderManager _valueForProvider:context:feature:](self, sel__valueForProvider_context_feature_, a3, 0, a4);
}

- (_TtC18HealthPlatformCore33DateRangeRelevanceProviderManager)initWithQueue:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DateRangeRelevanceProviderManager();
  return -[RERelevanceProviderManager initWithQueue:](&v5, sel_initWithQueue_, a3);
}

@end
