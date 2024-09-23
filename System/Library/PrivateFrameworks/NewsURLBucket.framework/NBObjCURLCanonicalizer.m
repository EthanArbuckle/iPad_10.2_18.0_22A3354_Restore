@implementation NBObjCURLCanonicalizer

- (NBObjCURLCanonicalizer)init
{
  return (NBObjCURLCanonicalizer *)sub_1ABFB85E0((char *)self, (uint64_t)a2, &OBJC_IVAR___NBObjCURLCanonicalizer_urlCanonicalizer, (void (*)(_QWORD))type metadata accessor for URLCanonicalizer);
}

- (id)canonicalizedURLForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  NBObjCURLCanonicalizer *v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  uint64_t v15;

  v4 = sub_1ABFBC598();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v15 - v9;
  sub_1ABFBC544();
  v11 = self;
  URLCanonicalizer.canonicalizedURL(for:)((uint64_t)v8, (uint64_t)v10);

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v13 = (void *)sub_1ABFBC538();
  v12(v10, v4);
  return v13;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
