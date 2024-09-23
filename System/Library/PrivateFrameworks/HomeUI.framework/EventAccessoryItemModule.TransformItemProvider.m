@implementation EventAccessoryItemModule.TransformItemProvider

- (id)_subclass_transformItem:(id)a3
{
  id v4;
  _TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8FC0180(v4);

  if (v6)
  {
    sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
    sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
    v7 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *)sub_1B8FC0774(a3, (uint64_t)sub_1B8FC1D18, v6);
}

- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3
{
  id v3;
  _TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *v4;

  v3 = a3;
  v4 = (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *)sub_1B8FC1950((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
