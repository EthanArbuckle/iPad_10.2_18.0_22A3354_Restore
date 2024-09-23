@implementation OAuthLoginManager

- (_TtC6HomeUI17OAuthLoginManager)initWithAuthURL:(id)a3 presentingContext:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC6HomeUI17OAuthLoginManager *v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20A8E0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B93EB780();
    v10 = sub_1B93EB798();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_1B93EB798();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v12 = (_TtC6HomeUI17OAuthLoginManager *)sub_1B8F4A860((uint64_t)v9, (uint64_t)a4, (char *)self);
  swift_unknownObjectRelease();
  return v12;
}

- (void)startSessionWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  _TtC6HomeUI17OAuthLoginManager *v14;
  uint64_t v15;

  v8 = sub_1B93EB798();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1B93EB780();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  swift_unknownObjectRetain();
  v14 = self;
  sub_1B8F4A44C((uint64_t)v11, (uint64_t)a4, (uint64_t)sub_1B8F4B99C, v13, (uint64_t)v14);
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)startAuthenticationWithPresentationContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC6HomeUI17OAuthLoginManager *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v8 = self;
  sub_1B8F49C84((uint64_t)a3, (void (*)(_QWORD, _QWORD, void *))sub_1B8F4B994, v7, (char *)v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)processRedirectURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20A8E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B93EB780();
    v7 = sub_1B93EB798();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_1B93EB798();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_1B8F4AE18((uint64_t)v6);
  sub_1B8E26870((uint64_t)v6, &qword_1EF20A8E0);
  v9 = (void *)sub_1B93EDCE8();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC6HomeUI17OAuthLoginManager)init
{
  _TtC6HomeUI17OAuthLoginManager *result;

  result = (_TtC6HomeUI17OAuthLoginManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E26870((uint64_t)self + OBJC_IVAR____TtC6HomeUI17OAuthLoginManager_authURL, &qword_1EF20A8E0);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end
