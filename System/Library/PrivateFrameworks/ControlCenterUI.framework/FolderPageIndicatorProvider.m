@implementation FolderPageIndicatorProvider

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v6;
  id v7;
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  if ((objc_msgSend(v6, sel_isExtraList_, v7) & 1) == 0)
    objc_msgSend(v7, sel_addListObserver_, v8);
  sub_1CFBB8FB8();

}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  id v12;
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *v13;
  uint64_t v14;

  v7 = sub_1CFBFA6F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFBBAA24(0, &qword_1EFBF0908);
  v11 = sub_1CFBFA900();
  sub_1CFBFA6E4();
  v12 = a3;
  v13 = self;
  sub_1CFBBA614(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)folder:(id)a3 didMoveList:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v8;
  id v9;
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1CFBB8FB8();

}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CFBB8FB8();

}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *v11;

  if (a3)
  {
    v8 = a4;
    v9 = a5;
    v11 = self;
    v10 = a3;
    sub_1CFBB90B4(v10);

  }
  else
  {
    __break(1u);
  }
}

- (void)iconList:(void *)a3 didAddIcon:(void *)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v8 = a1;
    v7 = a3;
    sub_1CFBB90B4(v7);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC15ControlCenterUI27FolderPageIndicatorProvider)init
{
  _TtC15ControlCenterUI27FolderPageIndicatorProvider *result;

  result = (_TtC15ControlCenterUI27FolderPageIndicatorProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI27FolderPageIndicatorProvider_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
