@implementation URLProtocolDelegate

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  uint64_t ObjectType;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC19AppStoreKitInternal19URLProtocolDelegate *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD v22[6];

  ObjectType = swift_getObjectType();
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = URLProtocolDelegate.presentDialog(for:)(v16);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v16;
  v19[3] = sub_1D862F880;
  v19[4] = v13;
  v19[5] = ObjectType;
  v22[4] = sub_1D874C09C;
  v22[5] = v19;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 1107296256;
  v22[2] = sub_1D85EA660;
  v22[3] = &block_descriptor_39_0;
  v20 = _Block_copy(v22);
  v21 = v16;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addFinishBlock_, v20);
  _Block_release(v20);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  uint64_t ObjectType;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC19AppStoreKitInternal19URLProtocolDelegate *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD v22[6];

  ObjectType = swift_getObjectType();
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = URLProtocolDelegate.performAuthentication(for:)(v16);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v16;
  v19[3] = sub_1D862FB48;
  v19[4] = v13;
  v19[5] = ObjectType;
  v22[4] = sub_1D874C098;
  v22[5] = v19;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 1107296256;
  v22[2] = sub_1D85EA660;
  v22[3] = &block_descriptor_29_0;
  v20 = _Block_copy(v22);
  v21 = v16;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addFinishBlock_, v20);
  _Block_release(v20);

  swift_release();
}

- (_TtC19AppStoreKitInternal19URLProtocolDelegate)init
{
  _TtC19AppStoreKitInternal19URLProtocolDelegate *result;

  result = (_TtC19AppStoreKitInternal19URLProtocolDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D83FC12C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal19URLProtocolDelegate_dialogStyle));
}

@end
