@implementation CKSendLaterView

- (CKSendLaterView)initWithPluginContext:(id)a3
{
  return (CKSendLaterView *)sub_18E746470(a3);
}

- (CKSendLaterView)initWithCoder:(id)a3
{
  id v5;
  CKSendLaterView *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSendLaterView_cancellables) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSendLaterView_hostingView) = 0;
  v5 = a3;

  result = (CKSendLaterView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)addDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)removeDelegate:(id)a3
{
  uint64_t v5;
  id v6;
  CKSendLaterView *v7;

  v5 = MEMORY[0x193FF501C]((char *)self + OBJC_IVAR___CKSendLaterView_delegate, a2);
  if (v5)
  {
    v6 = (id)v5;
    swift_unknownObjectRetain();
    v7 = self;
    swift_unknownObjectRelease();
    if (v6 == a3)
      swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();

  }
}

- (CKSendLaterView)initWithFrame:(CGRect)a3
{
  CKSendLaterView *result;

  result = (CKSendLaterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKSendLaterView_delegate);
  swift_bridgeObjectRelease();

}

@end
