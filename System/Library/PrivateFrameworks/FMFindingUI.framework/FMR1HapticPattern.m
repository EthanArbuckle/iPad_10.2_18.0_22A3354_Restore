@implementation FMR1HapticPattern

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameters:(id)a4 error:(id *)a5
{
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_23A9A0A08((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, &qword_2569D6688, 0x24BDBF5B8, (SEL *)&selRef_initWithEvents_parameters_error_);
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithEvents:(id)a3 parameterCurves:(id)a4 error:(id *)a5
{
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_23A9A0A08((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (unint64_t *)&unk_2569D66D0, 0x24BDBF5D8, (SEL *)&selRef_initWithEvents_parameterCurves_error_);
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithDictionary:(id)a3 error:(id *)a4
{
  type metadata accessor for Key(0);
  sub_23A961DE4(&qword_2569D5098, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_23AA35EE4);
  sub_23AA32F84();
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_23A9A0AFC();
}

- (_TtC11FMFindingUI17FMR1HapticPattern)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = sub_23AA32D44();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23AA32D2C();
  return (_TtC11FMFindingUI17FMR1HapticPattern *)sub_23A9A0E00((uint64_t)v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
