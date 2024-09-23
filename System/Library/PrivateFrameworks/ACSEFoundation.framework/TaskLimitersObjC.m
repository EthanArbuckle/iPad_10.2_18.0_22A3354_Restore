@implementation TaskLimitersObjC

- (void)performWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _TtC14ACSEFoundation16TaskLimitersObjC *v20;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = sub_2358BA350();
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v11;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v12;
  v18 = sub_2358BA3F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_2358B9BC0;
  v19[8] = v16;
  v19[9] = sub_2358B9BE8;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2358B8C68((uint64_t)v10, (uint64_t)&unk_256306EF0, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)performClosureNoParamsWithIdentifier:(id)a3 task:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _TtC14ACSEFoundation16TaskLimitersObjC *v20;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542936F8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = _Block_copy(a5);
  v13 = sub_2358BA350();
  v15 = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v11;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v12;
  v18 = sub_2358BA3F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v13;
  v19[6] = v15;
  v19[7] = sub_2358B9B4C;
  v19[8] = v16;
  v19[9] = sub_2358B9B98;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2358AC9E8((uint64_t)v10, (uint64_t)&unk_256306EE8, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

- (_TtC14ACSEFoundation16TaskLimitersObjC)init
{
  uint64_t v3;
  objc_class *v4;
  _TtC14ACSEFoundation16TaskLimitersObjC *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC14ACSEFoundation16TaskLimitersObjC_taskLimiters;
  type metadata accessor for TaskLimiters();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *((_QWORD *)v4 + 14) = MEMORY[0x24BEE4B00];
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TaskLimitersObjC();
  return -[TaskLimitersObjC init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
