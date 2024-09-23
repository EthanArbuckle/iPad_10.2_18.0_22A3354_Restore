@implementation AXSDSecureControllerImplementation

- (NSSet)currentDetectionTypes
{
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v2;
  void *v3;

  v2 = self;
  sub_21AD04E90();

  type metadata accessor for AXSDSoundDetectionType();
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  v3 = (void *)sub_21AD24024();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (_TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation)init
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  objc_super v8;

  if (qword_2551178E0 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = sub_21AD23EE0();
  v5 = sub_21AD2406C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21ACD4000, v4, v5, "Initializing Secure Sound Detection Controller", v6, 2u);
    MEMORY[0x220756ED0](v6, -1, -1);
  }

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return -[AXSDSecureBaseControllerImplementation init](&v8, sel_init);
}

- (void)dealloc
{
  uint64_t v2;
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_2551178E0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_21AD23EEC();
  __swift_project_value_buffer(v4, (uint64_t)qword_2551180B8);
  v5 = sub_21AD23EE0();
  v6 = sub_21AD2406C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21ACD4000, v5, v6, "Deinitializing Secure Sound Detection Controller", v7, 2u);
    MEMORY[0x220756ED0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  -[AXSDSecureBaseControllerImplementation dealloc](&v8, sel_dealloc);
}

- (void)addWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21AD05530(v4);

}

- (void)removeWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21AD05620(v4);

}

- (void)removeAllListenTypes
{
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0DDB4();

}

- (void)startListening
{
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0DFDC();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI34AXSDSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0E224();

}

@end
