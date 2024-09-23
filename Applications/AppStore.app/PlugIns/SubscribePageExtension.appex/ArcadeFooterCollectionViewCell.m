@implementation ArcadeFooterCollectionViewCell

- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *)sub_10048EBF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100490A18();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *v2;

  v2 = self;
  sub_10048F798();

}

- (void)buttonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->riverView[OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock];
    v5 = self;
    v4 = sub_100019320((uint64_t)v2, v3);
    v2(v4);
    sub_100019310((uint64_t)v2, v3);

  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100490E20();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *v11;

  v7 = sub_100019574(0, (unint64_t *)&qword_100801570, UITouch_ptr);
  v8 = sub_10006C2E0();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10048FEB8(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell *v13;
  Class isa;
  objc_super v15;

  v7 = sub_100019574(0, (unint64_t *)&qword_100801570, UITouch_ptr);
  v8 = sub_10006C2E0();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteView);
  *(_BYTE *)(v10 + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_isHighlighted) = 0;
  v11 = qword_1007F1298;
  v12 = a4;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_1007F1298, sub_100123404);
  objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel), "setTextColor:", qword_1007FBC78);
  isa = Set._bridgeToObjectiveC()().super.isa;
  v15.receiver = v13;
  v15.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell(0);
  -[ArcadeFooterCollectionViewCell touchesEnded:withEvent:](&v15, "touchesEnded:withEvent:", isa, v12);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock]);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock]);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30ArcadeFooterCollectionViewCell_metrics, &qword_100812108);
}

@end
