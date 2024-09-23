@implementation MarketingWebViewCoordinator

- (_TtC16FitnessMarketing27MarketingWebViewCoordinator)init
{
  _TtC16FitnessMarketing27MarketingWebViewCoordinator *result;

  result = (_TtC16FitnessMarketing27MarketingWebViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C1CF99C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing27MarketingWebViewCoordinator_onPurchase));
  swift_unknownObjectWeakDestroy();
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_23C1F3C94(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23C1F3E30);
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_23C1F3C94(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23C1F3FF0);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC16FitnessMarketing27MarketingWebViewCoordinator *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23C1F41B0(a4, a5);

}

@end
