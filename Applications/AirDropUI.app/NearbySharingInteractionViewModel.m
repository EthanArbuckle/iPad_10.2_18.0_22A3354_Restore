@implementation NearbySharingInteractionViewModel

- (void)dealloc
{
  uint64_t v3;
  _TtC9AirDropUI33NearbySharingInteractionViewModel *v4;
  objc_super v5;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_contactDetailsResolvingTask);
  v4 = self;
  if (v3)
  {
    swift_retain(v3);
    Task.cancel()();
    swift_release(v3);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbySharingInteractionViewModel(0);
  -[NearbySharingInteractionViewModel dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__interaction;
  v6 = sub_100008F88(&qword_10013D338);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__state;
  v8 = sub_100008F88((uint64_t *)&unk_10013D340);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__shareableContent;
  v10 = sub_100008F88(&qword_10013D2B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__collaborationItem;
  v12 = sub_100008F88(&qword_10013D2A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__collaborationItemOptions;
  v14 = sub_100008F88(&qword_10013D2A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__previewImage;
  v16 = sub_100008F88(&qword_10013D298);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__resolvedRemotePerson;
  v18 = sub_100008F88(&qword_10013D290);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel__shareableContentActionBeginTime;
  v20 = sub_100008F88(&qword_10013D288);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_contentResolver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_contactDetailsProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_animationCoordinator));
  sub_10000CC5C((uint64_t)self + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_interactionAssertionID, (uint64_t *)&unk_1001405D0);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_contactDetailsResolvingTask));
  swift_bridgeObjectRelease(*(_TtC9AirDropUI33AirDropTransferSessionsController **)((char *)&self->super.isa+ OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_subscriptions), v21, v22, v23, v24, v25, v26, v27);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationsItemProvider));
  sub_100026F80(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel____lazy_storage___optionsChangedCallback), *(_QWORD *)&self->contentResolver[OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel____lazy_storage___optionsChangedCallback]);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  _TtC9AirDropUI33NearbySharingInteractionViewModel *v8;
  id v9;
  uint64_t KeyPath;
  uint64_t v11;
  _QWORD v12[7];

  if (a4 == 4)
  {
    v12[5] = v4;
    v12[6] = v5;
    swift_unknownObjectRetain(a3);
    v8 = self;
    v9 = objc_msgSend(a3, "shareOptions");
    KeyPath = swift_getKeyPath(&unk_1000EB168);
    v11 = swift_getKeyPath(&unk_1000EB190);
    v12[0] = v9;
    static Published.subscript.setter(v12, v8, KeyPath, v11);
    swift_unknownObjectRelease(a3);
  }
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  id v6;
  _TtC9AirDropUI33NearbySharingInteractionViewModel *v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;
  SEL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v19);
  swift_unknownObjectRelease(a4);
  v8 = sub_100008F88((uint64_t *)&unk_10013B830);
  v9 = swift_allocObject(v8, 64, 7);
  *(_OWORD *)(v9 + 16) = xmmword_1000E9370;
  sub_10003AE84((uint64_t)v19, v9 + 32);

  sub_100009070(v19);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease((_TtC9AirDropUI33AirDropTransferSessionsController *)v9, v11, v12, v13, v14, v15, v16, v17);
  return isa;
}

- (id)collaborationServiceForItemsProvider:(id)a3
{
  void *v5;
  id v6;
  _TtC9AirDropUI33NearbySharingInteractionViewModel *v7;
  id v8;
  id v9;
  id v10;
  _TtC9AirDropUI33NearbySharingInteractionViewModel *v11;
  id v12;

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9AirDropUI33NearbySharingInteractionViewModel_collaborationService);
  if (v5)
  {
    v6 = a3;
    v7 = self;
    v8 = v5;
  }
  else
  {
    v9 = objc_allocWithZone((Class)type metadata accessor for PlaceholderSFCollaborationService());
    v10 = a3;
    v11 = self;
    v8 = objc_msgSend(v9, "init");
  }
  v12 = v5;

  return v8;
}

- (_TtC9AirDropUI33NearbySharingInteractionViewModel)init
{
  _TtC9AirDropUI33NearbySharingInteractionViewModel *result;

  result = (_TtC9AirDropUI33NearbySharingInteractionViewModel *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.NearbySharingInteractionViewModel", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
