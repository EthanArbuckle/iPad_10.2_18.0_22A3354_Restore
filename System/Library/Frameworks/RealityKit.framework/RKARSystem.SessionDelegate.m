@implementation RKARSystem.SessionDelegate

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  _TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate *v10;
  id v11;

  v7 = MEMORY[0x1DF091D08]((char *)self+ OBJC_IVAR____TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate_system, a2);
  if (v7)
  {
    v11 = (id)v7;
    v8 = a3;
    v9 = a4;
    v10 = self;
    specialized RKARSystem.session(_:didUpdate:)(v9);

  }
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  @objc RKARSystem.SessionDelegate.session(_:didAdd:)((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))specialized RKARSystem.session(_:didAdd:));
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  @objc RKARSystem.SessionDelegate.session(_:didAdd:)((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))specialized RKARSystem.session(_:didUpdate:));
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  @objc RKARSystem.SessionDelegate.session(_:didAdd:)((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))specialized RKARSystem.session(_:didRemove:));
}

- (void)session:(id)a3 didOutputCollaborationData:(id)a4
{
  id v6;
  id v7;
  _TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized RKARSystem.SessionDelegate.session(_:didOutputCollaborationData:)(v7);

}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  _TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  specialized RKARSystem.SessionDelegate.session(_:requestedRunWith:options:)();

}

- (_TtCC10RealityKit10RKARSystemP33_7C42569567E429B6AB2725E2C535D52915SessionDelegate)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RKARSystem.SessionDelegate();
  return -[RKARSystem.SessionDelegate init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
