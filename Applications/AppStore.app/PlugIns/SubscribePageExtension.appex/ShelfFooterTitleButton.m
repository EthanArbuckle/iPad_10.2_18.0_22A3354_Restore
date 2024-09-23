@implementation ShelfFooterTitleButton

- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  _TtC22SubscribePageExtension22ShelfFooterTitleButton *v14;
  uint64_t v15;
  uint64_t v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = type metadata accessor for ShelfFooterTitleButton.Style(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1007F3168 != -1)
    swift_once(&qword_1007F3168, sub_10057E714);
  v12 = sub_1000117A8(v9, (uint64_t)qword_100856FF8);
  sub_1004B5F8C(v12, (uint64_t)v11);
  v13 = objc_allocWithZone(ObjectType);
  v14 = (_TtC22SubscribePageExtension22ShelfFooterTitleButton *)sub_10057F47C((uint64_t)v11, x, y, width, height);
  v15 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v15, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x34));
  return v14;
}

- (_TtC22SubscribePageExtension22ShelfFooterTitleButton)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension22ShelfFooterTitleButton *result;

  result = (_TtC22SubscribePageExtension22ShelfFooterTitleButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ShelfFooterTitleButton.swift", 51, 2, 154, 0);
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  _TtC22SubscribePageExtension22ShelfFooterTitleButton *v2;

  v2 = self;
  sub_10057F820();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension22ShelfFooterTitleButton *v2;

  v2 = self;
  sub_100580008();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension22ShelfFooterTitleButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100580268(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  sub_1004B6058((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension22ShelfFooterTitleButton_style);
}

@end
