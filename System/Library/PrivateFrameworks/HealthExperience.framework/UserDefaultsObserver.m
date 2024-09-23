@implementation UserDefaultsObserver

- (void)dealloc
{
  void *v2;
  _TtC16HealthExperience20UserDefaultsObserver *v3;
  id v4;
  void *v5;
  objc_super v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16HealthExperience20UserDefaultsObserver_userDefaults);
  v3 = self;
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1BC933E88();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_removeObserver_forKeyPath_, v3, v5);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  -[UserDefaultsObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC16HealthExperience20UserDefaultsObserver *v14;
  _QWORD *v15;
  id v16;
  _TtC16HealthExperience20UserDefaultsObserver *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_1BC933EB8();
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
  sub_1BC934554();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1BC85727C();
  v15 = (_QWORD *)sub_1BC933DE0();

LABEL_8:
  sub_1BC8E19F4(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC87D3A4((uint64_t)v18);
}

- (_TtC16HealthExperience20UserDefaultsObserver)init
{
  _TtC16HealthExperience20UserDefaultsObserver *result;

  result = (_TtC16HealthExperience20UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
