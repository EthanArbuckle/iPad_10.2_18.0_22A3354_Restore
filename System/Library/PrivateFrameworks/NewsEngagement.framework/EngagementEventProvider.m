@implementation EngagementEventProvider

- (_TtC14NewsEngagement23EngagementEventProvider)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC14NewsEngagement23EngagementEventProvider *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14NewsEngagement23EngagementEventProvider_observersStore) = (Class)MEMORY[0x1E0DEE9E0];
  v4 = OBJC_IVAR____TtC14NewsEngagement23EngagementEventProvider_engagement;
  v5 = objc_allocWithZone(MEMORY[0x1E0CFDA78]);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[EngagementEventProvider init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_1BA1E16B8(self, (int)a2, a3, a4, a5, (unint64_t *)&qword_1ED5AF548, &qword_1ED5AF540, 0x1E0CFDA68);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_1BA1E16B8(self, (int)a2, a3, a4, a5, (unint64_t *)&unk_1EF279750, &qword_1ED5AF550, 0x1E0CFDAB0);
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC14NewsEngagement23EngagementEventProvider *v19;

  v10 = _Block_copy(a7);
  v11 = sub_1BA202508();
  v13 = v12;
  v14 = sub_1BA202508();
  v16 = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1BA1E1DFC(a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC14NewsEngagement23EngagementEventProvider *v17;

  v9 = sub_1BA202508();
  v11 = v10;
  v12 = sub_1BA202508();
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v17 = self;
  sub_1BA1E2190(a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
