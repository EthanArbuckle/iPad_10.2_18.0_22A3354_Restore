@implementation DKIDSHandler

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC11DockKitCore12DKIDSHandler *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _TtC11DockKitCore12DKIDSHandler *v27;

  v9 = a5;
  if (!a5)
  {
    v23 = a3;
    v24 = a4;
    v25 = a6;
    v26 = a7;
    v27 = self;
    v19 = 0xF000000000000000;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    v22 = 0;
    goto LABEL_6;
  }
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = self;
  v17 = v9;
  v9 = (void *)sub_23A690624();
  v19 = v18;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  v20 = sub_23A690E1C();
  v22 = v21;

LABEL_6:
  sub_23A61893C((uint64_t)v9, v19, v20, v22);
  swift_bridgeObjectRelease();
  sub_23A608C74((uint64_t)v9, v19);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _TtC11DockKitCore12DKIDSHandler *v17;

  v8 = a6;
  if (!a5)
  {
    if (a6)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  sub_23A690DBC();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v12 = sub_23A690E1C();
  v8 = v13;
LABEL_6:
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = self;
  sub_23A619094(a3, v12, (unint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (uint64_t)service:(void *)a3 devicesChanged:(uint64_t)a4
{
  _QWORD *v5;
  void (*v6)(id);
  id v7;
  _QWORD *v8;

  v5 = (_QWORD *)result;
  if (a4)
  {
    result = sub_23A690F18();
    if (a3)
    {
LABEL_3:
      v6 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & *v5) + 0x70);
      v7 = a3;
      v8 = v5;
      v6(v7);

      return swift_bridgeObjectRelease();
    }
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

- (_TtC11DockKitCore12DKIDSHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DKIDSHandler();
  return -[DKIDSHandler init](&v3, sel_init);
}

@end
