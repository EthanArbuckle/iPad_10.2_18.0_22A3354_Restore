@implementation ClarityUIWindowScene

- (void)_readySceneForConnection
{
  _TtC7SwiftUI20ClarityUIWindowScene *v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v2 = self;
  v3 = -[ClarityUIWindowScene session](v2, sel_session);
  v4 = objc_msgSend(v3, sel_configuration);

  v5 = objc_msgSend(v4, sel_storyboard);
  if (v5)
    MEMORY[0x18D75AC90](0xD000000000000042, 0x8000000187BD3FD0);
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  -[ClarityUIWindowScene _readySceneForConnection](&v6, sel__readySceneForConnection);
  ClarityUIWindowScene.loadWindowWithRootView()();

}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  void *v3;
  id v6;
  _TtC7SwiftUI20ClarityUIWindowScene *v7;
  id v8;
  char v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow);
  if (v3)
  {
    type metadata accessor for UIWindow();
    v6 = a3;
    v7 = self;
    v8 = v3;
    v9 = static NSObject.== infix(_:_:)();

  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  void *v3;
  _TtC7SwiftUI20ClarityUIWindowScene *v4;
  id v5;
  _TtC7SwiftUI20ClarityUIWindowScene *v6;
  objc_super v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow);
  if (v3)
  {
    v4 = self;
    v5 = v3;
    if ((objc_msgSend(v5, sel_isHidden) & 1) != 0)
      objc_msgSend(v5, sel_makeKeyAndVisible);

  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  -[ClarityUIWindowScene _performDeferredInitialWindowUpdateForConnection](&v7, sel__performDeferredInitialWindowUpdateForConnection);

}

- (_TtC7SwiftUI20ClarityUIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIWindowScene();
  return -[ClarityUIWindowScene initWithSession:connectionOptions:](&v7, sel_initWithSession_connectionOptions_, a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI20ClarityUIWindowScene_defaultCreatedWindow));
}

@end
