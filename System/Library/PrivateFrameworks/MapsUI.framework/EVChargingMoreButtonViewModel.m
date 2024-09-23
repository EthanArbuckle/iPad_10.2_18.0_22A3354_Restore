@implementation EVChargingMoreButtonViewModel

- (NSString)titleString
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_191EEAF9C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)symbolName
{
  void *v2;

  if (*(_QWORD *)&self->titleString[OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_symbolName])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_191EEAF9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (id)actionBlock
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_191DCBE04;
  aBlock[3] = &block_descriptor_7;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setActionBlock:(id)a3
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
    v4 = sub_191DCE008;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_191DCB644(v7);
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionStyle);
}

- (_TtC6MapsUI29EVChargingMoreButtonViewModel)init
{
  return (_TtC6MapsUI29EVChargingMoreButtonViewModel *)sub_191DCD1C4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_191DCB644(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6MapsUI29EVChargingMoreButtonViewModel_actionBlock));
}

@end
