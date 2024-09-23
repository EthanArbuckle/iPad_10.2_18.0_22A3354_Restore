@implementation ApplicationInfo

- (void)_loadFromProxy:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ApplicationInfo(0);
  -[ApplicationInfo _loadFromProxy:](&v4, "_loadFromProxy:", a3);
}

- (NSURL)executableURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC12PreviewShell15ApplicationInfo *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_100006658(&qword_10005F9E8);
  __chkstk_darwin(v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1000144C8((uint64_t)v5);

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationRecord:(id)a3
{
  return (_TtC12PreviewShell15ApplicationInfo *)sub_100014718((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithApplicationRecord_);
}

- (_TtC12PreviewShell15ApplicationInfo)initWithApplicationProxy:(id)a3
{
  return (_TtC12PreviewShell15ApplicationInfo *)sub_100014718((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithApplicationProxy_);
}

- (void).cxx_destruct
{
  sub_100014BB4((uint64_t)self + OBJC_IVAR____TtC12PreviewShell15ApplicationInfo_overrideExecutableURL);
}

@end
