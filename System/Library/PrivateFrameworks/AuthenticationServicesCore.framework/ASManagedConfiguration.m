@implementation ASManagedConfiguration

+ (id)loadFromDiskWithPlistURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253E8D1D0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_20E6E9B78();
    v8 = sub_20E6E9BC0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_20E6E9BC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  swift_getObjCClassMetadata();
  v10 = static ASManagedConfiguration.loadFromDisk(plistURL:)((uint64_t)v7);
  sub_20E66DEC4((uint64_t)v7);
  return v10;
}

- (BOOL)isConfiguredForEnterpriseAttestationForRelyingParty:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC26AuthenticationServicesCore22ASManagedConfiguration *v7;
  uint64_t v8;

  v4 = sub_20E6EA1CC();
  v6 = v5;
  swift_beginAccess();
  v7 = self;
  v8 = swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_20E6C4128(v8, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC26AuthenticationServicesCore22ASManagedConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v4 = sub_20E6EA1CC();
  v6 = v5;
  swift_beginAccess();
  v7 = self;
  swift_bridgeObjectRetain();
  v8 = swift_bridgeObjectRetain();
  sub_20E6C0418(v8, v4, v6, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  v9 = v17;
  if (v17)
  {
    v10 = v16;
    v11 = sub_20E6E9C14();
    v13 = v12;
    sub_20E6C4314(v10, v9);

    swift_bridgeObjectRelease();
    if (v13 >> 60 != 15)
    {
      v14 = (void *)sub_20E6E9C68();
      sub_20E66AA28(v11, v13);
      return v14;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return 0;
}

- (_TtC26AuthenticationServicesCore22ASManagedConfiguration)init
{
  _TtC26AuthenticationServicesCore22ASManagedConfiguration *result;

  result = (_TtC26AuthenticationServicesCore22ASManagedConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore22ASManagedConfiguration_plistURL;
  v3 = sub_20E6E9BC0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
