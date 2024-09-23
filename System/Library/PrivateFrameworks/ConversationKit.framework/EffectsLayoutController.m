@implementation EffectsLayoutController

- (_TtC15ConversationKit23EffectsLayoutController)initWithContainingViewController:(id)a3
{
  return (_TtC15ConversationKit23EffectsLayoutController *)EffectsLayoutController.init(containingViewController:)(a3);
}

- (BOOL)shouldAlwaysPresentExpandedAppsFor:(id)a3
{
  id v4;
  _TtC15ConversationKit23EffectsLayoutController *v5;
  BOOL v6;

  v4 = a3;
  v5 = self;
  v6 = EffectsLayoutController.shouldAlwaysPresentExpandedApps(for:)();

  return v6;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  void (*v10)(void);
  uint64_t v11;
  id v12;
  id v13;
  _TtC15ConversationKit23EffectsLayoutController *v14;

  v6 = a5;
  v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = (void (*)(void))thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = a4;
  v14 = self;
  EffectsLayoutController.effectBrowserViewController(_:presentExpandedAppViewController:animated:completion:)(v12, a4, v6, v10, v11);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v10);

}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t (*v10)(id);
  uint64_t v11;
  id v12;
  id v13;
  _TtC15ConversationKit23EffectsLayoutController *v14;

  v10 = (uint64_t (*)(id))_Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = (uint64_t (*)(id))partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = a4;
  v14 = self;
  EffectsLayoutController.effectBrowserViewController(_:dismissExpandedAppViewController:animated:completion:)((uint64_t)v14, a4, a5, v10, v11);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v10);

}

- (CGSize)expandedAppViewControllerSizeFor:(id)a3
{
  id v4;
  _TtC15ConversationKit23EffectsLayoutController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  v5 = self;
  v6 = EffectsLayoutController.expandedAppViewControllerSize(for:)(v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC15ConversationKit23EffectsLayoutController)init
{
  EffectsLayoutController.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
