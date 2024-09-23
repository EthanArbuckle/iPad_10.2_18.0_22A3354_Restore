@implementation GameCenterReengagementCollectionViewCell

- (_TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell *)sub_100225FC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100227B10();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell *v2;

  v2 = self;
  sub_100226BF8();

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell *v7;
  uint64_t v8;
  Class isa;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_100227748(x, y, width, height);

  sub_10000DF3C(&qword_1008022D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_badgeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_badge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_heroContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_lockup));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_visualEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_backgroundImage));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterReengagementCollectionViewCell_customBackgroundBlur));
}

@end
