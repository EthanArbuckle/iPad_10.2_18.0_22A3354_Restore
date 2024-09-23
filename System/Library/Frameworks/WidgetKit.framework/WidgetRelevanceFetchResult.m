@implementation WidgetRelevanceFetchResult

- (_TtC9WidgetKit26WidgetRelevanceFetchResult)init
{
  _TtC9WidgetKit26WidgetRelevanceFetchResult *result;

  result = (_TtC9WidgetKit26WidgetRelevanceFetchResult *)sub_190A48448();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit26WidgetRelevanceFetchResult)initWithCoder:(id)a3
{
  id v3;
  _TtC9WidgetKit26WidgetRelevanceFetchResult *v4;

  v3 = a3;
  v4 = (_TtC9WidgetKit26WidgetRelevanceFetchResult *)sub_1909AE55C(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit26WidgetRelevanceFetchResult *v5;

  v4 = a3;
  v5 = self;
  WidgetRelevanceFetchResult.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
