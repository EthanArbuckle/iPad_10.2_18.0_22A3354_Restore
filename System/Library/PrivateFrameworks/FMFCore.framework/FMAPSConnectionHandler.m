@implementation FMAPSConnectionHandler

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC7FMFCore22FMAPSConnectionHandler *v12;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_211A47910();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_211A4785C();
LABEL_4:
  v11 = a3;
  v12 = self;
  sub_21191C8C0(v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC7FMFCore22FMAPSConnectionHandler *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC7FMFCore22FMAPSConnectionHandler *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = sub_211A4716C();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_211920364(v9, v11);
  sub_211964B98(v9, v11);

}

- (void)dealloc
{
  _TtC7FMFCore22FMAPSConnectionHandler *v2;

  v2 = self;
  FMAPSConnectionHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_211962AB8((uint64_t)self + OBJC_IVAR____TtC7FMFCore22FMAPSConnectionHandler_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7FMFCore22FMAPSConnectionHandler)init
{
  _TtC7FMFCore22FMAPSConnectionHandler *result;

  result = (_TtC7FMFCore22FMAPSConnectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v8;
  id v10;
  id v11;
  id v12;
  _TtC7FMFCore22FMAPSConnectionHandler *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  _TtC7FMFCore22FMAPSConnectionHandler *v20;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (void *)sub_211A4716C();
    v16 = v15;

    if (a5)
      goto LABEL_3;
LABEL_6:
    if (!a6)
      goto LABEL_7;
    goto LABEL_4;
  }
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = self;
  v16 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  sub_211A47910();

  if (a6)
  {
LABEL_4:
    sub_211A47910();

  }
LABEL_7:
  sub_2119FE7F4((uint64_t)v8, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_211964B98((uint64_t)v8, v16);

}

@end
