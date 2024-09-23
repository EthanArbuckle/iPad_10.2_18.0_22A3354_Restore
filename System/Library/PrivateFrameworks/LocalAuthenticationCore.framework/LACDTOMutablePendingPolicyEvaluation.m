@implementation LACDTOMutablePendingPolicyEvaluation

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier);
  v3 = *(_QWORD *)&self->identifier[OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x2426863FC](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isInvalidated
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInvalidated:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)callbackReason
{
  return (NSString *)@objc LACDTOMutablePendingPolicyEvaluation.callbackReason.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackReason);
}

- (void)setCallbackReason:(id)a3
{
  @objc LACDTOMutablePendingPolicyEvaluation.callbackReason.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackReason);
}

- (NSURL)callbackURL
{
  return (NSURL *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for URL?, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCD8D0]);
}

- (void)setCallbackURL:(id)a3
{
  @objc LACDTOMutablePendingPolicyEvaluation.callbackURL.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCD9C0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL);
}

- (NSDate)notificationScheduledAt
{
  return (NSDate *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (void)setNotificationScheduledAt:(id)a3
{
  @objc LACDTOMutablePendingPolicyEvaluation.callbackURL.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE878], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt);
}

- (NSDate)coolOffStarted
{
  return (NSDate *)@objc LACDTOMutablePendingPolicyEvaluation.callbackURL.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (void)setCoolOffStarted:(id)a3
{
  @objc LACDTOMutablePendingPolicyEvaluation.callbackURL.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE878], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted);
}

- (NSString)ratchetUUID
{
  return (NSString *)@objc LACDTOMutablePendingPolicyEvaluation.callbackReason.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_ratchetUUID);
}

- (void)setRatchetUUID:(id)a3
{
  @objc LACDTOMutablePendingPolicyEvaluation.callbackReason.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_ratchetUUID);
}

- (BOOL)hasNotifiedUserAboutCompletion
{
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v2;
  char v3;

  v2 = self;
  v3 = LACDTOMutablePendingPolicyEvaluation.hasNotifiedUserAboutCompletion.getter();

  return v3 & 1;
}

- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)initWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v13;
  uint64_t *v14;
  objc_super v16;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_isInvalidated) = 0;
  v7 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackReason);
  *v7 = 0;
  v7[1] = 0;
  v8 = (char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL;
  v9 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (char *)self
      + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt;
  v11 = type metadata accessor for Date();
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12((char *)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted, 1, 1, v11);
  v13 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_ratchetUUID);
  *v13 = 0;
  v13[1] = 0;
  v14 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_identifier);
  *v14 = v4;
  v14[1] = v6;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for LACDTOMutablePendingPolicyEvaluation();
  return -[LACDTOMutablePendingPolicyEvaluation init](&v16, sel_init);
}

- (BOOL)isNotificationScheduledForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v8;
  char v9;
  uint64_t v11;

  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = LACDTOMutablePendingPolicyEvaluation.isNotificationScheduled(for:)(v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation)init
{
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *result;

  result = (_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_callbackURL, &demangling cache variable for type metadata for URL?);
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)self+ OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_notificationScheduledAt, &demangling cache variable for type metadata for Date?);
  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)self + OBJC_IVAR____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation_coolOffStarted, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = LACDTOMutablePendingPolicyEvaluation.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x2426863FC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v4;
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = LACDTOMutablePendingPolicyEvaluation.isEqual(_:)((uint64_t)v8);

  outlined destroy of AsyncStream<()>.Continuation?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

@end
