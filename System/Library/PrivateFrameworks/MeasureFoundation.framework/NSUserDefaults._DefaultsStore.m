@implementation NSUserDefaults._DefaultsStore

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore *v13;
  uint64_t v14;
  id v15;
  _TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore *v16;
  _OWORD v17[2];

  if (a3)
  {
    v9 = sub_2216531B0();
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v17, 0, sizeof(v17));
    v15 = a5;
    v16 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_221653768();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_2215BB99C(&qword_2556D91B0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_221655EC4);
  v14 = sub_2216530A8();

LABEL_8:
  _sSo14NSUserDefaultsC17MeasureFoundationE01_B5StoreC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2215DDB1C((uint64_t)v17);
}

- (_TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore)init
{
  _TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore *result;

  result = (_TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
