@implementation NowPlayingArtworkRestrictionsMonitor

- (_TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor)init
{
  return (_TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor *)sub_2412CF938();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor *v14;
  void *v15;
  id v16;
  _TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_2414B4D68();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_2414B544C();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_2412C8030(&qword_257120FF0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2414B7B60);
  v15 = (void *)sub_2414B4C0C();

LABEL_8:
  sub_241465C14(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2412CBE78((uint64_t)v18, &qword_25437D280);
}

- (void)dealloc
{
  void *v3;
  _TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_standardUserDefaults);
  v6 = (void *)sub_2414B4D44();
  objc_msgSend(v5, sel_removeObserver_forKeyPath_, v4, v6);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for NowPlayingArtworkRestrictionsMonitor();
  -[NowPlayingArtworkRestrictionsMonitor dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor__isMotionDisabled;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254384338);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
