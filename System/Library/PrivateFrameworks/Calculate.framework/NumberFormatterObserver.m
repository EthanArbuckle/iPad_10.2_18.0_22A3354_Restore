@implementation NumberFormatterObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9Calculate23NumberFormatterObserver *v13;
  uint64_t v14;
  id v15;
  _TtC9Calculate23NumberFormatterObserver *v16;
  _OWORD v17[2];

  if (a3)
  {
    v9 = sub_1B8912AD4();
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
  sub_1B8912E70();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey();
  sub_1B8896ADC(&qword_1ED561BC0, (uint64_t)&unk_1B8916AE8);
  v14 = sub_1B8912A20();

LABEL_8:
  sub_1B889688C(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B88938A0((uint64_t)v17);
}

- (void)dealloc
{
  _TtC9Calculate23NumberFormatterObserver *v2;

  v2 = self;
  sub_1B8896678();
}

- (void).cxx_destruct
{

  swift_release();
  sub_1B8896A0C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Calculate23NumberFormatterObserver_willChange));
}

- (_TtC9Calculate23NumberFormatterObserver)init
{
  _TtC9Calculate23NumberFormatterObserver *result;

  result = (_TtC9Calculate23NumberFormatterObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
