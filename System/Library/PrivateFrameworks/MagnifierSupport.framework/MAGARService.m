@implementation MAGARService

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport12MAGARService *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22741ABB0(v6, v7);

}

- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4
{
  sub_22741B1F0(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_2558D9CE0, 0x24BDB1568, sub_22741AF00);
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  sub_22741B1F0(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_2558D9CD8, 0x24BDB1470, sub_22741B03C);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  sub_22741B1F0(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_2558D9CD8, 0x24BDB1470, sub_22741B270);
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  sub_22741B1F0(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_2558D9CD8, 0x24BDB1470, sub_22741B348);
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12MAGARService *v5;

  v4 = a3;
  v5 = self;
  sub_22741B5A0(v4);

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4;
  _TtC16MagnifierSupport12MAGARService *v5;

  v4 = a3;
  v5 = self;
  sub_22741BA58(v4);

}

- (_TtC16MagnifierSupport12MAGARService)init
{
  _TtC16MagnifierSupport12MAGARService *result;

  result = (_TtC16MagnifierSupport12MAGARService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_arRecordingConfiguration));

  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService____lazy_storage___currentRecordingURL, (uint64_t *)&unk_2558D9CE8);
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_lastRecordingURL, &qword_2540B7B10);
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_lastScreenRecordingURL, &qword_2540B7B10);
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC16MagnifierSupport12MAGARService *v14;
  id v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_detectionModeAutomationRunning) == 1)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_detectionModeAutomationRunning) = 0;
  }
  else
  {
    v12 = sub_22758E4C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = self;
    v14 = self;
    v15 = a3;
    sub_2274193DC((uint64_t)v11, (uint64_t)&unk_2558D9CD0, (uint64_t)v13);

    swift_release();
  }
}

@end
