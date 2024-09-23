@implementation BlastDoorMorphology

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)grammaticalGender
{
  return sub_1AD4BBB9C();
}

- (int64_t)partOfSpeech
{
  int64_t result;
  char v3;

  result = sub_1AD4D9C78(*((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BlastDoorMorphology_morphology + 1));
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (int64_t)number
{
  return sub_1AD4BBC48();
}

- (NSArray)customPronouns
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4BBC94, (void (*)(void))type metadata accessor for _ObjCMorphologyCustomPronounPairWrapper);
}

- (BlastDoorMorphology)init
{
  BlastDoorMorphology *result;

  result = (BlastDoorMorphology *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
