@implementation VideoMessagingFileTransferer

- (_TtC20FaceTimeMessageStore28VideoMessagingFileTransferer)init
{
  sub_23B35CFE4();
}

- (void).cxx_destruct
{
  sub_23B31269C((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_incomingDelegate);
  sub_23B31269C((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_outgoingDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_service);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_serverBag);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore28VideoMessagingFileTransferer_transactionLock));
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _TtC20FaceTimeMessageStore28VideoMessagingFileTransferer *v25;
  uint64_t v26;
  uint64_t v27;

  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542F19F0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_23B3D4B68();
    v18 = sub_23B3D4BB0();
    v19 = 0;
  }
  else
  {
    v18 = sub_23B3D4BB0();
    v19 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v19, 1, v18);
  if (a6)
    a6 = (id)sub_23B3D51B0();
  if (a7)
  {
    v20 = sub_23B3D5258();
    a7 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a3;
  v23 = a4;
  v24 = a8;
  v25 = self;
  sub_23B35D0D4((uint64_t)v25, v26, (uint64_t)v17, (uint64_t)a6, v20, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B305768((uint64_t)v17, (uint64_t *)&unk_2542F19F0);
}

- (void)service:(id)a3 account:(id)a4 pendingResourceWithMetadata:(id)a5 fromID:(id)a6 acknowledgementBlock:(id)a7 context:(id)a8
{
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _TtC20FaceTimeMessageStore28VideoMessagingFileTransferer *v21;
  uint64_t v22;

  v14 = _Block_copy(a7);
  if (a5)
    a5 = (id)sub_23B3D51B0();
  if (!a6)
  {
    v15 = 0;
    if (v14)
      goto LABEL_5;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v15 = sub_23B3D5258();
  a6 = v16;
  if (!v14)
    goto LABEL_7;
LABEL_5:
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  v14 = sub_23B35FB40;
LABEL_8:
  v18 = a3;
  v19 = a4;
  v20 = a8;
  v21 = self;
  sub_23B35E47C((uint64_t)v21, v22, (uint64_t)a5, v15, (unint64_t)a6, (uint64_t)v14, v17, a8);
  sub_23B338524((uint64_t)v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _TtC20FaceTimeMessageStore28VideoMessagingFileTransferer *v21;
  uint64_t v22;

  v10 = a6;
  if (a5)
  {
    v14 = sub_23B3D5258();
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = self;
  sub_23B35ED8C((uint64_t)v21, v22, v14, v16, v10, a7);

  swift_bridgeObjectRelease();
}

@end
