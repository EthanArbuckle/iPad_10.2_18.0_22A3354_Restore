@implementation WidgetExtensionXPCServer.ExportedObject

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject_xpcConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject__queue));
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1908AA7E8(self, (int)a2, a3, (uint64_t)&unk_1E2CCB398, (uint64_t)sub_1908B48F4, (void (*)(uint64_t, uint64_t))sub_1908AE8F8);
}

- (void)invalidate
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject_xpcConnection), sel_invalidate);
}

- (void)performCleanup
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject_xpcConnection), sel_invalidate);
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1908AA7E8(self, (int)a2, a3, (uint64_t)&unk_1E2CCB410, (uint64_t)sub_1908CE69C, (void (*)(uint64_t, uint64_t))sub_1908C9D9C);
}

- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v10;

  v5 = _Block_copy(a4);
  v6 = sub_190A47ADC();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_1908BEE4C(v6, v8, (uint64_t)sub_1908CE66C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for PlaceholderRequest();
  v6 = sub_190A47C5C();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_1908CA2D8(v6, (uint64_t)sub_1908CEBBC, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v10;

  v5 = a4;
  v7 = _Block_copy(a5);
  type metadata accessor for TimelineRequest();
  v8 = sub_190A47C5C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_1908C1404(v8, v5, 0, (uint64_t)sub_1908CEBBC, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  void *v4;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1908CC6C0((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1908CC810(v8, (uint64_t)sub_1908CEB50, v7);

  swift_release();
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v11;

  v7 = _Block_copy(a5);
  v8 = sub_190A47ADC();
  v10 = v9;
  _Block_copy(v7);
  swift_unknownObjectRetain();
  v11 = self;
  sub_1908CCA34(v8, v10, (uint64_t)a4, (uint64_t)v11, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject)init
{
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *result;

  result = (_TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for ControlTemplateRequest();
  v6 = sub_190A47C5C();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_1908C3ACC(v6, 0, (uint64_t)sub_1908CDA5C, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)pushTokensDidChange:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF6B9F8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_190A47D7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_190A47D64();
  v13 = a3;
  v14 = self;
  swift_retain();
  v15 = sub_190A47D58();
  v16 = (_QWORD *)swift_allocObject();
  v17 = MEMORY[0x1E0DF06E8];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v13;
  v16[5] = sub_1908CEBBC;
  v16[6] = v11;
  sub_1908C5D18((uint64_t)v9, (uint64_t)&unk_1EE1EC880, (uint64_t)v16);
  swift_release();
  sub_1908AA544((uint64_t)v9, &qword_1ECF6B9F8);

  swift_release();
}

- (void)setControlState:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF6B9F8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_190A47D7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  sub_190A47D64();
  v13 = a3;
  v14 = self;
  v15 = v13;
  swift_retain();
  v16 = sub_190A47D58();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x1E0DF06E8];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  v17[5] = v15;
  v17[6] = sub_1908CEBBC;
  v17[7] = v11;
  sub_1908C5D18((uint64_t)v9, (uint64_t)&unk_1EE1EC850, (uint64_t)v17);
  swift_release();
  sub_1908AA544((uint64_t)v9, &qword_1ECF6B9F8);

  swift_release();
}

- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _TtCC9WidgetKit24WidgetExtensionXPCServer14ExportedObject *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for ActivityWidgetRequest(0);
  v6 = sub_190A47C5C();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_1908C75F8(v6, 0, (uint64_t)sub_1908B48F4, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

@end
