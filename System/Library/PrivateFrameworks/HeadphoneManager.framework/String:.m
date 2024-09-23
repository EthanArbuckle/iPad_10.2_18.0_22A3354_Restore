@implementation String:

- (unint64_t)HMDeviceRecord
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : HMDeviceRecord]);
    v1 = MEMORY[0x24263B698](MEMORY[0x24BEE04F0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String : HMDeviceRecord] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (Class)NSObject
{
  uint64_t v1;
  Class isa;
  Class v4;
  uint64_t (*v5)(uint64_t);

  v5 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v1 = swift_retain();
  if (v5(v1))
  {
    type metadata accessor for NSObject();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v4 = isa;
  }
  else
  {
    v4 = 0;
  }
  swift_release();
  return v4;
}

- (void)HMDeviceRecord
{
  swift_bridgeObjectRelease();
}

- (void)HeadphoneDevice
{
  swift_bridgeObjectRelease();
}

- (_QWORD)HeadphoneDevice
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

- (_QWORD)HMDeviceRecord
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

- (unint64_t)HeadphoneDevice
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values;
  if (!lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : HeadphoneDevice].Values);
    v1 = MEMORY[0x24263B698](MEMORY[0x24BEE03C0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String : HeadphoneDevice].Values and conformance [A : B].Values);
    return v1;
  }
  return v3;
}

- (unint64_t)Data
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [String : Data] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : Data] and conformance [A : B])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v1 = MEMORY[0x24263B698](MEMORY[0x24BEE04D8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [String : Data] and conformance [A : B]);
    return v1;
  }
  return v3;
}

- (void)Data
{
  swift_bridgeObjectRelease();
}

@end
