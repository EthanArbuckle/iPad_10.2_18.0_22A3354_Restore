@implementation MockNetworkProxy

+ (BOOL)canInitWithRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned __int8 v7;
  uint64_t v9;

  v3 = sub_18CEC10A8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18CEC109C();
  v7 = static MockNetworkProxy.canInit(with:)((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  uint64_t v13;

  v3 = sub_18CEC10A8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  sub_18CEC109C();
  static MockNetworkProxy.canonicalRequest(for:)((uint64_t)v7);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_18CEC1090();
  v10(v9, v3);
  return v11;
}

- (_TtC18AppleMediaServices16MockNetworkProxy)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v7 = sub_18CEC10A8();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18CEC109C();
  v10 = a4;
  swift_unknownObjectRetain();
  return (_TtC18AppleMediaServices16MockNetworkProxy *)sub_18C9350E0((uint64_t)v9, a4, (uint64_t)a5);
}

- (void)startLoading
{
  _TtC18AppleMediaServices16MockNetworkProxy *v2;

  v2 = self;
  MockNetworkProxy.startLoading()();

}

- (void)stopLoading
{
  _TtC18AppleMediaServices16MockNetworkProxy *v2;

  v2 = self;
  MockNetworkProxy.stopLoading()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AppleMediaServices16MockNetworkProxy_networkProxy));
}

@end
