@implementation AnyHashable:

- (uint64_t)Any
{
  uint64_t v6;
  void (*v7)(void *, void *, uint64_t);
  uint64_t v8;
  id v9;
  id v10;

  v7 = *(void (**)(void *, void *, uint64_t))(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (a4)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  swift_retain(v6);
  v9 = a2;
  v10 = a3;
  v7(a2, a3, v8);
  swift_release(v6);

  return swift_bridgeObjectRelease(v8);
}

- (void)Any
{
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_retain(v4);
  v7 = a2;
  v5(a2, v6);
  swift_release(v4);
  swift_bridgeObjectRelease(v6);

}

@end
