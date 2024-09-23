@implementation CLSVisualUnderstandingServiceClient

- (CLSVisualUnderstandingServiceClient)initWithVisionCacheURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  char *v5;
  uint64_t v7;

  sub_1CABE15E8();
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CABE15DC();
  return (CLSVisualUnderstandingServiceClient *)CLSVisualUnderstandingServiceClient.init(visionCacheURL:)((uint64_t)v5);
}

- (id)deviceOwnerPersonUUIDWithIgnoreContactsLinking:(BOOL)a3
{
  uint64_t v5;
  char *v6;
  CLSVisualUnderstandingServiceClient *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED85F2C0);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1CAB7BD0C(a3, (uint64_t)v6);

  v8 = sub_1CABE1600();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1CABE15F4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (CLSVisualUnderstandingServiceClient)init
{
  CLSVisualUnderstandingServiceClient *result;

  result = (CLSVisualUnderstandingServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
