@implementation AMSUIDDynamicImpressionMetrics

- (AMSUIDDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1B9DE20A0();
  v7 = sub_1B9DE20A0();
  return (AMSUIDDynamicImpressionMetrics *)DynamicImpressionMetrics.init(identifier:fields:custom:)((uint64_t)a3, v6, v7);
}

- (NSDictionary)custom
{
  return (NSDictionary *)sub_1B9D8A914((uint64_t)self, (uint64_t)a2, (void (*)(void))DynamicImpressionMetrics.custom.getter);
}

- (void)setCustom:(id)a3
{
  uint64_t v4;
  AMSUIDDynamicImpressionMetrics *v5;

  v4 = sub_1B9DE20A0();
  v5 = self;
  DynamicImpressionMetrics.custom.setter(v4);

}

- (NSDictionary)fields
{
  return (NSDictionary *)sub_1B9D8A914((uint64_t)self, (uint64_t)a2, (void (*)(void))DynamicImpressionMetrics.fields.getter);
}

- (void)setFields:(id)a3
{
  uint64_t v4;
  AMSUIDDynamicImpressionMetrics *v5;

  v4 = sub_1B9DE20A0();
  v5 = self;
  DynamicImpressionMetrics.fields.setter(v4);

}

- (AMSUIDDynamicImpressionMetricsIdentifier)identifier
{
  return (AMSUIDDynamicImpressionMetricsIdentifier *)DynamicImpressionMetrics.identifier.getter();
}

- (void)setIdentifier:(id)a3
{
  id v4;
  AMSUIDDynamicImpressionMetrics *v5;

  v4 = a3;
  v5 = self;
  DynamicImpressionMetrics.identifier.setter(v4);

}

- (AMSUIDDynamicImpressionMetrics)init
{
  DynamicImpressionMetrics.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
