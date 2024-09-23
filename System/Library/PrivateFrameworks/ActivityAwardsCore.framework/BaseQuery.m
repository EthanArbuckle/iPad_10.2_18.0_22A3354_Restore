@implementation BaseQuery

- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC18ActivityAwardsCore9BaseQuery *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F238B8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2175A6428();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_254EF9E08;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_254EF9E18;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_21759DD58((uint64_t)v11, (uint64_t)&unk_254EF9E28, (uint64_t)v16);
  swift_release();
}

- (_TtC18ActivityAwardsCore9BaseQuery)init
{
  _TtC18ActivityAwardsCore9BaseQuery *v3;
  objc_super v5;

  sub_2175A6338();
  swift_allocObject();
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC18ActivityAwardsCore9BaseQuery_transportDispatchService) = (Class)sub_2175A632C();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for BaseQuery();
  return -[BaseQuery init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)transportEvent:(unint64_t)a3 data:(id)a4
{
  _TtC18ActivityAwardsCore9BaseQuery *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC18ActivityAwardsCore9BaseQuery *v11;

  if (a4)
  {
    v6 = self;
    v7 = a4;
    v8 = sub_2175A62C0();
    v10 = v9;

  }
  else
  {
    v11 = self;
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  _s18ActivityAwardsCore9BaseQueryC14transportEvent_4dataySo16AACTransportItemV_10Foundation4DataVSgtF_0(a3);
  sub_21759C0F8(v8, v10);

}

@end
