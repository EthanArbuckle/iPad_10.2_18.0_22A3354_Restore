@implementation SUUIStopPageViewController.StopPageLockup

- (_TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_241EC9718();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_241EC5484(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *v2;

  v2 = self;
  sub_241EC577C();

}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  if (a4)
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView), sel_setImage_, a4);
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  _TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *v5;

  v4 = a3;
  v5 = self;
  sub_241EC9940();

}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  _TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_241EC9C74(v7);

}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (_TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup)initWithFrame:(CGRect)a3
{
  _TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *result;

  result = (_TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_lockupRequest));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoaderOperationQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoader));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_clientContext));
}

@end
