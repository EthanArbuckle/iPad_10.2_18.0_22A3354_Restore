@implementation AMSUIWebViewControllerDelegate

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16NewsSubscription30AMSUIWebViewControllerDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1BA38B488(v10, v11, (uint64_t)sub_1BA339CBC, v9);

  swift_release();
}

- (_TtC16NewsSubscription30AMSUIWebViewControllerDelegate)init
{
  _TtC16NewsSubscription30AMSUIWebViewControllerDelegate *result;

  result = (_TtC16NewsSubscription30AMSUIWebViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AMSUIWebViewControllerDelegate_entitlementsManager);
}

@end
