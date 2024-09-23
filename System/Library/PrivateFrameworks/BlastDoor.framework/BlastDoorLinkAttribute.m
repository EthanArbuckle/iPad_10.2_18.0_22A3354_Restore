@implementation BlastDoorLinkAttribute

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for LinkAttribute, &OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute);
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4A8A64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSURL)link
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for LinkAttribute(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AD63AF28();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute, (uint64_t)v5, type metadata accessor for LinkAttribute);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, &v5[*(int *)(v3 + 20)], v6);
  v10 = (void *)sub_1AD63AE98();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (NSURL *)v10;
}

- (BlastDoorLinkAttribute)init
{
  BlastDoorLinkAttribute *result;

  result = (BlastDoorLinkAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorLinkAttribute_linkAttribute, type metadata accessor for LinkAttribute);
}

@end
