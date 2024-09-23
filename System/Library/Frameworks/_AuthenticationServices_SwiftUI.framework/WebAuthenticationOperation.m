@implementation WebAuthenticationOperation

- (void)start
{
  _TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *v2;

  v2 = self;
  sub_226330DE4();

}

- (void)cancel
{
  _TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *v2;

  v2 = self;
  sub_22633156C();

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
  _TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *v5;
  unsigned __int8 v7;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
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
  _TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *v5;
  unsigned __int8 v7;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v3 = (_BYTE *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_22632EA04(v3, &v7);
  os_unfair_lock_unlock(v4);
  LODWORD(v3) = v7;

  return (_DWORD)v3 == 2;
}

- (_TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation)init
{
  _TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *result;

  result = (_TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22632D754(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler));
  sub_22632D754(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider));
  sub_226332AE4((uint64_t)self + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider));
}

@end
