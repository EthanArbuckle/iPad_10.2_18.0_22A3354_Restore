@implementation CommerceDialogHandler

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  sub_1D862EE7C(self, (int)a2, a3, a4, (uint64_t)&unk_1E9DE91C8, (uint64_t)sub_1D862F898, (void (*)(id, uint64_t, uint64_t))CommerceDialogHandler.handle(_:resultHandler:));
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  sub_1D862EE7C(self, (int)a2, a3, a4, (uint64_t)&unk_1E9DE91A0, (uint64_t)sub_1D862F898, (void (*)(id, uint64_t, uint64_t))CommerceDialogHandler.handle(_:resultHandler:));
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC19AppStoreKitInternal21CommerceDialogHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1D862F36C(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  sub_1D862EE7C(self, (int)a2, a3, a4, (uint64_t)&unk_1E9DE9128, (uint64_t)sub_1D862FB48, (void (*)(id, uint64_t, uint64_t))CommerceDialogHandler.handle(_:resultHandler:));
}

- (_TtC19AppStoreKitInternal21CommerceDialogHandler)init
{
  _TtC19AppStoreKitInternal21CommerceDialogHandler *result;

  result = (_TtC19AppStoreKitInternal21CommerceDialogHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal21CommerceDialogHandler_bag, (uint64_t *)&unk_1EDA454D8);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
