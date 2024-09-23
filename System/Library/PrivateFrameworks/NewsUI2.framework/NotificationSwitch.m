@implementation NotificationSwitch

- (_TtC7NewsUI218NotificationSwitch)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  Class v7;
  id v8;
  id v9;
  _TtC7NewsUI218NotificationSwitch *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC7NewsUI218NotificationSwitch *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged;
  sub_1D60B4250();
  v8 = objc_allocWithZone(v7);
  v9 = a3;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v8, sel_init);
  v11 = (char *)v10 + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  v12 = *MEMORY[0x1E0DB6BE8];
  v13 = sub_1D6E1CAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);

  v16.receiver = v10;
  v16.super_class = ObjectType;
  v14 = -[NotificationSwitch initWithCoder:](&v16, sel_initWithCoder_, v9);

  return v14;
}

- (_TtC7NewsUI218NotificationSwitch)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  Class v10;
  id v11;
  _TtC7NewsUI218NotificationSwitch *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged;
  sub_1D60B4250();
  v11 = objc_allocWithZone(v10);
  v12 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);
  v13 = (char *)v12 + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  v14 = *MEMORY[0x1E0DB6BE8];
  v15 = sub_1D6E1CAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);

  v17.receiver = v12;
  v17.super_class = ObjectType;
  return -[NotificationSwitch initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_onValueChanged));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI218NotificationSwitch_toggleState;
  v4 = sub_1D6E1CAF0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (BOOL)accessibilityActivate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC7NewsUI218NotificationSwitch *v7;
  unsigned int v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_1D6E1CAF0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[NotificationSwitch isOn](v7, sel_isOn);
  v9 = (unsigned int *)MEMORY[0x1E0DB6BF0];
  if (!v8)
    v9 = (unsigned int *)MEMORY[0x1E0DB6BE8];
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v9, v3);
  sub_1D699273C((uint64_t)v6, 1);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  MEMORY[0x1D8288AD0](v10);

  return 1;
}

@end
