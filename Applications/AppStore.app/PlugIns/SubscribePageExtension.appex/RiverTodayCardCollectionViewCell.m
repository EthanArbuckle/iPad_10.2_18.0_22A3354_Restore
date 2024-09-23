@implementation RiverTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell *)sub_100080468(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  id *v3;
  id v4;
  _BYTE v5[24];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[BaseTodayCardCollectionViewCell layoutSubviews](&v6, "layoutSubviews");
  sub_100080C50();
  sub_100080E0C();
  v3 = (id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_gradientView];
  swift_beginAccess(&v2[OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_gradientView], v5, 0, 0);
  v4 = *v3;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1000820E8();

}

- (void)willMoveToWindow:(id)a3
{
  char *v4;
  id v5;
  char *v6;
  char *Strong;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[RiverTodayCardCollectionViewCell willMoveToWindow:](&v9, "willMoveToWindow:", v5);
  v6 = &v4[OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_otherCardToExchangeRiverWith];
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_otherCardToExchangeRiverWith]);
  if (Strong)
  {
    v8 = Strong;
    sub_100081664(Strong);

    swift_unknownObjectWeakAssign(v6, 0);
  }

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverDataSource));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverStyling;
  v4 = type metadata accessor for RiverViewStyling(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_labelsView));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_otherCardToExchangeRiverWith);
}

@end
