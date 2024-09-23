@implementation MFMailboxUserInfo

- (void).cxx_destruct
{
  swift_getObjectType();
  sub_1A5139364((uint64_t)self + OBJC_IVAR___MFMailboxUserInfo__lock);
  sub_1A5139364((uint64_t)self + OBJC_IVAR___MFMailboxUserInfo__fileURL);
}

- (MFMailboxUserInfo)initWithFileURL:(id)a3
{
  void *v3;
  id v4;
  id v6[3];
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  id v13;

  v6[2] = self;
  v13 = a3;
  swift_getObjectType();
  v7 = sub_1A5949EF4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v6 - v9;
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE7A1980) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = (void *)MEMORY[0x1E0C80A78](v13);
  v12 = (char *)v6 - v11;
  v4 = v3;
  if (v13)
  {
    v6[1] = v13;
    v6[0] = v13;
    sub_1A5949EA0();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v10, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v12, 1, 1, v7);
  }
  return (MFMailboxUserInfo *)MFMailboxUserInfo.init(fileURL:)(v12);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  MFMailboxUserInfo *v5;
  uint64_t v6;
  uint64_t v7;
  id v11;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  v6 = sub_1A594B40C();
  v11 = (id)MFMailboxUserInfo.subscript.getter(v6, v7);
  swift_bridgeObjectRelease();

  return v11;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v5;
  id v6;
  MFMailboxUserInfo *v7;
  uint64_t v8;
  uint64_t v9;

  swift_getObjectType();
  v5 = a3;
  v6 = a4;
  v7 = self;
  v8 = sub_1A594B40C();
  MFMailboxUserInfo.subscript.setter(a3, v8, v9);

}

- (MFMailboxUserInfo)init
{
  swift_getObjectType();
  return (MFMailboxUserInfo *)MFMailboxUserInfo.init()();
}

@end
