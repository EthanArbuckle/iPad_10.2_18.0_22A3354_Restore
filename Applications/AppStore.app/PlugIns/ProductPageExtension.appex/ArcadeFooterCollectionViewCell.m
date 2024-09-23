@implementation ArcadeFooterCollectionViewCell

- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *)sub_1002EB84C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1002ED674(v4);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *v2;

  v2 = self;
  sub_1002EC3F4();

}

- (void)buttonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->riverView[OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4;
  _TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002EDA7C();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *v11;

  v7 = sub_100018B6C(0, (unint64_t *)&qword_1008285A0, UITouch_ptr);
  v8 = sub_100225F48();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_1002ECB14(v9, (uint64_t)a4);

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
  _TtC20ProductPageExtension30ArcadeFooterCollectionViewCell *v13;
  Class isa;
  objc_super v15;

  v7 = sub_100018B6C(0, (unint64_t *)&qword_1008285A0, UITouch_ptr);
  v8 = sub_100225F48();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteView);
  *(_BYTE *)(v10 + OBJC_IVAR____TtC20ProductPageExtension12FootnoteView_isHighlighted) = 0;
  v11 = qword_1008049E0;
  v12 = a4;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_1008049E0, sub_1000FF1D8);
  objc_msgSend(*(id *)(v10 + OBJC_IVAR____TtC20ProductPageExtension12FootnoteView_textLabel), "setTextColor:", qword_10080F4B8);
  isa = Set._bridgeToObjectiveC()().super.isa;
  v15.receiver = v13;
  v15.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell(0);
  -[ArcadeFooterCollectionViewCell touchesEnded:withEvent:](&v15, "touchesEnded:withEvent:", isa, v12);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_footnoteActionBlock]);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock), *(_QWORD *)&self->riverView[OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_buttonActionBlock]);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30ArcadeFooterCollectionViewCell_metrics, (uint64_t *)&unk_10081B418);
}

@end
