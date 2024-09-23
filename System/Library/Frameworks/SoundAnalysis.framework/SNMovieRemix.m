@implementation SNMovieRemix

+ (void)runRequest:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  v6 = a3;
  sub_1D4305024((uint64_t)v6, v5);
  _Block_release(v5);

}

+ (void)runRequest:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  _OWORD v10[2];

  v7 = _Block_copy(a5);
  if (a4)
  {
    v8 = a3;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = a3;
  }
  sub_1D4305084((uint64_t)a3, (int)v10, v7);
  _Block_release(v7);

  sub_1D42D7018((uint64_t)v10, &qword_1EFE47160);
}

+ (id)runRequest:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)sub_1D43052B0((uint64_t)v4);

  return v5;
}

+ (id)analyzeFileAtURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1D4519BC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  sub_1D4305384((uint64_t)v7);
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

+ (id)analyzeFileAtURL:(id)a3 environment:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  _OWORD v14[2];

  v6 = sub_1D4519BC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D4519B7C();
  if (a4)
  {
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1D43054D8();
  v11 = v10;
  sub_1D42D7018((uint64_t)v14, &qword_1EFE47160);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (SNMovieRemix)init
{
  return (SNMovieRemix *)SNMovieRemix.init()();
}

@end
