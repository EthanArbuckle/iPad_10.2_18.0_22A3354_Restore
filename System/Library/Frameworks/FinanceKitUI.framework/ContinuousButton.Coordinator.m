@implementation ContinuousButton.Coordinator

- (void)onButtonSelected
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))&self->parent[24];
  swift_retain();
  v3 = swift_retain();
  v2(v3);
  swift_release();
  swift_release();
}

@end
