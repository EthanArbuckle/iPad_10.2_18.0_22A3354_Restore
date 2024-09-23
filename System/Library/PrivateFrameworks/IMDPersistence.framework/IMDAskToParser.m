@implementation IMDAskToParser

- (IMDAskToParser)initWithUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_1ABC4DADC(&qword_1EEC401A8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1ABC642C4();
    v7 = sub_1ABC642D0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_1ABC642D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (IMDAskToParser *)AskToParser.init(url:)((uint64_t)v6);
}

- (BOOL)isValid
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  IMDAskToParser *v11;
  uint64_t v13;

  v3 = sub_1ABC4DADC(&qword_1EEC401A8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1ABC642D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC4EDDC((uint64_t)self + OBJC_IVAR___IMDAskToParser_url, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1ABC4EE24((uint64_t)v5);
    v10 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    v11 = self;
    v10 = sub_1ABC643FC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  }
  return v10 & 1;
}

- (NSString)notificationText
{
  void *v2;
  IMDAskToParser *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDAskToParser_payload);
  if (v2)
  {
    v3 = self;
    v4 = (void *)sub_1ABC64420();
    sub_1ABC64384();
    v6 = v5;

    if (v6)
    {
      v2 = (void *)sub_1ABC64444();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (NSString)summary
{
  return (NSString *)sub_1ABC4F26C((char *)self, (uint64_t)a2, MEMORY[0x1E0CFE230]);
}

- (NSString)questionIdentifier
{
  return (NSString *)sub_1ABC4F26C((char *)self, (uint64_t)a2, MEMORY[0x1E0CFE218]);
}

- (IMDAskToParser)init
{
  IMDAskToParser *result;

  result = (IMDAskToParser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___IMDAskToParser_urlParser;
  v4 = sub_1ABC64414();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_1ABC4EE24((uint64_t)self + OBJC_IVAR___IMDAskToParser_url);
}

@end
