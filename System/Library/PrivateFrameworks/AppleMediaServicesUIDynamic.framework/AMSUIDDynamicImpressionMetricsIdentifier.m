@implementation AMSUIDDynamicImpressionMetricsIdentifier

- (AMSUIDDynamicImpressionMetricsIdentifier)initWithParent:(id)a3 element:(id)a4 index:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    v6 = sub_1B9DE2160();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_1B9DE2160();
  return (AMSUIDDynamicImpressionMetricsIdentifier *)DynamicImpressionMetricsIdentifier.init(parent:element:index:)(v6, v8, v9, v10, a5);
}

- (NSString)element
{
  void *v2;

  DynamicImpressionMetricsIdentifier.element.getter();
  v2 = (void *)sub_1B9DE213C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setElement:(id)a3
{
  AMSUIDDynamicImpressionMetricsIdentifier *v4;

  sub_1B9DE2160();
  v4 = self;
  DynamicImpressionMetricsIdentifier.element.setter();

}

- (int64_t)index
{
  return DynamicImpressionMetricsIdentifier.index.getter();
}

- (void)setIndex:(int64_t)a3
{
  DynamicImpressionMetricsIdentifier.index.setter(a3);
}

- (NSString)parent
{
  uint64_t v2;
  void *v3;

  DynamicImpressionMetricsIdentifier.parent.getter();
  if (v2)
  {
    v3 = (void *)sub_1B9DE213C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setParent:(id)a3
{
  AMSUIDDynamicImpressionMetricsIdentifier *v4;

  if (a3)
    sub_1B9DE2160();
  v4 = self;
  DynamicImpressionMetricsIdentifier.parent.setter();

}

- (AMSUIDDynamicImpressionMetricsIdentifier)init
{
  DynamicImpressionMetricsIdentifier.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
