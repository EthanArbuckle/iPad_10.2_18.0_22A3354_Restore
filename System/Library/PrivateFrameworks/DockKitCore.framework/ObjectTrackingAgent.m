@implementation ObjectTrackingAgent

- (BOOL)customInferenceEnabled
{
  uint64_t v2;
  ObjectTrackingAgent *v3;
  char v4;
  char v5;

  v2 = qword_25699DC70;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = byte_2569AD6E8;
  if (byte_2569AD6E8 == 2)
  {
    v5 = *((_BYTE *)&v3->super.isa + OBJC_IVAR___ObjectTrackingAgent_customInferenceEnabledConfig);

  }
  else
  {

    return v4 & 1;
  }
  return v5;
}

+ (BOOL)trackingSummaryDebugEnabled
{
  if (qword_2542D25F8 != -1)
    swift_once();
  return byte_2569AD6E9;
}

- (double)publishSummaryPeriod
{
  return 0.05;
}

- (NSDate)lastSummaryPublishTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_23A6906D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime, v3);
  v7 = (void *)sub_23A690684();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v7;
}

- (void)setLastSummaryPublishTime:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_23A6906D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A6906A8();
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))((char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime, v7, v4);
}

- (ObjectTrackingAgent)init
{
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init()();
}

- (ObjectTrackingAgent)initWithAppID:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23A690E1C();
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(appID:)(v3, v4);
}

- (ObjectTrackingAgent)initWithConfig:(id)a3
{
  uint64_t v3;

  v3 = sub_23A690DBC();
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(config:)(v3);
}

- (ObjectTrackingAgent)initWithTrackerConfig:(id)a3
{
  return (ObjectTrackingAgent *)ObjectTrackingAgent.init(trackerConfig:)(a3);
}

- (void)dealloc
{
  ObjectTrackingAgent *v2;

  v2 = self;
  ObjectTrackingAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_23A5F234C((uint64_t)self + OBJC_IVAR___ObjectTrackingAgent_delegate);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ObjectTrackingAgent_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_release();

  v5 = (char *)self + OBJC_IVAR___ObjectTrackingAgent_lastSummaryPublishTime;
  v6 = sub_23A6906D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)isTrackingWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699F010;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699F018;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699F020, (uint64_t)v12);
  swift_release();
}

- (void)trackWithMetadata:(NSArray *)a3 image:(CIImage *)a4 cameraPortType:(NSString *)a5 cameraIntrinsics:(NSArray *)a6 referenceDimensions:(CGSize)a7 orientation:(int)a8 completionHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  NSArray *v26;
  CIImage *v27;
  NSString *v28;
  NSArray *v29;
  ObjectTrackingAgent *v30;
  uint64_t v31;

  height = a7.height;
  width = a7.width;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a9);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a3;
  *(_QWORD *)(v22 + 24) = a4;
  *(_QWORD *)(v22 + 32) = a5;
  *(_QWORD *)(v22 + 40) = a6;
  *(CGFloat *)(v22 + 48) = width;
  *(CGFloat *)(v22 + 56) = height;
  *(_DWORD *)(v22 + 64) = a8;
  *(_QWORD *)(v22 + 72) = v21;
  *(_QWORD *)(v22 + 80) = self;
  v23 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_25699EFF0;
  v24[5] = v22;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_25699EFF8;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = self;
  sub_23A67DFCC((uint64_t)v20, (uint64_t)&unk_25699F000, (uint64_t)v25);
  swift_release();
}

- (void)trackWithFocusObservation:(DKFocusObservation *)a3 metadata:(NSArray *)a4 image:(CIImage *)a5 cameraPortType:(NSString *)a6 cameraIntrinsics:(NSArray *)a7 referenceDimensions:(CGSize)a8 orientation:(int)a9 completionHandler:(id)a10
{
  CGFloat height;
  CGFloat width;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  DKFocusObservation *v27;
  NSArray *v28;
  CIImage *v29;
  NSString *v30;
  NSArray *v31;
  ObjectTrackingAgent *v32;
  uint64_t v33;

  height = a8.height;
  width = a8.width;
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = _Block_copy(a10);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a3;
  *(_QWORD *)(v23 + 24) = a4;
  *(_QWORD *)(v23 + 32) = a5;
  *(_QWORD *)(v23 + 40) = a6;
  *(_QWORD *)(v23 + 48) = a7;
  *(CGFloat *)(v23 + 56) = width;
  *(CGFloat *)(v23 + 64) = height;
  *(_DWORD *)(v23 + 72) = a9;
  *(_QWORD *)(v23 + 80) = v22;
  *(_QWORD *)(v23 + 88) = self;
  v24 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v21, 1, 1, v24);
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_25699EFD0;
  v25[5] = v23;
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = &unk_25699EFD8;
  v26[5] = v25;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v31 = a7;
  v32 = self;
  sub_23A67DFCC((uint64_t)v21, (uint64_t)&unk_25699EFE0, (uint64_t)v26);
  swift_release();
}

