@implementation __RKEntityStartAnimateAction

- (id)copyWithZone:(void *)a3
{
  void *v3;
  uint64_t v5[4];

  swift_retain();
  __RKEntityStartAnimateAction.copy(with:)(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end
