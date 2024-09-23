@implementation TrackingStand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore13TrackingStand)initWithInfo:(id)a3 systems:(id)a4
{
  uint64_t v5;

  type metadata accessor for System();
  v5 = sub_23A690F18();
  return (_TtC11DockKitCore13TrackingStand *)TrackingStand.init(info:systems:)(a3, v5);
}

- (void)dealloc
{
  _TtC11DockKitCore13TrackingStand *v2;

  v2 = self;
  TrackingStand.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  uint64_t v12;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11DockKitCore13TrackingStand__trackingButtonSemaphore));
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand_timeElapsedSinceStartup;
  v4 = sub_23A6906D8();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  v6 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__intelligentTracking;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25699F060);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  v5((char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand_lastSummaryPrintTime, v4);
  swift_release();
  swift_release();
  sub_23A62C940(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC11DockKitCore13TrackingStand____lazy_storage___trackingSensor));
  v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__selectedFaceIDs;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25699F0C0);
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10((char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__selectedBodyIDs, v9);
  swift_release();
  swift_release();
  sub_23A62AE70(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore13TrackingStand_currentObservation), *(void **)&self->super._xpcConnection[OBJC_IVAR____TtC11DockKitCore13TrackingStand_currentObservation]);
  swift_release();
  swift_release();
  v11 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__lastLatency;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25699FC90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore13TrackingStand *v5;

  v4 = a3;
  v5 = self;
  sub_23A5F6368(v4);

}

- (_TtC11DockKitCore13TrackingStand)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore13TrackingStand *)TrackingStand.init(coder:)(a3);
}

- (void)startTrackingWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore13TrackingStand *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25699FF48;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699FF50;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699FF58, (uint64_t)v12);
  swift_release();
}

- (void)stopTracking
{
  _TtC11DockKitCore13TrackingStand *v2;

  v2 = self;
  sub_23A62101C();

}

- (void)trackObservationsWithMetadata:(_TtC11DockKitCore16FollowerMetadata *)a3 image:(CIImage *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore16FollowerMetadata *v17;
  CIImage *v18;
  _TtC11DockKitCore13TrackingStand *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25699FF28;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25699FF30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_25699FF38, (uint64_t)v16);
  swift_release();
}

- (id)getDiagnostics
{
  _TtC11DockKitCore13TrackingStand *v2;
  void *v3;

  v2 = self;
  swift_retain();
  v3 = (void *)sub_23A681EE4();

  swift_release();
  return v3;
}

- (id)dumpStateWithDirectory:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC11DockKitCore13TrackingStand *v14;
  _QWORD v16[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25699F060);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25699FF18);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23A6905F4();
    v12 = sub_23A690600();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_23A690600();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__intelligentTracking, v5);
  v14 = self;
  sub_23A6909CC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v16[1])
  {
    sub_23A690930();

    swift_release();
  }
  else
  {

  }
  sub_23A5C921C((uint64_t)v11, &qword_25699FF18);
  return 0;
}

- (BOOL)searchWithCalibrate:(BOOL)a3
{
  _TtC11DockKitCore13TrackingStand *v3;
  BOOL v4;

  v3 = self;
  v4 = sub_23A62BD40((uint64_t)&unk_250B77E70, (uint64_t)&unk_25699F070);

  return v4;
}

- (BOOL)stopSearchWithCalibrate:(BOOL)a3
{
  _TtC11DockKitCore13TrackingStand *v3;
  BOOL v4;

  v3 = self;
  v4 = sub_23A62BD40((uint64_t)&unk_250B77E48, (uint64_t)&unk_25699F068);

  return v4;
}

- (BOOL)returnToBase
{
  _TtC11DockKitCore13TrackingStand *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_23A629C74();

  return v3;
}

- (BOOL)stopReturnToBase
{
  _TtC11DockKitCore13TrackingStand *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_23A629D18();

  return v3;
}

- (void)flip180WithClockwise:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore13TrackingStand *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25699FF00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A03C0;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_25699FF10, (uint64_t)v14);
  swift_release();
}

@end
