@implementation GDKnosisResultContextItem

- (GDEntityIdentifier)entityIdentifier
{
  return (GDEntityIdentifier *)sub_1AE690998();
}

- (id)answer
{
  GDKnosisResultContextItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AE6909A4();
  v4 = v3;

  return v4;
}

- (id)contextForAnswerParents
{
  GDKnosisResultContextItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AE690A3C((uint64_t)v2);
  v4 = v3;

  return v4;
}

- (GDKnosisResultContextItem)init
{
  GDKnosisResultContextItem.init()();
}

- (void).cxx_destruct
{

  sub_1AE525C94(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GDKnosisResultContextItem__answer), *(_QWORD *)&self->_entityId[OBJC_IVAR___GDKnosisResultContextItem__answer], *(_QWORD *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer], *(_QWORD *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 8], *(unsigned __int16 *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 16], self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 18]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AE4F6648();
  swift_bridgeObjectRelease();
}

@end
