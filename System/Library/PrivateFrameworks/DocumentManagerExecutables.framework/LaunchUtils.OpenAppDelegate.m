@implementation LaunchUtils.OpenAppDelegate

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6520);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_21EB022DC();
    v10 = sub_21EB02300();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_21EB02300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  sub_21EAE964C(a3, (uint64_t)v9);

  sub_21EA59E08((uint64_t)v9, (uint64_t *)&unk_2540A6520);
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v5;
  _TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_21EAE309C(a3);

}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v7;
  _TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a4;
  sub_21EAE327C(a3, (uint64_t)a4);

}

- (_TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate)init
{
  _TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *result;

  result = (_TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
