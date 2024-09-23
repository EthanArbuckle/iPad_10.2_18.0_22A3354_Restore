@implementation MTSessionError

+ (id)withDescription:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v3 = sub_1B8DFDB68();
  v5 = sub_1B8D99E80(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC18MobileTimerSupport14MTSessionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _QWORD *v8;
  void *v9;
  void *v10;
  _TtC18MobileTimerSupport14MTSessionError *v11;
  objc_super v13;

  sub_1B8DFDB68();
  if (a5)
    a5 = (id)sub_1B8DFDA6C();
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18MobileTimerSupport14MTSessionError_descriptionString);
  *v8 = 0;
  v8[1] = 0;
  v9 = (void *)sub_1B8DFDB5C();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v10 = (void *)sub_1B8DFDA60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MTSessionError();
  v11 = -[MTSessionError initWithDomain:code:userInfo:](&v13, sel_initWithDomain_code_userInfo_, v9, a4, v10);

  return v11;
}

- (_TtC18MobileTimerSupport14MTSessionError)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18MobileTimerSupport14MTSessionError_descriptionString);
  v6 = (objc_class *)type metadata accessor for MTSessionError();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[MTSessionError initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
