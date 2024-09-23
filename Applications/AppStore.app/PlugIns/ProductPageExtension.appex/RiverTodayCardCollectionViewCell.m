@implementation RiverTodayCardCollectionViewCell

- (_TtC20ProductPageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32RiverTodayCardCollectionViewCell *)sub_10057B274(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  sub_10057BA48();
  sub_10057BC04();
  v3 = (id *)&v2[OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_gradientView];
  swift_beginAccess(&v2[OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_gradientView], v5, 0, 0);
  v4 = *v3;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension32RiverTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_10057CEE0();

}

- (void)willMoveToWindow:(id)a3
{
  char *v4;
  id v5;
  char *Strong;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  v5 = a3;
  -[RiverTodayCardCollectionViewCell willMoveToWindow:](&v8, "willMoveToWindow:", v5);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_otherCardToExchangeRiverWith]);
  if (Strong)
  {
    v7 = Strong;
    sub_10057C45C(Strong);

    swift_unknownObjectWeakAssign();
  }

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverDataSource));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverStyling;
  v4 = type metadata accessor for RiverViewStyling(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_labelsView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_otherCardToExchangeRiverWith);
}

@end
