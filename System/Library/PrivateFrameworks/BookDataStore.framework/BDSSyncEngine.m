@implementation BDSSyncEngine

+ (_TtC13BookDataStore13BDSSyncEngine)shared
{
  if (qword_253F39928 != -1)
    swift_once();
  return (_TtC13BookDataStore13BDSSyncEngine *)(id)qword_253F39920;
}

- (void)setDatabase:(id)a3 config:(id)a4
{
  BCCloudKitConfiguration *v6;
  _TtC13BookDataStore13BDSSyncEngine *v7;
  id _;

  _ = a3;
  v6 = (BCCloudKitConfiguration *)a4;
  v7 = self;
  BDSSyncEngine.setDatabase(_:config:)((CKDatabase)_, v6);

}

- (void)addSaltChangeObserver:(id)a3
{
  _TtC13BookDataStore13BDSSyncEngine *v5;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_227E24D68((uint64_t)a3, (uint64_t)v5);

  swift_unknownObjectRelease();
}

- (void)reestablishSalt
{
  _TtC13BookDataStore13BDSSyncEngine *v2;

  v2 = self;
  BDSSyncEngine.reestablishSalt()();

}

- (void)reestablishSaltIfNeeded
{
  _TtC13BookDataStore13BDSSyncEngine *v2;

  v2 = self;
  BDSSyncEngine.reestablishSaltIfNeeded()();

}

- (void)setCloudKitZone:(id)a3 enabled:(BOOL)a4
{
  _TtC13BookDataStore13BDSSyncEngine *v6;
  id _;

  _ = a3;
  v6 = self;
  BDSSyncEngine.setCloudKitZone(_:enabled:)((CKRecordZoneID)_, a4);

}

- (id)enabledCloudKitZones
{
  uint64_t v3;
  void *v4;
  _TtC13BookDataStore13BDSSyncEngine *v5;
  void *v6;
  void *v7;

  v3 = OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_zoneLock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_zoneLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  swift_beginAccess();
  v6 = *(Class *)((char *)&self->super.isa + v3);
  swift_bridgeObjectRetain();
  objc_msgSend(v6, sel_unlock);

  sub_227D52DBC(0, (unint64_t *)&unk_25592A2C0);
  sub_227E2AED4();
  v7 = (void *)sub_227E60134();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)resetCloudKitZone:(id)a3
{
  _TtC13BookDataStore13BDSSyncEngine *v4;
  id v5;

  v5 = a3;
  v4 = self;
  BDSSyncEngine.resetCloudKitZone(_:)((CKRecordZone)v5);

}

- (void)resetChangeToken:(id)a3
{
  id v4;
  _TtC13BookDataStore13BDSSyncEngine *v5;

  v4 = a3;
  v5 = self;
  sub_227E1D608(v4);

}

- (void)saltManager:(id)a3 updatedSaltWithVersion:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC13BookDataStore13BDSSyncEngine *v9;
  id v10;

  v6 = sub_227E5FF84();
  v8 = v7;
  v10 = a3;
  v9 = self;
  sub_227E2B834(v6, v8);
  swift_bridgeObjectRelease();

}

- (BOOL)establishedSalt
{
  void **v2;
  void *v3;

  v2 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_saltManager);
  swift_beginAccess();
  v3 = *v2;
  if (*v2)
    LOBYTE(v3) = objc_msgSend(v3, sel_establishedSalt);
  return (char)v3;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _TtC13BookDataStore13BDSSyncEngine *v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  void *v15;

  v5 = sub_227E5FF84();
  v7 = v6;
  v8 = sub_227E5FF84();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  object = BDSSyncEngine.recordName(fromRecordType:identifier:)(v12, v13).value._object;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (object)
  {
    v15 = (void *)sub_227E5FF78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (_TtC13BookDataStore13BDSSyncEngine)init
{
  return (_TtC13BookDataStore13BDSSyncEngine *)BDSSyncEngine.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_persistFetchCoordinatorGroup));
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_logger;
  v4 = sub_227E5F588();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)diagnosticSyncEngineInfo
{
  id *v3;
  id v4;
  _TtC13BookDataStore13BDSSyncEngine *v5;
  id v6;

  v3 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_saltManager);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  if (v4)
    v4 = objc_msgSend(v4, sel_establishedSalt);
  v6 = objc_msgSend(objc_allocWithZone((Class)BDSCloudSyncDiagnosticSyncEngineInfo), sel_initWithEstablishedSalt_, v4);

  return v6;
}

@end
