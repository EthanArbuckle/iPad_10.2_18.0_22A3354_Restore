@implementation FBKSForm_FrameworkPrivateName

- (void)setQuestionsWithNsMutableDict:(id)a3
{
  id v4;
  FBKSForm_FrameworkPrivateName *v5;

  v4 = a3;
  v5 = self;
  _s15FeedbackService8FBKSFormC12setQuestions13nsMutableDictySo19NSMutableDictionaryC_tF_0();

}

- (NSData)asJSON
{
  FBKSForm_FrameworkPrivateName *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = FBKSForm.asJSON.getter();
  v5 = v4;

  v6 = (void *)sub_23B483338();
  sub_23B43ED7C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  v4 = sub_23B483344();
  v6 = v5;

  v7 = (void *)_s15FeedbackService8FBKSFormC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_23B43ED7C(v4, v6);
  return v7;
}

- (id)asFBAURLSchemeWithIsSurvey:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  FBKSForm_FrameworkPrivateName *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A1A610);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  FBKSForm.asFBAURLScheme(isSurvey:)((uint64_t)v6);

  v8 = sub_23B48332C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_23B483320();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (NSString)identifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23B483428();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_23B483434();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)authenticationMethod
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  swift_beginAccess();
  return *v2;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  swift_beginAccess();
  *v4 = a3;
}

- (FBKSForm_FrameworkPrivateName)initWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  FBKSForm_FrameworkPrivateName *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  objc_super v13;

  v4 = sub_23B483434();
  v6 = v5;
  v7 = (unint64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  v8 = self;
  v9 = MEMORY[0x24BEE4AF8];
  *v7 = sub_23B473950(MEMORY[0x24BEE4AF8]);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod) = (Class)3;
  v10 = sub_23B473950(v9);
  swift_beginAccess();
  *v7 = v10;
  swift_bridgeObjectRelease();
  v11 = (uint64_t *)((char *)v8 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  *v11 = v4;
  v11[1] = v6;

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for FBKSForm();
  return -[FBKSForm_FrameworkPrivateName init](&v13, sel_init);
}

- (void)prefillWithQuestion:(id)a3 answer:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  FBKSForm_FrameworkPrivateName *v11;
  uint64_t v12[2];

  v5 = sub_23B483434();
  v7 = v6;
  v8 = sub_23B483434();
  v10 = v9;
  v12[0] = v5;
  v12[1] = v7;
  v11 = self;
  sub_23B47519C(v12, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (FBKSForm_FrameworkPrivateName)init
{
  FBKSForm_FrameworkPrivateName *result;

  result = (FBKSForm_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
