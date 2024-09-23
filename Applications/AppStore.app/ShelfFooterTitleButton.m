@implementation ShelfFooterTitleButton

- (_TtC8AppStore22ShelfFooterTitleButton)initWithFrame:(CGRect)a3
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
  _TtC8AppStore22ShelfFooterTitleButton *v14;
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
  if (qword_100828568 != -1)
    swift_once(&qword_100828568, sub_1003D34A0);
  v12 = sub_10007AF70(v9, (uint64_t)qword_10088E9D0);
  sub_1003D5CB8(v12, (uint64_t)v11);
  v13 = objc_allocWithZone(ObjectType);
  v14 = (_TtC8AppStore22ShelfFooterTitleButton *)sub_1003D4208((uint64_t)v11, x, y, width, height);
  v15 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v15, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x34));
  return v14;
}

- (_TtC8AppStore22ShelfFooterTitleButton)initWithCoder:(id)a3
{
  _TtC8AppStore22ShelfFooterTitleButton *result;

  result = (_TtC8AppStore22ShelfFooterTitleButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ShelfFooterTitleButton.swift", 37, 2, 154, 0);
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  _TtC8AppStore22ShelfFooterTitleButton *v2;

  v2 = self;
  sub_1003D45AC();

}

- (void)layoutSubviews
{
  _TtC8AppStore22ShelfFooterTitleButton *v2;

  v2 = self;
  sub_1003D4D94();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore22ShelfFooterTitleButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1003D4FF4(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  sub_1003D5D40((uint64_t)self + OBJC_IVAR____TtC8AppStore22ShelfFooterTitleButton_style);
}

@end
