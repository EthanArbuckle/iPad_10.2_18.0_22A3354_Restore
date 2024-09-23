@implementation __RKEntityStopAnimateAction

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;

  swift_beginAccess();
  type metadata accessor for __RKEntityStopAnimateAction();
  swift_allocObject();
  v3 = swift_retain();
  return (id)__RKEntityAnimateAction.init(targetEntity:)(v3);
}

@end