- (id)dockKitFocusObservationFrom:(id)a3
{
  id v4;
  ObjectTrackingAgent *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_23A5EFDE0(v4);

  return v6;
}

- (id)getDockCoreObservationsFrom:(id)a3 cameraPort:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  ObjectTrackingAgent *v10;
  void *v11;

  v6 = sub_23A690E1C();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_23A5D5218(v9, v6, v8);

  swift_bridgeObjectRelease();
  type metadata accessor for DockCoreObservation();
  v11 = (void *)sub_23A690F00();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)getSelectedFaceIds
{
  return sub_23A5D72AC(self, (uint64_t)a2, (void (*)(void))sub_23A5D6A5C);
}

- (id)getSelectedBodyIds
{
  return sub_23A5D72AC(self, (uint64_t)a2, (void (*)(void))sub_23A5D6DD8);
}

- (void)stop
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  ObjectTrackingAgent *v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ObjectTrackingAgent_expectingDisconnect) = 1;
  v6 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_23A5D120C((uint64_t)v5, (uint64_t)&unk_25699EFC0, (uint64_t)v7);
  swift_release();

}

- (id)getTrackedObjects
{
  void *v2;
  ObjectTrackingAgent *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjectTrackingAgent_lastFaces);
  v3 = self;
  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25699EBD8);
  sub_23A690F0C();

  v5 = (void *)sub_23A690F00();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)processImageWithImage:(CIImage *)a3 faces:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  CIImage *v17;
  NSArray *v18;
  ObjectTrackingAgent *v19;
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
  v15[4] = &unk_25699EFA8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25699EFB0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_25699EFB8, (uint64_t)v16);
  swift_release();
}

- (BOOL)docked
{
  ObjectTrackingAgent *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_23A5D7FB0();

  return v3;
}

- (void)trackingButtonEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EF88;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EF90;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EF98, (uint64_t)v12);
  swift_release();
}

- (void)selectSubjectAtPoint:(CGPoint)a3 completionHandler:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CGFloat *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ObjectTrackingAgent *v16;
  uint64_t v17;

  y = a3.y;
  x = a3.x;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CGFloat *)swift_allocObject();
  v12[2] = x;
  v12[3] = y;
  *((_QWORD *)v12 + 4) = v11;
  *((_QWORD *)v12 + 5) = self;
  v13 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25699EF68;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25699EF70;
  v15[5] = v14;
  v16 = self;
  sub_23A67DFCC((uint64_t)v10, (uint64_t)&unk_25699EF78, (uint64_t)v15);
  swift_release();
}

- (void)selectSubjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  ObjectTrackingAgent *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25699EF48;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25699EF50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_25699EF58, (uint64_t)v14);
  swift_release();
}

- (void)setRectOfInterestLocallyWithRect:(CGRect)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  ObjectTrackingAgent *v18;
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((_QWORD *)v14 + 6) = v13;
  *((_QWORD *)v14 + 7) = self;
  v15 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25699EF28;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25699EF30;
  v17[5] = v16;
  v18 = self;
  sub_23A67DFCC((uint64_t)v12, (uint64_t)&unk_25699EF38, (uint64_t)v17);
  swift_release();
}

- (void)setRectOfInterestWithRect:(CGRect)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  ObjectTrackingAgent *v18;
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((_QWORD *)v14 + 6) = v13;
  *((_QWORD *)v14 + 7) = self;
  v15 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25699EF08;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25699EF10;
  v17[5] = v16;
  v18 = self;
  sub_23A67DFCC((uint64_t)v12, (uint64_t)&unk_25699EF18, (uint64_t)v17);
  swift_release();
}

- (void)setupAgentWithTrustNotifications:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ObjectTrackingAgent *v15;
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
  v13[4] = &unk_25699EEE8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25699EEF0;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_25699EEF8, (uint64_t)v14);
  swift_release();
}

- (void)registerForTrackingConfigChangesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EEC8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EED0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EED8, (uint64_t)v12);
  swift_release();
}

- (void)registerForDebugNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EEA8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EEB0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EEB8, (uint64_t)v12);
  swift_release();
}

- (void)deRegisterForDebugNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EE88;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EE90;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EE98, (uint64_t)v12);
  swift_release();
}

