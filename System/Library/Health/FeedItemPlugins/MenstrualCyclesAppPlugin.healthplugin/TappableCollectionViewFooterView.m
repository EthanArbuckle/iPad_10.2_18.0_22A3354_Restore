@implementation TappableCollectionViewFooterView

- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  v9 = objc_allocWithZone(MEMORY[0x24BEBDA88]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText);
  *v11 = 0;
  v11[1] = 0;
  v12 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_tapCompletion);
  *v12 = nullsub_1;
  v12[1] = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for TappableCollectionViewFooterView();
  v13 = -[TappableCollectionViewFooterView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_231C78D48();

  return v13;
}

- (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBDA88]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_highlightedText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_tapCompletion);
  *v9 = nullsub_1;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length;
  void *location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView *v15;
  uint64_t v17;

  length = a5.length;
  location = (void *)a5.location;
  v10 = sub_231C9CF4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9CF28();
  v14 = a3;
  v15 = self;
  LOBYTE(length) = sub_231C79694((uint64_t)v13, location, length);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32TappableCollectionViewFooterView_footerTextView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
