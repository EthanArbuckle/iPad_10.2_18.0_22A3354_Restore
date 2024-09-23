@implementation WKGroupSession

- (WKURLActivity)activity
{
  return (WKURLActivity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___WKGroupSession_activityWrapper));
}

- (NSUUID)uuid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  WKGroupSession *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_2354A37C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  swift_retain();
  sub_2354A3804();

  swift_release();
  v8 = (void *)sub_2354A37B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (int64_t)state
{
  WKGroupSession *v2;
  int64_t v3;

  v2 = self;
  v3 = GroupSessionWrapper.state.getter();

  return v3;
}

- (id)newActivityCallback
{
  return sub_235498F90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WKGroupSession_newActivityCallback, (uint64_t)sub_235498A38, (uint64_t)&block_descriptor_23);
}

- (void)setNewActivityCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_23549A634;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSession_newActivityCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23549A0F0(v7);
}

- (id)stateChangedCallback
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_stateChangedCallback);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235498BF0;
  aBlock[3] = &block_descriptor_17;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setStateChangedCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_23549A36C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSession_stateChangedCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23549A0F0(v7);
}

- (void)join
{
  sub_235498D80(self, (uint64_t)a2, MEMORY[0x24BDD1E18]);
}

- (void)leave
{
  sub_235498D80(self, (uint64_t)a2, MEMORY[0x24BDD1E50]);
}

- (void)coordinateWithCoordinator:(id)a3
{
  id v4;
  WKGroupSession *v5;

  v4 = a3;
  v5 = self;
  swift_retain();
  sub_2354A3B64();

  swift_release();
}

- (WKGroupSession)init
{
  WKGroupSession *result;

  result = (WKGroupSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  sub_23549A0F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_newActivityCallback));
  sub_23549A0F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSession_stateChangedCallback));
}

@end
