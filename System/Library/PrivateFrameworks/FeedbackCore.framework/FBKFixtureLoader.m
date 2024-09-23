@implementation FBKFixtureLoader

- (id)initForBundle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_21DA5F1EC(v3);

  return v4;
}

- (void)didLogOutWithCompletion:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC12FeedbackCore16FBKFixtureLoader *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  _QWORD *v6;
  void (*v7)(_QWORD *);
  id v8;
  _TtC12FeedbackCore16FBKFixtureLoader *v9;

  v6 = _Block_copy(a4);
  v7 = (void (*)(_QWORD *))v6[2];
  v8 = a3;
  v9 = self;
  v7(v6);
  _Block_release(v6);

}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  sub_21DA5C958(self, (uint64_t)a2, (uint64_t)a3, a4, a5, 0xD000000000000018, 0x800000021DAD8D40);
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  sub_21DA5C958(self, (uint64_t)a2, (uint64_t)a3, a4, a5, 0xD000000000000024, 0x800000021DAD8D90);
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _TtC12FeedbackCore16FBKFixtureLoader *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553999F0);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21DAC3CA0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a4);
  v18 = _Block_copy(a5);
  sub_21DAC3C88();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  v21 = self;
  sub_21DAC3C94();
  v22 = sub_21DAC3E44();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v11, 1, v22) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_21DA5CF9C((uint64_t)v11, (uint64_t)sub_21DA5FCD8, v19, (uint64_t)sub_21DA5FB48, v20);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v22);

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC12FeedbackCore16FBKFixtureLoader *v17;
  uint64_t v18;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  sub_21DAC3E20();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_21DA5DC9C((uint64_t)v12, (uint64_t)sub_21DA5FB44, v15, (uint64_t)sub_21DA5FB48, v16);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  _TtC12FeedbackCore16FBKFixtureLoader *v15;
  uint64_t v16;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  sub_21DAC3E20();
  v15 = self;
  _Block_release(v14);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC12FeedbackCore16FBKFixtureLoader *v17;
  uint64_t v18;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  sub_21DAC3E20();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_21DA5CF9C((uint64_t)v12, (uint64_t)sub_21DA5FB4C, v15, (uint64_t)sub_21DA5FB48, v16);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC12FeedbackCore16FBKFixtureLoader *v19;
  uint64_t v20;

  v10 = sub_21DAC3E44();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  sub_21DAC3E20();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_21DA5DC9C((uint64_t)v14, (uint64_t)sub_21DA5FB44, v17, (uint64_t)sub_21DA5FB48, v18);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC12FeedbackCore16FBKFixtureLoader *v19;
  uint64_t v20;

  v10 = sub_21DAC3E44();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  sub_21DAC3E20();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_21DA5DC9C((uint64_t)v14, (uint64_t)sub_21DA5FB44, v17, (uint64_t)sub_21DA5FB48, v18);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC12FeedbackCore16FBKFixtureLoader *v17;
  uint64_t v18;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  sub_21DAC3E20();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = self;
  sub_21DA5DC9C((uint64_t)v12, (uint64_t)sub_21DA5FB44, v15, (uint64_t)sub_21DA5FB48, v16);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC12FeedbackCore16FBKFixtureLoader *v19;
  uint64_t v20;

  v10 = sub_21DAC3E44();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  sub_21DAC3E20();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v16;
  v19 = self;
  sub_21DA5DC9C((uint64_t)v14, (uint64_t)sub_21DA5FB44, v17, (uint64_t)sub_21DA5FB48, v18);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

- (_TtC12FeedbackCore16FBKFixtureLoader)init
{
  _TtC12FeedbackCore16FBKFixtureLoader *result;

  result = (_TtC12FeedbackCore16FBKFixtureLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12FeedbackCore16FBKFixtureLoader_logger;
  v4 = sub_21DAC4030();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
