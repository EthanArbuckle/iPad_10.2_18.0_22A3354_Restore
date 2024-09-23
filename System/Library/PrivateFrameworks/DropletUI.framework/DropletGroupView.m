@implementation DropletGroupView

- (_TtC9DropletUI16DropletGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A82E788();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9DropletUI16DropletGroupView *v10;

  if (a4)
  {
    v6 = sub_23A84C21C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_23A82E888(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  _TtC9DropletUI16DropletGroupView *v2;

  v2 = self;
  sub_23A82BBBC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___mainEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___shadowEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___blurredKeylineEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletGroupView____lazy_storage___keylineEffectView));
  swift_bridgeObjectRelease();
}

@end
