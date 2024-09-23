@implementation ArcadeFooterCollectionViewCell

- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30ArcadeFooterCollectionViewCell *)sub_100517584(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005193AC();
}

- (void)layoutSubviews
{
  _TtC8AppStore30ArcadeFooterCollectionViewCell *v2;

  v2 = self;
  sub_10051812C();

}

- (void)buttonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore30ArcadeFooterCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->riverView[OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC8AppStore30ArcadeFooterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1005197B4();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8AppStore30ArcadeFooterCollectionViewCell *v11;

  v7 = sub_100008FE4(0, (unint64_t *)&qword_100838EE0, UITouch_ptr);
  v8 = sub_1000E2124();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10051884C(v9, (uint64_t)a4);

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
  _TtC8AppStore30ArcadeFooterCollectionViewCell *v13;
  Class isa;
  objc_super v15;

  v7 = sub_100008FE4(0, (unint64_t *)&qword_100838EE0, UITouch_ptr);
  v8 = sub_1000E2124();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteView);
  *(_BYTE *)(v10 + OBJC_IVAR____TtC8AppStore12FootnoteView_isHighlighted) = 0;
  v11 = qword_100826BD0;
  v12 = a4;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_100826BD0, sub_1000D26AC);
  objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC8AppStore12FootnoteView_textLabel), "setTextColor:", qword_10082CC00);
  isa = Set._bridgeToObjectiveC()().super.isa;
  v15.receiver = v13;
  v15.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell(0);
  -[ArcadeFooterCollectionViewCell touchesEnded:withEvent:](&v15, "touchesEnded:withEvent:", isa, v12);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteActionBlock]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock]);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_metrics, &qword_100830388);
}

@end
