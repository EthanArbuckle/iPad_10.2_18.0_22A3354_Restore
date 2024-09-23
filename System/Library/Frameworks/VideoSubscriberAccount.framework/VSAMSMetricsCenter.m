@implementation VSAMSMetricsCenter

+ (_TtC22VideoSubscriberAccount18VSAMSMetricsCenter)shared
{
  if (qword_1EFC7FFF0 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC22VideoSubscriberAccount18VSAMSMetricsCenter *)(id)qword_1EFC7FFF8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EFC7FFF0;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EFC7FFF8;
  qword_1EFC7FFF8 = (uint64_t)v4;

}

- (_TtC22VideoSubscriberAccount18VSAMSMetricsCenter)init
{
  return (_TtC22VideoSubscriberAccount18VSAMSMetricsCenter *)sub_1D2482E38();
}

- (void)recordEventWithTopic:(id)a3 eventType:(id)a4 eventData:(id)a5 completion:(id)a6
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC22VideoSubscriberAccount18VSAMSMetricsCenter *v16;

  v7 = (uint64_t (*)())_Block_copy(a6);
  v8 = sub_1D24DFD70();
  v10 = v9;
  v11 = sub_1D24DFD70();
  v13 = v12;
  v14 = sub_1D24DFD1C();
  if (v7)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v7;
    v7 = sub_1D2486818;
  }
  else
  {
    v15 = 0;
  }
  v16 = self;
  sub_1D2482F58(v8, v10, v11, v13, v14, (uint64_t)v7, v15);
  sub_1D24867E4((uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)recordAccountUpdate:(id)a3 source:(id)a4 updateType:(id)a5 completion:(id)a6
{
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VSUserAccount *v16;
  _TtC22VideoSubscriberAccount18VSAMSMetricsCenter *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = (uint64_t (*)())_Block_copy(a6);
  v9 = sub_1D24DFD70();
  v11 = v10;
  v12 = sub_1D24DFD70();
  v14 = v13;
  if (v8)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v8;
    v8 = sub_1D2486818;
  }
  else
  {
    v15 = 0;
  }
  v16 = (VSUserAccount *)a3;
  v17 = self;
  VSUserAccount.init(_:)((VideoSubscriberAccount::VSUserAccount *)&v20, v16);
  v18 = v20;
  v19 = v20;
  (*(void (**)(void **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v17->super.isa) + 0x70))(&v19, v9, v11, v12, v14, v8, v15);

  sub_1D24867E4((uint64_t)v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22VideoSubscriberAccount18VSAMSMetricsCenter_analyticsService));

}

@end
