@implementation AXSDSecureBaseControllerImplementation

- (BOOL)isListening
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v2 + 16) != 0;
}

- (BOOL)isSecure
{
  return 1;
}

- (_TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation *)AXSDSecureBaseControllerImplementation.init()();
}

- (void)dealloc
{
  uint64_t v2;
  _TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation *v3;
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
    _os_log_impl(&dword_21ACD4000, v5, v6, "Deinitializing Base Secure Sound Detection Controller", v7, 2u);
    MEMORY[0x220756ED0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  -[AXSDSecureBaseControllerImplementation dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation *v2;

  v2 = self;
  sub_21AD0DFDC();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation *v2;

  v2 = self;
  sub_21AD0E224();

}

@end