- (void)trackingEnabledForAppWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EE68;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EE70;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EE78, (uint64_t)v12);
  swift_release();
}

- (void)getConnectedTrackerWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EE48;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699EE50;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699EE58, (uint64_t)v12);
  swift_release();
}

- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore24CameraSessionInformation *v17;
  ObjectTrackingAgent *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25699EE28;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25699EE30;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_25699EE38, (uint64_t)v16);
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  ObjectTrackingAgent *v17;
  id v18;
  uint64_t v19;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v16 = a3;
  v17 = self;
  v18 = v16;
  sub_23A5D120C((uint64_t)v13, (uint64_t)&unk_25699EE18, (uint64_t)v15);
  swift_release();

}

- (void)stateEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _TtC11DockKitCore12DockCoreInfo *v21;
  ObjectTrackingAgent *v22;
  uint64_t v23;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_25699EE00;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_25699EE08;
  v20[5] = v19;
  v21 = a3;
  v22 = self;
  sub_23A67DFCC((uint64_t)v15, (uint64_t)&unk_25699EE10, (uint64_t)v20);
  swift_release();
}

- (void)trackingButtonStateChangedWithInfo:(id)a3 state:(int64_t)a4
{
  ObjectTrackingAgent *v6;
  id v7;

  v7 = a3;
  v6 = self;
  sub_23A5E301C(v7, a4);

}

- (void)disconnectedWithErr:(id)a3
{
  id v4;
  ObjectTrackingAgent *v5;

  v5 = self;
  v4 = a3;
  sub_23A5E3E50(a3);

}

- (void)xpcConnected
{
  ObjectTrackingAgent *v2;

  v2 = self;
  sub_23A5E4DC0();

}

- (void)xpcDisconnected
{
  ObjectTrackingAgent *v2;

  v2 = self;
  sub_23A5E4EF4();

}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3
{
  ObjectTrackingAgent *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23A5E74F4((uint64_t)&unk_250B75758, (uint64_t)&unk_250B75780, (uint64_t)&unk_25699F098);

}

- (void)dumpTrackerStateWithPath:(id)a3
{
  ObjectTrackingAgent *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23A5E74F4((uint64_t)&unk_250B75708, (uint64_t)&unk_250B75730, (uint64_t)&unk_25699F080);

}

- (void)searchWithCalibrate:(BOOL)a3
{
  ObjectTrackingAgent *v4;

  v4 = self;
  sub_23A5E617C(a3);

}

- (void)stopSearchWithCalibrate:(BOOL)a3
{
  ObjectTrackingAgent *v4;

  v4 = self;
  sub_23A5E6748(a3);

}

- (void)returnToBase
{
  ObjectTrackingAgent *v2;

  v2 = self;
  sub_23A5E6F54();

}

- (void)stopReturnToBase
{
  ObjectTrackingAgent *v2;

  v2 = self;
  sub_23A5E74D0();

}

- (void)flip180WithClockwise:(BOOL)a3
{
  ObjectTrackingAgent *v4;

  v4 = self;
  sub_23A5E7C20(a3);

}

- (void)trackingEnabledWithEnabled:(BOOL)a3 appID:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  ObjectTrackingAgent *v9;

  v4 = a3;
  v6 = sub_23A690E1C();
  v8 = v7;
  v9 = self;
  sub_23A5E8200(v4, v6, v8);
  swift_bridgeObjectRelease();

}

- (void)setFramingModeEventWithMode:(int64_t)a3
{
  ObjectTrackingAgent *v4;

  v4 = self;
  sub_23A5E8954(a3);

}

- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4
{
  id v6;
  ObjectTrackingAgent *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_23A5E8FC0(v8, v6);

}

- (void)selectSubjectsEvent:(id)a3
{
  uint64_t v4;
  ObjectTrackingAgent *v5;

  v4 = sub_23A690F18();
  v5 = self;
  sub_23A5EA23C(v4);
  swift_bridgeObjectRelease();

}

- (void)setRectOfInterestEventWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ObjectTrackingAgent *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_23A5EB4C8(x, y, width, height);

}

- (void)sendCommandEventWithCommand:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  ObjectTrackingAgent *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_23A690624();
  v7 = v6;

  sub_23A5EC430();
  sub_23A5CA254(v5, v7);

}

- (void)sendUsageMetricWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ObjectTrackingAgent *v13;
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
  v11[4] = &unk_25699EDF0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A03C0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699FF10, (uint64_t)v12);
  swift_release();
}

- (void)sendTrackingSummary
{
  ObjectTrackingAgent *v2;

  v2 = self;
  sub_23A5EDB64();

}

@end
