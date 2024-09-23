@implementation SystemCloseButton.Coordinator

- (void)primaryAction
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))self->action;
  v3 = *(_QWORD *)&self->action[8];
  swift_retain(self);
  v5 = swift_retain(v3);
  v4(v5);
  swift_release(self);
  swift_release(v3);
}

@end
