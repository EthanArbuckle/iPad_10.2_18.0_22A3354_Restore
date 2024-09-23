@implementation MetricsIdStore

- (void)storeAccountDidChange
{
  uint64_t v2;
  unint64_t v3;

  v2 = qword_1F016EB38;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v3 = sub_1D8572C68(MEMORY[0x1E0DEE9D8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0176CA8);
  swift_allocObject();
  off_1F0176AF0 = (_UNKNOWN *)sub_1D836E708(v3);
  swift_release();
  swift_release();
}

@end
