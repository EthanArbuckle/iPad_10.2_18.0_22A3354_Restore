@implementation MFNotAuthenticatedBannerViewController

+ (id)viewControllerWithSender:(id)a3 dismissAction:(id)a4
{
  id v4;
  void *v7;
  uint64_t v8;
  void *v10;

  swift_getObjCClassMetadata();
  v4 = a3;
  v7 = _Block_copy(a4);
  v8 = sub_1D56F1248();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  swift_getObjCClassMetadata();
  v10 = (void *)sub_1D56ECA24(v8);
  swift_release();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC12MobileMailUI38MFNotAuthenticatedBannerViewController)init
{
  return (_TtC12MobileMailUI38MFNotAuthenticatedBannerViewController *)sub_1D56ECB9C();
}

@end
