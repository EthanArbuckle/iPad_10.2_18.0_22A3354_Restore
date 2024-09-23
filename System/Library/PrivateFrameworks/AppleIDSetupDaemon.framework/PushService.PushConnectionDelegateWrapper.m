@implementation PushService.PushConnectionDelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v20;
  v10 = self;
  if (a4)
  {
    v11 = a4;
    v12 = sub_23669663C();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_236628E74(v12, v14);
    goto LABEL_8;
  }
  v16 = Strong;
  if (v14 >> 60 == 15)
  {
    swift_release();
LABEL_8:

    return;
  }
  v17 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = v12;
  v18[6] = v14;
  sub_23667A264(v12, v14);
  sub_236678834((uint64_t)v8, (uint64_t)&unk_2564216B8, (uint64_t)v18);
  swift_release();
  sub_236628E74(v12, v14);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  _TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v11 = Strong;
    if (a4)
    {
      v12 = sub_2366974D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = 0;
      v13[3] = 0;
      v13[4] = v11;
      v13[5] = a4;
      v14 = a4;
      v15 = a3;
      v16 = self;
      sub_236678834((uint64_t)v9, (uint64_t)&unk_256421698, (uint64_t)v13);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

- (_TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper)init
{
  _TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper *result;

  result = (_TtCC18AppleIDSetupDaemon11PushService29PushConnectionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
