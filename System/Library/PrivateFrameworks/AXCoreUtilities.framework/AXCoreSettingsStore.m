@implementation AXCoreSettingsStore

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  _TtC15AXCoreUtilities19AXCoreSettingsStore *v11;
  uint64_t v12;
  id v13;
  _TtC15AXCoreUtilities19AXCoreSettingsStore *v14;
  _OWORD v15[2];

  if (a3)
  {
    sub_18EC671A0();
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v15, 0, sizeof(v15));
    v13 = a5;
    v14 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v10 = a5;
  v11 = self;
  sub_18EC6756C();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_18EC19538(&qword_1EE13A790, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_18EC6C048);
  v12 = sub_18EC67110();

LABEL_8:
  sub_18EC49EAC((uint64_t)v15, v12, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18EC1A590((uint64_t)v15);
}

- (_TtC15AXCoreUtilities19AXCoreSettingsStore)init
{
  return (_TtC15AXCoreUtilities19AXCoreSettingsStore *)AXCoreSettingsStore.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
