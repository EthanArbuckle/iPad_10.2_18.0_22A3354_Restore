@implementation MockHeadline

- (NSDate)displayDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1D5F8589C();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  swift_beginAccess();
  v7 = sub_1D6E15ECC();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D6E15DE8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setDisplayDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _TtC7NewsUI212MockHeadline *v16;
  _TtC7NewsUI212MockHeadline *v17;
  char *v18;
  uint64_t v19;

  v5 = sub_1D6E15ECC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5F8589C();
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v19 - v13;
  if (a3)
  {
    sub_1D6E15E60();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, v15, 1, v5);
  sub_1D5F3DF44((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
  {
    v16 = self;
    sub_1D6E15DAC();
    sub_1D5FCC7A8((uint64_t)v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v12, v5);
    v17 = self;
  }
  v18 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 40))(v18, v8, v5);
  swift_endAccess();
  sub_1D5FCC7A8((uint64_t)v14);

}

- (_TtC7NewsUI212MockHeadline)init
{
  _TtC7NewsUI212MockHeadline *result;

  result = (_TtC7NewsUI212MockHeadline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  v3 = sub_1D6E15ECC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
