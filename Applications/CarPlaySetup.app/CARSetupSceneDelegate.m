@implementation CARSetupSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupSceneDelegate window](self, "window"));

  if (!v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v9);
    -[CARSetupSceneDelegate setWindow:](self, "setWindow:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupSceneDelegate window](self, "window"));
    objc_msgSend(v8, "makeKeyAndVisible");

  }
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->window, 0);
}

@end
