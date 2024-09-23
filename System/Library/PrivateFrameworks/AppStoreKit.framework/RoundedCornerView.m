@implementation RoundedCornerView

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedCornerView();
  v4 = v8.receiver;
  v5 = a3;
  -[RoundedCornerView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_traitCollection, v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, sel_userInterfaceStyle);

  if (!v5 || v7 != objc_msgSend(v5, sel_userInterfaceStyle))
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0xE8))();

}

- (_TtC11AppStoreKit17RoundedCornerView)initWithFrame:(CGRect)a3
{
  return (_TtC11AppStoreKit17RoundedCornerView *)RoundedCornerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  id *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedCornerView();
  v2 = (char *)v5.receiver;
  -[RoundedCornerView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = (id *)&v2[OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderView];
  swift_beginAccess();
  if (*v3)
  {
    v4 = (char *)*v3;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (_TtC11AppStoreKit17RoundedCornerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11AppStoreKit17RoundedCornerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit17RoundedCornerView_borderColor));
}

@end
