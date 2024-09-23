@implementation SNFileUtils

+ (BOOL)addPurgeablePropertyToURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1D4519BC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  swift_getObjCClassMetadata();
  sub_1D44D2F84();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

- (SNFileUtils)init
{
  return (SNFileUtils *)sub_1D44D382C();
}

@end
