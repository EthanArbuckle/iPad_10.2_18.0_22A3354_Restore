@implementation DIIdentityAuthorizationController

- (DIIdentityAuthorizationController)init
{
  DIIdentityAuthorizationController *v2;
  _TtC7CoreIDV25DigitalPresentmentSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIIdentityAuthorizationController;
  v2 = -[DIIdentityAuthorizationController init](&v5, sel_init);
  v3 = objc_alloc_init(_TtC7CoreIDV25DigitalPresentmentSession);
  -[DIIdentityAuthorizationController setSession:](v2, "setSession:", v3);

  return v2;
}

- (void)checkCanRequestDocument:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DIIdentityAuthorizationController session](self, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkCanRequestDocument:completionHandler:", v7, v6);

}

- (void)requestDocument:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DIIdentityAuthorizationController session](self, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestDocument:completionHandler:", v7, v6);

}

- (void)cancelRequest
{
  id v2;

  -[DIIdentityAuthorizationController session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelRequest");

}

- (_TtC7CoreIDV25DigitalPresentmentSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
