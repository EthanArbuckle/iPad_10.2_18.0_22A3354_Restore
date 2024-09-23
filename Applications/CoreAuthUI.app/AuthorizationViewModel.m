@implementation AuthorizationViewModel

- (_TtC10CoreAuthUI22AuthorizationViewModel)init
{
  _TtC10CoreAuthUI22AuthorizationViewModel *result;

  result = (_TtC10CoreAuthUI22AuthorizationViewModel *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.AuthorizationViewModel", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView[0];
  v4 = sub_100025D1C(&qword_100091F30);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton[0], v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView[0], v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused[0], v4);
  v6 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate[0];
  v7 = sub_100025D1C(&qword_100091F48);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText[0];
  v9 = sub_100025D1C(&qword_100091F60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder;
  v11 = sub_100025D1C(&qword_100091F70);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts[0];
  v13 = sub_100025D1C(&qword_100091F80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton[0], v4);
  v5((char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, v4);
  sub_100027EB8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion), *(_QWORD *)&self->completion[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_options));
  v14 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_log;
  v15 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_backoffCounter));

  sub_10002BE18((uint64_t)self + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->completion[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle]);
  sub_10004554C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon));
}

- (void)authenticationResult:(id)a3 error:(id)a4 context:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC10CoreAuthUI22AuthorizationViewModel *v10;
  id v11;

  if (a3)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  v11 = a4;
  v9 = a5;
  v10 = self;
  sub_100054864((uint64_t)a4);

  swift_bridgeObjectRelease(v8);
}

- (void)biometricNoMatch
{
  _TtC10CoreAuthUI22AuthorizationViewModel *v2;

  v2 = self;
  sub_100053AB4();

}

- (void)biometryDidBecomeIdle
{
  _TtC10CoreAuthUI22AuthorizationViewModel *v2;

  v2 = self;
  sub_100053CE0();

}

@end
