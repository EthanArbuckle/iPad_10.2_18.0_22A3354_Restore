@implementation ControlHomeIntentHandler

- (void)resolveUserTaskForControlHome:(id)a3 withCompletion:(id)a4
{
  sub_220B96628(self, (int)a2, a3, a4, (void (*)(id, void *))sub_220B98BB0);
}

- (void)resolveFiltersForControlHome:(id)a3 withCompletion:(id)a4
{
  sub_220B96628(self, (int)a2, a3, a4, (void (*)(id, void *))sub_220B992F8);
}

- (void)resolveTimeForControlHome:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  _TtC22HomeAutomationInternal24ControlHomeIntentHandler *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v11 = a3;
  v7 = self;
  v8 = objc_msgSend(v11, sel_time);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedDateComponentsRange_, v8);
    v6[2](v6, v10);

  }
  else
  {
    sub_22086D1D8(0, (unint64_t *)&unk_25561B2C0);
    v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    v6[2](v6, v10);
  }

  _Block_release(v6);
}

- (void)confirmControlHome:(ControlHomeIntent *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ControlHomeIntent *v15;
  _TtC22HomeAutomationInternal24ControlHomeIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25560BCD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_220C98D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25561B320;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25560BCE8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_220B986FC((uint64_t)v9, (uint64_t)&unk_25560BCF0, (uint64_t)v14);
  swift_release();
}

- (void)handleControlHome:(id)a3 completion:(id)a4
{
  _QWORD *v6;
  id v7;
  _TtC22HomeAutomationInternal24ControlHomeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220B9B15C(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC22HomeAutomationInternal24ControlHomeIntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ControlHomeIntentHandler();
  return -[ControlHomeIntentHandler init](&v3, sel_init);
}

@end
