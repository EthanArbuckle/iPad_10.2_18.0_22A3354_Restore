@implementation PaymentButtonView.Coordinator

- (void)callback
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))self->action;
  v3 = swift_retain();
  v2(v3);
  swift_release();
}

@end
