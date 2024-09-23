@implementation GameCenterSignInActionImplementation

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8;
  _TtC12GameCenterUI36GameCenterSignInActionImplementation *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_1AB59FA00(v8, a4, a5);

}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  _TtC12GameCenterUI36GameCenterSignInActionImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_1AB59FAE4(v4);

}

- (_TtC12GameCenterUI36GameCenterSignInActionImplementation)init
{
  sub_1AB59FB8C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI36GameCenterSignInActionImplementation_signInViewController));
  swift_release();
}

@end
