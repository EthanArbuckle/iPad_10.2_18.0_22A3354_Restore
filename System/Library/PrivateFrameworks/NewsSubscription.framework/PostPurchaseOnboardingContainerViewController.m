@implementation PostPurchaseOnboardingContainerViewController

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)init
{
  return (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *)sub_1BA3C5D10();
}

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithCoder:(id)a3
{
  return -[PostPurchaseOnboardingContainerViewController init](self, sel_init, a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  objc_class *ObjectType;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  _TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *v13;
  objc_super v14;
  _QWORD aBlock[6];

  v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = _Block_copy(a4);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1BA3C679C;
  }
  else
  {
    v9 = 0;
  }
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = v8;
  v11[4] = v9;
  aBlock[4] = sub_1BA37F070;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA2F358C;
  aBlock[3] = &block_descriptor_15_2;
  v12 = _Block_copy(aBlock);
  v13 = self;
  sub_1BA350184((uint64_t)v8);
  swift_release();
  v14.receiver = v13;
  v14.super_class = ObjectType;
  -[PostPurchaseOnboardingContainerViewController dismissViewControllerAnimated:completion:](&v14, sel_dismissViewControllerAnimated_completion_, v5, v12);
  _Block_release(v12);
  sub_1BA30788C((uint64_t)v8);

}

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *result;

  v4 = a4;
  result = (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController_lastShownViewController));
  sub_1BA30788C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController_onDismissal));
}

@end
