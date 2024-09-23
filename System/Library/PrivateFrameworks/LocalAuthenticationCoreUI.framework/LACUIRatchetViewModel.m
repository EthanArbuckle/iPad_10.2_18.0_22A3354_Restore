@implementation LACUIRatchetViewModel

- (BOOL)isInvalidated
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInvalidated:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated;
  swift_beginAccess();
  *v4 = a3;
}

- (void)dealloc
{
  _TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *v2;

  v2 = self;
  LACUIRatchetViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of LACUIAuthCountdownView((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state, type metadata accessor for LACUIRatchetViewModel.State);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)self + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate, &demangling cache variable for type metadata for Date?);
}

- (void)start
{
  _TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *v2;

  v2 = self;
  LACUIRatchetViewModel.start()();

}

- (void)stopWithReason:(id)a3 invalidate:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 32) = self;
  *(_QWORD *)(v13 + 40) = v9;
  *(_QWORD *)(v13 + 48) = v11;
  *(_BYTE *)(v13 + 56) = a4;
  v14 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)partial apply, v13);
  swift_release();
  swift_bridgeObjectRelease();

}

+ (id)mapError:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = specialized static LACUIRatchetViewModel.mapError(_:)(a3);

  if (v5)
  {
    v6 = (void *)_convertErrorToNSError(_:)();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (_TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel)init
{
  _TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *result;

  result = (_TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)ratchetStateDidChange:(id)a3
{
  id v4;
  _TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel *v5;

  v4 = a3;
  v5 = self;
  LACUIRatchetViewModel.ratchetStateDidChange(_:)(v4);

}

@end
