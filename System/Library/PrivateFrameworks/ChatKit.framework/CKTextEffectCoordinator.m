@implementation CKTextEffectCoordinator

+ (BOOL)transcriptTextEffectCoordinationDisabled
{
  return sub_18E51D424((uint64_t)a1, (uint64_t)a2, qword_1EE0FAF60, (unsigned __int8 *)&byte_1EE1086A8);
}

+ (BOOL)entryViewTextEffectCoordinationDisabled
{
  return sub_18E51D424((uint64_t)a1, (uint64_t)a2, &qword_1EE0FBB38, (unsigned __int8 *)&byte_1EE1086A9);
}

+ (BOOL)inlineRepliesTextEffectCoordinationDisabled
{
  return sub_18E51D424((uint64_t)a1, (uint64_t)a2, &qword_1EE1071A0, (unsigned __int8 *)&byte_1EE1086AA);
}

+ (BOOL)messageEditingTextEffectCoordinationDisabled
{
  return sub_18E51D424((uint64_t)a1, (uint64_t)a2, &qword_1EE1071A8, (unsigned __int8 *)&byte_1EE1086AB);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)initWithLogIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC7ChatKit23CKTextEffectCoordinator *v13;
  uint64_t v15;

  v4 = sub_18E76866C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_18E768984();
  v10 = v9;
  v11 = objc_allocWithZone((Class)type metadata accessor for CKTextEffectCoordinator.Configuration());
  swift_getObjectType();
  *v7 = 5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF4A0], v4);
  v12 = sub_18E620344(v8, v10, (uint64_t)v7, 1);
  swift_deallocPartialClassInstance();
  v13 = -[CKTextEffectCoordinator initWithConfiguration:](self, sel_initWithConfiguration_, v12);

  return v13;
}

- (_TtC7ChatKit23CKTextEffectCoordinator)initWithConfiguration:(id)a3
{
  return (_TtC7ChatKit23CKTextEffectCoordinator *)CKTextEffectCoordinator.init(configuration:)(a3);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)init
{
  CKTextEffectCoordinator.init()();
}

- (void)dealloc
{
  _TtC7ChatKit23CKTextEffectCoordinator *v2;

  v2 = self;
  CKTextEffectCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_logger;
  v4 = sub_18E7666F8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_resumeDate;
  v6 = sub_18E766284();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_now;
  v8 = sub_18E7686CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_delegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_configurationDelegate);
}

- (_NSCustomTextRenderingDisplayLink)customRenderDisplayLink
{
  return (_NSCustomTextRenderingDisplayLink *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_displayLink));
}

- (BOOL)isPaused
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_isPaused;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setPaused:(BOOL)a3 includingAnimators:(BOOL)a4
{
  _BOOL4 v4;
  _TtC7ChatKit23CKTextEffectCoordinator *v6;

  v4 = a4;
  v6 = self;
  sub_18E65A320(a3, v4);

}

- (void)reset
{
  _TtC7ChatKit23CKTextEffectCoordinator *v2;

  v2 = self;
  sub_18E65ACA4();

}

- (void)resetAndContinueFromState:(id)a3
{
  id v4;
  _TtC7ChatKit23CKTextEffectCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_18E65AE2C(v4);

}

- (void)resetBackoffState
{
  _TtC7ChatKit23CKTextEffectCoordinator *v2;

  v2 = self;
  sub_18E65B0E8();

}

- (void)updateWithReason:(id)a3
{
  uint64_t v4;
  void (*v5)(_QWORD, _QWORD);
  void (*v6)(_QWORD, _QWORD);
  _TtC7ChatKit23CKTextEffectCoordinator *v7;

  v4 = sub_18E768984();
  v6 = v5;
  v7 = self;
  sub_18E65B288(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtP7ChatKit31CKTextEffectCoordinatorDelegate_)delegate
{
  return (_TtP7ChatKit31CKTextEffectCoordinatorDelegate_ *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_18E660778();
}

- (_TtP7ChatKit50CKTextEffectCoordinatorEffectConfigurationDelegate_)configurationDelegate
{
  return (_TtP7ChatKit50CKTextEffectCoordinatorEffectConfigurationDelegate_ *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7ChatKit23CKTextEffectCoordinator_configurationDelegate);
}

- (void)setConfigurationDelegate:(id)a3
{
  sub_18E660778();
}

@end
