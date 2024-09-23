@implementation TimerCreationDelegateHandler

- (void)timerCreationViewController:(id)a3 didCreateTimer:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler *v13;
  id v14;
  _TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler *v15;
  id v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a4;
  v11[5] = self;
  v12 = a4;
  v13 = self;
  v14 = v12;
  v15 = v13;
  v16 = a3;
  sub_1B8EB73B4((uint64_t)v9, (uint64_t)&unk_1EF209B60, (uint64_t)v11);

  swift_release();
}

- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler)init
{
  _TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler *result;

  result = (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8EA8C60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE28TimerCreationDelegateHandler_parentContainerID);
}

@end
