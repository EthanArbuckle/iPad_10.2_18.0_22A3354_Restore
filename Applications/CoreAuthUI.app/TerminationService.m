@implementation TerminationService

- (_TtC10CoreAuthUI18TerminationService)init
{
  objc_class *ObjectType;
  uint64_t v4;
  void *v5;
  _TtC10CoreAuthUI18TerminationService *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 0;
  v4 = OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions;
  v5 = (void *)objc_opt_self(NSHashTable);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, "weakObjectsHashTable");

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[TerminationService init](&v8, "init");
}

+ (_TtC10CoreAuthUI18TerminationService)shared
{
  _BYTE v3[24];

  if (qword_1000923D0 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  swift_beginAccess(&qword_100093B38, v3, 0, 0);
  return (_TtC10CoreAuthUI18TerminationService *)(id)qword_100093B38;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE v6[24];

  v3 = qword_1000923D0;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  swift_beginAccess(&qword_100093B38, v6, 1, 0);
  v5 = (void *)qword_100093B38;
  qword_100093B38 = (uint64_t)v4;

}

- (void)scheduleTermination
{
  _TtC10CoreAuthUI18TerminationService *v2;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 1;
  v2 = self;
  sub_10002DCA4();

}

- (void).cxx_destruct
{

}

@end
