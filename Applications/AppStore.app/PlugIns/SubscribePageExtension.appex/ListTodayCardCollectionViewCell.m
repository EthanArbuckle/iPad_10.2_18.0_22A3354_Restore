@implementation ListTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *)sub_100113580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isDragging
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[ListTodayCardCollectionViewCell isDragging](&v3, "isDragging");
}

- (void)setDragging:(BOOL)a3
{
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v4;

  v4 = self;
  sub_100114640(a3, (uint64_t)v4);

}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
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
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v10;
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
  sub_10011A120((uint64_t)v9, 3, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100114A50();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100115AFC();

}

- (void)applyContentSizeCategoryUpdates
{
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100113D44();

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
  -[ListTodayCardCollectionViewCell willMoveToWindow:](&v9, "willMoveToWindow:", v5);
  v6 = &v4[OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith];
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith]);
  if (Strong)
  {
    v8 = Strong;
    sub_100118988(Strong);

    swift_unknownObjectWeakAssign(v6, 0);
  }

}

- (NSArray)accessibilityElements
{
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100119704();

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
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v7;
  _TtC22SubscribePageExtension31ListTodayCardCollectionViewCell *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_todayCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_lockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_topLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_trailingLockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_riverBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_riverContainerView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_cardStyle, &qword_1007F5808);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith);
}

@end
