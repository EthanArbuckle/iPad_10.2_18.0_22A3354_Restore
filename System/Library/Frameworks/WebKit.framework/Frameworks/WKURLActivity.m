@implementation WKURLActivity

- (NSURL)fallbackURL
{
  uint64_t v3;
  char *v4;
  WKURLActivity *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256236208);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v5 = self;
  sub_2354A3858();
  swift_endAccess();
  v6 = sub_2354A37A4();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v4, 0, 1, v6);

  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    v8 = (void *)sub_2354A378C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  return (NSURL *)v8;
}

- (WKURLActivity)init
{
  WKURLActivity *result;

  result = (WKURLActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___WKURLActivity_urlActivity;
  v3 = sub_2354A3864();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
