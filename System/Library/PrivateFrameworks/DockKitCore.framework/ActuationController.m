@implementation ActuationController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 motionModel:(int64_t)a5 name:(id)a6 actuators:(id)a7
{
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  _TtC11DockKitCore19ActuationController *v15;

  v10 = sub_23A690E1C();
  v12 = v11;
  type metadata accessor for Actuator();
  v13 = sub_23A690F18();
  v14 = a3;
  v15 = (_TtC11DockKitCore19ActuationController *)sub_23A63ECE8(a3, a4, a5, v10, v12, v13);

  swift_bridgeObjectRelease();
  return v15;
}

- (_TtC11DockKitCore19ActuationController)initWithAccessory:(id)a3 id:(int64_t)a4 type:(int64_t)a5 name:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC11DockKitCore19ActuationController *v13;

  v9 = sub_23A690E1C();
  v11 = v10;
  v12 = a3;
  v13 = (_TtC11DockKitCore19ActuationController *)sub_23A63F228((uint64_t)a3, a4, a5, v9, v11);

  return v13;
}

- (void)actuatorFeedbackWithInfo:(id)a3 system:(id)a4 actuators:(id)a5 positions:(id)a6 velocities:(id)a7 timestamp:(double)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC11DockKitCore19ActuationController *v14;

  v10 = sub_23A690F18();
  v11 = sub_23A690F18();
  v12 = sub_23A690F18();
  v13 = a3;
  v14 = self;
  sub_23A63F514(v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)trajectoryProgressFeedbackWithInfo:(id)a3 system:(id)a4 progress:(id)a5
{
  id v7;
  id v8;
  _TtC11DockKitCore19ActuationController *v9;

  v7 = a3;
  v8 = a5;
  v9 = self;
  sub_23A63FA98(v8);

}

- (void)disconnectedWithErr:(id)a3
{
  _TtC11DockKitCore19ActuationController *v4;
  id v5;

  v4 = self;
  v5 = a3;
  _s11DockKitCore19ActuationControllerC12disconnected3errys5Error_pSg_tF_0();

}

- (void)setRotationWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC11DockKitCore19ActuationController *v19;
  uint64_t v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(double *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0498;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A04A0;
  v18[5] = v17;
  v19 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A04A8, (uint64_t)v18);
  swift_release();
}

- (void)setActuatorVelocitiesWithActuatorNames:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  _TtC11DockKitCore19ActuationController *v19;
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
  v15[4] = &unk_2569A0478;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0480;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0488, (uint64_t)v16);
  swift_release();
}

- (void)setRotationalVelocityWithYaw:(double)a3 pitch:(double)a4 roll:(double)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC11DockKitCore19ActuationController *v19;
  uint64_t v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(double *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0458;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A0460;
  v18[5] = v17;
  v19 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A0468, (uint64_t)v18);
  swift_release();
}

- (void)setActuatorPositionsWithActuators:(NSArray *)a3 positions:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  _TtC11DockKitCore19ActuationController *v19;
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
  v15[4] = &unk_2569A0438;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0440;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0448, (uint64_t)v16);
  swift_release();
}

- (void)setActuatorVelocitiesWithActuators:(NSArray *)a3 velocities:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  _TtC11DockKitCore19ActuationController *v19;
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
  v15[4] = &unk_2569A0418;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0420;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0428, (uint64_t)v16);
  swift_release();
}

- (void)getActuatorFeedbackWithActuators:(NSArray *)a3 delegate:(_TtP11DockKitCore25XPCActuatorClientProtocol_ *)a4 occurrence:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSArray *v19;
  _TtC11DockKitCore19ActuationController *v20;
  uint64_t v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A03F8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A0400;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain();
  v20 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A0408, (uint64_t)v18);
  swift_release();
}

- (void)getCurrentFeedbackWithActuators:(NSArray *)a3 completionHandler:(id)a4
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
  _TtC11DockKitCore19ActuationController *v16;
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
  v13[4] = &unk_2569A03D8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A03E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A03E8, (uint64_t)v14);
  swift_release();
}

- (void)stopActuatorFeedbackWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore19ActuationController *v13;
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
  v11[4] = &unk_2569A03B8;
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _TtC11DockKitCore19ActuationController *v7;

  v4 = a3;
  v7 = self;
  v5 = (void *)sub_23A691008();
  v6 = (void *)sub_23A690E04();
  objc_msgSend(v4, sel_encodeObject_forKey_, v5, v6);

  sub_23A62E48C(v4);
}

- (_TtC11DockKitCore19ActuationController)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore19ActuationController *)ActuationController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_lastFeedbackTime;
  v6 = sub_23A6906D8();
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController_lastFeedbackRequest, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore19ActuationController__feedbackStarted;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25699FD48);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end
