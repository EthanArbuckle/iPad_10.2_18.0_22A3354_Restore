@implementation LACOnenessAuthenticatorModel

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[LACOnenessAuthenticatorModel dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel_replyQueue));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)isAvailable
{
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v2;
  char v3;

  v2 = self;
  v3 = LACOnenessAuthenticatorModel.isAvailable.getter();

  return v3 & 1;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  LACOnenessAuthenticatorModel.domainState(for:completion:)((uint64_t)a3, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ()partial apply, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)authenticateRequest:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  specialized LACOnenessAuthenticatorModel.authenticateRequest(_:completion:)(a3, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

}

- (void)cancelAuthenticationForRequest:(id)a3
{
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v5;

  swift_unknownObjectRetain();
  v5 = self;
  LACOnenessAuthenticatorModel.cancelAuthentication(for:)(a3);
  swift_unknownObjectRelease();

}

- (_TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel)init
{
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *result;

  result = (_TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(const __CFString *)a4
{
  __CFString *v6;
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v7;

  swift_unknownObjectRetain();
  v6 = (id)a4;
  v7 = self;
  if (LACDarwinNotificationsEqual(v6, CFSTR("com.apple.LocalAuthentication.GlobalDomainDidChange")))
    LACOnenessAuthenticatorModel.simulateAuthenticationSuccess()();

  swift_unknownObjectRelease();
}

- (void)authenticationProvider:(id)a3 didStartAuthenticationWithID:(id)a4
{
  @objc LACOnenessAuthenticatorModel.authenticationProvider(_:didStartAuthenticationWith:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))specialized LACOnenessAuthenticatorModel.authenticationProvider(_:didStartAuthenticationWith:));
}

- (void)authenticationProvider:(id)a3 didCompleteAuthenticationWithID:(id)a4
{
  @objc LACOnenessAuthenticatorModel.authenticationProvider(_:didStartAuthenticationWith:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))specialized LACOnenessAuthenticatorModel.authenticationProvider(_:didCompleteAuthenticationWith:));
}

- (void)authenticationProvider:(id)a3 didFailAuthenticationWithID:(id)a4 error:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v11 = a5;
  v12 = self;
  specialized LACOnenessAuthenticatorModel.authenticationProvider(_:didFailAuthenticationWith:error:)((uint64_t)v10, (uint64_t)v11);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
