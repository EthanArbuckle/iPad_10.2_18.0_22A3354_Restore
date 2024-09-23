@implementation JSAdsObject

- (void)setTimeoutForCurrentOnDeviceAdFetch:(id)a3 :(double)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC19AppStoreKitInternal11JSAdsObject *v9;

  v6 = sub_1D892ADB4();
  v8 = v7;
  v9 = self;
  sub_1D834EA30(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (id)fetchOnDeviceAdPlacement:(id)a3 :(double)a4 :(id)a5 :(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _TtC19AppStoreKitInternal11JSAdsObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;

  v23 = sub_1D8928210();
  v10 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1D892ADB4();
  v14 = v13;
  if (a5)
    a5 = (id)sub_1D892AC88();
  if (a6)
  {
    v15 = sub_1D892ADB4();
    a6 = v16;
  }
  else
  {
    v15 = 0;
  }
  sub_1D8929F14();
  v17 = self;
  sub_1D8929F08();
  sub_1D89281F8();
  sub_1D892B5F4();
  v18 = (void *)sub_1D8929F08();
  sub_1D89281EC();

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v19 = (void *)sub_1D892B870();
  MEMORY[0x1E0C80A78](v19);
  *(&v22 - 12) = v22;
  *(&v22 - 11) = v14;
  *((double *)&v22 - 10) = a4;
  *(&v22 - 9) = (uint64_t)v17;
  *(&v22 - 8) = (uint64_t)a5;
  *(&v22 - 7) = v15;
  *(&v22 - 6) = (uint64_t)a6;
  *(&v22 - 5) = (uint64_t)"JSAdsObject.fetchOnDeviceAdPlacement";
  *(&v22 - 4) = 36;
  *((_BYTE *)&v22 - 24) = 2;
  *(&v22 - 2) = (uint64_t)v12;
  v20 = (void *)sub_1D892B87C();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

- (id)fetchAppBinaryTraitsOverride
{
  _TtC19AppStoreKitInternal11JSAdsObject *v3;
  void *v4;
  void *v5;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

  return v5;
}

- (id)processAdvertsForSponsoredSearch:(id)a3 :(id)a4 :(id)a5 :(double)a6 :(BOOL)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC19AppStoreKitInternal11JSAdsObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _BOOL4 v25;
  _TtC19AppStoreKitInternal11JSAdsObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  double v32;
  const char *v33;
  uint64_t v34;
  char v35;
  char *v36;

  v25 = a7;
  v11 = sub_1D8928210();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1D892ADB4();
  v16 = v15;
  sub_1D8929F14();
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1D8929F08();
  sub_1D89281F8();
  sub_1D892B5F4();
  v20 = (void *)sub_1D8929F08();
  sub_1D89281EC();

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v21 = (void *)sub_1D892B870();
  v26 = v19;
  v27 = v17;
  v28 = v18;
  v29 = v24;
  v30 = v16;
  v31 = v25;
  v32 = a6;
  v33 = "JSAdsObject.processAdvertsForSponsoredSearch";
  v34 = 44;
  v35 = 2;
  v36 = v14;
  v22 = (void *)sub_1D892B87C();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  return v22;
}

- (id)isNativeAdLoggingEnabled
{
  _TtC19AppStoreKitInternal11JSAdsObject *v3;
  void *v4;
  void *v5;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

  return v5;
}

- (void)debugLog:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC19AppStoreKitInternal11JSAdsObject *v7;

  v4 = sub_1D892ADB4();
  v6 = v5;
  v7 = self;
  sub_1D8457B34(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal11JSAdsObject)init
{
  _TtC19AppStoreKitInternal11JSAdsObject *result;

  result = (_TtC19AppStoreKitInternal11JSAdsObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
