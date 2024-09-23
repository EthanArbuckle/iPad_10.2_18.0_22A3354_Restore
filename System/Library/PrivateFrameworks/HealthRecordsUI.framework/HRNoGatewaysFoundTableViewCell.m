@implementation HRNoGatewaysFoundTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRNoGatewaysFoundTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (HRNoGatewaysFoundTableViewCell *)sub_1BC41F748(a3, (uint64_t)a4, v6);
}

- (HRNoGatewaysFoundTableViewCell)initWithCoder:(id)a3
{
  HRNoGatewaysFoundTableViewCell *result;

  result = (HRNoGatewaysFoundTableViewCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

@end
