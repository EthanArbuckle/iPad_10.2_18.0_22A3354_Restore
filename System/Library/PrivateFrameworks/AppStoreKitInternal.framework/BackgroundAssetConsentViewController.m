@implementation BackgroundAssetConsentViewController

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundAssetConsentViewController();
  return -[SKBackgroundAssetConsentViewController init](&v3, sel_init);
}

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_1D892ADB4();
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController *)sub_1D8588830(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_1D892ADB4();
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = sub_1D892ADB4();
  v16 = v15;
  return (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController *)sub_1D8588830(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC19AppStoreKitInternal36BackgroundAssetConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _TtC19AppStoreKitInternal36BackgroundAssetConsentViewController *v14;
  objc_super v16;

  sub_1D892ADB4();
  if (a4)
  {
    sub_1D892ADB4();
    a4 = v10;
  }
  v11 = a5;
  v12 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BackgroundAssetConsentViewController();
  v14 = -[BackgroundAssetConsentViewController initWithTitle:detailText:icon:contentLayout:](&v16, sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, v11, a6);

  return v14;
}

@end
