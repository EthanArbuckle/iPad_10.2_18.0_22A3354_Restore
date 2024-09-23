@implementation LogKey

- (id)description
{
  os_unfair_lock_s *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  char v10;

  v1 = *(os_unfair_lock_s **)&a1[OBJC_IVAR____TtC22ManagedAppDistribution6LogKey_lockedRepresentation];
  v2 = (uint64_t)&v1[4];
  v3 = v1 + 9;
  v4 = a1;
  os_unfair_lock_lock(v3);
  sub_233B1FE1C(v2, (uint64_t)v9);
  os_unfair_lock_unlock(v3);
  v5 = v9[0];
  v6 = v9[1];
  LOBYTE(v3) = v10;
  LogKey.Representation.description.getter();
  sub_233B04B94(v5, v6, (char)v3);

  v7 = (void *)sub_233B57F6C();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC22ManagedAppDistribution6LogKey)init
{
  _TtC22ManagedAppDistribution6LogKey *result;

  result = (_TtC22ManagedAppDistribution6LogKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
