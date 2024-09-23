@implementation FFConfiguration(Disclosure)

- (void)addDisclosure:()Disclosure atLevel:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to addDisclosure with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)addDisclosure:()Disclosure atLevel:.cold.2()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to addDisclosure with a level that is not permitted";
  qword_1EFEC93F0 = 2;
  __break(1u);
}

- (void)removeDisclosure:()Disclosure atLevel:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeDisclosure with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)removeDisclosure:()Disclosure atLevel:.cold.2()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeDisclosure with a level that is not permitted";
  qword_1EFEC93F0 = 2;
  __break(1u);
}

- (void)removeAllDisclosuresAtLevelIndex:()Disclosure .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllDisclosures with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)removeAllDisclosuresAtLevelIndex:()Disclosure .cold.2()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllDisclosure with a level that is not permitted";
  qword_1EFEC93F0 = 4;
  __break(1u);
}

@end
