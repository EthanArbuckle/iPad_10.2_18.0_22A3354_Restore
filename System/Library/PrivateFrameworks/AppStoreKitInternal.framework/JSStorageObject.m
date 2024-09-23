@implementation JSStorageObject

- (_TtC19AppStoreKitInternal15JSStorageObject)init
{
  return (_TtC19AppStoreKitInternal15JSStorageObject *)sub_1D8350154();
}

- (void)storeString:(id)a3 :(id)a4
{
  id v6;
  id v7;
  _TtC19AppStoreKitInternal15JSStorageObject *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D88D48A0();

}

- (id)retrieveString:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal15JSStorageObject *v6;
  void *v7;
  void *v8;

  sub_1D8501868();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (void).cxx_destruct
{
  sub_1D8337264((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal15JSStorageObject_path);
  swift_bridgeObjectRelease();
}

@end
