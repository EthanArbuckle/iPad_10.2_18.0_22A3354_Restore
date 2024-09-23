@implementation AppStoreAssetManager

+ (void)fetchAssetNameForAppBundleId:(id)a3 completion:(id)a4
{
  sub_21CD34608((int)a1, (int)a2, (int)a3, a4, (uint64_t)&unk_24E0C96D0, (uint64_t)sub_21CD35D98, _s28HealthExposureNotificationUI20AppStoreAssetManagerC05fetchg7NameForE8BundleId_10completionySS_ySSSg_So7NSErrorCSgtctFZ_0);
}

+ (void)fetchAssetForAppBundleId:(id)a3 completion:(id)a4
{
  sub_21CD34608((int)a1, (int)a2, (int)a3, a4, (uint64_t)&unk_24E0C96A8, (uint64_t)sub_21CD35D84, _s28HealthExposureNotificationUI20AppStoreAssetManagerC05fetchg3ForE8BundleId_10completionySS_ySo7UIImageCSg_So7NSErrorCSgtctFZ_0);
}

+ (void)accessAppFor:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t ObjCClassMetadata;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  v9 = a3;
  v10 = a4;
  sub_21CD35958((uint64_t)v9, v10, ObjCClassMetadata, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

}

+ (void)presentAppStoreProductPage:(id)a3 from:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_21CD35BC4(v5, v6);

}

+ (void)openAppStoreFromViewController:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  v6 = objc_msgSend(v4, sel_defaultWorkspace);
  if (v6)
  {
    v7 = v6;
    v8 = (id)sub_21CD7658C();
    objc_msgSend(v7, sel_openApplicationWithBundleID_, v8);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC28HealthExposureNotificationUI20AppStoreAssetManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppStoreAssetManager();
  return -[AppStoreAssetManager init](&v3, sel_init);
}

@end
