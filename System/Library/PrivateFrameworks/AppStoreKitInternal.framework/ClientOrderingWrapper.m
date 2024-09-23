@implementation ClientOrderingWrapper

- (void)visibilityForIAPs:(id)a3 :(id)a4
{
  uint64_t v6;
  id v7;
  _TtC19AppStoreKitInternal21ClientOrderingWrapper *v8;

  v6 = sub_1D892AC88();
  v7 = a4;
  v8 = self;
  sub_1D88640D4(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _TtC19AppStoreKitInternal21ClientOrderingWrapper *v18;

  v10 = (uint64_t)a4;
  if (a3)
  {
    v12 = sub_1D892ADB4();
    v14 = v13;
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
  if (a4)
LABEL_3:
    v10 = sub_1D892B060();
LABEL_4:
  if (a5)
    a5 = (id)sub_1D892B060();
  if (a6)
  {
    v15 = sub_1D892ADB4();
    a6 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = a7;
  v18 = self;
  sub_1D886443C(v12, v14, v10, (uint64_t)a5, v15, (uint64_t)a6, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal21ClientOrderingWrapper)init
{
  _TtC19AppStoreKitInternal21ClientOrderingWrapper *result;

  result = (_TtC19AppStoreKitInternal21ClientOrderingWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
