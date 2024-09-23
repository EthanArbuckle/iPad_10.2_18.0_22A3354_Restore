@implementation MusicPreviewPlayer

- (_TtC15ShazamEventsApp18MusicPreviewPlayer)init
{
  return (_TtC15ShazamEventsApp18MusicPreviewPlayer *)sub_10003DC10();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC15ShazamEventsApp18MusicPreviewPlayer *v4;
  double v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  v5 = sub_10003E2A4();
  v6.receiver = v4;
  v6.super_class = ObjectType;
  -[MusicPreviewPlayer dealloc](&v6, "dealloc", v5);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100007F38((uint64_t)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer__playerTimeObserver, (uint64_t *)&unk_10015D4A0);

  sub_100007F38((uint64_t)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer__currentSong, &qword_1001597E0);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer_lock));
  v3 = (char *)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC15ShazamEventsApp18MusicPreviewPlayer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC15ShazamEventsApp18MusicPreviewPlayer *v19;
  _OWORD v20[2];

  if (a3)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v20, 0, sizeof(v20));
    v18 = a5;
    v19 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)(v20, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v15 = v14;
  v16 = sub_100007428(&qword_100158220, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100108218);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

LABEL_8:
  sub_100040564(v9, v11, (uint64_t)v20, v17);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v11);
  sub_100007F38((uint64_t)v20, (uint64_t *)&unk_10015D4A0);
}

- (void)playerDidFinishPlaying
{
  _TtC15ShazamEventsApp18MusicPreviewPlayer *v2;

  v2 = self;
  sub_10003F424();

}

@end
