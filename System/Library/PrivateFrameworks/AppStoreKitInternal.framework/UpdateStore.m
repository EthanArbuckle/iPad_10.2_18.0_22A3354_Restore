@implementation UpdateStore

- (_TtC19AppStoreKitInternal11UpdateStore)init
{
  return (_TtC19AppStoreKitInternal11UpdateStore *)UpdateStore.init()();
}

- (void)dealloc
{
  void *v3;
  _TtC19AppStoreKitInternal11UpdateStore *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UpdateStore();
  -[ASDSoftwareUpdatesStore dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal11UpdateStore_notificationQueue));
  swift_weakDestroy();
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC19AppStoreKitInternal11UpdateStore *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1D855FC64;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1D855EF4C((uint64_t)v7, v6);
  sub_1D83634B4((uint64_t)v7);

}

- (void)broadcastChangeNotificationIfNotCoalescing
{
  _TtC19AppStoreKitInternal11UpdateStore *v2;

  v2 = self;
  sub_1D855F760();

}

@end
