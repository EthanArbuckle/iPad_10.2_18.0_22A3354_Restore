@implementation KeyTransparencyFooterTextView

- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKit29KeyTransparencyFooterTextView *v5;
  _TtC7ChatKit29KeyTransparencyFooterTextView *v6;
  _TtC7ChatKit29KeyTransparencyFooterTextView *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29KeyTransparencyFooterTextView_status) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29KeyTransparencyFooterTextView_handles) = (Class)MEMORY[0x1E0DEE9D8];
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KeyTransparencyFooterTextView();
  v4 = a3;
  v5 = -[KeyTransparencyFooterTextView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_18E598E90();

  }
  return v6;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  uint64_t ObjCClassFromMetadata;
  id v10;
  id v11;
  id v12;
  _TtC7ChatKit29KeyTransparencyFooterTextView *v13;
  uint64_t v14;

  type metadata accessor for KeyTransparencyFooterTextView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  if (objc_msgSend(v10, sel_isKindOfClass_, ObjCClassFromMetadata))
  {
    sub_18E59955C();
    v14 = sub_18E768F6C();

    v12 = (id)v14;
  }

  return v12;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for KeyTransparencyFooterTextView();
  v2 = v3.receiver;
  -[KeyTransparencyFooterTextView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_sizeToFit, v3.receiver, v3.super_class);

}

- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC7ChatKit29KeyTransparencyFooterTextView *result;

  v4 = a4;
  result = (_TtC7ChatKit29KeyTransparencyFooterTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
