@implementation _SwiftDriverManager

+ (id)sharedManager
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_23A73BC88();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v6 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_2542D2F88 != -1)
    swift_once();
  return (id)static DriverManager.shared;
}

- (void)addObserver:(id)a3
{
  sub_23A72DC84(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))DriverManager.addObserver(_:));
}

- (void)removeObserver:(id)a3
{
  sub_23A72DC84(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))DriverManager.removeObserver(_:));
}

- (int64_t)driverCount
{
  _SwiftDriverManager *v2;
  Swift::Int v3;

  v2 = self;
  v3 = DriverManager.driverCount()();

  return v3;
}

- (int64_t)thirdPartyDriverCount
{
  _SwiftDriverManager *v2;
  Swift::Int v3;

  v2 = self;
  v3 = DriverManager.thirdPartyDriverCount()();

  return v3;
}

- (int64_t)driverCountForAppID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _SwiftDriverManager *v7;
  Swift::String v8;
  Swift::Int v9;

  v4 = sub_23A73BD54();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9 = DriverManager.driverCount(forAppID:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)refresh
{
  _SwiftDriverManager *v2;

  v2 = self;
  DriverManager.refresh()();

}

- (_SwiftDriverManager)init
{
  return (_SwiftDriverManager *)sub_23A72E9F4();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _SwiftDriverManager *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_23A738D80();
  sub_23A73BD78();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[_SwiftDriverManager dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____SwiftDriverManager__driverApprovalStates;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4830);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)setDriverState:(id)a3 approved:(BOOL)a4
{
  _BOOL4 v4;
  char *v6;
  int v7;
  _SwiftDriverManager *v8;

  v4 = a4;
  v6 = (char *)a3;
  v8 = self;
  if (v4)
    v7 = 1;
  else
    v7 = 2;
  DriverManager.setDriverState(driverApprovalState:state:)(v6, v7);

}

- (id)driverApprovalStatesForThirdPartyApp:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _SwiftDriverManager *v8;
  void *v9;
  _QWORD v11[6];

  v4 = sub_23A73BD54();
  v6 = v5;
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  v8 = self;
  objc_msgSend(v7, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  v11[2] = v4;
  v11[3] = v6;
  sub_23A732ADC((uint64_t (*)(id *))sub_23A736E38, (uint64_t)v11, v11[5]);
  objc_msgSend(v7, sel_unlock);

  swift_bridgeObjectRelease();
  type metadata accessor for DriverApprovalState();
  v9 = (void *)sub_23A73BE14();
  swift_bridgeObjectRelease();
  return v9;
}

@end
