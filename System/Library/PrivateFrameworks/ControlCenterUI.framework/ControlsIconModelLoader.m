@implementation ControlsIconModelLoader

- (_TtC15ControlCenterUI23ControlsIconModelLoader)init
{
  _TtC15ControlCenterUI23ControlsIconModelLoader *result;

  result = (_TtC15ControlCenterUI23ControlsIconModelLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager));
  swift_unknownObjectRelease();
}

- (unint64_t)maxListCountForFoldersForIconModel:(id)a3
{
  return 15;
}

- (SBHIconGridSize)iconModel:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  id v5;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v6;
  SBHIconGridSize v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = self;
  v7 = (SBHIconGridSize)sub_1CFBF88F8();
  v9 = v8;
  v11 = v10;

  return v7;
}

- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  _BOOL4 IsPortrait;
  id v7;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  IsPortrait = UIInterfaceOrientationIsPortrait(a4);
  v7 = a3;
  v8 = self;
  v9 = sub_1CFBF88F8();
  v11 = v10;
  v13 = v12;

  if (IsPortrait)
    return HIWORD(v9);
  else
    return (unsigned __int16)v9;
}

- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  _BOOL4 IsPortrait;
  id v7;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  IsPortrait = UIInterfaceOrientationIsPortrait(a4);
  v7 = a3;
  v8 = self;
  v9 = sub_1CFBF88F8();
  v11 = v10;
  v13 = v12;

  if (IsPortrait)
    return (unsigned __int16)v9;
  else
    return HIWORD(v9);
}

- (id)gridSizeClassSizesForIconModel:(id)a3
{
  id v4;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  sub_1CFBF88F8();
  v7 = v6;
  v9 = v8;

  return v7;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  id v5;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = self;
  sub_1CFBF88F8();
  v8 = v7;
  v10 = v9;

  return v10;
}

- (int64_t)iconModel:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4
{
  return 4;
}

- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return 3;
}

- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  void *v4;

  sub_1CFBFA894();
  v4 = (void *)sub_1CFBFA870();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)iconModel:(id)a3 iconDataSourceForArchiveRepresentation:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC15ControlCenterUI23ControlsIconModelLoader *v8;
  id v9;

  v6 = sub_1CFBFA84C();
  v7 = a3;
  v8 = self;
  v9 = sub_1CFBF6E50(v6);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)gridSizeClassDomainForIconModel:
{
  return objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
}

- (id)iconModel:(void *)a3 archiveRepresentationForIconDataSource:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  swift_unknownObjectRetain();
  v5 = a1;
  v6 = sub_1CFBF9174();

  swift_unknownObjectRelease();
  if (v6)
  {
    v7 = (void *)sub_1CFBFA840();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)archiveVersionForIconModel:
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, 1000);
}

@end
