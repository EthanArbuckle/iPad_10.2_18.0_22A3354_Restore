@implementation SongPreviewPlaybackController

- (_TtC16MusicRecognition29SongPreviewPlaybackController)init
{
  return (_TtC16MusicRecognition29SongPreviewPlaybackController *)sub_10006EBC0((uint64_t)self, (uint64_t)a2);
}

- (void)playerDidFinishPlaying
{
  uint64_t v2;
  _TtC16MusicRecognition29SongPreviewPlaybackController *v3;

  v3 = self;
  sub_10006F5EC((uint64_t)v3, v2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC16MusicRecognition29SongPreviewPlaybackController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _TtC16MusicRecognition29SongPreviewPlaybackController *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_100004864(&qword_1001164C8, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1000D1440);
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_10006FB30(v10, v12, (uint64_t)v21, v18, (char *)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_10000526C((uint64_t)v21, &qword_10011A350);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicRecognition29SongPreviewPlaybackController_previewPlayer));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicRecognition29SongPreviewPlaybackController__statusController;
  v4 = sub_100004F7C(&qword_10011A358);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
