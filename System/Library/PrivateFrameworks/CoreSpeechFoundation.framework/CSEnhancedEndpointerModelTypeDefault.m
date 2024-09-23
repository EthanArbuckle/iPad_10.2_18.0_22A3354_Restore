@implementation CSEnhancedEndpointerModelTypeDefault

- (int64_t)featureCount
{
  swift_beginAccess();
  return *(_QWORD *)self->featureCount;
}

- (void)setFeatureCount:(int64_t)a3
{
  swift_beginAccess();
  *(_QWORD *)self->featureCount = a3;
}

- (int64_t)endpointerType
{
  swift_beginAccess();
  return *(_QWORD *)self->endpointerType;
}

- (void)setEndpointerType:(int64_t)a3
{
  swift_beginAccess();
  *(_QWORD *)self->endpointerType = a3;
}

- (id)modelName
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1B50CBC3C();
  swift_bridgeObjectRelease();
  return v0;
}

- (uint64_t)setModelName:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_1B50CBC48();
  v4 = v3;
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v4;
  return swift_bridgeObjectRelease();
}

- (uint64_t)inputVector
{
  swift_beginAccess();
  return swift_getObjCClassFromMetadata();
}

- (uint64_t)setInputVector:(uint64_t)a1
{
  uint64_t ObjCClassMetadata;
  uint64_t result;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  result = swift_beginAccess();
  *(_QWORD *)(a1 + 40) = ObjCClassMetadata;
  return result;
}

@end
