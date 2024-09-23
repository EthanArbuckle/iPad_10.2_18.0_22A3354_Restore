@implementation CoreMLModelWriterService

+ (void)registerCapabilities:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = (id)sub_222BC7E10();
  objc_msgSend(v4, sel_publishCapability_withVersion_forClass_, v5, 4, swift_getObjCClassFromMetadata());

}

- (_TtC24DVTInstrumentsFoundation24CoreMLModelWriterService)initWithChannel:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC24DVTInstrumentsFoundation24CoreMLModelWriterService *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  _TtC24DVTInstrumentsFoundation24CoreMLModelWriterService *v10;
  objc_super v12;

  v4 = qword_25576F488;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  v7 = qword_255770C70;
  type metadata accessor for CoreMLModelWriterServiceMessageHandler();
  v8 = (objc_class *)swift_allocObject();
  *((_QWORD *)v8 + 5) = type metadata accessor for CoreMLPerfCoordinator();
  *((_QWORD *)v8 + 6) = &protocol witness table for CoreMLPerfCoordinator;
  *((_QWORD *)v8 + 2) = v7;
  *((_QWORD *)v8 + 7) = v5;
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC24DVTInstrumentsFoundation24CoreMLModelWriterService_messageHandler) = v8;
  v9 = v5;
  swift_retain();

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for CoreMLModelWriterService();
  v10 = -[DTXService initWithChannel:](&v12, sel_initWithChannel_, v9);

  return v10;
}

- (void)messageReceived:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CoreMLModelWriterService();
  v4 = a3;
  v5 = v6.receiver;
  -[DTXService messageReceived:](&v6, sel_messageReceived_, v4);
  sub_222BB73D8(v4);

}

- (void)dealloc
{
  uint64_t v2;
  _TtC24DVTInstrumentsFoundation24CoreMLModelWriterService *v3;
  uint64_t v4;
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_25576F4A0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_222BC7DA4();
  sub_222BAC438(v4, (uint64_t)qword_255770C80);
  v5 = sub_222BC7E94();
  v6 = sub_222BC7D8C();
  if (os_log_type_enabled(v6, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_222B17000, v6, v5, "ModelWriterService - deinit", v7, 2u);
    MEMORY[0x22767A418](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CoreMLModelWriterService();
  -[CoreMLModelWriterService dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC24DVTInstrumentsFoundation24CoreMLModelWriterService)init
{
  _TtC24DVTInstrumentsFoundation24CoreMLModelWriterService *result;

  result = (_TtC24DVTInstrumentsFoundation24CoreMLModelWriterService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
