@implementation CharacteristicNotificationManager.StateContainer

- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  _TtCC4Home33CharacteristicNotificationManager14StateContainer *v12;
  uint64_t v13;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03E4600);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1DD3E3D2C(v10, v11, (uint64_t)v9);
  v13 = sub_1DD63D768();
  LOBYTE(self) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v9, 1, v13) != 1;
  sub_1DD3540B8((uint64_t)v9, (uint64_t *)&unk_1F03E4600);

  return (char)self;
}

- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  _TtCC4Home33CharacteristicNotificationManager14StateContainer *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03E4600);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1DD3E3D2C(v10, v11, (uint64_t)v9);

  v13 = sub_1DD63D768();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) != 1)
  {
    v15 = (void *)sub_1DD63D714();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  return v15;
}

- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  _TtCC4Home33CharacteristicNotificationManager14StateContainer *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DD3E41D4(v6, v7);

  return v9;
}

- (_TtCC4Home33CharacteristicNotificationManager14StateContainer)init
{
  _TtCC4Home33CharacteristicNotificationManager14StateContainer *result;

  result = (_TtCC4Home33CharacteristicNotificationManager14StateContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
