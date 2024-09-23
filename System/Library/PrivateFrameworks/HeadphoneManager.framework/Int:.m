@implementation Int:

- (void)String
{
  swift_bridgeObjectRelease();
}

- (_QWORD)String
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

@end
