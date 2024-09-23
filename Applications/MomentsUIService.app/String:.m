@implementation String:

- (Class)NSObject
{
  uint64_t (*v1)(__n128);
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(__n128))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    type metadata accessor for UIApplication(0, (unint64_t *)&lazy cache variable for type metadata for NSObject, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

@end
