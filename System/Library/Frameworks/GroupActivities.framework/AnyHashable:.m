@implementation AnyHashable:

- (uint64_t)Any
{
  void (*v6)(void *, uint64_t, uint64_t, uint64_t);
  void *v7;
  uint64_t v8;

  v6 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v7 = _Block_copy(aBlock);
  if (v7)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSSecureCoding?, @unowned NSError?) -> ();
    if (!ObjCClassMetadata)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = 0;
  if (ObjCClassMetadata)
LABEL_3:
    ObjCClassMetadata = swift_getObjCClassMetadata();
LABEL_4:
  if (a4)
    a4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v7, v8, ObjCClassMetadata, a4);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v7);
  return swift_release();
}

@end
