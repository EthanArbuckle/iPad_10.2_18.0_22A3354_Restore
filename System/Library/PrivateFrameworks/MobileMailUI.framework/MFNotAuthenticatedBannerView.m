@implementation MFNotAuthenticatedBannerView

- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithSender:(id)a3 dismissAction:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *v13;

  v4 = a3;
  v9 = _Block_copy(a4);
  v11 = sub_1D56F1248();
  v10 = v5;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v9;
  v13 = (_TtC12MobileMailUI28MFNotAuthenticatedBannerView *)MFNotAuthenticatedBannerView.init(sender:dismissAction:)(v11, v10, (uint64_t)sub_1D56ECC5C, v6);

  return v13;
}

- (void)createPrimaryViews
{
  _TtC12MobileMailUI28MFNotAuthenticatedBannerView *v2;

  v2 = self;
  sub_1D56ED274();

}

- (_TtC12MobileMailUI28MFNotAuthenticatedBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileMailUI28MFNotAuthenticatedBannerView *)MFNotAuthenticatedBannerView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileMailUI28MFNotAuthenticatedBannerView_hostingViewController));
}

@end
