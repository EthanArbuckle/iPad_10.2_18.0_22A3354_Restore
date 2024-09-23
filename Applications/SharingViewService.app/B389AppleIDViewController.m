@implementation B389AppleIDViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService25B389AppleIDViewController *v4;

  v4 = self;
  sub_10004EC34(a3);

}

- (void)openSettingsPressed
{
  _TtC18SharingViewService25B389AppleIDViewController *v2;

  v2 = self;
  sub_10004F5B4();

}

- (void)dismissPressed
{
  uint64_t v2;
  _TtC18SharingViewService25B389AppleIDViewController *v3;

  v3 = self;
  sub_10004F7B0((uint64_t)v3, v2);

}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithMainController:(id)a3
{
  id v3;
  _TtC18SharingViewService25B389AppleIDViewController *v4;

  v3 = a3;
  v4 = (_TtC18SharingViewService25B389AppleIDViewController *)sub_10005B2A8((uint64_t)v3);

  return v4;
}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService25B389AppleIDViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10004F820);
}

- (_TtC18SharingViewService25B389AppleIDViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService25B389AppleIDViewController *)sub_10004F9B8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_imageName));
  sub_10000D858((uint64_t)self + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_onDoneURL, &qword_1001A3618);
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_body));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_buttonText));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_titleText));
  swift_bridgeObjectRelease(*(NSLayoutConstraint **)((char *)&self->super._bottomMarginConstraint
                                                   + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_bodyText));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_btn));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_titleLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_msgLbl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService25B389AppleIDViewController_lockImageView));
}

@end
