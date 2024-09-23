@implementation AirDropTransferSessionsController

- (_TtC9AirDropUI33AirDropTransferSessionsController)init
{
  return (_TtC9AirDropUI33AirDropTransferSessionsController *)sub_100028E1C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_connection));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_airdropClient));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_airDropClient));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_transfersMonitorTask));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_interventionTasks));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_nearbySharingInteractionCoordinator));
  v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController__airDropSessionsByID;
  v4 = sub_100008F88(&qword_10013CC20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController__bannerAirDropSession;
  v6 = sub_100008F88(&qword_10013CC18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_userNotificationsCenter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_lockStateMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_contactIconProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_appCornerIconProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9AirDropUI33AirDropTransferSessionsController_transfersBeingEnded));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC9AirDropUI33AirDropTransferSessionsController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10003EF20(v9);

  swift_unknownObjectRelease(a5);
}

- (void)registerForPermissionRequests:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC9AirDropUI33AirDropTransferSessionsController *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_100008F88(&qword_10013BCC0);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_100125780, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1001257A8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10013CB60;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_1001257D0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10013CB70;
  v13[5] = v12;
  v14 = self;
  v15 = sub_10003A5A8((uint64_t)v8, (uint64_t)&unk_10013CB80, (uint64_t)v13);
  swift_release(v15);
}

- (void)transferStartedForIdentifier:(id)a3 isFromMe:(id)a4 withTransferState:(id)a5 itemCount:(id)a6 senderName:(id)a7 localizedTransferDescription:(id)a8 previewImageData:(id)a9 previewImageIsSensitive:(id)a10
{
  id v16;
  uint64_t v17;
  _TtC9AirDropUI33AirDropTransferSessionsController *v18;
  _TtC9AirDropUI33AirDropTransferSessionsController *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  SEL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  SEL v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _TtC9AirDropUI33AirDropTransferSessionsController *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _TtC9AirDropUI33AirDropTransferSessionsController *v56;
  _TtC9AirDropUI33AirDropTransferSessionsController *v57;

  v16 = a9;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v57 = v18;
  if (a7)
  {
    a7 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
    v56 = v19;
    if (a8)
    {
LABEL_3:
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
      a8 = v20;
      goto LABEL_6;
    }
  }
  else
  {
    v56 = 0;
    if (a8)
      goto LABEL_3;
  }
  v55 = 0;
LABEL_6:
  v54 = a4;
  v53 = a5;
  v52 = a6;
  v21 = a10;
  v51 = self;
  if (a9)
  {
    v22 = a7;
    v23 = a9;
    v16 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a9);
    v25 = v24;

    a7 = v22;
  }
  else
  {
    v25 = 0xF000000000000000;
  }
  sub_1000316F4(v17, (unint64_t)v57, v54, v53, v52, (uint64_t)a7, (unint64_t)v56, v55, (uint64_t)a8, (uint64_t)v16, v25, v21);
  sub_1000180AC((uint64_t)v16, v25);

  swift_bridgeObjectRelease(v57, v26, v27, v28, v29, v30, v31, v32, v47, v49);
  swift_bridgeObjectRelease((_TtC9AirDropUI33AirDropTransferSessionsController *)a8, v33, v34, v35, v36, v37, v38, v39, v48, v50);
  swift_bridgeObjectRelease(v56, v40, v41, v42, v43, v44, v45, v46, a9, a10);
}

- (void)transferUpdatedForIdentifier:(id)a3 withTransferState:(id)a4 transferAccepted:(id)a5 completedUnitCount:(id)a6 totalUnitCount:(id)a7 localizedTransferDescription:(id)a8 actionsData:(id)a9 completedURLsData:(id)a10
{
  _TtC9AirDropUI33AirDropTransferSessionsController *v16;
  _TtC9AirDropUI33AirDropTransferSessionsController *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  SEL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  SEL v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _TtC9AirDropUI33AirDropTransferSessionsController *v43;
  id v44;
  uint64_t v45;
  _TtC9AirDropUI33AirDropTransferSessionsController *v46;
  uint64_t v47;
  _TtC9AirDropUI33AirDropTransferSessionsController *v48;
  _TtC9AirDropUI33AirDropTransferSessionsController *v49;

  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v49 = v16;
  if (a8)
  {
    v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
    v48 = v17;
  }
  else
  {
    v45 = 0;
    v48 = 0;
  }
  v46 = (_TtC9AirDropUI33AirDropTransferSessionsController *)a4;
  v18 = a5;
  v19 = a6;
  v44 = a7;
  v43 = self;
  v20 = a10;
  v21 = v20;
  if (!a9)
  {
    v23 = 0;
    v25 = 0xF000000000000000;
    if (v20)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v28 = 0xF000000000000000;
    goto LABEL_9;
  }
  v22 = a9;
  v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v25 = v24;

  if (!v21)
    goto LABEL_8;
LABEL_6:
  v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a10);
  v28 = v27;

LABEL_9:
  sub_1000367CC(v47, v49, v46, v18, v19, v44, v45, v48, v23, v25, v26, v28);
  sub_1000180AC(v26, v28);
  sub_1000180AC(v23, v25);

  swift_bridgeObjectRelease(v49, v29, v30, v31, v32, v33, v34, v35);
  swift_bridgeObjectRelease(v48, v36, v37, v38, v39, v40, v41, v42);
}

- (void)transferEndedForIdentifier:(id)a3
{
  uint64_t v4;
  _TtC9AirDropUI33AirDropTransferSessionsController *v5;
  _TtC9AirDropUI33AirDropTransferSessionsController *v6;
  _TtC9AirDropUI33AirDropTransferSessionsController *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10002F300(v4, (unint64_t)v6);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC9AirDropUI33AirDropTransferSessionsController *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1000405E8(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

@end
