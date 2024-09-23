@implementation MapsSyncDataSession

- (void)contextDidSaveWithNotification:(id)a3
{
  id v4;
  _TtC8MapsSync19MapsSyncDataSession *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)sub_1A423C140();
  MapsSyncPostNotification(v6);

}

- (NSPersistentContainer)persistentContainer
{
  uint64_t v3;
  void *v4;
  _TtC8MapsSync19MapsSyncDataSession *v5;
  void *v6;
  id v7;

  v3 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  v6 = *(Class *)((char *)&self->super.isa + v3);
  v7 = *(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer);
  objc_msgSend(v6, sel_unlock);

  return (NSPersistentContainer *)v7;
}

- (void)setPersistentContainer:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC8MapsSync19MapsSyncDataSession *v8;
  void *v9;
  id v10;

  v5 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock);
  v7 = a3;
  v8 = self;
  objc_msgSend(v6, sel_lock);
  v9 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer) = (Class)a3;
  v10 = v7;

  objc_msgSend(*(id *)((char *)&self->super.isa + v5), sel_unlock);
}

+ (void)suppressNotifications
{
  swift_beginAccess();
  qword_1ED1AA840 = 0x4008000000000000;
}

+ (void)resumeNotifications
{
  swift_beginAccess();
  qword_1ED1AA840 = 0;
}

+ (BOOL)useInMemoryOnly
{
  return byte_1EE70EEE8;
}

+ (void)setUseInMemoryOnly:(BOOL)a3
{
  _s8MapsSync0aB11DataSessionC15useInMemoryOnlySbvsZ_0(a3);
}

+ (void)disableNotifications
{
  swift_beginAccess();
  byte_1EE710368 = 1;
}

+ (void)enableNotifications
{
  swift_beginAccess();
  byte_1EE710368 = 0;
}

+ (_TtC8MapsSync19MapsSyncDataSession)defaultSession
{
  uint64_t *v2;

  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v2 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v2 = qword_1ED1AC168;
  }
  return (_TtC8MapsSync19MapsSyncDataSession *)(id)*v2;
}

+ (_TtC8MapsSync19MapsSyncDataSession)defaultLocalOnlySession
{
  uint64_t *v2;

  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E270 != -1)
      swift_once();
    v2 = &qword_1EE70EEE0;
  }
  else
  {
    if (qword_1ED1AB520 != -1)
      swift_once();
    v2 = &qword_1ED1AB4E8;
  }
  return (_TtC8MapsSync19MapsSyncDataSession *)(id)*v2;
}

+ (BOOL)isInMemoryOnly
{
  return byte_1EE70EEE8;
}

+ (void)reset
{
  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    -[MapsSyncDataSession resetInMemoryStore]_0();
  }
}

+ (void)resetWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  uint64_t ObjCClassMetadata;

  v3 = (void (**)(_QWORD))_Block_copy(a3);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A413DBDC(ObjCClassMetadata, v3);
  _Block_release(v3);
}

- (_TtC8MapsSync19MapsSyncDataSession)initWithPersisted:(BOOL)a3 deviceLocal:(BOOL)a4
{
  return (_TtC8MapsSync19MapsSyncDataSession *)sub_1A41389D0(a3, a4);
}

- (void)getReadContextWithCompletion:(id)a3
{
  sub_1A4138F98((char *)self, (int)a2, a3, (void (*)(char *, void *))sub_1A413DEC4);
}

