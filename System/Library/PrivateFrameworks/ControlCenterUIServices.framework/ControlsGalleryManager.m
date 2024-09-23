@implementation ControlsGalleryManager

- (_TtC23ControlCenterUIServices22ControlsGalleryManager)init
{
  _TtC23ControlCenterUIServices22ControlsGalleryManager *result;

  result = (_TtC23ControlCenterUIServices22ControlsGalleryManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics));
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 32;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  id v4;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_238506084();
  v7 = v6;

  return v7;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_238503630(v4);

  return v6;
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  return 1;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (id)gridSizeClassDomainForIconView:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
}

- (BOOL)controlHostViewControllerShouldPerformPrimaryAction:(id)a3
{
  id v4;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v5;

  v4 = a3;
  v5 = self;
  sub_238503C98(v4);

  return 0;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4
{
  return (id)sub_238506B48();
}

- (id)customApplicationWidgetCollectionsForAddWidgetSheetConfigurationManager:(id)a3
{
  id v4;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = sub_23850612C();

  if (v6)
  {
    sub_2384F5DDC(0, &qword_2569164A0);
    v7 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)addWidgetSheetConfigurationManager:(id)a3 isDescriptorSupported:(id)a4
{
  id v6;
  id v7;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2385061E4(v7);
  v10 = v9;

  return v10 & 1;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return (SBHWidgetDragHandling *)0;
}

- (id)addWidgetSheetViewController:(id)a3 widgetIconForGalleryItem:(id)a4
{
  id v6;
  _TtC23ControlCenterUIServices22ControlsGalleryManager *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2385065B0((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

@end
