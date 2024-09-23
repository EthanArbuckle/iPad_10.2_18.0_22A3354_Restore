@implementation MarketingPlacementObserver

- (_TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver)init
{
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *result;

  result = (_TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236E8BE48(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver_onRequestUpdateForDialogPlacement));
  sub_236E8BE48(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver_onRequestUpdateForEngagementPlacement));
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *v24;
  uint64_t v25;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23731FF58();
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v17 = self;
  if (v12 == sub_237319E50() && v14 == v18)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_237320A38();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return;
    }
  }
  v21 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v11, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v17;
  v22[5] = v12;
  v22[6] = v14;
  v22[7] = a4;
  v23 = v16;
  v24 = v17;
  swift_bridgeObjectRetain();
  sub_23700D22C((uint64_t)v11, (uint64_t)&unk_2567A4DD0, (uint64_t)v22);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  AMSEngagement *v21;
  AMSEngagementRequest *v22;
  NSString *v23;
  NSString *v24;
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2567A4DA8;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2567A4DB0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_2370061B4((uint64_t)v15, (uint64_t)&unk_2567A4DB8, (uint64_t)v20);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AMSEngagement *v17;
  AMSDialogRequest *v18;
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2567A4D88;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2567A4D90;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2370061B4((uint64_t)v11, (uint64_t)&unk_2567A4D98, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AMSEngagement *v17;
  AMSEngagementRequest *v18;
  _TtC24FitnessEngagementServiceP33_BEC6C0704903DD2FBF3B8EA6FBD9907426MarketingPlacementObserver *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2567A4D40;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2567A4D50;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2370061B4((uint64_t)v11, (uint64_t)&unk_2567A4D60, (uint64_t)v16);
  swift_release();
}

@end
