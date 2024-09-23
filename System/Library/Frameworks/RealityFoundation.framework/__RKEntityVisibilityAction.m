@implementation __RKEntityVisibilityAction

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  type metadata accessor for __RKEntityVisibilityAction();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 112) = 0;
  *(_BYTE *)(v3 + 120) = 1;
  *(_QWORD *)(v3 + 128) = 0;
  *(_BYTE *)(v3 + 136) = 1;
  *(_DWORD *)(v3 + 140) = 0;
  v4 = swift_retain();
  return (id)__RKEntityAction.init(targetEntity:)(v4);
}

@end
