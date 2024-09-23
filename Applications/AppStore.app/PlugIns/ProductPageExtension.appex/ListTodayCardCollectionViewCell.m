@implementation ListTodayCardCollectionViewCell

- (_TtC20ProductPageExtension31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31ListTodayCardCollectionViewCell *)sub_10046EE20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isDragging
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ListTodayCardCollectionViewCell isDragging](&v3, "isDragging");
}

- (void)setDragging:(BOOL)a3
{
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v4;

  v4 = self;
  sub_10046FEE0(a3);

}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[ListTodayCardCollectionViewCell _continuousCornerRadius](&v3, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v10;
  double v11;
  double v12;
  objc_super v13;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = type metadata accessor for CornerStyle(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = self;
  -[ListTodayCardCollectionViewCell _setContinuousCornerRadius:](&v14, "_setContinuousCornerRadius:", a3);
  v13.receiver = v10;
  v13.super_class = ObjectType;
  -[ListTodayCardCollectionViewCell _continuousCornerRadius](&v13, "_continuousCornerRadius");
  v12 = v11;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for CornerStyle.continuous(_:), v6);
  sub_100475A14((uint64_t)v9, 3, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1004702F0();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_10047139C();

}

- (void)applyContentSizeCategoryUpdates
{
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_10046F5E4();

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
  -[ListTodayCardCollectionViewCell willMoveToWindow:](&v8, "willMoveToWindow:", v5);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith]);
  if (Strong)
  {
    v7 = Strong;
    sub_100474228(Strong);

    swift_unknownObjectWeakAssign();
  }

}

- (NSArray)accessibilityElements
{
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100474FA4();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v7;
  _TtC20ProductPageExtension31ListTodayCardCollectionViewCell *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, (char *)&type metadata for Any + 8);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  -[ListTodayCardCollectionViewCell setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_lockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_topLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_trailingLockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverContainerView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_cardStyle, &qword_10081A3C8);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith);
}

@end
