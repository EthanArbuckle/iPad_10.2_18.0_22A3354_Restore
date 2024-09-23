@implementation MUBadgeView

- (MUBadgeView)initWithFrame:(CGRect)a3
{
  return (MUBadgeView *)BadgeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUBadgeView)initWithCoder:(id)a3
{
  MUBadgeView *result;

  result = (MUBadgeView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (NSString)badgeString
{
  void *v2;
  MUBadgeView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUBadgeView_label);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_191EEAFC0();

  }
  else
  {

  }
  v6 = (void *)sub_191EEAF9C();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setBadgeString:(id)a3
{
  void *v4;
  MUBadgeView *v5;
  id v6;

  sub_191EEAFC0();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUBadgeView_label);
  v5 = self;
  v6 = (id)sub_191EEAF9C();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v6);

}

- (void).cxx_destruct
{

}

@end
