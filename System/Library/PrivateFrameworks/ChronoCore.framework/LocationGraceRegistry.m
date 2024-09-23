@implementation LocationGraceRegistry

- (int64_t)serializedDataLength
{
  int64_t v2;

  swift_retain();
  v2 = sub_1D28E4650();
  swift_release();
  return v2;
}

- (BOOL)serializeToWriter:(id)a3
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  v5 = sub_1D28E5C3C(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
  return v5;
}

+ (id)deserializeFromReader:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)sub_1D28E6134((uint64_t (**)(_QWORD, _QWORD, _QWORD))v3);
  _Block_release(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  char v3;
  _OWORD v5[2];

  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    sub_1D29C6144();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
    swift_retain();
  }
  v3 = sub_1D28E4AA4((uint64_t)v5);
  swift_release();
  sub_1D2742324((uint64_t)v5);
  return v3 & 1;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  void *v5;

  swift_beginAccess();
  v4 = *(_QWORD *)self->timeoutByIdentifier;
  type metadata accessor for LocationGraceRegistry();
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1D29C65C4();
  swift_release();
  return v5;
}

@end
