@implementation HKQuantityType:

- (void)HKUnit
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = type metadata accessor for UIApplication(0, (unint64_t *)&lazy cache variable for type metadata for HKQuantityType, HKQuantityType_ptr);
  v8 = type metadata accessor for UIApplication(0, (unint64_t *)&lazy cache variable for type metadata for HKUnit, HKUnit_ptr);
  v9 = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, v7, v8, v9);
  swift_retain(v5);
  v11 = a3;
  v6(v10, a3);
  swift_release(v5);
  swift_bridgeObjectRelease(v10);

}

@end
