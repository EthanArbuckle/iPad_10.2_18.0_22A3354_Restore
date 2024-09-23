@implementation KeepAlive.RBSAssertionComponent

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent_assertion));
  sub_18C8735E4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent_invalidationHandler));
}

- (_TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent)init
{
  return (_TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent *)sub_18C894D4C();
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  _TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent *v5;

  v4 = a3;
  v5 = self;
  sub_18C965A14(v4);

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtCV18AppleMediaServices9KeepAliveP33_8D5EA5EE57B6E86A66C300315FB9941621RBSAssertionComponent *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_18C965E84(v6, (uint64_t)a4);

}

@end
