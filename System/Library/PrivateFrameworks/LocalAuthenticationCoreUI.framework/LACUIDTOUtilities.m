@implementation LACUIDTOUtilities

+ (NSURL)dtoLearnMoreLinkURL
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSURL *result;
  NSURL *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  result = (NSURL *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (NSURL *)v12;
  }
  return result;
}

- (LACUIDTOUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACUIDTOUtilities;
  return -[LACUIDTOUtilities init](&v3, sel_init);
}

@end
