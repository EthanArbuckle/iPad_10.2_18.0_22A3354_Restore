@implementation MUCompositionalStackLayoutInternal

- (MUCompositionalStackLayoutInternal)initWithContainer:(id)a3 group:(id)a4
{
  uint64_t ObjectType;
  void (*v7)(_QWORD *__return_ptr);
  id v8;
  MUCompositionalStackLayoutInternal *v9;
  _QWORD v11[11];

  ObjectType = swift_getObjectType();
  v7 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a4) + 0x58);
  swift_unknownObjectRetain();
  v8 = a4;
  v7(v11);
  v9 = (MUCompositionalStackLayoutInternal *)(*(uint64_t (**)(id, _QWORD *))(ObjectType + 104))(a3, v11);

  swift_deallocPartialClassInstance();
  return v9;
}

- (MULayoutItem)container
{
  MUCompositionalStackLayoutInternal *v2;
  void *v3;
  _BYTE v5[96];

  v2 = self;
  sub_191E0F534((uint64_t)v5);
  v3 = (void *)MEMORY[0x1940213B8](v5);
  sub_191E2F60C((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  MUCompositionalStackLayoutInternal *v4;
  _BYTE v5[96];
  _BYTE v6[96];

  swift_unknownObjectRetain();
  v4 = self;
  sub_191E0F534((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_191E2F630((uint64_t)v6, (uint64_t)v5);
  sub_191E0F598((uint64_t)v5);
  sub_191E2F60C((uint64_t)v6);
  sub_191E2EC98();

  swift_unknownObjectRelease();
}

- (MUCompositionalStackLayoutGroupInternal)group
{
  void (*v3)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutInternal *v4;
  id v5;
  _QWORD v7[11];

  type metadata accessor for CompositionalStackLayout.GroupRef();
  v3 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x88);
  v4 = self;
  v3(v7);
  v5 = sub_191E27CAC((uint64_t)v7);

  return (MUCompositionalStackLayoutGroupInternal *)v5;
}

- (void)setGroup:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *__return_ptr);
  MUCompositionalStackLayoutInternal *v6;
  id v7;
  _QWORD v8[11];

  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)a3) + 0x58);
  v7 = a3;
  v6 = self;
  v5(v8);
  (*(void (**)(_QWORD *))((*v4 & (uint64_t)v6->super.super.isa) + 0x90))(v8);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
