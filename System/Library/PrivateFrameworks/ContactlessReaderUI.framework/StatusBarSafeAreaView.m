@implementation StatusBarSafeAreaView

- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithCoder:(id)a3
{
  _OWORD *v4;
  char *v5;
  _OWORD *v6;
  id v7;
  _TtC19ContactlessReaderUI21StatusBarSafeAreaView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_safeRect);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_cornerRadii);
  *v6 = 0u;
  v6[1] = 0u;
  v7 = a3;

  result = (_TtC19ContactlessReaderUI21StatusBarSafeAreaView *)sub_22F98F394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _OWORD v7[2];
  char v8;

  memset(v7, 0, sizeof(v7));
  v8 = 1;
  v6 = a1;
  sub_22F9881B4(0, (uint64_t)v7, 0);
  v1 = &v6[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_safeRect];
  *(_QWORD *)v1 = v2;
  *((_QWORD *)v1 + 1) = v3;
  *((_QWORD *)v1 + 2) = v4;
  *((_QWORD *)v1 + 3) = v5;

}

- (_TtC19ContactlessReaderUI21StatusBarSafeAreaView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC19ContactlessReaderUI21StatusBarSafeAreaView *result;

  v4 = a4;
  result = (_TtC19ContactlessReaderUI21StatusBarSafeAreaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  if (a3)
    objc_msgSend(a3, sel_layoutSubviews);
  else
    __break(1u);
}

- (uint64_t)viewSafeAreaInsetsDidChange
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255E206E0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255E1DB00 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v0, (uint64_t)qword_255E295B0);
  sub_22F87BC08(v3, (uint64_t)v2);
  v4 = sub_22F98DAA4();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v4) == 1)
    return sub_22F87BC50((uint64_t)v2);
  v7 = sub_22F98DA8C();
  v8 = sub_22F98F07C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22F85B000, v7, v8, "safeAreaInsetsDidChange", v9, 2u);
    MEMORY[0x2348A6838](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v2, v4);
}

@end
