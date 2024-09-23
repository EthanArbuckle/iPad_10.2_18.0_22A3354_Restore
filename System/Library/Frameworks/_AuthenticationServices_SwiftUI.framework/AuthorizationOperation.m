@implementation AuthorizationOperation

- (void)start
{
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v2;

  v2 = self;
  sub_22632DD0C();

}

- (void)cancel
{
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v2;

  v2 = self;
  sub_22632DF90();

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2;
  _BYTE *v3;
  os_unfair_lock_s *v4;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v5;
  unsigned __int8 v7;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v3 = (_BYTE *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_22632EA04(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return (_DWORD)v3 == 1;
}

- (BOOL)isFinished
{
  uint64_t v2;
  _BYTE *v3;
  os_unfair_lock_s *v4;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v5;
  unsigned __int8 v7;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v3 = (_BYTE *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_22632EA04(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return (_DWORD)v3 == 2;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v6;
  id v7;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, sel_credential);
  sub_226329B74((uint64_t)&v13);
  v10 = v13;
  v11 = v13;
  v12 = v14;
  sub_22632EB00((uint64_t)&v11);

}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  void *v6;
  id v7;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v8;
  id v9;

  v6 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = 0;
  v7 = a3;
  v9 = a4;
  v8 = self;

  sub_22632E38C(v9);
}

- (_TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation)init
{
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *result;

  result = (_TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22632D754(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler));
  sub_22632D754(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider));
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  uint64_t (*v4)(uint64_t);
  id v5;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v6;
  uint64_t v7;
  void *v8;
  id result;
  id v10;
  _TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation *v11;

  v4 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.isa
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  if (v4)
  {
    v5 = a3;
    v6 = self;
    v7 = sub_22632F234((uint64_t)v4);
    v8 = (void *)v4(v7);
    sub_22632D754((uint64_t)v4);
    if (v8)
    {

      return v8;
    }
  }
  else
  {
    v10 = a3;
    v11 = self;
  }
  result = (id)sub_226333F24();
  __break(1u);
  return result;
}

@end
