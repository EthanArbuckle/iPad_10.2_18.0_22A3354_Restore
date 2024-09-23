@implementation InteractiveBackgroundContentView

- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView *)sub_1001D43B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView_artworkView;
  v6 = type metadata accessor for ArtworkView(0);
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InteractiveSectionBackgroundView.swift", 59, 2, 182, 0);
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  return -[InteractiveBackgroundContentView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v4 = a3;
  v5 = v6.receiver;
  -[InteractiveBackgroundContentView setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  ArtworkView.backgroundColor.setter(objc_msgSend(v5, "backgroundColor", v6.receiver, v6.super_class));

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v2 = v3.receiver;
  -[InteractiveBackgroundContentView layoutSubviews](&v3, "layoutSubviews");
  ArtworkView.frame.setter(objc_msgSend(v2, "bounds", v3.receiver, v3.super_class));

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_77054DFF2A0EE1186124695D301FA42432InteractiveBackgroundContentView_artworkView));
}

@end
