@implementation HUDashboardLayoutManager

- (id)buildCamerasMosaicSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5
{
  return sub_1B8E42084(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, id))sub_1B8E4213C);
}

- (id)generateCameraLayoutOptionsFor:(id)a3
{
  HUDashboardLayoutManager *v4;
  id v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    v4 = self;
    v5 = a3;
    v6 = HUCellSizeSubclassForViewSizeSubclass((unint64_t)objc_msgSend(v5, sel_viewSizeSubclass));
    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_, v6, objc_msgSend(v5, sel_viewSizeSubclass));

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_, 1, 1);
  }
  return v7;
}

- (HUDashboardLayoutManager)initWithDelegate:(id)a3
{
  _QWORD *v3;
  HUDashboardLayoutManager *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts) = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardLayoutManager();
  swift_unknownObjectRetain();
  v4 = -[HUCollectionLayoutManager init](&v6, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

- (void)registerSectionDecorationViewsWithLayout:(id)a3
{
  uint64_t ObjCClassFromMetadata;
  id v6;
  HUDashboardLayoutManager *v7;
  id v8;

  type metadata accessor for TransparentBlackBackgroundDecorationView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = a3;
  v7 = self;
  v8 = (id)sub_1B93EDD84();
  objc_msgSend(v6, sel_registerClass_forDecorationViewOfKind_, ObjCClassFromMetadata, v8);

}

- (id)configurationWithContext:(id)a3 traitCollection:(id)a4
{
  void *v7;
  id v8;
  id v9;
  HUDashboardLayoutManager *v10;
  id v11;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_defaultConfiguration);
  objc_msgSend(v11, sel_setContentInsetsReference_, 3);
  objc_msgSend(v11, sel_setInterSectionSpacing_, 20.0);

  return v11;
}

- (id)buildSectionWithIdentifier:(id)a3 context:(id)a4 layoutEnvironment:(id)a5
{
  id v8;
  id v9;
  HUDashboardLayoutManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = sub_1B8E3D9B4(v8, (uint64_t)v9, a5);

  swift_unknownObjectRelease();
  return v11;
}

- (BOOL)isAdaptiveTileStyleInSectionIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HUDashboardLayoutManager *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B8EA6D34((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (id)buildNowPlayingSectionFor:(id)a3 sectionIdentifier:(id)a4 :(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HUDashboardLayoutManager *v10;
  id v11;

  v7 = sub_1B93EDDB4();
  v9 = v8;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = sub_1B8EA68E4(v7, v9, a5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v11;
}

- (HUGridSize)favoritesSectionGridSize
{
  int64_t v2;
  int64_t v3;
  HUGridSize result;

  v2 = 1;
  v3 = 2;
  result.columnsAcross = v3;
  result.rowsDown = v2;
  return result;
}

- (HUDashboardLayoutManager)init
{
  HUDashboardLayoutManager *result;

  result = (HUDashboardLayoutManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (id)buildResponsiveGridCamerasSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5
{
  return sub_1B8E42084(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, id))sub_1B8FF4A48);
}

@end
