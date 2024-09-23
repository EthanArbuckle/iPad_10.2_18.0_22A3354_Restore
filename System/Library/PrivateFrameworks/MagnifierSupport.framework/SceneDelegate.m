@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MagnifierSupport13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_22751E45C(v8, v10);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22751ED18(v7);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, uint64_t);
  id v9;
  id v10;
  _TtC16MagnifierSupport13SceneDelegate *v11;

  v8 = (void (**)(void *, uint64_t))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_22751BFAC(a4);
  v8[2](v8, 1);
  _Block_release(v8);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC16MagnifierSupport13SceneDelegate *v8;

  sub_22730BA80(0, &qword_2540B9E98);
  sub_22751FB50((unint64_t *)&unk_2540B9EA0, &qword_2540B9E98);
  v6 = sub_22758E5B0();
  v7 = a3;
  v8 = self;
  sub_22751C57C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)updateAppearanceForReduceTransparency:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16MagnifierSupport13SceneDelegate *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B00);
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22758C5F4();
    v12 = sub_22758C618();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_22758C618();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = self;
  sub_22751E0D4();

  sub_22731A1A4((uint64_t)v11, &qword_2540B7B00);
}

- (_TtC16MagnifierSupport13SceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16MagnifierSupport13SceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

- (uint64_t)sceneDidBecomeActive:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_type_t v21;
  uint8_t *v22;
  os_signpost_id_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v0 = sub_22758CF18();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12);
  v14 = (char *)&v26 - v13;
  if (qword_2558D4A00 != -1)
    swift_once();
  v15 = sub_22758CF9C();
  __swift_project_value_buffer(v15, (uint64_t)qword_2558D6128);
  v16 = sub_22758CF84();
  v17 = sub_22758E6B8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_2272F4000, v16, v17, "Scene Became Active", v18, 2u);
    MEMORY[0x2276B3D50](v18, -1, -1);
  }

  if (qword_2558D4AC8 != -1)
    swift_once();
  v19 = sub_22758CF3C();
  __swift_project_value_buffer(v19, (uint64_t)qword_2558D66B8);
  sub_22758CF0C();
  v20 = sub_22758CF24();
  v21 = sub_22758E814();
  if ((sub_22758EA0C() & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v14, v0);
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    v23 = sub_22758CF00();
    _os_signpost_emit_with_name_impl(&dword_2272F4000, v20, v21, v23, "SceneBecameActive", ", v22, 2u);
    MEMORY[0x2276B3D50](v22, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v1 + 8);
    v24(v14, v0);
    return ((uint64_t (*)(char *, uint64_t))v24)(v7, v0);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
}

- (void)sceneWillResignActive:
{
  id v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  objc_msgSend(v0, sel_setShortcutItems_, 0);

  if (qword_2558D4A00 != -1)
    swift_once();
  v1 = sub_22758CF9C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558D6128);
  oslog = sub_22758CF84();
  v2 = sub_22758E6B8();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2272F4000, oslog, v2, "Scene Will Resign Active", v3, 2u);
    MEMORY[0x2276B3D50](v3, -1, -1);
  }

}

- (void)sceneWillEnterForeground:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_type_t v21;
  uint8_t *v22;
  os_signpost_id_t v23;
  void (*v24)(char *, uint64_t);
  id v25;
  uint64_t v26;

  v0 = sub_22758CF18();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12);
  v14 = (char *)&v26 - v13;
  if (qword_2558D4A00 != -1)
    swift_once();
  v15 = sub_22758CF9C();
  __swift_project_value_buffer(v15, (uint64_t)qword_2558D6128);
  v16 = sub_22758CF84();
  v17 = sub_22758E6B8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_2272F4000, v16, v17, "Scene Will Enter Foreground", v18, 2u);
    MEMORY[0x2276B3D50](v18, -1, -1);
  }

  if (qword_2558D4AC8 != -1)
    swift_once();
  v19 = sub_22758CF3C();
  __swift_project_value_buffer(v19, (uint64_t)qword_2558D66B8);
  sub_22758CF0C();
  v20 = sub_22758CF24();
  v21 = sub_22758E814();
  if ((sub_22758EA0C() & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v7, v14, v0);
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    v23 = sub_22758CF00();
    _os_signpost_emit_with_name_impl(&dword_2272F4000, v20, v21, v23, "SceneEnterFG", ", v22, 2u);
    MEMORY[0x2276B3D50](v22, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v1 + 8);
    v24(v14, v0);
    v24(v7, v0);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
  v25 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v25, sel_beginGeneratingDeviceOrientationNotifications);

}

- (void)sceneDidEnterBackground:
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;

  if (qword_2558D4A00 != -1)
    swift_once();
  v0 = sub_22758CF9C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2558D6128);
  v1 = sub_22758CF84();
  v2 = sub_22758E6B8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2272F4000, v1, v2, "Scene Did Enter Background", v3, 2u);
    MEMORY[0x2276B3D50](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v4, sel_endGeneratingDeviceOrientationNotifications);

}

@end
