@implementation PushService.PushConnectionDelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v21;
  v11 = self;
  if (a4)
  {
    v12 = a4;
    v13 = sub_1B408FB70();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_1B4053BA0(v13, v15);
    goto LABEL_8;
  }
  v17 = Strong;
  if (v15 >> 60 == 15)
  {
    swift_release();
LABEL_8:

    return;
  }
  v18 = sub_1B408FFCC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v17;
  v19[5] = v13;
  v19[6] = v15;
  sub_1B4053C9C(v13, v15);
  sub_1B4052DF0((uint64_t)v9, (uint64_t)&unk_1EF088BC0, (uint64_t)v19);
  swift_release();
  sub_1B4053BA0(v13, v15);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  _TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v12 = Strong;
    if (a4)
    {
      v13 = sub_1B408FFCC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = 0;
      v14[3] = 0;
      v14[4] = v12;
      v14[5] = a4;
      v15 = a4;
      v16 = a3;
      v17 = self;
      sub_1B4052DF0((uint64_t)v10, (uint64_t)&unk_1EF088BA0, (uint64_t)v14);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

- (_TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper)init
{
  _TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper *result;

  result = (_TtCC18AAAFoundationSwift11PushService29PushConnectionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
