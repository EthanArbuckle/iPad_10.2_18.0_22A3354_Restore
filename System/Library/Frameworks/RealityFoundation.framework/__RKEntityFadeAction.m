@implementation __RKEntityFadeAction

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;

  swift_beginAccess();
  type metadata accessor for __RKEntityFadeAction();
  *(_QWORD *)(swift_allocObject() + 108) = *(_QWORD *)self->duration;
  v4 = swift_retain();
  return (id)__RKEntityAction.init(targetEntity:)(v4);
}

@end
