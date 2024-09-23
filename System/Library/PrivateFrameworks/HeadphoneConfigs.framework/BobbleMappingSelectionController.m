@implementation BobbleMappingSelectionController

- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1DB3BC340();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16HeadphoneConfigs32BobbleMappingSelectionController *)BobbleMappingSelectionController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC16HeadphoneConfigs32BobbleMappingSelectionController)initWithCoder:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs32BobbleMappingSelectionController *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase) = 2;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = 0;
  v4 = a3;

  result = (_TtC16HeadphoneConfigs32BobbleMappingSelectionController *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (id)specifiers
{
  _TtC16HeadphoneConfigs32BobbleMappingSelectionController *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = (unint64_t)BobbleMappingSelectionController.specifiers()();

  if (v3)
  {
    v4 = (void *)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16HeadphoneConfigs32BobbleMappingSelectionController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1DB3BBD64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB3BBD40();
  v10 = a3;
  v11 = self;
  v12 = (void *)BobbleMappingSelectionController.tableView(_:cellForRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)listItemSelected:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16HeadphoneConfigs32BobbleMappingSelectionController *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFC0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DB3BBD40();
    v8 = sub_1DB3BBD64();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1DB3BBD64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  BobbleMappingSelectionController.listItemSelected(_:)((uint64_t)v7);

  sub_1DB3894E4((uint64_t)v7, &qword_1F02DAFC0);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
