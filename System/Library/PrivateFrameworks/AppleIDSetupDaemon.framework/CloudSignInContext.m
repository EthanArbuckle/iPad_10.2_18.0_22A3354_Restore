@implementation CloudSignInContext

- (CDPContext)cdpContext
{
  return (CDPContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext));
}

- (void)setCdpContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_cdpContext) = (Class)a3;
  v3 = a3;

}

- (BOOL)skipCDPEnablement
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipCDPEnablement);
}

- (void)setSkipCDPEnablement:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipCDPEnablement) = a3;
}

- (BOOL)backgroundDataclassEnablement
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_backgroundDataclassEnablement);
}

- (void)setBackgroundDataclassEnablement:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_backgroundDataclassEnablement) = a3;
}

- (BOOL)skipDataclassEnablement
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipDataclassEnablement);
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_skipDataclassEnablement) = a3;
}

- (NSSet)requiredTerms
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_requiredTerms))
  {
    type metadata accessor for AATermsEntry(0);
    sub_236605D64(&qword_25641FDD0, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_23669837C);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_236697524();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (void)setRequiredTerms:(id)a3
{
  objc_class *v4;

  if (a3)
  {
    type metadata accessor for AATermsEntry(0);
    sub_236605D64(&qword_25641FDD0, (uint64_t (*)(uint64_t))type metadata accessor for AATermsEntry, (uint64_t)&unk_23669837C);
    v4 = (objc_class *)sub_236697530();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_requiredTerms) = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)shouldStashLoginResponse
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_shouldStashLoginResponse);
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_shouldStashLoginResponse) = a3;
}

- (unint64_t)findMyActivationAction
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_findMyActivationAction);
}

- (void)setFindMyActivationAction:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AppleIDSetupDaemon18CloudSignInContext_findMyActivationAction) = (Class)a3;
}

- (void)signInFlowController:(AASignInFlowController *)a3 presentGenericTermsUIForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignInFlowController *v17;
  ACAccount *v18;
  _TtC18AppleIDSetupDaemon18CloudSignInContext *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256420E28;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256420E30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_256420E38, (uint64_t)v16);
  swift_release();
}

- (void)signInFlowController:(AASignInFlowController *)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignInFlowController *v17;
  _TtC18AppleIDSetupDaemon18CloudSignInContext *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256420E08;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256420E10;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_256420E18, (uint64_t)v16);
  swift_release();
}

- (void)signInFlowController:(AASignInFlowController *)a3 presentProgressViewForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignInFlowController *v17;
  ACAccount *v18;
  _TtC18AppleIDSetupDaemon18CloudSignInContext *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256420DF0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256421B10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_25641FE00, (uint64_t)v16);
  swift_release();
}

- (_TtC18AppleIDSetupDaemon18CloudSignInContext)init
{
  _TtC18AppleIDSetupDaemon18CloudSignInContext *result;

  result = (_TtC18AppleIDSetupDaemon18CloudSignInContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end
