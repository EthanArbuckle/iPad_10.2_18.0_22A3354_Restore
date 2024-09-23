@implementation IMUrlToTransferMap

- (NSDictionary)urlToTransferGuids
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (IMUrlToTransferMap)initWithUrlToTransferGuids:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMUrlToTransferMap_urlToTransferGuids) = (Class)sub_19E36F828();
  v5.receiver = self;
  v5.super_class = (Class)IMUrlToTransferMap;
  return -[IMUrlToTransferMap init](&v5, sel_init);
}

- (id)transferGuidFromUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IMUrlToTransferMap *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    v4 = sub_19E36F888();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_19E333A04(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (IMUrlToTransferMap)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMUrlToTransferMap *)IMUrlToTransferMap.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  uint64_t inited;
  uint64_t v4;
  IMUrlToTransferMap *v5;
  NSDictionary *v6;
  uint64_t v7;
  void *v8;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = sub_19E36F888();
  *(_QWORD *)(inited + 40) = v4;
  v5 = self;
  v6 = -[IMUrlToTransferMap urlToTransferGuids](v5, sel_urlToTransferGuids);
  v7 = sub_19E36F828();

  *(_QWORD *)(inited + 72) = sub_19E247E74(&qword_1EE502C38);
  *(_QWORD *)(inited + 48) = v7;
  sub_19E32D864(inited);

  v8 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)copyWithZone:(void *)a3
{
  IMUrlToTransferMap *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_19E333E8C(v6);

  sub_19E323360(v6, v6[3]);
  v4 = (void *)sub_19E36FE04();
  sub_19E323384((uint64_t)v6);
  return v4;
}

- (IMUrlToTransferMap)init
{
  IMUrlToTransferMap *result;

  result = (IMUrlToTransferMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
