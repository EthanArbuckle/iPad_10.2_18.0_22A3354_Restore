@implementation ControlCenterModuleLayoutManager

- (HUGridSize)gridSizeForItem:(id)a3
{
  id v4;
  _TtC6HomeUI32ControlCenterModuleLayoutManager *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  HUGridSize result;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F049F8();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.columnsAcross = v10;
  result.rowsDown = v9;
  return result;
}

- (_TtC6HomeUI32ControlCenterModuleLayoutManager)init
{
  _TtC6HomeUI32ControlCenterModuleLayoutManager *result;

  result = (_TtC6HomeUI32ControlCenterModuleLayoutManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E968A4((uint64_t)self + OBJC_IVAR____TtC6HomeUI32ControlCenterModuleLayoutManager_config, type metadata accessor for ControlCenterModuleConfiguration);
}

@end
