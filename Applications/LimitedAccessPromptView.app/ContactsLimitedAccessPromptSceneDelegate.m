@implementation ContactsLimitedAccessPromptSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100013884(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  exit(0);
}

- (_TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptSceneDelegate();
  return -[ContactsLimitedAccessPromptSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc));
}

@end
