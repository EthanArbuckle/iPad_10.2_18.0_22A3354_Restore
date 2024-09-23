@implementation ConcreteFPDPurger

- (_TtC9libfssync17ConcreteFPDPurger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConcreteFPDPurger();
  return -[ConcreteFPDPurger init](&v3, sel_init);
}

- (void)purgeAndWaitAtUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _TtC9libfssync17ConcreteFPDPurger *v9;
  id v10;
  void *v11;
  _BYTE v12[16];

  v4 = sub_23B1C5A08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23B1C59CC();
  v8 = qword_2542DDDD8;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v10 = (id)fpfs_current_log();
  v11 = (void *)MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)&v12[-16] = v9;
  *(_QWORD *)&v12[-8] = v7;
  sub_23AC494B4(v11, 0, (uint64_t)"purgeAndWait(at:)", 17, 2, (uint64_t)sub_23AD40E90, (uint64_t)&v12[-32]);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)purgeAsyncAtUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _TtC9libfssync17ConcreteFPDPurger *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  _TtC9libfssync17ConcreteFPDPurger *v16;
  uint64_t v17;

  v4 = sub_23B1C5A08();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - v9;
  sub_23B1C59CC();
  v11 = qword_2542DDDD8;
  v12 = self;
  if (v11 != -1)
    swift_once();
  v13 = (id)fpfs_current_log();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v8, v4);
  v16 = v12;
  sub_23AA814FC(v13, (uint64_t)"purgeAsync(at:)", 15, 2, (uint64_t)sub_23AD404A0, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

@end
