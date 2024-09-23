@implementation FACacheImageMarqueeOperation

- (FACacheImageMarqueeOperation)initWithFamilyCircle:(id)a3
{
  id v4;
  FACacheImageMarqueeOperation *v5;

  v4 = a3;
  v5 = (FACacheImageMarqueeOperation *)sub_20DFD6E04(a3);

  return v5;
}

- (void)createAndCacheData
{
  FACacheImageMarqueeOperation *v2;

  v2 = self;
  sub_20DFD400C();

}

- (void)generateMarqueeWith:(unint64_t)a3
{
  FACacheImageMarqueeOperation *v4;

  v4 = self;
  sub_20DFD613C((id)a3);

}

- (FACacheImageMarqueeOperation)init
{
  FACacheImageMarqueeOperation *result;

  result = (FACacheImageMarqueeOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
