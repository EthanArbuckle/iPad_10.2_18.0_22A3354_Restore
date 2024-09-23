@implementation ListTodayCardCollectionViewCell

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
  v6 = &v4[OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith];
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith]);
  if (Strong)
  {
    v8 = Strong;
    sub_1002D9B8C(Strong);

    swift_unknownObjectWeakAssign(v6, 0);
  }

}

- (_TtC8AppStore31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ListTodayCardCollectionViewCell *)sub_10003226C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8AppStore31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100016650();

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
  _TtC8AppStore31ListTodayCardCollectionViewCell *v4;

  v4 = self;
  sub_1002D6A9C(a3, (uint64_t)v4);

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
  _TtC8AppStore31ListTodayCardCollectionViewCell *v10;
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
  sub_1002DAEA0((uint64_t)v9, 3, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)prepareForReuse
{
  _TtC8AppStore31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1002D74CC();

}

- (void)applyContentSizeCategoryUpdates
{
  _TtC8AppStore31ListTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100027C4C();

}

- (NSArray)accessibilityElements
{
  _TtC8AppStore31ListTodayCardCollectionViewCell *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1002DA870();

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
  _TtC8AppStore31ListTodayCardCollectionViewCell *v7;
  double v8;
  _TtC8AppStore31ListTodayCardCollectionViewCell *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, (char *)&type metadata for Any + 8);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v8 = swift_bridgeObjectRelease(v6).n128_u64[0];
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[ListTodayCardCollectionViewCell setAccessibilityElements:](&v10, "setAccessibilityElements:", isa, v8);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_todayCard));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_lockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_topLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_trailingLockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_riverContainerView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_cardStyle, &qword_10082FB08);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore31ListTodayCardCollectionViewCell_otherCardToExchangeRiverWith);
}

@end
