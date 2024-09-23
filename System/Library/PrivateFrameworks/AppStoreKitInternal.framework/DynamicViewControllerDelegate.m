@implementation DynamicViewControllerDelegate

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_1D8755E78(self, (uint64_t)a2, a3, a4, a5, (void (*)(void *, void *))sub_1D87563CC);
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  sub_1D8755E78(self, (uint64_t)a2, a3, a4, a5, (void (*)(void *, void *))sub_1D8756794);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  void (*v9)(id);
  id v10;
  id v11;
  _TtC19AppStoreKitInternal29DynamicViewControllerDelegate *v12;
  id v13;

  v9 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_didDismissHandler);
  v10 = a3;
  v11 = a4;
  v12 = self;
  if (v9)
    v9(a5);
  else
    v13 = a5;
  if (qword_1EDA2F360 != -1)
    swift_once();
  __swift_project_boxed_opaque_existential_1Tm(qword_1EDA686D8, qword_1EDA686F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B010);
  sub_1D89295A8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8931D70;
  sub_1D8929518();
  sub_1D892A778();

  swift_bridgeObjectRelease();
}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, double, double, double, double);
  id v13;
  _TtC19AppStoreKitInternal29DynamicViewControllerDelegate *v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = sub_1D892AC88();
  v12 = *(uint64_t (**)(uint64_t, double, double, double, double))((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_contentViewConstructor);
  if (v12)
  {
    v13 = a3;
    v14 = self;
    v15 = (void *)v12(v11, x, y, width, height);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = 0;
  }
  return v15;
}

- (_TtC19AppStoreKitInternal29DynamicViewControllerDelegate)init
{
  _TtC19AppStoreKitInternal29DynamicViewControllerDelegate *result;

  result = (_TtC19AppStoreKitInternal29DynamicViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_subscriptionManager));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_purchaseSuccessHandler));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_purchaseFailureHandler));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_carrierLinkSuccessHandler));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_carrierLinkFailureHandler));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_didDismissHandler));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29DynamicViewControllerDelegate_contentViewConstructor));
}

@end
