@implementation DataModel

+ (_TtC13HomeDataModel9DataModel)shared
{
  if (qword_254334098 != -1)
    swift_once();
  return (_TtC13HomeDataModel9DataModel *)(id)qword_254333F18;
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC13HomeDataModel9DataModel *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254334B40);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23E537934();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_23E5378F8();
  v9 = self;
  v10 = a3;
  v11 = sub_23E5378EC();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  v12[5] = ObjectType;
  sub_23E26D014((uint64_t)v7, (uint64_t)&unk_256D452C8, (uint64_t)v12);

  swift_release();
}

- (_TtC13HomeDataModel9DataModel)init
{
  return (_TtC13HomeDataModel9DataModel *)DataModel.init()();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  DataModel.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);

}

- (NSArray)sortedHomes
{
  return (NSArray *)sub_23E20220C(self, (uint64_t)a2, (void (*)(void))DataModel.sortedHomes.getter);
}

- (void)setHomeManager:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel_homeManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setCurrentHome:(id)a3
{
  id v5;
  _TtC13HomeDataModel9DataModel *v6;

  swift_getKeyPath();
  sub_23E1EE1C4((unint64_t *)&qword_254332460, (uint64_t (*)(uint64_t))type metadata accessor for DataModel, (uint64_t)&protocol conformance descriptor for DataModel);
  v5 = a3;
  v6 = self;
  sub_23E537064();

  swift_release();
}

- (HMHome)primaryHome
{
  _TtC13HomeDataModel9DataModel *v2;
  void *v3;

  v2 = self;
  v3 = DataModel.primaryHome.getter();

  return (HMHome *)v3;
}

- (NSArray)alphabeticalHomes
{
  return (NSArray *)sub_23E20220C(self, (uint64_t)a2, (void (*)(void))DataModel.alphabeticalHomes.getter);
}

- (id)accessoryFor:(id)a3 in:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC13HomeDataModel9DataModel *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE v19[16];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254333F50);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_23E536F68();
    v10 = sub_23E536F80();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_23E536F80();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v12, sel_accessories);
  sub_23E1E335C(0, (unint64_t *)&qword_254332BF0);
  v15 = sub_23E5377F0();

  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)&v19[-16] = v9;
  v17 = sub_23E24D560(sub_23E255400, (uint64_t)&v19[-32], v15);

  swift_bridgeObjectRelease();
  sub_23E1E7C64((uint64_t)v9, &qword_254333F50);
  return v17;
}

- (id)accessoryFromAnyHomeFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC13HomeDataModel9DataModel *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254333F50);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23E536F68();
    v8 = sub_23E536F80();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_23E536F80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  DataModel.accessoryFromAnyHome(for:)((uint64_t)v7);
  v12 = v11;

  sub_23E1E7C64((uint64_t)v7, &qword_254333F50);
  return v12;
}

- (id)homeFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _TtC13HomeDataModel9DataModel *v8;
  NSArray *v9;
  unint64_t v10;
  void *v11;
  _BYTE v13[16];
  _BYTE *v14;

  v4 = sub_23E536F80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23E536F68();
  v8 = self;
  v9 = -[DataModel sortedHomes](v8, sel_sortedHomes);
  sub_23E1E335C(0, (unint64_t *)&qword_254333DD0);
  v10 = sub_23E5377F0();

  v14 = v7;
  v11 = sub_23E24D560(sub_23E2553E8, (uint64_t)v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (id)accessoryFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.accessory(for:));
}

- (id)actionSetFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.actionSet(for:));
}

- (id)cameraProfileFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.cameraProfile(for:));
}

- (id)mediaProfileFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.mediaProfile(for:));
}

- (id)characteristicFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.characteristic(for:));
}

- (id)roomFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.room(for:));
}

- (id)serviceFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.service(for:));
}

- (id)serviceGroupFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.serviceGroup(for:));
}

- (id)mediaSystemFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.mediaSystem(for:));
}

- (id)userFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.user(for:));
}

- (id)residentFor:(id)a3
{
  return sub_23E253698(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))DataModel.resident(for:));
}

