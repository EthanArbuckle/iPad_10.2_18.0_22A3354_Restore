@implementation FAImageMarqueeViewWrapperImpl

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithFamilyCircle:(id)a3
{
  id v4;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *v5;
  id v6;
  uint64_t v7;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *v8;
  objc_super v10;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle) = (Class)a3;
  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_members);
  sub_20DE9432C(0, (unint64_t *)&qword_253D2DF18);
  v7 = sub_20E07D73C();

  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_membersToRender) = (Class)v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for FAImageMarqueeViewWrapperImpl();
  v8 = -[FAImageMarqueeViewWrapperImpl init](&v10, sel_init);

  return v8;
}

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)initWithMembersToRender:(id)a3 familyCircle:(id)a4
{
  objc_class *v6;
  id v7;
  objc_super v9;

  sub_20DE9432C(0, (unint64_t *)&qword_253D2DF18);
  v6 = (objc_class *)sub_20E07D73C();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_membersToRender) = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FAImageMarqueeViewWrapperImpl();
  v7 = a4;
  return -[FAImageMarqueeViewWrapperImpl init](&v9, sel_init);
}

- (UIViewController)viewController
{
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *v2;
  id v3;

  v2 = self;
  v3 = sub_20DFE0A98();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController) = (Class)a3;
  v3 = a3;

}

- (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl)init
{
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *result;

  result = (_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl_familyCircle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl____lazy_storage___viewController));
}

@end
