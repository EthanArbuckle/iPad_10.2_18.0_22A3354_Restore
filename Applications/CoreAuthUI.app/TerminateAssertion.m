@implementation TerminateAssertion

- (_TtC10CoreAuthUI18TerminateAssertion)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[TerminateAssertion init](&v6, "init");
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t *v4;
  void (*v5)(_TtC10CoreAuthUI18TerminateAssertion *);
  uint64_t v6;
  _TtC10CoreAuthUI18TerminateAssertion *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10CoreAuthUI18TerminateAssertion *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  v5 = *(void (**)(_TtC10CoreAuthUI18TerminateAssertion *))((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  if (v5)
  {
    v6 = v4[1];
    v7 = self;
    sub_100027180((uint64_t)v5, v6);
    v5(v7);
    sub_100027EB8((uint64_t)v5, v6);
    v8 = *v4;
    v9 = v4[1];
    *v4 = 0;
    v4[1] = 0;
    sub_100027EB8(v8, v9);
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  -[TerminateAssertion dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  sub_100027EB8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion), *(_QWORD *)&self->completion[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion]);
}

@end