+ (int64_t)context
{
  swift_beginAccess();
  return qword_254333510;
}

+ (void)setContext:(int64_t)a3
{
  swift_beginAccess();
  qword_254333510 = a3;
}

+ (HMHomeManagerConfiguration)homeManagerConfiguration
{
  swift_beginAccess();
  return (HMHomeManagerConfiguration *)(id)qword_254333470;
}

+ (void)setHomeManagerConfiguration:(id)a3
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = (void *)qword_254333470;
  qword_254333470 = (uint64_t)a3;
  v5 = a3;

}

- (HMHomeManager)homeManager
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel_homeManager);
  swift_beginAccess();
  return (HMHomeManager *)*v2;
}

- (HMHome)_currentHome
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome));
}

- (void)set_currentHome:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _TtC13HomeDataModel9DataModel *v11;

  v5 = OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome);
  v7 = v6;
  v8 = a3;
  v11 = self;
  sub_23E20AC74(a3);
  v9 = *(Class *)((char *)&self->super.isa + v5);
  *(Class *)((char *)&self->super.isa + v5) = (Class)a3;
  v10 = v8;

  sub_23E20AFB0(v6);
}

- (HMHome)currentHome
{
  _TtC13HomeDataModel9DataModel *v3;
  HMHome *v4;

  swift_getKeyPath();
  sub_23E1EE1C4((unint64_t *)&qword_254332460, (uint64_t (*)(uint64_t))type metadata accessor for DataModel, (uint64_t)&protocol conformance descriptor for DataModel);
  v3 = self;
  sub_23E537070();
  swift_release();
  v4 = (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                         + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentHome));

  return v4;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23E1E2FA0((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel9DataModel__currentStateSnapshot, type metadata accessor for StateSnapshot);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel9DataModel___observationRegistrar;
  v4 = sub_23E5370A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)homeManagerDidUpdatePrimaryHome:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  DataModel.homeManagerDidUpdatePrimaryHome(_:)((HMHomeManager)v4);

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC13HomeDataModel9DataModel *v14;
  id v15;
  _TtC13HomeDataModel9DataModel *v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  ObjectType = swift_getObjectType();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B40);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23E537934();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_23E5378F8();
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = v13;
  v16 = v14;
  v17 = v12;
  v18 = sub_23E5378EC();
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = v17;
  v19[7] = ObjectType;
  sub_23E26D014((uint64_t)v10, (uint64_t)&unk_256D452C0, (uint64_t)v19);

  swift_release();
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC13HomeDataModel9DataModel *v12;
  id v13;
  _TtC13HomeDataModel9DataModel *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B40);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23E537934();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_23E5378F8();
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = a3;
  v16 = sub_23E5378EC();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v14;
  sub_23E26D014((uint64_t)v9, (uint64_t)&unk_256D452B8, (uint64_t)v17);

  swift_release();
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  DataModel.home(_:didAdd:)((HMHome)v6, (HMAccessory)v7);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s13HomeDataModel0bC0C4home_9didRemoveySo6HMHomeC_So11HMAccessoryCtF_0(v6);

}

- (void)home:(void *)a3 didUpdateRoom:(void *)a4 forAccessory:(void *)a5
{
  uint64_t updated;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = qword_254334090;
  v17 = a3;
  v23 = a4;
  v18 = a5;
  v19 = a1;
  if (v16 != -1)
    swift_once();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v20, (uint64_t)qword_254333EE8);
  *v11 = v17;
  swift_storeEnumTagMultiPayload();
  v21 = v17;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);

}

- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5
{
  uint64_t updated;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC13HomeDataModel9DataModel *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = qword_254334090;
  v17 = a3;
  v23 = a4;
  v18 = a5;
  v19 = self;
  if (v16 != -1)
    swift_once();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v20, (uint64_t)qword_254333EE8);
  *v11 = v17;
  swift_storeEnumTagMultiPayload();
  v21 = v17;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);

}

