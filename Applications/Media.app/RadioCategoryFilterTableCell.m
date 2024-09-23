@implementation RadioCategoryFilterTableCell

- (void)controlChangedWithSender:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC5Media28RadioCategoryFilterTableCell *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->segmentedControl[OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler];
    v6 = a3;
    v7 = self;
    sub_100030550((uint64_t)v3, v5);
    v3(objc_msgSend(v6, "selectedSegmentIndex"));
    sub_100010074((uint64_t)v3, v5);

  }
}

- (_TtC5Media28RadioCategoryFilterTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  NSString v9;
  _QWORD *v10;
  _TtC5Media28RadioCategoryFilterTableCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
    *v8 = 0;
    v8[1] = 0;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
    *v10 = 0;
    v10[1] = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RadioCategoryFilterTableCell();
  v11 = -[RadioCategoryFilterTableCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC5Media28RadioCategoryFilterTableCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler);
  v6 = (objc_class *)type metadata accessor for RadioCategoryFilterTableCell();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[RadioCategoryFilterTableCell initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_segmentedControl));
  sub_100010074(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler), *(_QWORD *)&self->segmentedControl[OBJC_IVAR____TtC5Media28RadioCategoryFilterTableCell_handler]);
}

@end