- (id)unsafeGetReadContextAndReturnError:(id *)a3
{
  return sub_1A4139040((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
}

- (void)getBackgroundReadContextWithCompletion:(id)a3
{
  sub_1A4138F98((char *)self, (int)a2, a3, (void (*)(char *, void *))sub_1A413E044);
}

- (id)unsafeGetBackgroundReadContextAndReturnError:(id *)a3
{
  return sub_1A4139040((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
}

- (void)getWriteContextWithCompletion:(id)a3
{
  sub_1A4138F98((char *)self, (int)a2, a3, (void (*)(char *, void *))sub_1A413E1C4);
}

- (id)unsafeGetWriteContextAndReturnError:(id *)a3
{
  return sub_1A4139040((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__writeContext);
}

- (void)deleteAll
{
  _TtC8MapsSync19MapsSyncDataSession *v2;

  v2 = self;
  sub_1A413912C();

}

- (void)resetInMemoryStoreWithCompletion:(id)a3
{
  void *v4;
  _TtC8MapsSync19MapsSyncDataSession *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  -[MapsSyncDataSession resetInMemoryStore]_0();
  sub_1A413DA20((uint64_t)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)checkStoreLoadedWithCompletion:(void *)aBlock
{
  void *v4;
  id v5;

  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  v5 = a1;
  sub_1A413DA20((uint64_t)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

+ (void)whenReadyWithCompletion:(id)a3
{
  void (**v3)(_QWORD);

  v3 = (void (**)(_QWORD))_Block_copy(a3);
  sub_1A413C26C(v3);
  _Block_release(v3);
}

- (BOOL)hasLoadedStore
{
  void *v2;
  _TtC8MapsSync19MapsSyncDataSession *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__loadLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__hasLoadedStores);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (NSString)typeString
{
  void *v2;

  type metadata accessor for MapsSyncXPCDataContainer();
  if (!swift_dynamicCastClass())
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    if (!swift_dynamicCastClass())
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      swift_dynamicCastClass();
    }
  }
  v2 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)loadCoreDataStoresFor:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC8MapsSync19MapsSyncDataSession *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1A413E344(v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)loadStoresWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync19MapsSyncDataSession *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A4139E78((uint64_t)sub_1A411127C, v5);

  swift_release();
}

+ (BOOL)shouldRetryStoreLoadAfterErrorWithError:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = (uint64_t)a3;
  v4 = a3;
  LOBYTE(v3) = sub_1A413F53C(v3);

  return v3 & 1;
}

+ (BOOL)shouldMoveStoreAsideWithError:(id)a3
{
  unint64_t v3;
  id v4;

  v3 = (unint64_t)a3;
  v4 = a3;
  LOBYTE(v3) = sub_1A413E764(v3);

  return v3 & 1;
}

- (void)remoteChangeWithNotification:(id)a3
{
  id v4;
  _TtC8MapsSync19MapsSyncDataSession *v5;

  v4 = a3;
  v5 = self;
  sub_1A413FCD4();

}

- (_TtC8MapsSync19MapsSyncDataSession)init
{
  _TtC8MapsSync19MapsSyncDataSession *result;

  result = (_TtC8MapsSync19MapsSyncDataSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)resetInMemoryStore
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;

  if (qword_1EE70E268 != -1)
    swift_once();
  type metadata accessor for MapsSyncXPCDataContainer();
  if (swift_dynamicCastClass())
  {
    v0 = 0xE300000000000000;
    v1 = 4411480;
  }
  else
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    v0 = 0xE600000000000000;
    if (swift_dynamicCastClass())
    {
      v1 = 0x79726F6D654DLL;
    }
    else
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      v2 = swift_dynamicCastClass();
      if (v2)
        v1 = 0x74694B64756F6C43;
      else
        v1 = 0x746365726944;
      if (v2)
        v0 = 0xE800000000000000;
    }
  }
  sub_1A423C320();
  if (qword_1ED1ACAE8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A4243A80;
  v4 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  v5 = sub_1A40E766C();
  *(_QWORD *)(v3 + 32) = v1;
  *(_QWORD *)(v3 + 40) = v0;
  *(_QWORD *)(v3 + 96) = v4;
  *(_QWORD *)(v3 + 104) = v5;
  *(_QWORD *)(v3 + 64) = v5;
  *(_QWORD *)(v3 + 72) = 0xD000000000000019;
  *(_QWORD *)(v3 + 80) = 0x80000001A424BCB0;
  swift_bridgeObjectRetain();
  sub_1A423C020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (objc_class *)type metadata accessor for MapsSyncDataSession();
  v7 = objc_allocWithZone(v6);
  v8 = sub_1A41389D0(0, 0);
  v9 = (void *)qword_1EE70EED8;
  qword_1EE70EED8 = (uint64_t)v8;

  if (qword_1EE70E270 != -1)
    swift_once();
  v10 = 4411480;
  if (swift_dynamicCastClass())
  {
    v11 = 0xE300000000000000;
  }
  else
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    v11 = 0xE600000000000000;
    if (swift_dynamicCastClass())
    {
      v10 = 0x79726F6D654DLL;
    }
    else
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      v12 = swift_dynamicCastClass();
      if (v12)
        v10 = 0x74694B64756F6C43;
      else
        v10 = 0x746365726944;
      if (v12)
        v11 = 0xE800000000000000;
    }
  }
  sub_1A423C320();
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1A4243A80;
  *(_QWORD *)(v13 + 56) = v4;
  *(_QWORD *)(v13 + 64) = v5;
  *(_QWORD *)(v13 + 32) = v10;
  *(_QWORD *)(v13 + 40) = v11;
  *(_QWORD *)(v13 + 96) = v4;
  *(_QWORD *)(v13 + 104) = v5;
  *(_QWORD *)(v13 + 72) = 0xD00000000000001FLL;
  *(_QWORD *)(v13 + 80) = 0x80000001A424BCD0;
  swift_bridgeObjectRetain();
  sub_1A423C020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = objc_allocWithZone(v6);
  v15 = sub_1A41389D0(0, 0);
  v16 = (void *)qword_1EE70EEE0;
  qword_1EE70EEE0 = (uint64_t)v15;

}

@end
