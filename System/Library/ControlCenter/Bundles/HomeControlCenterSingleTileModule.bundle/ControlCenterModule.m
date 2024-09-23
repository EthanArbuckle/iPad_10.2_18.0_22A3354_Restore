@implementation ControlCenterModule

- (_TtC33HomeControlCenterSingleTileModule19ControlCenterModule)init
{
  return (_TtC33HomeControlCenterSingleTileModule19ControlCenterModule *)ControlCenterModule.init()();
}

- (NSString)moduleDescription
{
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = (void *)sub_232C0F4B4();
  v4 = (id)HULocalizedString();

  sub_232C0F4C0();
  v5 = (void *)sub_232C0F4B4();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (unint64_t)supportedGridSizeClasses
{
  return 21;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)setContentModuleContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context) = (Class)a3;
  v3 = a3;

}

- (id)contentViewControllerForContext:(id)a3
{
  id v4;
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s33HomeControlCenterSingleTileModule0bcF0C21contentViewController3forSo011CCUIContentf7ContenthI0_So06UIViewI0CXcSo0kF19PresentationContextCSg_tF_0();

  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_viewController));
  swift_release();
  swift_unknownObjectRelease();
}

- (CCUIContentModuleContext)contentModuleContext
{
  return (CCUIContentModuleContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_context));
}

- (void)controlCenterModuleViewController:(id)a3 moduleWillAppear:(BOOL)a4
{
  id v5;
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v6;
  id v7;

  v5 = a3;
  v6 = self;
  sub_232C0B090();
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  objc_msgSend(v7, sel_enterModuleViewWillAppear);

}

- (void)controlCenterModuleViewController:(id)a3 didChangeDisplayedItems:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v8;

  sub_232C0E738(0, &qword_255FF5860);
  sub_232C0E5B4();
  v6 = sub_232C0F52C();
  v7 = a3;
  v8 = self;
  ControlCenterModule.controlCenterModuleViewController(_:didChangeDisplayedItems:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)controlCenterModuleViewController:(id)a3 moduleDidDisappear:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v9;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  v9 = self;
  v8 = objc_msgSend(v6, sel_sharedManager);
  objc_msgSend(v8, sel_exitModuleViewDidDisappear);

  sub_232C0C0D4();
}

- (void)launchHomeAppForControlCenterModuleViewController:(id)a3
{
  id v4;
  _TtC33HomeControlCenterSingleTileModule19ControlCenterModule *v5;

  v4 = a3;
  v5 = self;
  ControlCenterModule.launchHomeApp(for:)(v4);

}

- (BOOL)isDeviceUnlockedForControlCenterModuleViewController:(id)a3
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC33HomeControlCenterSingleTileModule19ControlCenterModule_lockState)
      && sub_232C0EE28();
}

@end
