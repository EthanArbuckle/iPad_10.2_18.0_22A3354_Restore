@implementation NearbySharingInteractionCoordinator

- (void)dealloc
{
  uint64_t v3;
  _TtC9AirDropUI35NearbySharingInteractionCoordinator *v4;
  id v5;
  objc_super v6;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_updateNearbySharingInteractionsTask);
  v4 = self;
  if (v3)
  {
    swift_retain(v3);
    Task.cancel()();
    swift_release(v3);
  }
  v5 = sub_10007F400();
  objc_msgSend(v5, "stopListening");

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NearbySharingInteractionCoordinator(0);
  -[NearbySharingInteractionCoordinator dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_airDropClient));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_contactDetailsProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_contentResolver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_conversationManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_failureActivity));
  v3 = (char *)self
     + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator__nearbySharingInteractionViewModelsByID;
  v4 = sub_100008F88((uint64_t *)&unk_10013F280);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_TtC9AirDropUI33AirDropTransferSessionsController **)((char *)&self->super.isa+ OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_nearbySharingInteractionActivitiesByID), v5, v6, v7, v8, v9, v10, v11);
  swift_bridgeObjectRelease(*(_TtC9AirDropUI33AirDropTransferSessionsController **)((char *)&self->super.isa+ OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_nearbySharingInteractionRemoteAlertPresentationsByID), v12, v13, v14, v15, v16, v17, v18);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_updateNearbySharingInteractionsTask));
  swift_bridgeObjectRelease(*(_TtC9AirDropUI33AirDropTransferSessionsController **)((char *)&self->super.isa+ OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_subscriptionsByID), v19, v20, v21, v22, v23, v24, v25);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator____lazy_storage___collaborationMessageListener));
}

- (_TtC9AirDropUI35NearbySharingInteractionCoordinator)init
{
  _TtC9AirDropUI35NearbySharingInteractionCoordinator *result;

  result = (_TtC9AirDropUI35NearbySharingInteractionCoordinator *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.NearbySharingInteractionCoordinator", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)collaborationMessageListener:(id)a3 receivedMessage:(id)a4 inChat:(id)a5 style:(unsigned __int8)a6 accountID:(id)a7
{
  id v9;
  id v10;
  _TtC9AirDropUI35NearbySharingInteractionCoordinator *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100090FA8(v10);

}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4;
  _TtC9AirDropUI35NearbySharingInteractionCoordinator *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9AirDropUI35NearbySharingInteractionCoordinator *v10;
  _TtC9AirDropUI33AirDropTransferSessionsController *v11;
  _TtC9AirDropUI33AirDropTransferSessionsController *v12;
  SEL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "activeConversations");
  v7 = sub_100018D44(0, &qword_10013F088, TUConversation_ptr);
  v8 = sub_1000873C0((unint64_t *)&unk_10013F090, &qword_10013F088, TUConversation_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v6, v7, v8);

  v10 = v5;
  sub_10008F3B8(v9);
  v12 = v11;

  sub_100086470((uint64_t)v12);
  swift_bridgeObjectRelease(v12, v13, v14, v15, v16, v17, v18, v19);
}

@end
