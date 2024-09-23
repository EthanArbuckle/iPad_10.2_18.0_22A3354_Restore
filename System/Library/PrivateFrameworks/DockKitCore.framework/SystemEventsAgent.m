@implementation SystemEventsAgent

- (void)registerWithCallback:(id)a3 completionHandler:
{
  const void *v3;
  const void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  SystemEventsAgent *v16;
  uint64_t v17;

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0618;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0620;
  v15[5] = v14;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0628, (uint64_t)v15);
  swift_release();
}

- (void)registerWithCallback:(SystemEventsAgent *)self connectedCallback:(SEL)a2 completionHandler:(id)a3
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  SystemEventsAgent *v19;
  uint64_t v20;

  v5 = v4;
  v6 = v3;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a3);
  v13 = _Block_copy(v6);
  v14 = _Block_copy(v5);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v12;
  v15[3] = v13;
  v15[4] = v14;
  v15[5] = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0608;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_25699FF50;
  v18[5] = v17;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_25699FF58, (uint64_t)v18);
  swift_release();
}

- (void)deregisterWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  SystemEventsAgent *v13;
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
  v11[4] = &unk_2569A05F8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25699FF30;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_25699FF38, (uint64_t)v12);
  swift_release();
}

- (BOOL)connected
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_tracker) != 0;
}

- (void)deregisterSync
{
  SystemEventsAgent *v2;

  v2 = self;
  sub_23A642754();

}

- (void)dealloc
{
  SystemEventsAgent *v2;

  v2 = self;
  SystemEventsAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___SystemEventsAgent_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  sub_23A61BE00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_callback));
  sub_23A61BE00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_connectedCallback));
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  id v9;
  SystemEventsAgent *v10;

  v9 = a3;
  v10 = self;
  sub_23A645AD8(a4, a6);

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
  SystemEventsAgent *v13;
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
  v11[4] = &unk_2569A05D8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A05E0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A05E8, (uint64_t)v12);
  swift_release();
}

- (void)systemEventDataWithInfo:(id)a3 data:(id)a4
{
  void (*v4)(id);
  id v7;
  id v8;
  SystemEventsAgent *v9;

  v4 = *(void (**)(id))((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_callback);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    sub_23A5D0340((uint64_t)v4);
    v4(v8);
    sub_23A61BE00((uint64_t)v4);

  }
}

- (void)initializePanoramaWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  SystemEventsAgent *v13;
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
  v11[4] = &unk_2569A05B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A05C0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A05C8, (uint64_t)v12);
  swift_release();
}

- (void)deinitializePanoramaWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  SystemEventsAgent *v13;
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
  v11[4] = &unk_2569A0598;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A05A0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A05A8, (uint64_t)v12);
  swift_release();
}

- (void)updatePanoramaCaptureDirection:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SystemEventsAgent_panoramaController);
  if (v3)
    *(_BYTE *)(v3 + 50) = a3;
}

- (void)startPanoramaCaptureWithOrientation:(unsigned __int8)a3 finishedCallback:(id)a4 completionHandler:
{
  const void *v4;
  const void *v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  SystemEventsAgent *v18;
  uint64_t v19;

  v5 = v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(v5);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = v12;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = self;
  v15 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0578;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0580;
  v17[5] = v16;
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0588, (uint64_t)v17);
  swift_release();
}

- (void)stopPanoramaCaptureWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  SystemEventsAgent *v13;
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
  v11[4] = &unk_2569A0568;
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

- (void)disconnectedWithErr:(id)a3
{
  SystemEventsAgent *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_23A645CAC();

}

- (SystemEventsAgent)init
{
  return (SystemEventsAgent *)SystemEventsAgent.init()();
}

@end