- (void)home:(id)a3 didUpdateHomeHubState:(unint64_t)a4
{
  uint64_t updated;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC13HomeDataModel9DataModel *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = qword_254334090;
  v14 = a3;
  v15 = self;
  if (v13 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v16, (uint64_t)qword_254333EE8);
  *v8 = v14;
  swift_storeEnumTagMultiPayload();
  v17 = v14;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (void)home:(void *)a3 didAddUser:(void *)a4
{
  uint64_t updated;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v9 = (uint64_t *)((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = qword_254334090;
  v15 = a3;
  v16 = a4;
  v17 = a1;
  if (v14 != -1)
    swift_once();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v18, (uint64_t)qword_254333EE8);
  *v9 = v15;
  swift_storeEnumTagMultiPayload();
  v19 = v15;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

}

- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4
{
  uint64_t updated;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC13HomeDataModel9DataModel *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = qword_254334090;
  v14 = a3;
  v15 = self;
  if (v13 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v16, (uint64_t)qword_254333EE8);
  *v8 = v14;
  swift_storeEnumTagMultiPayload();
  v17 = v14;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  _s13HomeDataModel0bC0C024homeDidUpdateApplicationB0yySo6HMHomeCF_0(v4);

}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23E3A042C(v6, v7, "%s - new application data for room %s — %s");

}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23E3A042C(v6, v7, "%s - new application data for serviceGroup %s — %s");

}

- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23E3A042C(v6, v7, "%s - new application data for actionSet %s — %s");

}

- (void)homeDidUpdateName:(void *)a3
{
  uint64_t updated;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = qword_254334090;
  v13 = a3;
  v14 = a1;
  if (v12 != -1)
    swift_once();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v15, (uint64_t)qword_254333EE8);
  *v7 = v13;
  swift_storeEnumTagMultiPayload();
  v16 = v13;
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

}

- (void)userActionPredictionController:(id)a3 didUpdatePredictions:(id)a4
{
  uint64_t ObjectType;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC13HomeDataModel9DataModel *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  ObjectType = swift_getObjectType();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B40);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1E335C(0, &qword_254332C20);
  v10 = sub_23E5377F0();
  v11 = sub_23E537934();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  sub_23E5378F8();
  v12 = a3;
  v13 = self;
  v14 = v12;
  swift_bridgeObjectRetain();
  v15 = sub_23E5378EC();
  v16 = (_QWORD *)swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v13;
  v16[5] = v14;
  v16[6] = v10;
  v16[7] = ObjectType;
  sub_23E26D014((uint64_t)v9, (uint64_t)&unk_256D452B0, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)accessoryDidUpdateName:(void *)a3
{
  uint64_t updated;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = qword_254334090;
  v13 = a3;
  v14 = a1;
  if (v12 != -1)
    swift_once();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v15, (uint64_t)qword_254333EE8);
  *v7 = objc_msgSend(v13, sel_home);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13HomeDataModel9DataModel *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_23E3A08C8((uint64_t)v9, v10);

}

- (void)accessory:(void *)a3 didUpdateNameForService:(void *)a4
{
  uint64_t updated;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v9 = (uint64_t *)((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = qword_254334090;
  v15 = a3;
  v16 = a4;
  v17 = a1;
  if (v14 != -1)
    swift_once();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v18, (uint64_t)qword_254333EE8);
  *v9 = objc_msgSend(v15, sel_home);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

}

- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4
{
  uint64_t updated;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC13HomeDataModel9DataModel *v15;
  uint64_t v16;
  uint64_t v17;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v8 = (uint64_t *)((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = qword_254334090;
  v14 = a3;
  v15 = self;
  if (v13 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v16, (uint64_t)qword_254333EE8);
  *v8 = objc_msgSend(v14, sel_home);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  _s13HomeDataModel0bC0C029accessoryDidUpdateApplicationB0yySo11HMAccessoryCF_0(v4);

}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
  id v6;
  id v7;
  _TtC13HomeDataModel9DataModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s13HomeDataModel0bC0C9accessory_020didUpdateApplicationB3ForySo11HMAccessoryC_So9HMServiceCtF_0(v6, v7);

}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t updated;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC13HomeDataModel9DataModel *v13;
  uint64_t v14;
  uint64_t v15;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = qword_254334090;
  swift_unknownObjectRetain();
  v12 = a4;
  v13 = self;
  if (v11 != -1)
    swift_once();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v14, (uint64_t)qword_254333EE8);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_unknownObjectRelease();

}

- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4
{
  uint64_t updated;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC13HomeDataModel9DataModel *v13;
  uint64_t v14;
  uint64_t v15;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = qword_254334090;
  v12 = a3;
  v13 = self;
  if (v11 != -1)
    swift_once();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v14, (uint64_t)qword_254333EE8);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

}

- (void)homeManager:(void *)a3 didUpdateAuthorizationStatus:
{
  uint64_t updated;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = qword_254334090;
  v11 = a3;
  v12 = a1;
  if (v10 != -1)
    swift_once();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v13, (uint64_t)qword_254333EE8);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

}

- (void)lightProfile:(void *)a3 didUpdateSettings:(void *)a4
{
  uint64_t updated;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = qword_254334090;
  v13 = a3;
  v14 = a4;
  v15 = a1;
  if (v12 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v16, (uint64_t)qword_254333EE8);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC13HomeDataModel9DataModel *v14;
  uint64_t v15;

  v8 = sub_23E536F80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E536F68();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_23E3A1254((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didFailUpdate:(id)a5 withError:(id)a6 timestamp:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  _TtC13HomeDataModel9DataModel *v20;
  _TtC13HomeDataModel9DataModel *v21;
  uint64_t v22;

  v21 = self;
  v22 = sub_23E536F20();
  v10 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23E536F80();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E536F68();
  sub_23E536EFC();
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = v21;
  sub_23E3A1510((uint64_t)v16, v18, v19);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC13HomeDataModel9DataModel *v14;
  uint64_t v15;

  v8 = sub_23E536F80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E536F68();
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_23E3A186C((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC13HomeDataModel9DataModel *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23E3A1C54(v8, "Received snapshot control: %@");

}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  sub_23E3A1C54(v4, "Did update most recent snapshot: %@");

}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  sub_23E3A1C54(v4, "Did start stream: %@");

}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v6;
  _TtC13HomeDataModel9DataModel *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  _s13HomeDataModel0bC0C19cameraStreamControl_07didStopE9WithErrorySo08HMCameraeF0C_s0J0_pSgtF_0(v6, a4);

}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  uint64_t updated;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC13HomeDataModel9DataModel *v15;
  uint64_t v16;
  uint64_t v17;

  updated = type metadata accessor for StateSnapshot.UpdateType(0);
  MEMORY[0x24BDAC7A8](updated);
  v8 = (uint64_t *)((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = qword_254334090;
  v14 = a3;
  v15 = self;
  if (v13 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254334B60);
  __swift_project_value_buffer(v16, (uint64_t)qword_254333EE8);
  *v8 = objc_msgSend(v14, sel_home);
  swift_storeEnumTagMultiPayload();
  sub_23E537940();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  id v6;
  _TtC13HomeDataModel9DataModel *v7;

  v6 = a3;
  v7 = self;
  _s13HomeDataModel0bC0C6device_12stateChangedySo9MTRDeviceC_So0G5StateVtF_0(v6, a4);

}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
  sub_23E4F9278(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))_s13HomeDataModel0bC0C6device_23receivedAttributeReportySo9MTRDeviceC_SaySDySSypGGtF_0);
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
  sub_23E4F9278(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))_s13HomeDataModel0bC0C6device_19receivedEventReportySo9MTRDeviceC_SaySDySSypGGtF_0);
}

- (void)deviceBecameActive:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  sub_23E4FB120(v4, "Received MTRDevice delegate deviceBecameActive for device:%@");

}

- (void)deviceCachePrimed:(id)a3
{
  id v4;
  _TtC13HomeDataModel9DataModel *v5;

  v4 = a3;
  v5 = self;
  sub_23E4FB120(v4, "Received MTRDevice delegate deviceCachePrimed for device:%@");

}

@end
