@implementation ScenePresentationTypeObserver

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  _TtC12TirePressure29ScenePresentationTypeObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000DA90(v6);

}

- (_TtC12TirePressure29ScenePresentationTypeObserver)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12TirePressure29ScenePresentationTypeObserver *v10;
  objc_class *v11;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;

  v3 = sub_100003F8C(&qword_10001A358);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC12TirePressure29ScenePresentationTypeObserver__presentationType;
  v15 = 0;
  type metadata accessor for CRSUIHostedAltScreenPresentationType(0);
  v9 = v8;
  v10 = self;
  Published.init(initialValue:)(&v15, v9);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);

  v11 = (objc_class *)type metadata accessor for ScenePresentationTypeObserver(0);
  v14.receiver = v10;
  v14.super_class = v11;
  return -[ScenePresentationTypeObserver init](&v14, "init");
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12TirePressure29ScenePresentationTypeObserver__presentationType;
  v3 = sub_100003F8C(&qword_10001A358);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
