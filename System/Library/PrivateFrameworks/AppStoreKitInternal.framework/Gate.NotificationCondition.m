@implementation Gate.NotificationCondition

- (void)takeSatisfactionFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v8[24];

  v4 = sub_1D89271CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D8927190();
  swift_beginAccess();
  self->super.isSatisfied[0] = 1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_1D839784C();
    swift_release();
    swift_release();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)cantGetNoSatisfactionFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v8[24];

  v4 = sub_1D89271CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D8927190();
  swift_beginAccess();
  self->super.isSatisfied[0] = 0;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_1D839784C();
    swift_release();
    swift_release();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

@end
