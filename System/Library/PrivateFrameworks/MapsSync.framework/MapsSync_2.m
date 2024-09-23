void sub_1A41F6E88(_QWORD *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), *a2));
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_1A41F6EF4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = *a1;
  v7 = a1[1];
  v8 = *(void **)(*a2 + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy);
  if (v7 >> 60 == 15)
  {
    v9 = v8;
    v10 = 0;
  }
  else
  {
    sub_1A40D7720(*a1, v7);
    v11 = v8;
    v10 = sub_1A423BF48();
  }
  v12 = (id)v10;
  objc_msgSend(v8, *a5);
  sub_1A40D7778(v6, v7);

}

void (*sub_1A41F6F90(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_preferredChargingNetworks);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A41F700C;
}

void sub_1A41F700C(uint64_t *a1, char a2)
{
  sub_1A41F7018(a1, a2, (SEL *)&selRef_setPreferredChargingNetworks_);
}

void sub_1A41F7018(uint64_t *a1, char a2, SEL *a3)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = *a1;
  v5 = a1[1];
  v6 = *(void **)(a1[2] + a1[3]);
  if ((a2 & 1) != 0)
  {
    if (v5 >> 60 == 15)
    {
      v7 = v6;
      v8 = 0;
    }
    else
    {
      sub_1A40D7720(*a1, v5);
      v10 = v6;
      v8 = (void *)sub_1A423BF48();
    }
    objc_msgSend(v6, *a3, v8);
    sub_1A40D7778(v4, v5);

    sub_1A40D7778(v4, v5);
  }
  else
  {
    v11 = v6;
    if (v5 >> 60 == 15)
      v9 = 0;
    else
      v9 = (void *)sub_1A423BF48();
    objc_msgSend(v11, *a3, v9);
    sub_1A40D7778(v4, v5);

  }
}

void sub_1A41F7128()
{
  uint64_t v0;

}

id MapsSyncMutableVehicle.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableVehicle);
}

uint64_t sub_1A41F7154()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for MapsSyncMutableVehicle()
{
  return objc_opt_self();
}

void sub_1A41F719C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_colorHex, a2);
}

void sub_1A41F71B8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setColorHex_);
}

void sub_1A41F71D4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F6E88(a1, (SEL *)&selRef_currentVehicleState, a2);
}

void sub_1A41F71F0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F6EF4(a1, a2, a3, a4, (SEL *)&selRef_setCurrentVehicleState_);
}

uint64_t sub_1A41F720C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A41F5D28(a1, (SEL *)&selRef_dateOfVehicleIngestion, a2);
}

uint64_t sub_1A41F7228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A411BF20(a1, a2, a3, a4, (uint64_t (*)(char *))sub_1A41F55E4);
}

void sub_1A41F7244(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_displayName, a2);
}

void sub_1A41F7260(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setDisplayName_);
}

void sub_1A41F727C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_headUnitBluetoothIdentifier, a2);
}

void sub_1A41F7298(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setHeadUnitBluetoothIdentifier_);
}

void sub_1A41F72B4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_headUnitMacAddress, a2);
}

void sub_1A41F72D0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setHeadUnitMacAddress_);
}

void sub_1A41F72EC(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_iapIdentifier, a2);
}

void sub_1A41F7308(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setIapIdentifier_);
}

uint64_t sub_1A41F7324@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A41F5D28(a1, (SEL *)&selRef_lastStateUpdateDate, a2);
}

uint64_t sub_1A41F7340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A411BF20(a1, a2, a3, a4, (uint64_t (*)(char *))sub_1A41F5C08);
}

void sub_1A41F735C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_licensePlate, a2);
}

void sub_1A41F7378(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setLicensePlate_);
}

void sub_1A41F7394(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_lprPowerType, a2);
}

void sub_1A41F73B0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setLprPowerType_);
}

void sub_1A41F73CC(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_lprVehicleType, a2);
}

void sub_1A41F73E8(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setLprVehicleType_);
}

void sub_1A41F7404(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_manufacturer, a2);
}

void sub_1A41F7420(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setManufacturer_);
}

void sub_1A41F743C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_model, a2);
}

void sub_1A41F7458(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setModel_);
}

void sub_1A41F7474(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_pairedAppIdentifier, a2);
}

void sub_1A41F7490(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setPairedAppIdentifier_);
}

void sub_1A41F74AC(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F6E88(a1, (SEL *)&selRef_powerByConnector, a2);
}

void sub_1A41F74C8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F6EF4(a1, a2, a3, a4, (SEL *)&selRef_setPowerByConnector_);
}

void sub_1A41F74E4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_siriIntentsIdentifier, a2);
}

void sub_1A41F7500(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setSiriIntentsIdentifier_);
}

id sub_1A41F751C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_31Tm(a1, (SEL *)&selRef_supportedConnectors, a2);
}

id sub_1A41F7528(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_32Tm(a1, a2, a3, a4, (SEL *)&selRef_setSupportedConnectors_);
}

void sub_1A41F7534(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F67F0(a1, (SEL *)&selRef_vehicleIdentifier, a2);
}

void sub_1A41F7550(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F685C(a1, a2, a3, a4, (SEL *)&selRef_setVehicleIdentifier_);
}

id sub_1A41F756C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_31Tm(a1, (SEL *)&selRef_vehicleType, a2);
}

id sub_1A41F7578(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_32Tm(a1, a2, a3, a4, (SEL *)&selRef_setVehicleType_);
}

id sub_1A41F7584@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_31Tm(a1, (SEL *)&selRef_year, a2);
}

id keypath_get_31Tm@<X0>(_QWORD *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  id result;

  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                                 + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), *a2));
  *a3 = result;
  return result;
}

id sub_1A41F75D0(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_32Tm(a1, a2, a3, a4, (SEL *)&selRef_setYear_);
}

id keypath_set_32Tm(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), *a5, *a1);
}

void sub_1A41F75F8(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41F6E88(a1, (SEL *)&selRef_preferredChargingNetworks, a2);
}

void sub_1A41F7614(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41F6EF4(a1, a2, a3, a4, (SEL *)&selRef_setPreferredChargingNetworks_);
}

uint64_t sub_1A41F7630()
{
  return type metadata accessor for MapsSyncVehicle();
}

void sub_1A41F7638()
{
  unint64_t v0;

  sub_1A40F2A6C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncVehicle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncVehicle.colorHex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x540))();
}

uint64_t dispatch thunk of MapsSyncVehicle.currentVehicleState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x548))();
}

uint64_t dispatch thunk of MapsSyncVehicle.dateOfVehicleIngestion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x550))();
}

uint64_t dispatch thunk of MapsSyncVehicle.displayName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x558))();
}

uint64_t dispatch thunk of MapsSyncVehicle.headUnitBluetoothIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x560))();
}

uint64_t dispatch thunk of MapsSyncVehicle.headUnitMacAddress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x568))();
}

uint64_t dispatch thunk of MapsSyncVehicle.iapIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x570))();
}

uint64_t dispatch thunk of MapsSyncVehicle.lastStateUpdateDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x578))();
}

uint64_t dispatch thunk of MapsSyncVehicle.licensePlate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x580))();
}

uint64_t dispatch thunk of MapsSyncVehicle.lprPowerType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x588))();
}

uint64_t dispatch thunk of MapsSyncVehicle.lprVehicleType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x590))();
}

uint64_t dispatch thunk of MapsSyncVehicle.manufacturer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x598))();
}

uint64_t dispatch thunk of MapsSyncVehicle.model.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5A0))();
}

uint64_t dispatch thunk of MapsSyncVehicle.pairedAppIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5A8))();
}

uint64_t dispatch thunk of MapsSyncVehicle.powerByConnector.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5B0))();
}

uint64_t dispatch thunk of MapsSyncVehicle.siriIntentsIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5B8))();
}

uint64_t dispatch thunk of MapsSyncVehicle.supportedConnectors.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5C0))();
}

uint64_t dispatch thunk of MapsSyncVehicle.vehicleIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5C8))();
}

uint64_t dispatch thunk of MapsSyncVehicle.vehicleType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5D0))();
}

uint64_t dispatch thunk of MapsSyncVehicle.year.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5D8))();
}

uint64_t dispatch thunk of MapsSyncVehicle.preferredChargingNetworks.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5E0))();
}

uint64_t method lookup function for MapsSyncMutableVehicle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.colorHex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.colorHex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.colorHex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.currentVehicleState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.currentVehicleState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.currentVehicleState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.dateOfVehicleIngestion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.dateOfVehicleIngestion.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.dateOfVehicleIngestion.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.displayName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.displayName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.displayName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitBluetoothIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitBluetoothIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitBluetoothIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitMacAddress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitMacAddress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.headUnitMacAddress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.iapIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.iapIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.iapIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lastStateUpdateDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lastStateUpdateDate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lastStateUpdateDate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.licensePlate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.licensePlate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.licensePlate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprPowerType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprPowerType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprPowerType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprVehicleType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprVehicleType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.lprVehicleType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.manufacturer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.manufacturer.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.manufacturer.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.model.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.model.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.model.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.pairedAppIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.pairedAppIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.pairedAppIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.powerByConnector.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.powerByConnector.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.powerByConnector.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.siriIntentsIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.siriIntentsIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.siriIntentsIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.supportedConnectors.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.supportedConnectors.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.supportedConnectors.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.vehicleType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.year.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.year.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.year.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.preferredChargingNetworks.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.preferredChargingNetworks.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of MapsSyncMutableVehicle.preferredChargingNetworks.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

uint64_t sub_1A41F8030()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A41F8054()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableVehicle();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

id RAPRecordRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RAPRecordRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id RAPRecordRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for RAPRecord();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSRAPRecordRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id RAPRecordRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for RAPRecord();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSRAPRecordRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for RAPRecordRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for RAPRecordRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A41F82F4()
{
  return sub_1A41F83BC();
}

uint64_t sub_1A41F83BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSRAPRecordRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for RAPRecord();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for RAPRecord();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A41F8684()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A41F869C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A41F86F4;
  return sub_1A41EB994(0);
}

uint64_t sub_1A41F86F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A41F8768()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for RAPRecord();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for RAPRecord();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A41F8A70(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A41F8AE8;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A41F8AE8()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for RAPRecord();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A41F8BB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A41F8BCC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A41F8C28;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A41F8C28(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A41F8C9C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for RAPRecord();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for RAPRecord();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A41F8FB8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A41F9044;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A41F9044()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for RAPRecord();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A41F911C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A41F9134()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A41F92A8(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A41F92F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A41F9348(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A41F9360()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A41F94EC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A41F9540()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id RAPRecordRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RAPRecordRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for RAPRecordRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RAPRecordRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of RAPRecordRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RAPRecordRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RAPRecordRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of RAPRecordRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of RAPRecordRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of RAPRecordRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A41F9804()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710518 + dword_1EE710518))(v2, v3, v4);
}

uint64_t sub_1A41F987C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710528 + dword_1EE710528))(v2, v3);
}

uint64_t sub_1A41F98EC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710538 + dword_1EE710538))(v2, v3, v4);
}

uint64_t sub_1A41F9964()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710548 + dword_1EE710548))(v2, v3);
}

void sub_1A41F99D0(uint64_t a1, uint64_t a2)
{
  sub_1A41F99E4(a1, a2, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionItem, &qword_1EE710628);
}

void sub_1A41F99E4(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[6];

  sub_1A423C5CC();
  a3(0);
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v6 = sub_1A423C8C0();
  v8 = v7;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423BFE4();
  sub_1A40D0EE8(&qword_1EE710620, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v6, v8);
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
  v10 = objc_msgSend(v9, sel_name);

  if (v10)
  {
    sub_1A423C14C();

    v11 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v12 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v11, sel_initWithEntityName_, v12);

    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
    v15 = sub_1A423BFC0();
    *(_QWORD *)(v14 + 56) = sub_1A40D19C0(0, &qword_1EE70E6F0);
    *(_QWORD *)(v14 + 64) = sub_1A41D8678((unint64_t *)&qword_1EE710AE0, &qword_1EE70E6F0);
    *(_QWORD *)(v14 + 32) = v15;
    v16 = (void *)sub_1A423C314();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1A4243A90;
    v18 = v16;
    *(_QWORD *)(v17 + 32) = sub_1A423C314();
    *(_QWORD *)(v17 + 40) = v18;
    v28[0] = v17;
    sub_1A423C1DC();
    v19 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v20 = v18;
    v21 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v19, sel_initWithType_subpredicates_, 1, v21, v28[0]);

    objc_msgSend(v13, sel_setPredicate_, v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
    v23 = sub_1A423C3F8();
    v24 = sub_1A40E8A00(v23);
    swift_bridgeObjectRelease();
    sub_1A423C5CC();
    v25 = sub_1A423C8C0();
    v27 = v26;
    swift_bridgeObjectRelease();
    v28[0] = v25;
    v28[1] = v27;
    sub_1A423C188();
    v28[4] = v24;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AA9D0);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v25, v27);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v24 + 16))
    {
      sub_1A40D1AAC(v24 + 32, (uint64_t)v28);

      swift_dynamicCast();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A41F9FEC()
{
  return sub_1A411534C(&OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId);
}

uint64_t sub_1A41FA004()
{
  return sub_1A411534C(&OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken);
}

uint64_t sub_1A41FA0F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
  swift_beginAccess();
  return sub_1A410356C(v3, a1, &qword_1ED1AB5D0);
}

uint64_t sub_1A41FA15C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL);
}

uint64_t sub_1A41FA218()
{
  uint64_t v0;

  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces) = sub_1A418A344(v0, (uint64_t)sub_1A41FA260, 0);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRetain();
}

void sub_1A41FA260(void *a1)
{
  if (objc_msgSend(a1, sel_reviewedPlaces))
  {
    type metadata accessor for MapsSyncManagedReviewedPlace();
    sub_1A40D0EE8(&qword_1EE710630, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncManagedReviewedPlace, MEMORY[0x1E0DEFCF8]);
    sub_1A423C2C0();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  __break(1u);
}

uint64_t sub_1A41FA344(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  unsigned int v10;
  uint64_t result;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  objc_super v22;
  __int128 v23;
  uint64_t v24;

  sub_1A410356C(a1, (uint64_t)&v23, (uint64_t *)&unk_1ED1AC4F0);
  v3 = v24;
  if (v24)
  {
    v4 = __swift_project_boxed_opaque_existential_0(&v23, v24);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x1E0C80A78](v4);
    v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = sub_1A423C7AC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v23);
  }
  else
  {
    v8 = 0;
  }
  v9 = (objc_class *)type metadata accessor for MapsSyncAnonymousCredential();
  v22.receiver = v1;
  v22.super_class = v9;
  v10 = objc_msgSendSuper2(&v22, sel_isEqual_, v8);
  swift_unknownObjectRelease();
  if (!v10)
    return v10 & 1;
  sub_1A410356C(a1, (uint64_t)&v23, (uint64_t *)&unk_1ED1AC4F0);
  if (!v24)
  {
    sub_1A410251C((uint64_t)&v23, (uint64_t *)&unk_1ED1AC4F0);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    LOBYTE(v10) = 0;
    return v10 & 1;
  }

  result = sub_1A410356C(a1, (uint64_t)&v20, (uint64_t *)&unk_1ED1AC4F0);
  if (v21)
  {
    sub_1A40D1A9C(&v20, &v23);
    swift_dynamicCast();
    v12 = v19;
    v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId];
    v14 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8];
    v15 = *(_QWORD *)&v19[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId];
    v16 = *(_QWORD *)&v19[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8];
    if (v14 >> 60 == 15)
    {
      sub_1A40D7720(*(_QWORD *)&v19[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId], *(_QWORD *)&v19[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8]);

      if (v16 >> 60 == 15)
      {
        LOBYTE(v10) = 1;
        return v10 & 1;
      }
    }
    else
    {
      if (v16 >> 60 != 15)
      {
        sub_1A40D7720(v13, v14);
        sub_1A40D7720(v15, v16);
        sub_1A40D7720(v13, v14);
        sub_1A40E6DC0(v13, v14);
        LOBYTE(v10) = v17;

        sub_1A40D7778(v15, v16);
        sub_1A40D7778(v13, v14);
        sub_1A40D7778(v13, v14);
        return v10 & 1;
      }
      sub_1A40D7734(v13, v14);

    }
    sub_1A40D7778(v13, v14);
    sub_1A40D7778(v15, v16);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_1A41FA654(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)();
  uint64_t v16;
  void *v17;
  uint64_t (*v18)();
  int64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void (*v29)();
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  _QWORD *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  char isEscapingClosureAtFileLocation;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void (*v58)();
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  __int128 v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t aBlock;
  unint64_t v68;
  uint64_t (*v69)(uint64_t);
  void *v70;
  uint64_t (*v71)();
  uint64_t v72;
  int64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v54 - v10;
  v73 = (int64_t)a1;
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB4F0);
  swift_dynamicCast();
  v13 = v1 + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A410356C(v13, (uint64_t)v11, (uint64_t *)&unk_1ED1ABCE0);
  v14 = v70;
  v15 = v71;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&aBlock, (uint64_t)v70);
  (*((void (**)(char *, void *, uint64_t (*)()))v15 + 2))(v11, v14, v15);
  sub_1A423BF90();
  v16 = sub_1A423BF9C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 0, 1, v16);
  v17 = v70;
  v18 = v71;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&aBlock, (uint64_t)v70);
  (*((void (**)(char *, void *, uint64_t (*)()))v18 + 5))(v5, v17, v18);
  sub_1A417E494("SaveObjectNew", 13, 2u, 1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&aBlock);
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  v55 = swift_dynamicCastClassUnconditional();
  v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored);
  v57 = v12;
  if ((v19 & 0xC000000000000001) != 0)
  {
    v20 = v12;
    swift_bridgeObjectRetain();
    sub_1A423C4DC();
    type metadata accessor for MapsSyncReviewedPlace();
    sub_1A40D0EE8((unint64_t *)&unk_1EE710610, (uint64_t (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace, MEMORY[0x1E0DEFCF8]);
    sub_1A423C308();
    v19 = v73;
    v63 = v74;
    v21 = v75;
    v22 = v76;
    v23 = v77;
  }
  else
  {
    v24 = -1 << *(_BYTE *)(v19 + 32);
    v25 = *(_QWORD *)(v19 + 56);
    v63 = v19 + 56;
    v21 = ~v24;
    v26 = -v24;
    if (v26 < 64)
      v27 = ~(-1 << v26);
    else
      v27 = -1;
    v23 = v27 & v25;
    v28 = v12;
    swift_bridgeObjectRetain();
    v22 = 0;
  }
  v29 = 0;
  v30 = 0;
  v61 = v19 & 0x7FFFFFFFFFFFFFFFLL;
  v56 = v21;
  v62 = (unint64_t)(v21 + 64) >> 6;
  v65 = 0x80000001A424FA30;
  v64 = xmmword_1A4243A70;
  v60 = MEMORY[0x1E0DEE9B0] + 8;
  while (2)
  {
    v58 = v29;
    v59 = v30;
    while (1)
    {
      while (1)
      {
        v31 = v22;
        if (v19 < 0)
        {
          v34 = sub_1A423C548();
          if (!v34)
            goto LABEL_39;
          v66 = v34;
          type metadata accessor for MapsSyncReviewedPlace();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v35 = (char *)aBlock;
          swift_unknownObjectRelease();
          if (!v35)
            goto LABEL_39;
        }
        else
        {
          if (v23)
          {
            v32 = __clz(__rbit64(v23));
            v23 &= v23 - 1;
            v33 = v32 | (v22 << 6);
          }
          else
          {
            v36 = v22 + 1;
            if (__OFADD__(v22, 1))
            {
              __break(1u);
              goto LABEL_41;
            }
            if (v36 >= v62)
              goto LABEL_39;
            v37 = *(_QWORD *)(v63 + 8 * v36);
            ++v22;
            if (!v37)
            {
              v22 = v31 + 2;
              if (v31 + 2 >= v62)
                goto LABEL_39;
              v37 = *(_QWORD *)(v63 + 8 * v22);
              if (!v37)
              {
                v22 = v31 + 3;
                if (v31 + 3 >= v62)
                  goto LABEL_39;
                v37 = *(_QWORD *)(v63 + 8 * v22);
                if (!v37)
                {
                  v22 = v31 + 4;
                  if (v31 + 4 >= v62)
                    goto LABEL_39;
                  v37 = *(_QWORD *)(v63 + 8 * v22);
                  if (!v37)
                  {
                    v38 = v31 + 5;
                    while (v62 != v38)
                    {
                      v37 = *(_QWORD *)(v63 + 8 * v38++);
                      if (v37)
                      {
                        v22 = v38 - 1;
                        goto LABEL_29;
                      }
                    }
LABEL_39:
                    sub_1A40D19B8();

                    sub_1A4111284((uint64_t)v58);
                    return;
                  }
                }
              }
            }
LABEL_29:
            v23 = (v37 - 1) & v37;
            v33 = __clz(__rbit64(v37)) + (v22 << 6);
          }
          v35 = (char *)*(id *)(*(_QWORD *)(v19 + 48) + 8 * v33);
          if (!v35)
            goto LABEL_39;
        }
        if (*(_QWORD *)&v35[OBJC_IVAR____TtC8MapsSync21MapsSyncObjectWrapper__managedObjectID])
          break;

      }
      v39 = (uint64_t)&v35[OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier];
      swift_beginAccess();
      sub_1A410356C(v39, (uint64_t)v9, (uint64_t *)&unk_1ED1ABCE0);
      v40 = sub_1A423BFE4();
      LODWORD(v39) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v9, 1, v40);
      sub_1A410251C((uint64_t)v9, (uint64_t *)&unk_1ED1ABCE0);
      if ((_DWORD)v39 != 1)
        break;
      aBlock = 0;
      v68 = 0xE000000000000000;
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      aBlock = 0xD00000000000002FLL;
      v68 = v65;
      v41 = objc_msgSend(v35, sel_description);
      sub_1A423C14C();

      sub_1A423C188();
      swift_bridgeObjectRelease();
      v43 = aBlock;
      v42 = v68;
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = v64;
      *(_QWORD *)(v44 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v44 + 64) = sub_1A40E766C();
      *(_QWORD *)(v44 + 32) = v43;
      *(_QWORD *)(v44 + 40) = v42;
      swift_bridgeObjectRetain();
      sub_1A423C020();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v45 = v57;
    v46 = objc_msgSend(v57, sel_managedObjectContext);
    if (v46)
    {
      v47 = v46;
      v48 = (_QWORD *)swift_allocObject();
      v48[2] = v35;
      v48[3] = v47;
      v48[4] = v55;
      v49 = v45;
      v54 = v35;
      v50 = v47;
      sub_1A4111284((uint64_t)v58);
      v51 = swift_allocObject();
      *(_QWORD *)(v51 + 16) = sub_1A41FD498;
      *(_QWORD *)(v51 + 24) = v48;
      v71 = sub_1A40DE09C;
      v72 = v51;
      aBlock = MEMORY[0x1E0C809B0];
      v68 = 1107296256;
      v69 = sub_1A40D4EE4;
      v70 = &block_descriptor_40;
      v52 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v50, sel_performBlockAndWait_, v52);

      _Block_release(v52);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      v29 = sub_1A41FD498;
      v30 = v48;
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        continue;
      __break(1u);
      goto LABEL_39;
    }
    break;
  }
LABEL_41:
  __break(1u);
}

void sub_1A41FAEAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1 + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A410356C(v9, (uint64_t)v8, (uint64_t *)&unk_1ED1ABCE0);
  v10 = sub_1A423BFE4();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1A41F99E4((uint64_t)v8, a2, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedReviewedPlace, (uint64_t *)&unk_1EE710AA0);
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    if (v13)
    {
      objc_msgSend(a3, sel_addReviewedPlacesObject_, v13);

      return;
    }
  }
  __break(1u);
}

void sub_1A41FB02C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A41CF8C8(a1);
  type metadata accessor for MapsSyncManagedCollection();
  if (swift_dynamicCastClass())
  {
    type metadata accessor for MapsSyncManagedAnonymousCredential();
    v6 = (void *)swift_dynamicCastClassUnconditional();
    v7 = a1;
    v8 = objc_msgSend(v6, sel_anonymousId);
    if (v8)
    {
      v9 = v8;
      v10 = sub_1A423BF54();
      v12 = v11;

    }
    else
    {
      v10 = 0;
      v12 = 0xF000000000000000;
    }
    v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId);
    v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId);
    v15 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8);
    *v13 = v10;
    v13[1] = v12;
    sub_1A40D7778(v14, v15);
    v16 = objc_msgSend(v6, sel_mapsToken);
    if (v16)
    {
      v17 = v16;
      v18 = sub_1A423BF54();
      v20 = v19;

    }
    else
    {
      v18 = 0;
      v20 = 0xF000000000000000;
    }
    v21 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken);
    v22 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken);
    v23 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken + 8);
    *v21 = v18;
    v21[1] = v20;
    sub_1A40D7778(v22, v23);
    v24 = objc_msgSend(v6, sel_mapsTokenCreatedAt);
    if (v24)
    {
      v25 = v24;
      sub_1A423BF84();

      v26 = sub_1A423BF9C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v5, 0, 1, v26);
    }
    else
    {
      v27 = sub_1A423BF9C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v5, 1, 1, v27);
    }
    v28 = v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt;
    swift_beginAccess();
    sub_1A40F1FC8((uint64_t)v5, v28);
    swift_endAccess();
    v29 = objc_msgSend(v6, sel_mapsTokenTTL);

    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL) = v29;
  }
}

uint64_t sub_1A41FB2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41FD0D0, v4);
  return swift_release();
}

uint64_t sub_1A41FB420()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  objc_class *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v21[32];
  __int128 v22;
  __int128 v23;
  objc_super v24;
  __int128 v25;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = 0xE000000000000000;
  sub_1A423C5CC();
  v25 = v22;
  sub_1A423C188();
  v5 = (objc_class *)type metadata accessor for MapsSyncAnonymousCredential();
  v24.receiver = v0;
  v24.super_class = v5;
  v6 = objc_msgSendSuper2(&v24, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8];
  v8 = MEMORY[0x1E0CB0338];
  if (v7 >> 60 == 15)
  {
    v22 = 0u;
    v23 = 0u;
  }
  else
  {
    v9 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId];
    *((_QWORD *)&v23 + 1) = MEMORY[0x1E0CB0338];
    *(_QWORD *)&v22 = v9;
    *((_QWORD *)&v22 + 1) = v7;
    sub_1A410356C((uint64_t)&v22, (uint64_t)v21, (uint64_t *)&unk_1ED1AC4F0);
    sub_1A40D7734(v9, v7);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC4F0);
    sub_1A423C158();
  }
  sub_1A410251C((uint64_t)&v22, (uint64_t *)&unk_1ED1AC4F0);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v10 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken + 8];
  if (v10 >> 60 == 15)
  {
    v22 = 0u;
    v23 = 0u;
  }
  else
  {
    v11 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken];
    *((_QWORD *)&v23 + 1) = v8;
    *(_QWORD *)&v22 = v11;
    *((_QWORD *)&v22 + 1) = v10;
    sub_1A410356C((uint64_t)&v22, (uint64_t)v21, (uint64_t *)&unk_1ED1AC4F0);
    sub_1A40D7734(v11, v10);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC4F0);
    sub_1A423C158();
  }
  sub_1A410251C((uint64_t)&v22, (uint64_t *)&unk_1ED1AC4F0);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v12 = (uint64_t)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt];
  swift_beginAccess();
  sub_1A410356C(v12, (uint64_t)v4, &qword_1ED1AB5D0);
  v13 = sub_1A423BF9C();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13) == 1)
  {
    sub_1A410251C((uint64_t)v4, &qword_1ED1AB5D0);
    v22 = 0u;
    v23 = 0u;
  }
  else
  {
    *((_QWORD *)&v23 + 1) = v13;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v22);
    (*(void (**)(uint64_t *, _BYTE *, uint64_t))(v14 + 32))(boxed_opaque_existential_0, v4, v13);
    sub_1A410356C((uint64_t)&v22, (uint64_t)v21, (uint64_t *)&unk_1ED1AC4F0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC4F0);
    sub_1A423C158();
  }
  sub_1A410251C((uint64_t)&v22, (uint64_t *)&unk_1ED1AC4F0);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v16 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL];
  *((_QWORD *)&v23 + 1) = MEMORY[0x1E0DEE190];
  *(_QWORD *)&v22 = v16;
  sub_1A410356C((uint64_t)&v22, (uint64_t)v21, (uint64_t *)&unk_1ED1AC4F0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC4F0);
  sub_1A423C158();
  sub_1A410251C((uint64_t)&v22, (uint64_t *)&unk_1ED1AC4F0);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v17 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces];
  if (v17)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v18 = sub_1A423C518();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(_QWORD *)(v17 + 16);
    }
  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)&v22 = v18;
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  return v25;
}

void *sub_1A41FB8EC(void *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId] = xmmword_1A4243680;
  *(_OWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken] = xmmword_1A4243680;
  v4 = &v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt];
  v5 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored] = MEMORY[0x1E0DEE9E8];
  return sub_1A41D033C(a1);
}

uint64_t sub_1A41FBA50()
{
  uint64_t v0;

  sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId), *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId + 8));
  sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken), *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken + 8));
  sub_1A410251C(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id MapsSyncAnonymousCredential.__deallocating_deinit()
{
  return sub_1A40E5B7C(0, type metadata accessor for MapsSyncAnonymousCredential);
}

id MapsSyncMutableAnonymousCredential.__allocating_init(proxyObject:)(void *a1)
{
  objc_class *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id MapsSyncMutableAnonymousCredential.init(proxyObject:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  type metadata accessor for MapsSyncManagedAnonymousCredential();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v3 = a1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_1A41FBCE4()
{
  return sub_1A41FBE3C((SEL *)&selRef_anonymousId);
}

void sub_1A41FBCFC(uint64_t a1, unint64_t a2)
{
  sub_1A41FBFA0(a1, a2, (SEL *)&selRef_setAnonymousId_);
}

void (*sub_1A41FBD08(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_anonymousId);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A41FBD84;
}

void sub_1A41FBD84(uint64_t *a1, char a2)
{
  sub_1A41F7018(a1, a2, (SEL *)&selRef_setAnonymousId_);
}

id sub_1A41FBD9C(char *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v4 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject];
  v5 = a1;
  v6 = objc_msgSend(v4, *a3);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1A423BF54();
    v10 = v9;

    v11 = (void *)sub_1A423BF48();
    sub_1A40D778C(v8, v10);
  }
  else
  {

    v11 = 0;
  }
  return v11;
}

uint64_t sub_1A41FBE30()
{
  return sub_1A41FBE3C((SEL *)&selRef_mapsToken);
}

uint64_t sub_1A41FBE3C(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), *a1));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_1A423BF54();

  return v4;
}

void sub_1A41FBEB4(char *a1, uint64_t a2, void *a3, SEL *a4)
{
  void *v5;
  char *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  char *v14;
  id v15;

  v5 = a3;
  if (!a3)
  {
    v11 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject];
    v14 = a1;
    v10 = 0xF000000000000000;
    goto LABEL_5;
  }
  v7 = a1;
  v8 = v5;
  v5 = (void *)sub_1A423BF54();
  v10 = v9;

  v11 = *(void **)&v7[OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject];
  if (v10 >> 60 == 15)
  {
LABEL_5:
    v12 = v11;
    v13 = 0;
    goto LABEL_6;
  }
  v12 = v11;
  v13 = sub_1A423BF48();
LABEL_6:
  v15 = (id)v13;
  objc_msgSend(v12, *a4);
  sub_1A40D7778((uint64_t)v5, v10);

}

void sub_1A41FBF94(uint64_t a1, unint64_t a2)
{
  sub_1A41FBFA0(a1, a2, (SEL *)&selRef_setMapsToken_);
}

void sub_1A41FBFA0(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v3;
  id v7;
  uint64_t v8;
  id v9;

  v7 = *(id *)(v3 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject);
  if (a2 >> 60 == 15)
    v8 = 0;
  else
    v8 = sub_1A423BF48();
  v9 = (id)v8;
  objc_msgSend(v7, *a3);
  sub_1A40D7778(a1, a2);

}

void sub_1A41FC038(_QWORD *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), *a2));
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_1A41FC0A4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = *a1;
  v7 = a1[1];
  v8 = *(void **)(*a2 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject);
  if (v7 >> 60 == 15)
  {
    v9 = v8;
    v10 = 0;
  }
  else
  {
    sub_1A40D7720(*a1, v7);
    v11 = v8;
    v10 = sub_1A423BF48();
  }
  v12 = (id)v10;
  objc_msgSend(v8, *a5);
  sub_1A40D7778(v6, v7);

}

void (*sub_1A41FC140(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_mapsToken);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423BF54();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A41FC1BC;
}

void sub_1A41FC1BC(uint64_t *a1, char a2)
{
  sub_1A41F7018(a1, a2, (SEL *)&selRef_setMapsToken_);
}

uint64_t sub_1A41FC320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenCreatedAt);
  if (v3)
  {
    v4 = v3;
    sub_1A423BF84();

    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_1A41FC47C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject);
  sub_1A410356C(a1, (uint64_t)v5, &qword_1ED1AB5D0);
  v7 = sub_1A423BF9C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  v10 = v6;
  v11 = 0;
  if (v9 != 1)
  {
    v11 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  objc_msgSend(v10, sel_setMapsTokenCreatedAt_, v11);

  return sub_1A410251C(a1, &qword_1ED1AB5D0);
}

uint64_t sub_1A41FC590@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenCreatedAt);
  if (v3)
  {
    v4 = v3;
    sub_1A423BF84();

    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_1A41FC620(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A410356C(a1, (uint64_t)v4, &qword_1ED1AB5D0);
  return sub_1A41FC47C((uint64_t)v4);
}

void (*sub_1A41FC6A4(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  v6 = malloc(v4);
  v7 = OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject;
  v3[5] = v6;
  v3[6] = v7;
  v8 = objc_msgSend(*(id *)(v1 + v7), sel_mapsTokenCreatedAt);
  if (v8)
  {
    v9 = v8;
    sub_1A423BF84();

    v10 = sub_1A423BF9C();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    v11 = sub_1A423BF9C();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  sub_1A40F1F64((uint64_t)v5, (uint64_t)v6);
  return sub_1A41FC7C0;
}

void sub_1A41FC7C0(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;

  v2 = *a1;
  v3 = (*a1)[5];
  v4 = v2[6];
  if ((a2 & 1) != 0)
  {
    v6 = v2[1];
    v5 = v2[2];
    v7 = *v2;
    sub_1A410356C(v3, v5, &qword_1ED1AB5D0);
    v8 = *(void **)(v7 + v4);
    sub_1A410356C(v5, v6, &qword_1ED1AB5D0);
    v9 = sub_1A423BF9C();
    v10 = *(_QWORD *)(v9 - 8);
    LODWORD(v5) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9);
    v11 = v8;
    v12 = 0;
    if ((_DWORD)v5 != 1)
    {
      v13 = v2[1];
      v12 = (void *)sub_1A423BF6C();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    }
    v15 = (void *)v2[4];
    v14 = (void *)v2[5];
    v17 = (void *)v2[2];
    v16 = (void *)v2[3];
    v18 = (void *)v2[1];
    objc_msgSend(v11, sel_setMapsTokenCreatedAt_, v12);

    sub_1A410251C((uint64_t)v17, &qword_1ED1AB5D0);
  }
  else
  {
    v19 = v2[3];
    v20 = *(void **)(*v2 + v4);
    sub_1A410356C(v3, v19, &qword_1ED1AB5D0);
    v21 = sub_1A423BF9C();
    v22 = *(_QWORD *)(v21 - 8);
    LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21);
    v23 = v20;
    v24 = 0;
    if ((_DWORD)v19 != 1)
    {
      v25 = v2[3];
      v24 = (void *)sub_1A423BF6C();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
    }
    v15 = (void *)v2[4];
    v14 = (void *)v2[5];
    v17 = (void *)v2[2];
    v16 = (void *)v2[3];
    v18 = (void *)v2[1];
    objc_msgSend(v23, sel_setMapsTokenCreatedAt_, v24);

  }
  sub_1A410251C((uint64_t)v14, &qword_1ED1AB5D0);
  free(v14);
  free(v15);
  free(v16);
  free(v17);
  free(v18);
  free(v2);
}

id sub_1A41FC9B0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenTTL);
}

id sub_1A41FC9E0(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_setMapsTokenTTL_, a1);
}

id (*sub_1A41FC9FC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = objc_msgSend(*(id *)(v1 + v2), sel_mapsTokenTTL);
  return sub_1A41FCA44;
}

id sub_1A41FCA44(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[1] + a1[2]), sel_setMapsTokenTTL_, *a1);
}

void sub_1A41FCA5C()
{
  uint64_t v0;

}

id MapsSyncMutableAnonymousCredential.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableAnonymousCredential);
}

void _s8MapsSync0aB19AnonymousCredentialC011fetchLatestcD0ACSgvgZ_0()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *ObjCClassFromMetadata;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  objc_super v21;
  uint64_t v22;

  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v0 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v0 = qword_1ED1AC168;
  }
  v1 = (void *)*v0;
  v2 = *(void **)(*v0 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
  if (!v2)
  {
    v3 = (objc_class *)type metadata accessor for MapsSyncError();
    v4 = objc_allocWithZone(v3);
    v5 = v1;
    v6 = (void *)sub_1A423C140();
    v21.receiver = v4;
    v21.super_class = v3;
    v7 = objc_msgSendSuper2(&v21, sel_initWithDomain_code_userInfo_, v6, 5, 0);

    swift_willThrow();
  }
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v9 = v2;
  v10 = objc_msgSend(ObjCClassFromMetadata, sel_entity);
  v11 = objc_msgSend(v10, sel_name);

  if (v11)
  {
    sub_1A423C14C();

    v12 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v13 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v12, sel_initWithEntityName_, v13);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1A4243670;
    v16 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
    v17 = (void *)sub_1A423C140();
    v18 = objc_msgSend(v16, sel_initWithKey_ascending_, v17, 0);

    *(_QWORD *)(v15 + 32) = v18;
    v22 = v15;
    sub_1A423C1DC();
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
    v19 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setSortDescriptors_, v19);

    objc_msgSend(v14, sel_setFetchLimit_, 1);
    if (v2)
    {
      v20 = v9;
      sub_1A4217FD8(v14, v20);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void _s8MapsSync0aB19AnonymousCredentialC09fetchWithC2IdyACSgSo6NSDataCFZ_0(void *a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *ObjCClassFromMetadata;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  objc_super v21;

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
  v3 = (void *)*v2;
  v4 = *(void **)(*v2 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
  if (!v4)
  {
    v5 = (objc_class *)type metadata accessor for MapsSyncError();
    v6 = objc_allocWithZone(v5);
    v7 = v3;
    v8 = (void *)sub_1A423C140();
    v21.receiver = v6;
    v21.super_class = v5;
    v9 = objc_msgSendSuper2(&v21, sel_initWithDomain_code_userInfo_, v8, 5, 0);

    swift_willThrow();
  }
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v11 = v4;
  v12 = objc_msgSend(ObjCClassFromMetadata, sel_entity);
  v13 = objc_msgSend(v12, sel_name);

  if (v13)
  {
    sub_1A423C14C();

    v14 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v15 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v14, sel_initWithEntityName_, v15);

    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v17 + 56) = sub_1A40D19C0(0, &qword_1EE710638);
    *(_QWORD *)(v17 + 64) = sub_1A41D8678(&qword_1EE710640, &qword_1EE710638);
    *(_QWORD *)(v17 + 32) = a1;
    v18 = a1;
    v19 = (void *)sub_1A423C314();
    objc_msgSend(v16, sel_setPredicate_, v19);

    if (v4)
    {
      v20 = v11;
      sub_1A4217FD8(v16, v20);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t type metadata accessor for MapsSyncAnonymousCredential()
{
  uint64_t result;

  result = qword_1EE7105C8;
  if (!qword_1EE7105C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A41FD0AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for MapsSyncMutableAnonymousCredential()
{
  return objc_opt_self();
}

void sub_1A41FD0F4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41FC038(a1, (SEL *)&selRef_anonymousId, a2);
}

void sub_1A41FD110(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41FC0A4(a1, a2, a3, a4, (SEL *)&selRef_setAnonymousId_);
}

void sub_1A41FD12C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A41FC038(a1, (SEL *)&selRef_mapsToken, a2);
}

void sub_1A41FD148(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A41FC0A4(a1, a2, a3, a4, (SEL *)&selRef_setMapsToken_);
}

id sub_1A41FD16C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenTTL);
  *a2 = result;
  return result;
}

id sub_1A41FD1A8(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_setMapsTokenTTL_, *a1);
}

uint64_t sub_1A41FD1CC()
{
  return type metadata accessor for MapsSyncAnonymousCredential();
}

void sub_1A41FD1D4()
{
  unint64_t v0;

  sub_1A40F2A6C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncAnonymousCredential()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncAnonymousCredential.anonymousId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x360))();
}

uint64_t dispatch thunk of MapsSyncAnonymousCredential.mapsToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x368))();
}

uint64_t dispatch thunk of MapsSyncAnonymousCredential.mapsTokenCreatedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x370))();
}

uint64_t dispatch thunk of MapsSyncAnonymousCredential.mapsTokenTTL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x378))();
}

uint64_t dispatch thunk of MapsSyncAnonymousCredential.reviewedPlaces.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x380))();
}

uint64_t method lookup function for MapsSyncMutableAnonymousCredential()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.anonymousId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.anonymousId.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.anonymousId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsToken.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsToken.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsToken.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenCreatedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenCreatedAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenCreatedAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenTTL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenTTL.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MapsSyncMutableAnonymousCredential.mapsTokenTTL.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t sub_1A41FD464()
{
  id *v0;

  return swift_deallocObject();
}

void sub_1A41FD498()
{
  uint64_t v0;

  sub_1A41FAEAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1A41FD4A4()
{
  return swift_deallocObject();
}

uint64_t sub_1A41FD4B4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A41FD4D8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableAnonymousCredential();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

id sub_1A41FD578()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedAnalyticsIdentifier()
{
  return objc_opt_self();
}

id sub_1A41FD61C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedHistoryMultiPointRoute()
{
  return objc_opt_self();
}

id FavoriteItem.__allocating_init(customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, void *a12, __int128 a13, __int128 a14, uint64_t a15, unsigned __int16 a16, unsigned __int16 a17, __int16 a18)
{
  objc_class *v18;
  id v22;
  id v23;

  v22 = objc_allocWithZone(v18);
  v23 = sub_1A4205840(a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11, (uint64_t)a12, a13, *((uint64_t *)&a13 + 1), a14, *((uint64_t *)&a14 + 1), a15, __SPAIR32__(a17, a16),
          a18);

  return v23;
}

id FavoriteItem.init(customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int16 a19, unsigned __int16 a20,__int16 a21)
{
  id v23;

  v23 = sub_1A4205840(a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, a11, a12, (uint64_t)a13, a14, a15, a16, a17, a18, __SPAIR32__(a20, a19),
          a21);

  return v23;
}

char *FavoriteItem.__allocating_init(store:customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, uint64_t a14, unsigned __int16 a15, unsigned __int16 a16, unsigned __int16 a17)
{
  objc_class *v17;
  id v24;

  v24 = objc_allocWithZone(v17);
  return FavoriteItem.init(store:customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, *((void **)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13, *((uint64_t *)&a13 + 1), a14,
           a15,
           a16,
           a17);
}

char *FavoriteItem.init(store:customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned __int16 a20,unsigned __int16 a21,unsigned __int16 a22)
{
  void *v22;
  char *v23;
  void *v24;
  char *v25;

  v23 = (char *)objc_msgSend(v22, sel_initWithStore_, a1);
  v24 = *(void **)&v23[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  v25 = v23;
  objc_msgSend(v24, sel_lock);
  sub_1A41FDCF0((uint64_t)v24, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    (uint64_t)v25);
  objc_msgSend(v24, sel_unlock);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C(a11, &qword_1ED1AB5D0);
  return v25;
}

uint64_t sub_1A41FDCF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned __int16 a20,unsigned __int16 a21,unsigned __int16 a22,uint64_t a23)
{
  char v26;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  _WORD *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  _QWORD **v76;
  _QWORD *v77;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  int v110;
  uint64_t v111;

  v111 = a8;
  v87 = a7;
  v26 = a4;
  v91 = a4;
  v94 = a2;
  v97 = a1;
  v104 = a22;
  v109 = a20;
  v110 = a21;
  v107 = a17;
  v108 = a18;
  v101 = a16;
  v102 = a19;
  v100 = a14;
  v98 = a13;
  v105 = a12;
  v106 = a15;
  v84 = a11;
  v99 = a10;
  v86 = a9;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v92 = *(_QWORD *)(v29 - 8);
  v90 = *(_QWORD *)(v92 + 64);
  v30 = MEMORY[0x1E0C80A78](v29);
  v103 = (uint64_t)&v83 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v33 = (char *)&v83 - v32;
  v34 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__customName);
  *v34 = a2;
  v34[1] = a3;
  v93 = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a23 + OBJC_IVAR___MSFavoriteItem__hidden) = v26;
  v35 = *(void **)(a23 + OBJC_IVAR___MSFavoriteItem__latitude);
  v89 = a5;
  *(_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__latitude) = a5;
  v96 = a5;

  v36 = *(void **)(a23 + OBJC_IVAR___MSFavoriteItem__longitude);
  v88 = a6;
  *(_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__longitude) = a6;
  v95 = a6;

  v37 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
  v38 = v111;
  *v37 = a7;
  v37[1] = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__mapItemCategory);
  v40 = v99;
  *v39 = a9;
  v39[1] = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = v84;
  sub_1A410356C(v84, (uint64_t)v33, &qword_1ED1AB5D0);
  v42 = a23 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed;
  swift_beginAccess();
  sub_1A40F1FC8((uint64_t)v33, v42);
  swift_endAccess();
  v43 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__mapItemName);
  v44 = v98;
  *v43 = v105;
  v43[1] = v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v45 = *(void **)(a23 + OBJC_IVAR___MSFavoriteItem__muid);
  v46 = v100;
  *(_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__muid) = v100;
  v85 = v46;

  v47 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__originatingAddressString);
  v48 = v101;
  *v47 = v106;
  v47[1] = v48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__positionIndex) = v107;
  v49 = (_QWORD *)(a23 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier);
  v50 = v102;
  *v49 = v108;
  v49[1] = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a23 + OBJC_IVAR___MSFavoriteItem__source) = v109;
  *(_WORD *)(a23 + OBJC_IVAR___MSFavoriteItem__type) = v110;
  *(_WORD *)(a23 + OBJC_IVAR___MSFavoriteItem__version) = v104;
  sub_1A410356C(v41, v103, &qword_1ED1AB5D0);
  v51 = (*(unsigned __int8 *)(v92 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  v52 = (v90 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
  v53 = (v52 + 23) & 0xFFFFFFFFFFFFFFF8;
  v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF8;
  v55 = (v54 + 23) & 0xFFFFFFFFFFFFFFF8;
  v56 = (v55 + 15) & 0xFFFFFFFFFFFFFFF8;
  v57 = (v56 + 17) & 0xFFFFFFFFFFFFFFF8;
  v58 = swift_allocObject();
  v59 = v93;
  *(_QWORD *)(v58 + 16) = v94;
  *(_QWORD *)(v58 + 24) = v59;
  *(_BYTE *)(v58 + 32) = v91;
  v60 = v88;
  *(_QWORD *)(v58 + 40) = v89;
  *(_QWORD *)(v58 + 48) = v60;
  v61 = v111;
  *(_QWORD *)(v58 + 56) = v87;
  *(_QWORD *)(v58 + 64) = v61;
  v62 = v58 + v51;
  v63 = v99;
  *(_QWORD *)(v58 + 72) = v86;
  *(_QWORD *)(v58 + 80) = v63;
  sub_1A40F1F64(v103, v62);
  v64 = (_QWORD *)(v58 + v52);
  v65 = v98;
  *v64 = v105;
  v64[1] = v65;
  *(_QWORD *)(v58 + v53) = v100;
  v66 = (_QWORD *)(v58 + v54);
  v67 = v101;
  *v66 = v106;
  v66[1] = v67;
  v68 = v108;
  *(_QWORD *)(v58 + v55) = v107;
  v69 = (_QWORD *)(v58 + v56);
  v70 = v102;
  *v69 = v68;
  v69[1] = v70;
  v71 = (_WORD *)(v58 + v57);
  *v71 = v109;
  v71[1] = v110;
  v71[2] = v104;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  v72 = v96;
  v73 = v95;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v74 = v85;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v75 = swift_allocObject();
    *(_QWORD *)(v75 + 16) = sub_1A4207EE4;
    *(_QWORD *)(v75 + 24) = v58;
    v76 = (_QWORD **)(a23 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v77 = *v76;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v76 = v77;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v77 = sub_1A40CF360(0, v77[2] + 1, 1, v77);
      *v76 = v77;
    }
    v80 = v77[2];
    v79 = v77[3];
    if (v80 >= v79 >> 1)
    {
      v77 = sub_1A40CF360((_QWORD *)(v79 > 1), v80 + 1, 1, v77);
      *v76 = v77;
    }
    v77[2] = v80 + 1;
    v81 = &v77[2 * v80];
    v81[4] = sub_1A40D8018;
    v81[5] = v75;
    swift_endAccess();
  }
  return swift_release();
}

void sub_1A41FE2B0(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, __int16 a20,__int16 a21,__int16 a22)
{
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;

  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  v31 = swift_dynamicCastClass();
  if (v31)
  {
    v32 = (void *)v31;
    v44 = a1;
    v33 = a1;
    if (a3)
      v34 = (void *)sub_1A423C140();
    else
      v34 = 0;
    objc_msgSend(v32, sel_setCustomName_, v34);

    objc_msgSend(v32, sel_setHidden_, a4 & 1);
    objc_msgSend(v32, sel_setLatitude_, a5);
    objc_msgSend(v32, sel_setLongitude_, a6);
    if (a8)
      v35 = (void *)sub_1A423C140();
    else
      v35 = 0;
    objc_msgSend(v32, sel_setMapItemAddress_, v35);

    if (a10)
      v36 = (void *)sub_1A423C140();
    else
      v36 = 0;
    objc_msgSend(v32, sel_setMapItemCategory_, v36);

    sub_1A410356C(a11, (uint64_t)v30, &qword_1ED1AB5D0);
    v37 = sub_1A423BF9C();
    v38 = *(_QWORD *)(v37 - 8);
    v39 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v30, 1, v37) != 1)
    {
      v39 = (void *)sub_1A423BF6C();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v30, v37);
    }
    objc_msgSend(v32, sel_setMapItemLastRefreshed_, v39);

    if (a13)
      v40 = (void *)sub_1A423C140();
    else
      v40 = 0;
    objc_msgSend(v32, sel_setMapItemName_, v40);

    objc_msgSend(v32, sel_setMuid_, a14);
    if (a16)
      v41 = (void *)sub_1A423C140();
    else
      v41 = 0;
    objc_msgSend(v32, sel_setOriginatingAddressString_, v41);

    objc_msgSend(v32, sel_setPositionIndex_, a17);
    if (a19)
      v42 = (void *)sub_1A423C140();
    else
      v42 = 0;
    objc_msgSend(v32, sel_setShortcutIdentifier_, v42);

    objc_msgSend(v32, sel_setSource_, a20);
    objc_msgSend(v32, sel_setType_, a21);
    objc_msgSend(v32, sel_setVersion_, a22);

  }
}

uint64_t sub_1A41FE858()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v2 = MEMORY[0x1E0DEE9D8];
  *v1 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
  v3 = (_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__handleChanges);
  swift_beginAccess();
  *v3 = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A41FE998()
{
  return type metadata accessor for MapsSyncManagedFavoriteItem();
}

void sub_1A41FE9A0(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  unsigned __int16 v69;
  unsigned __int16 v70;
  unsigned __int16 v71;
  void *v72;
  id v73;
  id v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v80 - v9;
  sub_1A4187884(a1);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  v11 = swift_dynamicCastClass();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = a1;
    if ((a2 & 1) != 0 || (v14 = objc_msgSend(v12, sel_customName)) == 0)
    {
      v16 = 0;
      v18 = 0;
    }
    else
    {
      v15 = v14;
      v16 = sub_1A423C14C();
      v18 = v17;

    }
    v19 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__customName);
    *v19 = v16;
    v19[1] = v18;
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v12, sel_hidden);
    *(_BYTE *)(v2 + OBJC_IVAR___MSFavoriteItem__hidden) = v20;
    if ((a2 & 1) != 0)
    {
      v21 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__latitude);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__latitude) = 0;

      v22 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__longitude);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__longitude) = 0;

      v23 = (_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
      *v23 = 0;
      v23[1] = 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = objc_msgSend(v12, sel_latitude);
      v25 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__latitude);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__latitude) = v24;

      v26 = objc_msgSend(v12, sel_longitude);
      v27 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__longitude);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__longitude) = v26;

      v28 = objc_msgSend(v12, sel_mapItemAddress);
      if (v28)
      {
        v29 = v28;
        v30 = sub_1A423C14C();
        v32 = v31;

      }
      else
      {
        v30 = 0;
        v32 = 0;
      }
      v33 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
      *v33 = v30;
      v33[1] = v32;
      swift_bridgeObjectRelease();
      v34 = objc_msgSend(v12, sel_mapItemCategory);
      if (v34)
      {
        v35 = v34;
        v36 = sub_1A423C14C();
        v38 = v37;

        goto LABEL_14;
      }
    }
    v36 = 0;
    v38 = 0;
LABEL_14:
    v39 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemCategory);
    *v39 = v36;
    v39[1] = v38;
    swift_bridgeObjectRelease();
    if ((a2 & 1) != 0)
    {
      v40 = sub_1A423BF9C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v10, 1, 1, v40);
    }
    else
    {
      v41 = objc_msgSend(v12, sel_mapItemLastRefreshed);
      if (v41)
      {
        v42 = v41;
        sub_1A423BF84();

        v43 = sub_1A423BF9C();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v8, 0, 1, v43);
      }
      else
      {
        v44 = sub_1A423BF9C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v8, 1, 1, v44);
      }
      sub_1A40F1F64((uint64_t)v8, (uint64_t)v10);
    }
    v45 = v2 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed;
    swift_beginAccess();
    sub_1A40F1FC8((uint64_t)v10, v45);
    swift_endAccess();
    if ((a2 & 1) != 0)
    {
      v46 = (_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemName);
      *v46 = 0;
      v46[1] = 0;
      swift_bridgeObjectRelease();
      v47 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__muid);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__muid) = 0;

    }
    else
    {
      v48 = objc_msgSend(v12, sel_mapItemName);
      if (v48)
      {
        v49 = v48;
        v50 = sub_1A423C14C();
        v52 = v51;

      }
      else
      {
        v50 = 0;
        v52 = 0;
      }
      v53 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemName);
      *v53 = v50;
      v53[1] = v52;
      swift_bridgeObjectRelease();
      v54 = objc_msgSend(v12, sel_muid);
      v55 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__muid);
      *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__muid) = v54;

      v56 = objc_msgSend(v12, sel_originatingAddressString);
      if (v56)
      {
        v57 = v56;
        v58 = sub_1A423C14C();
        v60 = v59;

LABEL_28:
        v61 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__originatingAddressString);
        *v61 = v58;
        v61[1] = v60;
        swift_bridgeObjectRelease();
        v62 = objc_msgSend(v12, sel_positionIndex);
        *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__positionIndex) = v62;
        if ((a2 & 1) != 0
          || (v63 = objc_msgSend(v12, sel_shortcutIdentifier)) == 0)
        {
          v65 = 0;
          v67 = 0;
        }
        else
        {
          v64 = v63;
          v65 = sub_1A423C14C();
          v67 = v66;

        }
        v68 = (uint64_t *)(v2 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier);
        *v68 = v65;
        v68[1] = v67;
        swift_bridgeObjectRelease();
        v69 = (unsigned __int16)objc_msgSend(v12, sel_source);
        *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__source) = v69;
        v70 = (unsigned __int16)objc_msgSend(v12, sel_type);
        *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__type) = v70;
        v71 = (unsigned __int16)objc_msgSend(v12, sel_version);
        *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__version) = v71;
        if ((a2 & 1) == 0)
        {
          v73 = objc_msgSend(v12, sel_mapItem);
          v72 = v73;
          if (!v73)
            goto LABEL_37;
          v74 = objc_msgSend(v73, sel_mapItemStorage);

          if (v74)
          {
            v72 = (void *)sub_1A423BF54();
            v76 = v75;

LABEL_38:
            v77 = (_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemStorage);
            v78 = *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemStorage);
            v79 = *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__mapItemStorage + 8);
            *v77 = v72;
            v77[1] = v76;
            sub_1A40D7778(v78, v79);

            return;
          }
        }
        v72 = 0;
LABEL_37:
        v76 = 0xF000000000000000;
        goto LABEL_38;
      }
    }
    v58 = 0;
    v60 = 0;
    goto LABEL_28;
  }
}

uint64_t sub_1A41FEFBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__customName;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__customName);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A4205B28;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40DE09C;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_41;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A41FF2CC(uint64_t a1, uint64_t a2)
{
  sub_1A4205B5C(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A41FF2F0(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A41FEFBC();
  a1[1] = v3;
  return sub_1A41FF324;
}

uint64_t sub_1A41FF324(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A4205B5C);
}

uint64_t sub_1A41FF398()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___MSFavoriteItem__hidden);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A41FF42C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_BYTE *)(v2 + OBJC_IVAR___MSFavoriteItem__hidden) = a1;
  v5 = swift_allocObject();
  *(_BYTE *)(v5 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4205D30;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D7370;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id sub_1A41FF5C8(uint64_t a1, char a2)
{
  id result;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setHidden_, a2 & 1);
  return result;
}

id (*sub_1A41FF618(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_BYTE *)(v1 + OBJC_IVAR___MSFavoriteItem__hidden);
  objc_msgSend(v3, sel_unlock);
  *(_BYTE *)(a1 + 8) = v4;
  return sub_1A41FF688;
}

id sub_1A41FF688(uint64_t a1)
{
  return sub_1A41FF42C(*(_BYTE *)(a1 + 8));
}

uint64_t sub_1A41FF6DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v21;
  _QWORD aBlock[6];
  void *v23;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(void **)(v1 + OBJC_IVAR___MSFavoriteItem__latitude);
  v23 = v4;
  v5 = v4;
  v6 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v4 != 0)
    return (uint64_t)v4;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v6) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v10 = sub_1A412CBF8();
  v12 = v11;
  swift_release();
  if ((v12 & 1) != 0)
  {
    aBlock[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v21 = v10;
LABEL_17:
    sub_1A40D70E8(v21);

    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v13 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v14 = v13;
  objc_msgSend(v3, sel_unlock);
  if (!v13)
  {
    v21 = v10;
    goto LABEL_17;
  }
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v10;
  v15[3] = v14;
  v15[4] = &v23;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1A4205D38;
  *(_QWORD *)(v16 + 24) = v15;
  aBlock[4] = sub_1A40E0AB0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40D4EE4;
  aBlock[3] = &block_descriptor_19_6;
  v17 = _Block_copy(aBlock);
  v18 = v14;
  sub_1A40D715C(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v17);
  sub_1A40D70E8(v10);

  _Block_release(v17);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v4 = v23;
    swift_release();
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

void sub_1A41FFA0C(void *a1)
{
  sub_1A4205D6C(a1);

}

void (*sub_1A41FFA30(uint64_t *a1))(id *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1A41FF6DC();
  return sub_1A41FFA64;
}

void sub_1A41FFA64(id *a1, char a2)
{
  sub_1A40D6D90(a1, a2, (void (*)(id))sub_1A4205D6C);
}

uint64_t sub_1A41FFAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v21;
  _QWORD aBlock[6];
  void *v23;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(void **)(v1 + OBJC_IVAR___MSFavoriteItem__longitude);
  v23 = v4;
  v5 = v4;
  v6 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v4 != 0)
    return (uint64_t)v4;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v6) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v10 = sub_1A412CBF8();
  v12 = v11;
  swift_release();
  if ((v12 & 1) != 0)
  {
    aBlock[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v21 = v10;
LABEL_17:
    sub_1A40D70E8(v21);

    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v13 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v14 = v13;
  objc_msgSend(v3, sel_unlock);
  if (!v13)
  {
    v21 = v10;
    goto LABEL_17;
  }
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v10;
  v15[3] = v14;
  v15[4] = &v23;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1A4205F1C;
  *(_QWORD *)(v16 + 24) = v15;
  aBlock[4] = sub_1A40E0AB0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40D4EE4;
  aBlock[3] = &block_descriptor_29_3;
  v17 = _Block_copy(aBlock);
  v18 = v14;
  sub_1A40D715C(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v17);
  sub_1A40D70E8(v10);

  _Block_release(v17);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v4 = v23;
    swift_release();
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

void sub_1A41FFDD0(void *a1)
{
  sub_1A4205F50(a1);

}

void (*sub_1A41FFDF4(uint64_t *a1))(id *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1A41FFAA0();
  return sub_1A41FFE28;
}

void sub_1A41FFE28(id *a1, char a2)
{
  sub_1A40D6D90(a1, a2, (void (*)(id))sub_1A4205F50);
}

uint64_t sub_1A41FFE40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__mapItemAddress;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A4206100;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40E0AB0;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_39_4;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4200150(uint64_t a1, uint64_t a2)
{
  sub_1A4206134(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A4200174(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A41FFE40();
  a1[1] = v3;
  return sub_1A42001A8;
}

uint64_t sub_1A42001A8(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A4206134);
}

uint64_t sub_1A42001C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__mapItemCategory;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__mapItemCategory);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A42062F8;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40E0AB0;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_49_6;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42004D0(uint64_t a1, uint64_t a2)
{
  sub_1A420632C(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A42004F4(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A42001C0();
  a1[1] = v3;
  return sub_1A4200528;
}

uint64_t sub_1A4200528(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A420632C);
}

uint64_t sub_1A42005F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t result;
  void *v20;
  char v21;
  char v22;
  void *v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  id v28;
  char isEscapingClosureAtFileLocation;
  void *v30;
  char *v31;
  _QWORD aBlock[6];

  v2 = v1;
  v31 = (char *)a1;
  ObjectType = swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&aBlock[-1] - v8;
  v10 = sub_1A423BF9C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v12(v9, 1, 1, v10);
  v13 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v13, sel_lock);
  v14 = v2 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed;
  swift_beginAccess();
  sub_1A410251C((uint64_t)v9, &qword_1ED1AB5D0);
  sub_1A410356C(v14, (uint64_t)v9, &qword_1ED1AB5D0);
  objc_msgSend(v13, sel_unlock);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1)
    return sub_1A40F1F64((uint64_t)v9, (uint64_t)v31);
  sub_1A410356C((uint64_t)v9, (uint64_t)v7, &qword_1ED1AB5D0);
  v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10);
  v16 = sub_1A410251C((uint64_t)v7, &qword_1ED1AB5D0);
  if (v15 != 1)
    return sub_1A40F1F64((uint64_t)v9, (uint64_t)v31);
  if (((*(uint64_t (**)(uint64_t))(ObjectType + 536))(v16) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      v18 = *(id *)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_10;
    }
  }
  v18 = *(id *)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_10:

  v20 = sub_1A412CBF8();
  v22 = v21;
  swift_release();
  if ((v22 & 1) != 0)
  {
    aBlock[0] = v20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v30 = v20;
LABEL_16:
    sub_1A40D70E8(v30);
    v12(v31, 1, 1, v10);
    return sub_1A410251C((uint64_t)v9, &qword_1ED1AB5D0);
  }
  objc_msgSend(v13, sel_lock);
  v23 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v24 = v23;
  objc_msgSend(v13, (SEL)&selRef_fetchContactHandles + 1);
  if (!v23)
  {
    v30 = v20;
    goto LABEL_16;
  }
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = v20;
  v25[3] = v24;
  v25[4] = v9;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = sub_1A42064F0;
  *(_QWORD *)(v26 + 24) = v25;
  aBlock[4] = sub_1A40E0AB0;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40D4EE4;
  aBlock[3] = &block_descriptor_59_2;
  v27 = _Block_copy(aBlock);
  v28 = v24;
  sub_1A40D715C(v20);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_performBlockAndWait_, v27);
  sub_1A40D70E8(v20);

  _Block_release(v27);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_1A40F1F64((uint64_t)v9, (uint64_t)v31);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A4200AD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD **v16;
  _QWORD *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v23 - v9;
  v11 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v11, sel_lock);
  sub_1A410356C(a1, (uint64_t)v10, &qword_1ED1AB5D0);
  v12 = v2 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed;
  swift_beginAccess();
  sub_1A40F1FC8((uint64_t)v10, v12);
  swift_endAccess();
  sub_1A410356C(a1, (uint64_t)v8, &qword_1ED1AB5D0);
  v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v14 = swift_allocObject();
  sub_1A40F1F64((uint64_t)v8, v14 + v13);
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_1A42065A4;
    *(_QWORD *)(v15 + 24) = v14;
    v16 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v17 = *v16;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v16 = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = sub_1A40CF360(0, v17[2] + 1, 1, v17);
      *v16 = v17;
    }
    v20 = v17[2];
    v19 = v17[3];
    if (v20 >= v19 >> 1)
    {
      v17 = sub_1A40CF360((_QWORD *)(v19 > 1), v20 + 1, 1, v17);
      *v16 = v17;
    }
    v17[2] = v20 + 1;
    v21 = &v17[2 * v20];
    v21[4] = sub_1A40D8018;
    v21[5] = v15;
    swift_endAccess();
  }
  swift_release();
  objc_msgSend(v11, sel_unlock);
  return sub_1A410251C(a1, &qword_1ED1AB5D0);
}

uint64_t sub_1A4200D38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A410356C(a1, (uint64_t)v4, &qword_1ED1AB5D0);
  return sub_1A4200AD0((uint64_t)v4);
}

void sub_1A4200DBC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void (*v23)(_BYTE *, _BYTE *, uint64_t);
  void (*v24)(_BYTE *, _QWORD, uint64_t, uint64_t);
  id v25;
  void *v26;
  _BYTE v27[16];
  id v28[2];

  v28[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v6);
  v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1A423BF9C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = &v27[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11);
  v15 = &v27[-v14];
  v28[0] = 0;
  v16 = objc_msgSend(a1, sel_existingObjectWithID_error_, a2, v28);
  v17 = v28[0];
  if (v16)
  {
    v18 = v16;
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v19 = (void *)swift_dynamicCastClass();
    v20 = v17;
    if (v19)
    {
      v21 = objc_msgSend(v19, sel_mapItemLastRefreshed);
      if (v21)
      {
        v22 = v21;
        sub_1A423BF84();

        v23 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32);
        v23(v8, v13, v9);
        v24 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56);
        v24(v8, 0, 1, v9);
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
        {
          v23(v15, v8, v9);
          sub_1A410251C(a3, &qword_1ED1AB5D0);
          v23((_BYTE *)a3, v15, v9);
          v24((_BYTE *)a3, 0, 1, v9);
          return;
        }
      }
      else
      {

        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
      }
      sub_1A410251C((uint64_t)v8, &qword_1ED1AB5D0);
    }
    else
    {

    }
  }
  else
  {
    v25 = v28[0];
    v26 = (void *)sub_1A423BEC4();

    swift_willThrow();
  }
}

void sub_1A4201030(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = (void *)v7;
    sub_1A410356C(a2, (uint64_t)v6, &qword_1ED1AB5D0);
    v9 = sub_1A423BF9C();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9);
    v12 = a1;
    v13 = 0;
    if (v11 != 1)
    {
      v13 = (void *)sub_1A423BF6C();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    }
    objc_msgSend(v8, sel_setMapItemLastRefreshed_, v13);

  }
}

void (*sub_1A4201144(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  sub_1A42005F8((uint64_t)v4);
  return sub_1A42011B0;
}

void sub_1A42011B0(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_1A410356C(*(_QWORD *)(a1 + 16), (uint64_t)v2, &qword_1ED1AB5D0);
    sub_1A4200AD0((uint64_t)v2);
    sub_1A410251C((uint64_t)v3, &qword_1ED1AB5D0);
  }
  else
  {
    sub_1A4200AD0(*(_QWORD *)(a1 + 16));
  }
  free(v3);
  free(v2);
}

uint64_t sub_1A420122C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__mapItemName;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__mapItemName);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A42065E4;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40E0AB0;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_76;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A420153C(uint64_t a1, uint64_t a2)
{
  sub_1A4206618(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A4201560(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A420122C();
  a1[1] = v3;
  return sub_1A4201594;
}

uint64_t sub_1A4201594(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A4206618);
}

uint64_t sub_1A42015D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v21;
  _QWORD aBlock[6];
  void *v23;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(void **)(v1 + OBJC_IVAR___MSFavoriteItem__muid);
  v23 = v4;
  v5 = v4;
  v6 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v4 != 0)
    return (uint64_t)v4;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v6) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v9 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v10 = sub_1A412CBF8();
  v12 = v11;
  swift_release();
  if ((v12 & 1) != 0)
  {
    aBlock[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v21 = v10;
LABEL_17:
    sub_1A40D70E8(v21);

    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v13 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v14 = v13;
  objc_msgSend(v3, sel_unlock);
  if (!v13)
  {
    v21 = v10;
    goto LABEL_17;
  }
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v10;
  v15[3] = v14;
  v15[4] = &v23;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1A42067DC;
  *(_QWORD *)(v16 + 24) = v15;
  aBlock[4] = sub_1A40E0AB0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40D4EE4;
  aBlock[3] = &block_descriptor_86_1;
  v17 = _Block_copy(aBlock);
  v18 = v14;
  sub_1A40D715C(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBlockAndWait_, v17);
  sub_1A40D70E8(v10);

  _Block_release(v17);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v4 = v23;
    swift_release();
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

void sub_1A4201900(void *a1)
{
  sub_1A4206810(a1);

}

void sub_1A4201924(void *a1, uint64_t a2, void **a3, SEL *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v6 = objc_msgSend(a1, sel_existingObjectWithID_error_, a2, v15);
  v7 = v15[0];
  if (v6)
  {
    v8 = v6;
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v9 = (void *)swift_dynamicCastClass();
    v10 = v7;
    if (v9)
    {
      v11 = objc_msgSend(v9, *a4);

      if (v11)
      {
        v12 = *a3;
        *a3 = v11;

      }
    }
    else
    {

    }
  }
  else
  {
    v13 = v15[0];
    v14 = (void *)sub_1A423BEC4();

    swift_willThrow();
  }
}

id sub_1A4201A34(uint64_t a1, uint64_t a2, SEL *a3)
{
  id result;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, *a3, a2);
  return result;
}

void (*sub_1A4201A90(uint64_t *a1))(id *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1A42015D0();
  return sub_1A4201AC4;
}

void sub_1A4201AC4(id *a1, char a2)
{
  sub_1A40D6D90(a1, a2, (void (*)(id))sub_1A4206810);
}

uint64_t sub_1A4201ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__originatingAddressString;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__originatingAddressString);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A42069C0;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40E0AB0;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_96_2;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4201DEC(uint64_t a1, uint64_t a2)
{
  sub_1A42069F4(a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1A4201E10(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A4201ADC();
  a1[1] = v3;
  return sub_1A4201E44;
}

uint64_t sub_1A4201E44(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A42069F4);
}

uint64_t sub_1A4201EB8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__positionIndex);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A4201F4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__positionIndex) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4206BC8;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id sub_1A42020E8(uint64_t a1, uint64_t a2)
{
  id result;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setPositionIndex_, a2);
  return result;
}

id (*sub_1A4202138(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___MSFavoriteItem__positionIndex);
  objc_msgSend(v3, sel_unlock);
  *a1 = v4;
  return sub_1A42021A8;
}

id sub_1A42021A8(uint64_t *a1)
{
  return sub_1A4201F4C(*a1);
}

uint64_t sub_1A42021D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = v0 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier);
  v5 = *(_QWORD *)(v4 + 8);
  v24[0] = v6;
  v24[1] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v5 != 0)
    return v6;
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v7) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_11;
    }
  }
  v10 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_11:

  v11 = sub_1A412CBF8();
  v13 = v12;
  swift_release();
  if ((v13 & 1) != 0)
  {
    v23[0] = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v22 = v11;
LABEL_17:
    sub_1A40D70E8(v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  objc_msgSend(v3, sel_lock);
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v15 = v14;
  objc_msgSend(v3, sel_unlock);
  if (!v14)
  {
    v22 = v11;
    goto LABEL_17;
  }
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v11;
  v16[3] = v15;
  v16[4] = v24;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1A4206BF4;
  *(_QWORD *)(v17 + 24) = v16;
  v23[4] = sub_1A40E0AB0;
  v23[5] = v17;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 1107296256;
  v23[2] = sub_1A40D4EE4;
  v23[3] = &block_descriptor_113_0;
  v18 = _Block_copy(v23);
  v19 = v15;
  sub_1A40D715C(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBlockAndWait_, v18);
  sub_1A40D70E8(v11);

  _Block_release(v18);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v6 = v24[0];
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42024E4(uint64_t a1, uint64_t a2)
{
  sub_1A4206C28(a1, a2);
  return swift_bridgeObjectRelease();
}

void sub_1A4202508(void *a1, uint64_t a2, uint64_t *a3, SEL *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v18[0] = 0;
  v6 = objc_msgSend(a1, sel_existingObjectWithID_error_, a2, v18);
  v7 = v18[0];
  if (v6)
  {
    v8 = v6;
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v9 = (void *)swift_dynamicCastClass();
    v10 = v7;
    if (v9 && (v11 = objc_msgSend(v9, *a4)) != 0)
    {
      v12 = v11;
      v13 = sub_1A423C14C();
      v15 = v14;

      *a3 = v13;
      a3[1] = v15;
      swift_bridgeObjectRelease();
    }
    else
    {

    }
  }
  else
  {
    v16 = v18[0];
    v17 = (void *)sub_1A423BEC4();

    swift_willThrow();
  }
}

void sub_1A4202628(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  v7 = swift_dynamicCastClass();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = a1;
    if (a3)
      v10 = sub_1A423C140();
    else
      v10 = 0;
    v11 = (id)v10;
    objc_msgSend(v8, *a4);

  }
}

uint64_t (*sub_1A42026D8(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_1A42021D4();
  a1[1] = v3;
  return sub_1A420270C;
}

uint64_t sub_1A420270C(uint64_t *a1, char a2)
{
  return sub_1A40DA430(a1, a2, (void (*)(uint64_t, uint64_t))sub_1A4206C28);
}

uint64_t sub_1A4202724()
{
  return sub_1A40F0A10(&OBJC_IVAR___MSFavoriteItem__source);
}

id _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(__int16 a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__source) = a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4206DFC;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id (*sub_1A420290C(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  __int16 v4;

  *(_QWORD *)a1 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_WORD *)(v1 + OBJC_IVAR___MSFavoriteItem__source);
  objc_msgSend(v3, sel_unlock);
  *(_WORD *)(a1 + 8) = v4;
  return sub_1A420297C;
}

id sub_1A420297C(uint64_t a1)
{
  return _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(*(_WORD *)(a1 + 8));
}

uint64_t sub_1A42029AC()
{
  return sub_1A40F0A10(&OBJC_IVAR___MSFavoriteItem__type);
}

id _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(__int16 a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__type) = a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4206E2C;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id (*sub_1A4202B94(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  __int16 v4;

  *(_QWORD *)a1 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_WORD *)(v1 + OBJC_IVAR___MSFavoriteItem__type);
  objc_msgSend(v3, sel_unlock);
  *(_WORD *)(a1 + 8) = v4;
  return sub_1A4202C04;
}

id sub_1A4202C04(uint64_t a1)
{
  return _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(*(_WORD *)(a1 + 8));
}

uint64_t sub_1A4202C34()
{
  return sub_1A40F0A10(&OBJC_IVAR___MSFavoriteItem__version);
}

id sub_1A4202C80(__int16 a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_WORD *)(v2 + OBJC_IVAR___MSFavoriteItem__version) = a1;
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4206E5C;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id sub_1A4202E1C(uint64_t a1, __int16 a2, SEL *a3)
{
  id result;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, *a3, a2);
  return result;
}

id (*sub_1A4202E78(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  __int16 v4;

  *(_QWORD *)a1 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_WORD *)(v1 + OBJC_IVAR___MSFavoriteItem__version);
  objc_msgSend(v3, sel_unlock);
  *(_WORD *)(a1 + 8) = v4;
  return sub_1A4202EE8;
}

id sub_1A4202EE8(uint64_t a1)
{
  return sub_1A4202C80(*(_WORD *)(a1 + 8));
}

uint64_t sub_1A4202F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  id v26;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD aBlock[6];
  uint64_t v37;
  unint64_t v38;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___MSFavoriteItem__mapItemStorage);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___MSFavoriteItem__mapItemStorage + 8);
  v37 = v8;
  v38 = v7;
  sub_1A40D7720(v8, v7);
  sub_1A40D7778(0, 0xF000000000000000);
  v9 = objc_msgSend(v6, sel_unlock);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad) != 1 || v7 >> 60 != 15)
  {
    if (v7 >> 60 != 15)
    {
      v11 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
      sub_1A40D7734(v8, v7);
      v12 = (void *)sub_1A423BF48();
      v13 = objc_msgSend(v11, sel_initWithData_, v12);

      if (v13)
      {
        objc_msgSend(v6, sel_lock);
        v14 = v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier;
        swift_beginAccess();
        sub_1A410356C(v14, (uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
        objc_msgSend(v6, sel_unlock);
        swift_getObjectType();
        v15 = MapsSyncMapItemWithClientAttributes(mapItemStorage:identifier:classType:)(v13, (uint64_t)v5);

        sub_1A40D7778(v8, v7);
        sub_1A410251C((uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
        sub_1A40D7778(v8, v7);
        return (uint64_t)v15;
      }
      sub_1A40D7778(v8, v7);
    }
    goto LABEL_22;
  }
  if (((*(uint64_t (**)(id))(ObjectType + 536))(v9) & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      v17 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154780();
      goto LABEL_13;
    }
  }
  v17 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  sub_1A4154774();
LABEL_13:

  v18 = sub_1A412CBF8();
  v20 = v19;
  swift_release();
  if ((v20 & 1) != 0)
  {
    aBlock[0] = v18;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    v30 = v18;
LABEL_21:
    sub_1A40D70E8(v30);
LABEL_22:
    sub_1A40D7778(v8, v7);
    return 0;
  }
  objc_msgSend(v6, sel_lock);
  v21 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v22 = v21;
  objc_msgSend(v6, sel_unlock);
  if (!v21)
  {
    v30 = v18;
    goto LABEL_21;
  }
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v18;
  v23[3] = v22;
  v23[4] = &v37;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = sub_1A4206E7C;
  *(_QWORD *)(v24 + 24) = v23;
  aBlock[4] = sub_1A40E0AB0;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40D4EE4;
  aBlock[3] = &block_descriptor_144;
  v25 = _Block_copy(aBlock);
  v26 = v22;
  swift_retain();
  sub_1A40D715C(v18);
  swift_release();
  objc_msgSend(v18, sel_performBlockAndWait_, v25);
  _Block_release(v25);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v29 = v38;
    if (v38 >> 60 == 15)
    {
      sub_1A40D70E8(v18);

    }
    else
    {
      v31 = v37;
      v32 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
      sub_1A40D7734(v31, v29);
      v33 = (void *)sub_1A423BF48();
      v34 = objc_msgSend(v32, sel_initWithData_, v33);

      if (v34)
      {
        objc_msgSend(v6, sel_lock);
        v35 = v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier;
        swift_beginAccess();
        sub_1A410356C(v35, (uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
        objc_msgSend(v6, sel_unlock);
        swift_getObjectType();
        v15 = MapsSyncMapItemWithClientAttributes(mapItemStorage:identifier:classType:)(v34, (uint64_t)v5);

        sub_1A40D7778(v31, v29);
        sub_1A40D70E8(v18);
        sub_1A410251C((uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
        sub_1A40D7778(v37, v38);
        swift_release();
        return (uint64_t)v15;
      }
      sub_1A40D70E8(v18);

      sub_1A40D7778(v31, v29);
    }
    sub_1A40D7778(v37, v38);
    swift_release();
    return 0;
  }
  __break(1u);
  return result;
}

void sub_1A420353C(void *a1)
{
  char *v1;
  void *v2;

  v2 = *(void **)&v1[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  objc_msgSend(v2, sel_lock);
  sub_1A420375C((uint64_t)v2, a1, v1);
  objc_msgSend(v2, sel_unlock);

}

void sub_1A42035A0(id *a1, char **a2)
{
  id v2;
  char *v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  v4 = *(void **)&(*a2)[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  v5 = *a1;
  objc_msgSend(v4, sel_lock);
  sub_1A420375C((uint64_t)v4, v2, v3);
  objc_msgSend(v4, sel_unlock);

}

void sub_1A4203618(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v19[0] = 0;
  v4 = objc_msgSend(a1, sel_existingObjectWithID_error_, a2, v19);
  v5 = v19[0];
  if (v4)
  {
    v6 = v4;
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v7 = (void *)swift_dynamicCastClass();
    v8 = v5;
    if (v7
      && (v9 = objc_msgSend(v7, sel_mapItem)) != 0
      && (v10 = v9,
          v11 = objc_msgSend(v9, sel_mapItemStorage),
          v10,
          v11))
    {
      v12 = sub_1A423BF54();
      v14 = v13;

      v15 = *a3;
      v16 = a3[1];
      *a3 = v12;
      a3[1] = v14;
      sub_1A40D7778(v15, v16);
    }
    else
    {

    }
  }
  else
  {
    v17 = v19[0];
    v18 = (void *)sub_1A423BEC4();

    swift_willThrow();
  }
}

uint64_t sub_1A420375C(uint64_t a1, id a2, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  char *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  char *v65;
  uint64_t v66;
  char *v67;
  _QWORD *v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  id v74;
  char *v75;
  uint64_t v76;

  v76 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A423BF9C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v74 - v13;
  sub_1A423BF90();
  if (!a2)
  {
    v30 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__latitude];
    *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__latitude] = 0;

    v31 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__longitude];
    *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__longitude] = 0;

    v32 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__muid];
    *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__muid] = 0;

    v33 = &a3[OBJC_IVAR___MSFavoriteItem__mapItemAddress];
    *(_QWORD *)v33 = 0;
    *((_QWORD *)v33 + 1) = 0;
    swift_bridgeObjectRelease();
    v34 = &a3[OBJC_IVAR___MSFavoriteItem__mapItemName];
    *(_QWORD *)v34 = 0;
    *((_QWORD *)v34 + 1) = 0;
    swift_bridgeObjectRelease();
    v35 = &a3[OBJC_IVAR___MSFavoriteItem__mapItemCategory];
    *(_QWORD *)v35 = 0;
    *((_QWORD *)v35 + 1) = 0;
    swift_bridgeObjectRelease();
    v36 = *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage];
    v37 = *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage + 8];
    *(_OWORD *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage] = xmmword_1A4243680;
    sub_1A40D7778(v36, v37);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    v38 = (uint64_t)&a3[OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed];
    swift_beginAccess();
    sub_1A40F1FC8((uint64_t)v7, v38);
    swift_endAccess();
    v39 = 0;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    goto LABEL_15;
  }
  v74 = a2;
  v75 = v14;
  v15 = a2;
  objc_msgSend(v15, sel_coordinate);
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v16);
  v18 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__latitude];
  *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__latitude] = v17;

  objc_msgSend(v15, sel_coordinate);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v19);
  v21 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__longitude];
  *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__longitude] = v20;

  v22 = objc_msgSend(v15, sel__muid);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedLongLong_, v22);
  v24 = *(void **)&a3[OBJC_IVAR___MSFavoriteItem__muid];
  *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__muid] = v23;

  v25 = objc_msgSend(v15, sel_addressObject);
  v26 = v25;
  if (!v25)
    goto LABEL_7;
  v27 = objc_msgSend(v25, sel_fullAddressWithMultiline_, 0);

  if (!v27)
  {
    v26 = 0;
LABEL_7:
    v29 = 0;
    goto LABEL_8;
  }
  v26 = (void *)sub_1A423C14C();
  v29 = v28;

LABEL_8:
  v40 = &a3[OBJC_IVAR___MSFavoriteItem__mapItemAddress];
  *(_QWORD *)v40 = v26;
  *((_QWORD *)v40 + 1) = v29;
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(v15, sel_name);
  if (v41)
  {
    v42 = v41;
    v43 = sub_1A423C14C();
    v45 = v44;

  }
  else
  {
    v43 = 0;
    v45 = 0;
  }
  v46 = (uint64_t *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemName];
  *v46 = v43;
  v46[1] = v45;
  swift_bridgeObjectRelease();
  a2 = v15;
  v47 = sub_1A42054F4(a2);
  v49 = v48;

  v50 = &a3[OBJC_IVAR___MSFavoriteItem__mapItemCategory];
  *(_QWORD *)v50 = v47;
  *((_QWORD *)v50 + 1) = v49;
  swift_bridgeObjectRelease();
  v51 = objc_msgSend(a2, sel_data);
  if (v51)
  {
    v52 = v51;
    v53 = sub_1A423BF54();
    v55 = v54;

  }
  else
  {
    v53 = 0;
    v55 = 0xF000000000000000;
  }
  v56 = (uint64_t *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage];
  v57 = *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage];
  v58 = *(_QWORD *)&a3[OBJC_IVAR___MSFavoriteItem__mapItemStorage + 8];
  *v56 = v53;
  v56[1] = v55;
  sub_1A40D7778(v57, v58);
  v59 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v14 = v75;
  v59(v7, v75, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  v60 = (uint64_t)&a3[OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed];
  swift_beginAccess();
  sub_1A40F1FC8((uint64_t)v7, v60);
  swift_endAccess();

  v39 = v74;
  v59(v12, v14, v8);
LABEL_15:
  v61 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v62 = (v10 + v61 + 7) & 0xFFFFFFFFFFFFFFF8;
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v63 + v61, v12, v8);
  *(_QWORD *)(v63 + v62) = a3;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  v64 = a2;
  v65 = a3;
  if ((sub_1A423C44C() & 1) != 0)
  {
    v66 = swift_allocObject();
    *(_QWORD *)(v66 + 16) = sub_1A4207B94;
    *(_QWORD *)(v66 + 24) = v63;
    v67 = &v65[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks];
    swift_beginAccess();
    v68 = *(_QWORD **)v67;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v67 = v68;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v68 = sub_1A40CF360(0, v68[2] + 1, 1, v68);
      *(_QWORD *)v67 = v68;
    }
    v71 = v68[2];
    v70 = v68[3];
    if (v71 >= v70 >> 1)
    {
      v68 = sub_1A40CF360((_QWORD *)(v70 > 1), v71 + 1, 1, v68);
      *(_QWORD *)v67 = v68;
    }
    v68[2] = v71 + 1;
    v72 = &v68[2 * v71];
    v72[4] = sub_1A40D8018;
    v72[5] = v66;
    swift_endAccess();
  }
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

void sub_1A4203D58(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *ObjCClassFromObject;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  double v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  id v44;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = (void *)v4;
    if (a2)
    {
      ObjCClassFromObject = (void *)swift_getObjCClassFromObject();
      v44 = a1;
      v7 = a2;
      v8 = objc_msgSend(ObjCClassFromObject, sel_strippedMapItemWith_, v7);
      v9 = objc_msgSend(v5, sel_managedObjectContext);
      if (!v9)
      {

        v23 = v8;
LABEL_24:

        return;
      }
      v10 = v9;
      objc_msgSend(v8, sel_coordinate);
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v11);
      objc_msgSend(v5, sel_setLatitude_, v12);

      objc_msgSend(v8, sel_coordinate);
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v13);
      objc_msgSend(v5, sel_setLongitude_, v14);

      v15 = objc_msgSend(v8, sel__muid);
      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedLongLong_, v15);
      objc_msgSend(v5, sel_setMuid_, v16);

      v17 = objc_msgSend(v8, sel_addressObject);
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, sel_fullAddressWithMultiline_, 0);

        if (v19)
        {
          sub_1A423C14C();

          v18 = (void *)sub_1A423C140();
          swift_bridgeObjectRelease();
        }
        else
        {
          v18 = 0;
        }
      }
      objc_msgSend(v5, sel_setMapItemAddress_, v18);

      v24 = objc_msgSend(v8, sel_name);
      objc_msgSend(v5, sel_setMapItemName_, v24);

      v25 = v8;
      sub_1A42054F4(v25);

      v26 = (void *)sub_1A423C140();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_setMapItemCategory_, v26);

      v27 = (void *)sub_1A423BF6C();
      objc_msgSend(v5, sel_setMapItemLastRefreshed_, v27);

      v28 = objc_msgSend(v5, sel_mapItem);
      if (!v28)
      {
        type metadata accessor for MapsSyncManagedMixinMapItem();
        v29 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v10);
        objc_msgSend(v5, sel_setMapItem_, v29);

        v30 = objc_msgSend(v5, sel_mapItem);
        if (v30)
        {
          v31 = v30;
          v32 = (void *)sub_1A423BF6C();
          objc_msgSend(v31, sel_setCreateTime_, v32);

        }
        v33 = objc_msgSend(v5, sel_mapItem);
        if (v33)
        {
          v34 = v33;
          v35 = (void *)sub_1A423BF6C();
          objc_msgSend(v34, sel_setModificationTime_, v35);

        }
      }
      v36 = objc_msgSend(v5, sel_mapItem);
      if (v36)
      {
        v37 = v36;
        objc_msgSend(v25, sel_coordinate);
        objc_msgSend(v37, sel_setLatitude_);
        objc_msgSend(v25, sel_coordinate);
        objc_msgSend(v37, sel_setLongitude_, v38);
        v39 = objc_msgSend(v25, sel_data);
        if (v39)
        {
          v40 = sub_1A423BF54();
          v42 = v41;

          v39 = (id)sub_1A423BF48();
          sub_1A40D778C(v40, v42);
        }
        objc_msgSend(v37, sel_setMapItemStorage_, v39);

        v43 = (void *)sub_1A423BF6C();
        objc_msgSend(v37, sel_setModificationTime_, v43);

      }
    }
    else
    {
      v44 = a1;
      v20 = objc_msgSend(v5, sel_mapItem);
      if (v20)
      {
        v21 = v20;
        objc_msgSend(v20, sel_setMapItemStorage_, 0);

      }
      objc_msgSend(v5, sel_setLatitude_, 0);
      objc_msgSend(v5, sel_setLongitude_, 0);
      objc_msgSend(v5, sel_setMuid_, 0);
      v22 = (void *)sub_1A423BF6C();
      objc_msgSend(v5, sel_setModificationTime_, v22);

      objc_msgSend(v5, sel_setMapItemAddress_, 0);
      objc_msgSend(v5, sel_setMapItemName_, 0);
      objc_msgSend(v5, sel_setMapItemCategory_, 0);
      objc_msgSend(v5, sel_setMapItemLastRefreshed_, 0);
    }
    v23 = v44;
    goto LABEL_24;
  }
}

void (*sub_1A4204324(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1A4202F3C();
  return sub_1A4204358;
}

void sub_1A4204358(uint64_t a1, char a2)
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(char **)(a1 + 8);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  v6 = *(id *)a1;
  if ((a2 & 1) != 0)
  {
    v4 = v6;
    objc_msgSend(v3, sel_lock);
    sub_1A420375C((uint64_t)v3, v6, v2);
    objc_msgSend(v3, sel_unlock);

    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, sel_lock);
    sub_1A420375C((uint64_t)v3, v6, v2);
    objc_msgSend(v3, sel_unlock);
    v5 = v6;
  }

}

_QWORD *sub_1A4204414()
{
  char *v0;
  void *v1;
  uint64_t inited;
  id v3;
  char *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v9;

  v1 = *(void **)&v0[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243670;
  *(_QWORD *)(inited + 32) = v0;
  v9 = inited;
  sub_1A423C1DC();
  v3 = v1;
  v4 = v0;
  sub_1A415DA88(v9);

  swift_bridgeObjectRelease();
  v5 = *(void **)&v4[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  objc_msgSend(v5, sel_lock);
  sub_1A4206E98((uint64_t)v4);
  objc_msgSend(v5, sel_unlock);
  v6 = swift_bridgeObjectRetain();
  v7 = sub_1A40CFBE0(v6);
  swift_bridgeObjectRelease_n();
  return v7;
}

void sub_1A4204510(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _BYTE v22[8];
  _OWORD v23[2];
  __int128 v24;
  uint64_t v25;

  v4 = sub_1A423BEDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 || !a2)
    return;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_1A423C728())
      goto LABEL_5;
LABEL_20:
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_20;
LABEL_5:
  if ((a2 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x1A859B6A0](0, a2);
  }
  else
  {
    if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v9 = *(id *)(a2 + 32);
  }
  v20 = v9;
  swift_bridgeObjectRelease();
  type metadata accessor for MapsSyncManagedFavoriteItem();
  v10 = (void *)swift_dynamicCastClass();
  if (v10 && (v11 = objc_msgSend(v10, sel_contactHandles)) != 0)
  {
    v12 = v11;
    sub_1A423C410();
    v19 = v12;

    sub_1A417727C();
    sub_1A423C47C();
    while (v25)
    {
      sub_1A40D1A9C(&v24, v23);
      sub_1A40D1AAC((uint64_t)v23, (uint64_t)v22);
      type metadata accessor for MapsSyncManagedContactHandle();
      if (swift_dynamicCast())
      {
        v13 = v21;
        v14 = objc_msgSend(v21, sel_handle);

        if (v14)
        {
          v15 = sub_1A423C14C();
          v17 = v16;

          sub_1A416C804(v22, v15, v17);
          swift_bridgeObjectRelease();
        }
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      sub_1A423C47C();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  }
  else
  {

  }
}

id sub_1A42047FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD **v15;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD **)(v3 + OBJC_IVAR___MSFavoriteItem__handleChanges);
  swift_beginAccess();
  v8 = *v7;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1A40CF4E8(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_1A40CF4E8((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v11 + 1;
  v12 = &v8[3 * v11];
  *((_BYTE *)v12 + 32) = 0;
  v12[5] = a1;
  v12[6] = a2;
  swift_endAccess();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1A4206F90;
    *(_QWORD *)(v14 + 24) = v13;
    v15 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v16 = *v15;
    swift_retain();
    v17 = swift_isUniquelyReferenced_nonNull_native();
    *v15 = v16;
    if ((v17 & 1) == 0)
    {
      v16 = sub_1A40CF360(0, v16[2] + 1, 1, v16);
      *v15 = v16;
    }
    v19 = v16[2];
    v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      v16 = sub_1A40CF360((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
      *v15 = v16;
    }
    v16[2] = v19 + 1;
    v20 = &v16[2 * v19];
    v20[4] = sub_1A40D8018;
    v20[5] = v14;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

void sub_1A4204A4C(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  v2 = swift_dynamicCastClass();
  if (v2)
  {
    v3 = (void *)v2;
    v9 = a1;
    v4 = objc_msgSend(v9, sel_managedObjectContext);
    if (v4)
    {
      v5 = v4;
      type metadata accessor for MapsSyncManagedContactHandle();
      v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v5);
      v7 = (void *)sub_1A423C140();
      objc_msgSend(v6, sel_setHandle_, v7);

      objc_msgSend(v3, sel_addContactHandlesObject_, v6);
      v8 = v6;
    }
    else
    {
      v8 = v9;
    }

  }
}

id sub_1A4204B64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD **v15;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD **)(v3 + OBJC_IVAR___MSFavoriteItem__handleChanges);
  swift_beginAccess();
  v8 = *v7;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1A40CF4E8(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_1A40CF4E8((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v11 + 1;
  v12 = &v8[3 * v11];
  *((_BYTE *)v12 + 32) = 1;
  v12[5] = a1;
  v12[6] = a2;
  swift_endAccess();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1A4206F98;
    *(_QWORD *)(v14 + 24) = v13;
    v15 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v16 = *v15;
    swift_retain();
    v17 = swift_isUniquelyReferenced_nonNull_native();
    *v15 = v16;
    if ((v17 & 1) == 0)
    {
      v16 = sub_1A40CF360(0, v16[2] + 1, 1, v16);
      *v15 = v16;
    }
    v19 = v16[2];
    v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      v16 = sub_1A40CF360((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
      *v15 = v16;
    }
    v16[2] = v19 + 1;
    v20 = &v16[2 * v19];
    v20[4] = sub_1A40D8018;
    v20[5] = v14;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

void sub_1A4204DB8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  v6 = swift_dynamicCastClass();
  if (!v6)
    return;
  v7 = (void *)v6;
  v19 = a1;
  v8 = objc_msgSend(v19, sel_managedObjectContext);
  if (!v8)
  {
LABEL_15:
    v18 = v19;
LABEL_18:

    return;
  }
  v20 = v8;
  type metadata accessor for MapsSyncManagedContactHandle();
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchRequest);
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1A4243A70;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1A40E766C();
  *(_QWORD *)(v10 + 32) = a2;
  *(_QWORD *)(v10 + 40) = a3;
  swift_bridgeObjectRetain();
  v11 = (void *)sub_1A423C314();
  objc_msgSend(v9, sel_setPredicate_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v12 = sub_1A423C3F8();
  v13 = sub_1A41BD1F0(v12);
  swift_bridgeObjectRelease();
  if (!v13)
  {

    goto LABEL_15;
  }
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_1A423C728();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_8;
LABEL_17:

    swift_bridgeObjectRelease();
    v18 = v20;
    goto LABEL_18;
  }
  v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v14)
    goto LABEL_17;
LABEL_8:
  if (v14 >= 1)
  {
    v15 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v16 = (id)MEMORY[0x1A859B6A0](v15, v13);
      else
        v16 = *(id *)(v13 + 8 * v15 + 32);
      v17 = v16;
      ++v15;
      objc_msgSend(v7, sel_removeContactHandlesObject_, v16);
      objc_msgSend(v20, sel_deleteObject_, v17);

    }
    while (v14 != v15);
    goto LABEL_17;
  }
  __break(1u);
}

uint64_t sub_1A420508C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_1A423C14C();
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

id sub_1A42050E0(void *a1, void *a2, char a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return sub_1A4205128(a1, a2, a3);
}

id sub_1A4205128(void *a1, void *a2, char a3)
{
  uint64_t v3;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__customName);
  *v7 = 0;
  v7[1] = 0;
  *(_BYTE *)(v3 + OBJC_IVAR___MSFavoriteItem__hidden) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__latitude) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__longitude) = 0;
  v8 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
  *v8 = 0;
  v8[1] = 0;
  v9 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemCategory);
  *v9 = 0;
  v9[1] = 0;
  v10 = v3 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed;
  v11 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemName);
  *v12 = 0;
  v12[1] = 0;
  *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__muid) = 0;
  v13 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__originatingAddressString);
  *v13 = 0;
  v13[1] = 0;
  *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__positionIndex) = 0;
  v14 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier);
  *v14 = 0;
  v14[1] = 0;
  *(_WORD *)(v3 + OBJC_IVAR___MSFavoriteItem__source) = 0;
  *(_WORD *)(v3 + OBJC_IVAR___MSFavoriteItem__type) = 0;
  *(_WORD *)(v3 + OBJC_IVAR___MSFavoriteItem__version) = 0;
  *(_OWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemStorage) = xmmword_1A4243680;
  *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__handleChanges) = MEMORY[0x1E0DEE9D8];
  return sub_1A4185C24(a1, a2, a3);
}

uint64_t sub_1A42052CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C(v0 + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__mapItemStorage), *(_QWORD *)(v0 + OBJC_IVAR___MSFavoriteItem__mapItemStorage + 8));
  return swift_bridgeObjectRelease();
}

id FavoriteItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1A42054F4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id result;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_1A423BEDC();
  v23 = *(_QWORD *)(v2 - 8);
  v24 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v22 - v6;
  v30 = MEMORY[0x1E0DEE9E8];
  v8 = objc_msgSend(a1, sel__place);
  v9 = objc_msgSend(v8, sel_firstBusiness);

  v10 = objc_msgSend(v9, sel_localizedCategories);
  if (!v10)
  {
    sub_1A40D19C0(0, &qword_1EE70DF68);
    v10 = (id)MEMORY[0x1A859B4C0](MEMORY[0x1E0DEE9D8]);
  }
  sub_1A423C428();

  sub_1A423BED0();
  if (!v29)
  {
LABEL_16:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
    v28 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70DF50);
    sub_1A4207BE8();
    sub_1A4207C34();
    v21 = sub_1A423C1A0();
    swift_bridgeObjectRelease();
    return (id)v21;
  }
  v11 = sub_1A40D19C0(0, &qword_1EE710648);
  v22[1] = MEMORY[0x1E0DEE9B8] + 8;
  v22[2] = v11;
  while (1)
  {
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_6;
    v12 = v7;
    v13 = v26;
    v14 = objc_msgSend(v26, sel_localizedNames);
    if (!v14)
    {
      sub_1A40D19C0(0, &qword_1EE70DF68);
      v14 = (id)MEMORY[0x1A859B4C0](MEMORY[0x1E0DEE9D8]);
    }
    sub_1A423C428();

    sub_1A423BED0();
    if (v27)
      break;
LABEL_5:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);

    v7 = v12;
LABEL_6:
    sub_1A423BED0();
    if (!v29)
      goto LABEL_16;
  }
  sub_1A40D19C0(0, (unint64_t *)&unk_1EE710650);
  while ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_1A423BED0();
    if (!v27)
      goto LABEL_5;
  }
  v15 = v25;
  result = objc_msgSend(v25, sel_name);
  if (result)
  {
    v17 = result;
    v18 = sub_1A423C14C();
    v20 = v19;

    sub_1A416C804(&v25, v18, v20);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

id sub_1A4205840(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20)
{
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;

  v48 = a5;
  v46 = a4;
  v45 = a3;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED1AB880 != -1)
    swift_once();
  v43 = qword_1ED1AB9F0;
  if (a2)
  {
    v42 = sub_1A423C140();
    swift_bridgeObjectRelease();
    v25 = a9;
    v26 = a10;
    if (a7)
      goto LABEL_5;
LABEL_8:
    v41 = 0;
    if (v25)
      goto LABEL_6;
    goto LABEL_9;
  }
  v42 = 0;
  v25 = a9;
  v26 = a10;
  if (!a7)
    goto LABEL_8;
LABEL_5:
  v41 = sub_1A423C140();
  swift_bridgeObjectRelease();
  if (v25)
  {
LABEL_6:
    v40 = sub_1A423C140();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_9:
  v40 = 0;
LABEL_10:
  v44 = v26;
  sub_1A410356C(v26, (uint64_t)v24, &qword_1ED1AB5D0);
  v27 = sub_1A423BF9C();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v24, 1, v27) != 1)
  {
    v29 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v27);
  }
  if (a12)
  {
    v30 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v31 = a18;
    if (a15)
    {
LABEL_14:
      v32 = (void *)sub_1A423C140();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  else
  {
    v30 = 0;
    v31 = a18;
    if (a15)
      goto LABEL_14;
  }
  v32 = 0;
LABEL_17:
  if (v31)
  {
    v33 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = 0;
  }
  WORD2(v39) = a20;
  LODWORD(v39) = a19;
  v34 = (void *)v40;
  v35 = (void *)v42;
  v36 = (void *)v41;
  v37 = objc_msgSend(v47, sel_initWithStore_customName_hidden_latitude_longitude_mapItemAddress_mapItemCategory_mapItemLastRefreshed_mapItemName_muid_originatingAddressString_positionIndex_shortcutIdentifier_source_type_version_, v43, v42, v45 & 1, v46, v48, v41, v40, v29, v30, a13, v32, a16, v33, v39);

  sub_1A410251C(v44, &qword_1ED1AB5D0);
  return v37;
}

uint64_t sub_1A4205AFC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A4205B28()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_customName);
}

uint64_t sub_1A4205B4C()
{
  return swift_deallocObject();
}

id sub_1A4205B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__customName);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207D9C;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

uint64_t sub_1A4205D20()
{
  return swift_deallocObject();
}

id sub_1A4205D30(uint64_t a1)
{
  uint64_t v1;

  return sub_1A41FF5C8(a1, *(_BYTE *)(v1 + 16));
}

void sub_1A4205D38()
{
  uint64_t v0;

  sub_1A4201924(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32), (SEL *)&selRef_latitude);
}

uint64_t sub_1A4205D5C()
{
  return swift_deallocObject();
}

id sub_1A4205D6C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__latitude);
  *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__latitude) = a1;
  v6 = a1;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  v8 = v6;
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207D7C;
    *(_QWORD *)(v9 + 24) = v7;
    v10 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

void sub_1A4205F1C()
{
  uint64_t v0;

  sub_1A4201924(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32), (SEL *)&selRef_longitude);
}

uint64_t sub_1A4205F40()
{
  return swift_deallocObject();
}

id sub_1A4205F50(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__longitude);
  *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__longitude) = a1;
  v6 = a1;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  v8 = v6;
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207D5C;
    *(_QWORD *)(v9 + 24) = v7;
    v10 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

void sub_1A4206100()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_mapItemAddress);
}

uint64_t sub_1A4206124()
{
  return swift_deallocObject();
}

id sub_1A4206134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemAddress);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207D3C;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

void sub_1A42062F8()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_mapItemCategory);
}

uint64_t sub_1A420631C()
{
  return swift_deallocObject();
}

id sub_1A420632C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemCategory);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207D1C;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

void sub_1A42064F0()
{
  uint64_t v0;

  sub_1A4200DBC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1A42064FC()
{
  return swift_deallocObject();
}

uint64_t sub_1A420650C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  v3 = sub_1A423BF9C();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

void sub_1A42065A4(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8) + 80);
  sub_1A4201030(a1, v1 + ((v3 + 16) & ~v3));
}

void sub_1A42065E4()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_mapItemName);
}

uint64_t sub_1A4206608()
{
  return swift_deallocObject();
}

id sub_1A4206618(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__mapItemName);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207CFC;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

void sub_1A42067DC()
{
  uint64_t v0;

  sub_1A4201924(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32), (SEL *)&selRef_muid);
}

uint64_t sub_1A4206800()
{
  return swift_deallocObject();
}

id sub_1A4206810(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(void **)(v2 + OBJC_IVAR___MSFavoriteItem__muid);
  *(_QWORD *)(v2 + OBJC_IVAR___MSFavoriteItem__muid) = a1;
  v6 = a1;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  v8 = v6;
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207CDC;
    *(_QWORD *)(v9 + 24) = v7;
    v10 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

void sub_1A42069C0()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_originatingAddressString);
}

uint64_t sub_1A42069E4()
{
  return swift_deallocObject();
}

id sub_1A42069F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__originatingAddressString);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207C98;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

uint64_t sub_1A4206BB8()
{
  return swift_deallocObject();
}

id sub_1A4206BC8(uint64_t a1)
{
  uint64_t v1;

  return sub_1A42020E8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A4206BD0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1A4206BF4()
{
  uint64_t v0;

  sub_1A4202508(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), (SEL *)&selRef_shortcutIdentifier);
}

uint64_t sub_1A4206C18()
{
  return swift_deallocObject();
}

id sub_1A4206C28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v3 = v2;
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v6, sel_lock);
  v7 = (_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__shortcutIdentifier);
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_1A40D19C0(0, (unint64_t *)&qword_1EE70DF70);
  swift_bridgeObjectRetain();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1A4207C78;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD **)(v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v11 = *v10;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1A40CF360(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1A40CF360((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = sub_1A40D8018;
    v15[5] = v9;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v6, sel_unlock);
}

uint64_t sub_1A4206DEC()
{
  return swift_deallocObject();
}

id sub_1A4206DFC(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4202E1C(a1, *(_WORD *)(v1 + 16), (SEL *)&selRef_setSource_);
}

uint64_t sub_1A4206E1C()
{
  return swift_deallocObject();
}

id sub_1A4206E2C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4202E1C(a1, *(_WORD *)(v1 + 16), (SEL *)&selRef_setType_);
}

uint64_t sub_1A4206E4C()
{
  return swift_deallocObject();
}

id sub_1A4206E5C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4202E1C(a1, *(_WORD *)(v1 + 16), (SEL *)&selRef_setVersion_);
}

void sub_1A4206E7C()
{
  uint64_t v0;

  sub_1A4203618(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_1A4206E88()
{
  return swift_deallocObject();
}

uint64_t sub_1A4206E98(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];

  v1 = (uint64_t *)(a1 + OBJC_IVAR___MSFavoriteItem__handleChanges);
  result = swift_beginAccess();
  v3 = *v1;
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = (uint64_t *)(v3 + 48);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      if ((*(_BYTE *)(v5 - 2) & 1) != 0)
      {
        swift_bridgeObjectRetain();
        sub_1A420E5A8(v7, v6);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_1A416C804(v8, v7, v6);
      }
      swift_bridgeObjectRelease();
      v5 += 3;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A4206F6C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1A4206F90(void *a1)
{
  sub_1A4204A4C(a1);
}

void sub_1A4206F98(void *a1)
{
  uint64_t v1;

  sub_1A4204DB8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t type metadata accessor for FavoriteItem()
{
  uint64_t result;

  result = qword_1ED1AB328;
  if (!qword_1ED1AB328)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A4206FDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A41FEFBC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A4207004(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A4205B5C);
}

id sub_1A4207020@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  LOBYTE(v3) = *(_BYTE *)(v3 + OBJC_IVAR___MSFavoriteItem__hidden);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v3;
  return result;
}

id sub_1A4207084(char *a1)
{
  return sub_1A41FF42C(*a1);
}

uint64_t sub_1A42070A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1A41FF6DC();
  *a1 = result;
  return result;
}

void sub_1A42070D0(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A4205D6C(v1);

}

uint64_t sub_1A420710C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1A41FFAA0();
  *a1 = result;
  return result;
}

void sub_1A4207134(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A4205F50(v1);

}

uint64_t sub_1A4207170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A41FFE40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A4207198(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A4206134);
}

uint64_t sub_1A42071B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A42001C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A42071DC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A420632C);
}

uint64_t sub_1A42071F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1A42005F8(a1);
}

uint64_t sub_1A420721C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A420122C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A4207244(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A4206618);
}

uint64_t sub_1A4207260@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1A42015D0();
  *a1 = result;
  return result;
}

void sub_1A4207288(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A4206810(v1);

}

uint64_t sub_1A42072C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A4201ADC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A42072EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A42069F4);
}

id sub_1A4207308@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR___MSFavoriteItem__positionIndex);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v5;
  return result;
}

id sub_1A420736C(uint64_t *a1)
{
  return sub_1A4201F4C(*a1);
}

uint64_t sub_1A4207390@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A42021D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A42073B8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A40DA1DC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_1A4206C28);
}

id sub_1A42073D4@<X0>(uint64_t *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___MSFavoriteItem__source, a2);
}

id sub_1A42073E0(__int16 *a1)
{
  return _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(*a1);
}

id sub_1A4207404@<X0>(uint64_t *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___MSFavoriteItem__type, a2);
}

id sub_1A4207410(__int16 *a1)
{
  return _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(*a1);
}

id sub_1A4207434@<X0>(uint64_t *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___MSFavoriteItem__version, a2);
}

id sub_1A4207440(__int16 *a1)
{
  return sub_1A4202C80(*a1);
}

uint64_t sub_1A4207464@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1A4202F3C();
  *a1 = result;
  return result;
}

void sub_1A4207490()
{
  unint64_t v0;

  sub_1A40F2A6C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for FavoriteItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FavoriteItem.customName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x448))();
}

uint64_t dispatch thunk of FavoriteItem.customName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x450))();
}

uint64_t dispatch thunk of FavoriteItem.customName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x458))();
}

uint64_t dispatch thunk of FavoriteItem.hidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x460))();
}

uint64_t dispatch thunk of FavoriteItem.hidden.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x468))();
}

uint64_t dispatch thunk of FavoriteItem.hidden.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x470))();
}

uint64_t dispatch thunk of FavoriteItem.latitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x478))();
}

uint64_t dispatch thunk of FavoriteItem.latitude.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x480))();
}

uint64_t dispatch thunk of FavoriteItem.latitude.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x488))();
}

uint64_t dispatch thunk of FavoriteItem.longitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x490))();
}

uint64_t dispatch thunk of FavoriteItem.longitude.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x498))();
}

uint64_t dispatch thunk of FavoriteItem.longitude.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4A0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemAddress.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4A8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemAddress.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4B0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemAddress.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemCategory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4C0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemCategory.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4C8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemCategory.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemLastRefreshed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4D8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemLastRefreshed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4E0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemLastRefreshed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4E8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4F0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x4F8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x500))();
}

uint64_t dispatch thunk of FavoriteItem.muid.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x508))();
}

uint64_t dispatch thunk of FavoriteItem.muid.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x510))();
}

uint64_t dispatch thunk of FavoriteItem.muid.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x518))();
}

uint64_t dispatch thunk of FavoriteItem.originatingAddressString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x520))();
}

uint64_t dispatch thunk of FavoriteItem.originatingAddressString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x528))();
}

uint64_t dispatch thunk of FavoriteItem.originatingAddressString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x530))();
}

uint64_t dispatch thunk of FavoriteItem.positionIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x538))();
}

uint64_t dispatch thunk of FavoriteItem.positionIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x540))();
}

uint64_t dispatch thunk of FavoriteItem.positionIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x548))();
}

uint64_t dispatch thunk of FavoriteItem.shortcutIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x550))();
}

uint64_t dispatch thunk of FavoriteItem.shortcutIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x558))();
}

uint64_t dispatch thunk of FavoriteItem.shortcutIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x560))();
}

uint64_t dispatch thunk of FavoriteItem.source.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x568))();
}

uint64_t dispatch thunk of FavoriteItem.source.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x570))();
}

uint64_t dispatch thunk of FavoriteItem.source.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x578))();
}

uint64_t dispatch thunk of FavoriteItem.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x580))();
}

uint64_t dispatch thunk of FavoriteItem.type.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x588))();
}

uint64_t dispatch thunk of FavoriteItem.type.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x590))();
}

uint64_t dispatch thunk of FavoriteItem.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x598))();
}

uint64_t dispatch thunk of FavoriteItem.version.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5A0))();
}

uint64_t dispatch thunk of FavoriteItem.version.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5A8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5B0))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemStorage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5B8))();
}

uint64_t dispatch thunk of FavoriteItem.mapItemStorage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5C0))();
}

uint64_t dispatch thunk of FavoriteItem.fetchContactHandles()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5C8))();
}

uint64_t dispatch thunk of FavoriteItem.addContactHandle(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5D0))();
}

uint64_t dispatch thunk of FavoriteItem.removeContactHandle(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x5D8))();
}

uint64_t sub_1A4207B04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1A423BF9C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1A4207B94(void *a1)
{
  uint64_t v1;

  sub_1A423BF9C();
  sub_1A4203D58(a1, *(void **)(v1 + 16));
}

unint64_t sub_1A4207BE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE70DF58;
  if (!qword_1EE70DF58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE70DF50);
    result = MEMORY[0x1A859BF94](MEMORY[0x1E0DEB3D0], v1);
    atomic_store(result, (unint64_t *)&qword_1EE70DF58);
  }
  return result;
}

unint64_t sub_1A4207C34()
{
  unint64_t result;

  result = qword_1EE70DF40;
  if (!qword_1EE70DF40)
  {
    result = MEMORY[0x1A859BF94](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EE70DF40);
  }
  return result;
}

void sub_1A4207C78(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setShortcutIdentifier_);
}

void sub_1A4207C98(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setOriginatingAddressString_);
}

uint64_t sub_1A4207CB8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1A4207CDC(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4201A34(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_setMuid_);
}

void sub_1A4207CFC(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setMapItemName_);
}

void sub_1A4207D1C(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setMapItemCategory_);
}

void sub_1A4207D3C(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setMapItemAddress_);
}

id sub_1A4207D5C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4201A34(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_setLongitude_);
}

id sub_1A4207D7C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4201A34(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_setLatitude_);
}

void sub_1A4207D9C(void *a1)
{
  uint64_t v1;

  sub_1A4202628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (SEL *)&selRef_setCustomName_);
}

uint64_t sub_1A4207DBC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_1A423BF9C();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v2, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v2, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1A4207EE4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 17) & 0xFFFFFFFFFFFFFFF8;
  sub_1A41FE2B0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + v7), *(_QWORD *)(v1 + v7 + 8), *(_QWORD *)(v1 + v8), *(_QWORD *)(v1 + v9), *(_QWORD *)(v1 + v9 + 8),
    *(_DWORD *)(v1 + v10),
    HIWORD(*(_DWORD *)(v1 + v10)),
    *(_WORD *)(v1 + v10 + 4));
}

void sub_1A42080B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t inited;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD aBlock[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = v4;
  aBlock[4] = sub_1A42088CC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A40CBC44;
  aBlock[3] = &block_descriptor_42;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v7 = MapsSyncGetExceptionRaisedInBlock(v6);
  _Block_release(v6);
  swift_beginAccess();
  v8 = *(void **)(v4 + 16);
  if (v8)
  {
    v9 = v8;
    swift_willThrow();
    swift_release();
LABEL_5:

    return;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710670);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A4243A70;
    *(_QWORD *)(inited + 32) = 0x6F69747065637865;
    *(_QWORD *)(inited + 40) = 0xE90000000000006ELL;
    *(_QWORD *)(inited + 72) = sub_1A42088D8();
    *(_QWORD *)(inited + 48) = v7;
    v7 = v7;
    sub_1A4153890(inited);
    v11 = (objc_class *)type metadata accessor for MapsSyncError();
    v12 = objc_allocWithZone(v11);
    v13 = (void *)sub_1A423C140();
    v14 = (void *)sub_1A423C110();
    swift_bridgeObjectRelease();
    v15.receiver = v12;
    v15.super_class = v11;
    objc_msgSendSuper2(&v15, sel_initWithDomain_code_userInfo_, v13, 10, v14);

    swift_willThrow();
    swift_release();

    goto LABEL_5;
  }
  swift_release();
}

uint64_t MapsSyncErrorCode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

MapsSync::MapsSyncErrorCode_optional __swiftcall MapsSyncErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 13;
  if ((unint64_t)rawValue < 0xD)
    v2 = rawValue;
  *v1 = v2;
  return (MapsSync::MapsSyncErrorCode_optional)rawValue;
}

BOOL sub_1A4208334(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

MapsSync::MapsSyncErrorCode_optional sub_1A4208348(Swift::Int *a1)
{
  return MapsSyncErrorCode.init(rawValue:)(*a1);
}

void sub_1A4208350(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

BOOL static MapsSyncErrorType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MapsSyncErrorType.hash(into:)()
{
  return sub_1A423C86C();
}

uint64_t MapsSyncErrorType.hashValue.getter()
{
  sub_1A423C860();
  sub_1A423C86C();
  return sub_1A423C8A8();
}

uint64_t static MapsSyncError.supportsSecureCoding.getter()
{
  return 1;
}

MapsSync::MapsSyncErrorCode_optional sub_1A4208440@<W0>(_BYTE *a1@<X8>)
{
  void *v1;
  MapsSync::MapsSyncErrorCode_optional result;
  char v4;
  char v5;

  result.value = MapsSyncErrorCode.init(rawValue:)((Swift::Int)objc_msgSend(v1, sel_code)).value;
  v4 = v5;
  if (v5 == 13)
    v4 = 0;
  *a1 = v4;
  return result;
}

id MapsSyncError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  void *v9;
  id v10;

  v5 = v4;
  v8 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9 = (void *)sub_1A423C110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void MapsSyncError.init(domain:code:userInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MapsSyncError.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncError();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncError()
{
  return objc_opt_self();
}

unint64_t sub_1A42085EC()
{
  unint64_t result;

  result = qword_1EE710660;
  if (!qword_1EE710660)
  {
    result = MEMORY[0x1A859BF94](&protocol conformance descriptor for MapsSyncErrorCode, &type metadata for MapsSyncErrorCode);
    atomic_store(result, (unint64_t *)&qword_1EE710660);
  }
  return result;
}

unint64_t sub_1A4208634()
{
  unint64_t result;

  result = qword_1EE710668;
  if (!qword_1EE710668)
  {
    result = MEMORY[0x1A859BF94](&protocol conformance descriptor for MapsSyncErrorType, &type metadata for MapsSyncErrorType);
    atomic_store(result, (unint64_t *)&qword_1EE710668);
  }
  return result;
}

_BYTE *sub_1A4208680(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MapsSyncErrorCode()
{
  return &type metadata for MapsSyncErrorCode;
}

uint64_t _s8MapsSync17MapsSyncErrorCodeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s8MapsSync17MapsSyncErrorCodeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1A4208774 + 4 * byte_1A4247435[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1A42087A8 + 4 * byte_1A4247430[v4]))();
}

uint64_t sub_1A42087A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A42087B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A42087B8);
  return result;
}

uint64_t sub_1A42087C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A42087CCLL);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1A42087D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A42087D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MapsSyncErrorType()
{
  return &type metadata for MapsSyncErrorType;
}

uint64_t method lookup function for MapsSyncError()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncError.errorCode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t sub_1A4208820()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A4208844(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1A42088A0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A42088CC()
{
  uint64_t v0;

  return sub_1A4208844(*(uint64_t (**)(void))(v0 + 16));
}

unint64_t sub_1A42088D8()
{
  unint64_t result;

  result = qword_1EE710678;
  if (!qword_1EE710678)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE710678);
  }
  return result;
}

id sub_1A4208970()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedSharedTripBlockedItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedSharedTripBlockedItem()
{
  return objc_opt_self();
}

id HistoryDirectionsItemRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HistoryDirectionsItemRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id HistoryDirectionsItemRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for HistoryDirectionsItem();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSHistoryDirectionsItemRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id HistoryDirectionsItemRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for HistoryDirectionsItem();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSHistoryDirectionsItemRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for HistoryDirectionsItemRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for HistoryDirectionsItemRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A4208C14()
{
  return sub_1A4208CDC();
}

uint64_t sub_1A4208CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSHistoryDirectionsItemRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for HistoryDirectionsItem();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for HistoryDirectionsItem();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4208FA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4208FBC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A4209014;
  return sub_1A41EB994(0);
}

uint64_t sub_1A4209014(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4209088()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for HistoryDirectionsItem();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for HistoryDirectionsItem();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4209390(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A4209408;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A4209408()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for HistoryDirectionsItem();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A42094D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A42094EC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A4209548;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4209548(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A42095BC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for HistoryDirectionsItem();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for HistoryDirectionsItem();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42098D8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A4209964;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A4209964()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for HistoryDirectionsItem();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A4209A3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4209A54()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4209BC8(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A4209C10()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4209C68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A4209C80()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4209E0C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A4209E60()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id HistoryDirectionsItemRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HistoryDirectionsItemRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HistoryDirectionsItemRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of HistoryDirectionsItemRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A420A124()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE7106C8 + dword_1EE7106C8))(v2, v3, v4);
}

uint64_t sub_1A420A19C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))&a0_0[*(int *)a0_0])(v2, v3);
}

uint64_t sub_1A420A20C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))&a0_1[*(int *)a0_1])(v2, v3, v4);
}

uint64_t sub_1A420A284()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE7106F8 + dword_1EE7106F8))(v2, v3);
}

void sub_1A420A2F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1A423C4DC();
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C308();
    v1 = v27;
    v26 = v28;
    v2 = v29;
    v3 = v30;
    v4 = v31;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v23 = v2;
  v25 = (unint64_t)(v2 + 64) >> 6;
  v24 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v8 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!sub_1A423C548())
      goto LABEL_38;
    type metadata accessor for MapsSyncManagedContactHandle();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v11 = v32;
    swift_unknownObjectRelease();
    if (!v32)
      goto LABEL_38;
LABEL_31:
    v15 = objc_msgSend(v11, sel_handle, v23);
    if (v15)
    {
      v16 = v15;
      v17 = sub_1A423C14C();
      v19 = v18;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v24 = sub_1A40CF60C(0, v24[2] + 1, 1, v24);
      v21 = v24[2];
      v20 = v24[3];
      if (v21 >= v20 >> 1)
        v24 = sub_1A40CF60C((_QWORD *)(v20 > 1), v21 + 1, 1, v24);
      v24[2] = v21 + 1;
      v22 = &v24[2 * v21];
      v22[4] = v17;
      v22[5] = v19;
    }
    else
    {

    }
  }
  if (v4)
  {
    v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v10 = v9 | (v3 << 6);
LABEL_30:
    v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v11)
      goto LABEL_38;
    goto LABEL_31;
  }
  v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 >= v25)
      goto LABEL_38;
    v13 = *(_QWORD *)(v26 + 8 * v12);
    ++v3;
    if (!v13)
    {
      v3 = v8 + 2;
      if (v8 + 2 >= v25)
        goto LABEL_38;
      v13 = *(_QWORD *)(v26 + 8 * v3);
      if (!v13)
      {
        v3 = v8 + 3;
        if (v8 + 3 >= v25)
          goto LABEL_38;
        v13 = *(_QWORD *)(v26 + 8 * v3);
        if (!v13)
        {
          v3 = v8 + 4;
          if (v8 + 4 >= v25)
            goto LABEL_38;
          v13 = *(_QWORD *)(v26 + 8 * v3);
          if (!v13)
          {
            v3 = v8 + 5;
            if (v8 + 5 >= v25)
              goto LABEL_38;
            v13 = *(_QWORD *)(v26 + 8 * v3);
            if (!v13)
            {
              v14 = v8 + 6;
              while (v25 != v14)
              {
                v13 = *(_QWORD *)(v26 + 8 * v14++);
                if (v13)
                {
                  v3 = v14 - 1;
                  goto LABEL_29;
                }
              }
LABEL_38:
              sub_1A40D19B8();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    v4 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v3 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

void sub_1A420A63C(uint64_t a1, uint64_t a2)
{
  id v3;

  type metadata accessor for MapsSyncFavoriteItem();
  v3 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

id sub_1A420A690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];
  _QWORD v31[7];

  v3 = a1;
  v31[0] = MEMORY[0x1E0DEE9E8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1A423C4DC();
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    result = (id)sub_1A423C308();
    v3 = v31[1];
    v27 = v31[2];
    v5 = v31[3];
    v6 = v31[4];
    v7 = v31[5];
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v27 = a1 + 56;
    v9 = ~v8;
    v10 = -v8;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v7 = v11 & *(_QWORD *)(a1 + 56);
    result = (id)swift_bridgeObjectRetain();
    v5 = v9;
    v6 = 0;
  }
  v12 = 0;
  v26 = (unint64_t)(v5 + 64) >> 6;
  while (1)
  {
    if (v3 < 0)
    {
      if (!sub_1A423C548())
        goto LABEL_32;
      type metadata accessor for MapsSyncManagedContactHandle();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v16 = (id)aBlock[0];
      swift_unknownObjectRelease();
      v15 = v6;
      v13 = v7;
      if (!v16)
        goto LABEL_32;
      goto LABEL_29;
    }
    if (!v7)
      break;
    v13 = (v7 - 1) & v7;
    v14 = __clz(__rbit64(v7)) | (v6 << 6);
    v15 = v6;
LABEL_28:
    v16 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v14);
    if (!v16)
      goto LABEL_32;
LABEL_29:
    result = objc_msgSend(v16, sel_managedObjectContext);
    if (!result)
      goto LABEL_34;
    v20 = result;
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v31;
    v21[3] = a2;
    v21[4] = a3;
    v21[5] = v16;
    v22 = v16;
    sub_1A4111284((uint64_t)v12);
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_1A4210840;
    *(_QWORD *)(v23 + 24) = v21;
    aBlock[4] = sub_1A40DE09C;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A40D4EE4;
    aBlock[3] = &block_descriptor_43;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_performBlockAndWait_, v24);

    _Block_release(v24);
    LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
    result = (id)swift_release();
    v12 = sub_1A4210840;
    v6 = v15;
    v7 = v13;
    if ((v22 & 1) != 0)
    {
      __break(1u);
LABEL_32:
      sub_1A40D19B8();
      v25 = v31[0];
      sub_1A4111284((uint64_t)v12);
      return (id)v25;
    }
  }
  v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v26)
      goto LABEL_32;
    v18 = *(_QWORD *)(v27 + 8 * v17);
    v15 = v6 + 1;
    if (!v18)
    {
      v15 = v6 + 2;
      if (v6 + 2 >= v26)
        goto LABEL_32;
      v18 = *(_QWORD *)(v27 + 8 * v15);
      if (!v18)
      {
        v15 = v6 + 3;
        if (v6 + 3 >= v26)
          goto LABEL_32;
        v18 = *(_QWORD *)(v27 + 8 * v15);
        if (!v18)
        {
          v15 = v6 + 4;
          if (v6 + 4 >= v26)
            goto LABEL_32;
          v18 = *(_QWORD *)(v27 + 8 * v15);
          if (!v18)
          {
            v19 = v6 + 5;
            while (v26 != v19)
            {
              v18 = *(_QWORD *)(v27 + 8 * v19++);
              if (v18)
              {
                v15 = v19 - 1;
                goto LABEL_27;
              }
            }
            goto LABEL_32;
          }
        }
      }
    }
LABEL_27:
    v13 = (v18 - 1) & v18;
    v14 = __clz(__rbit64(v18)) + (v15 << 6);
    goto LABEL_28;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_1A420AA7C(uint64_t a1, void (*a2)(_QWORD *__return_ptr, uint64_t), uint64_t a3, uint64_t a4)
{
  _QWORD v5[2];
  _BYTE v6[8];

  a2(v5, a4);
  sub_1A416C804(v6, v5[0], v5[1]);
  return swift_bridgeObjectRelease();
}

void *sub_1A420AAC4(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_1A420AAF4(a1);
}

void *sub_1A420AAF4(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__contactHandles) = 0;
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName);
  *v3 = 0;
  v3[1] = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden) = 0;
  *(_OWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage) = xmmword_1A4243680;
  v4 = (_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString);
  *v4 = 0;
  v4[1] = 0;
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type) = 0;
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source) = 0;
  v5 = (_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier);
  *v5 = 0;
  v5[1] = 0;
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid) = 0;
  v6 = a1;
  v7 = sub_1A41D033C(a1);
  v8 = v7;
  if (!a1)
  {
    v6 = v7;
    sub_1A41CFDB0((uint64_t)sub_1A420BDFC, 0);
  }

  return v8;
}

uint64_t sub_1A420AC78()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  __int128 v14;

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__contactHandles];
  *(_QWORD *)&v11 = 0;
  *((_QWORD *)&v11 + 1) = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_1A423C5CC();
  v14 = v11;
  sub_1A423C188();
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for MapsSyncFavoriteItem();
  v3 = objc_msgSendSuper2(&v13, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  *(_QWORD *)&v11 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex];
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  swift_bridgeObjectRetain();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  LOWORD(v11) = *(_WORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type];
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  swift_bridgeObjectRetain();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v4 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8];
  if (v4 >> 60 == 15
    || (v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage],
        v6 = objc_allocWithZone(MEMORY[0x1E0D271E8]),
        sub_1A40D7734(v5, v4),
        v7 = (void *)sub_1A423BF48(),
        sub_1A40D7778(v5, v4),
        v8 = objc_msgSend(v6, sel_initWithData_, v7, (_QWORD)v11),
        v7,
        !v8))
  {
    v11 = 0u;
    v12 = 0u;
  }
  else
  {
    *((_QWORD *)&v12 + 1) = sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AB0E8);
    *(_QWORD *)&v11 = v8;
  }
  sub_1A40CD40C((uint64_t)&v11);
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  LOWORD(v11) = *(_WORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source];
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  if (v2)
  {
    v9 = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)&v11 = v9;
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  swift_bridgeObjectRetain();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  LOWORD(v11) = *(_WORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version];
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  return v14;
}

uint64_t sub_1A420B1D4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A420B1F0()
{
  return sub_1A41150F8(&OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName);
}

uint64_t sub_1A420B20C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden);
}

id sub_1A420B2D4()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8);
  if (v1 >> 60 == 15)
    return 0;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage);
  v4 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
  sub_1A40D7734(v3, v1);
  v5 = (void *)sub_1A423BF48();
  sub_1A40D7778(v3, v1);
  v2 = objc_msgSend(v4, sel_initWithData_, v5);

  return v2;
}

uint64_t type metadata accessor for MapsSyncFavoriteItem()
{
  uint64_t result;

  result = qword_1ED1ABF10;
  if (!qword_1ED1ABF10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A420B3BC()
{
  return sub_1A41150F8(&OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString);
}

uint64_t sub_1A420B3D8()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type);
}

uint64_t sub_1A420B3F8()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source);
}

uint64_t sub_1A420B414()
{
  return sub_1A41150F8(&OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier);
}

uint64_t sub_1A420B430()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version);
}

void *sub_1A420B450()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude);
  v2 = v1;
  return v1;
}

void *sub_1A420B48C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude);
  v2 = v1;
  return v1;
}

void *sub_1A420B4C8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid);
  v2 = v1;
  return v1;
}

uint64_t sub_1A420B57C(uint64_t a1)
{
  char *v1;
  objc_class *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t result;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  unsigned __int8 *v28;
  __int128 v29;
  uint64_t v30;
  objc_super v31;
  __int128 v32;
  uint64_t v33;

  sub_1A40E5BF8(a1, (uint64_t)&v32);
  if (!v33)
  {
    sub_1A40CD40C((uint64_t)&v32);
    return 0;
  }
  v3 = (objc_class *)type metadata accessor for MapsSyncFavoriteItem();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;

  sub_1A40E5BF8(a1, (uint64_t)&v32);
  v4 = v33;
  if (v33)
  {
    v5 = __swift_project_boxed_opaque_existential_0(&v32, v33);
    v6 = *(_QWORD *)(v4 - 8);
    MEMORY[0x1E0C80A78](v5);
    v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    v9 = sub_1A423C7AC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v32);
  }
  else
  {
    v9 = 0;
  }
  v31.receiver = v1;
  v31.super_class = v3;
  v10 = objc_msgSendSuper2(&v31, sel_isEqual_, v9);
  swift_unknownObjectRelease();
  if (!v10)
    return 0;
  result = sub_1A40E5BF8(a1, (uint64_t)&v29);
  if (v30)
  {
    sub_1A40D1A9C(&v29, &v32);
    swift_dynamicCast();
    v12 = v28;
    v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName + 8];
    v14 = *(_QWORD *)&v28[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName + 8];
    if (v13)
    {
      if (!v14
        || (*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName] != *(_QWORD *)&v28[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName]
         || v13 != v14)
        && (sub_1A423C7B8() & 1) == 0)
      {
        goto LABEL_22;
      }
    }
    else if (v14)
    {
      goto LABEL_22;
    }
    if (v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden] != v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden])
      goto LABEL_22;
    v15 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage];
    v16 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8];
    v17 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage];
    v18 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8];
    if (v16 >> 60 == 15)
    {
      if (v18 >> 60 == 15)
      {
LABEL_25:
        v21 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString + 8];
        v22 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString + 8];
        if (v21)
        {
          if (!v22
            || (*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString] != *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString]
             || v21 != v22)
            && (sub_1A423C7B8() & 1) == 0)
          {
            goto LABEL_22;
          }
        }
        else if (v22)
        {
          goto LABEL_22;
        }
        if (*(unsigned __int16 *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type] == *(unsigned __int16 *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type])
        {
          v23 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier + 8];
          v24 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier + 8];
          if (v23)
          {
            if (v24
              && (*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier] == *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier]
               && v23 == v24
               || (sub_1A423C7B8() & 1) != 0))
            {
              goto LABEL_40;
            }
          }
          else if (!v24)
          {
LABEL_40:
            v25 = *(unsigned __int16 *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version];
            v26 = *(unsigned __int16 *)&v12[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version];

            return v25 == v26;
          }
        }
LABEL_22:

        return 0;
      }
    }
    else if (v18 >> 60 != 15)
    {
      sub_1A40D7720(*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage], *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8]);
      sub_1A40D7720(v17, v18);
      sub_1A40E6DC0(v15, v16);
      v20 = v19;
      sub_1A40D7778(v17, v18);
      sub_1A40D7778(v15, v16);
      if ((v20 & 1) == 0)
        goto LABEL_22;
      goto LABEL_25;
    }
    sub_1A40D7720(*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage], *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8]);
    sub_1A40D7720(v17, v18);
    sub_1A40D7778(v15, v16);
    sub_1A40D7778(v17, v18);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A420B980(void *a1)
{
  uint64_t v1;
  uint64_t result;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned __int16 v19;
  id v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unsigned __int16 v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unsigned __int16 v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;

  sub_1A41CF8C8(a1);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  result = swift_dynamicCastClass();
  if (!result)
    return result;
  v4 = (void *)swift_dynamicCastClassUnconditional();
  v5 = a1;
  v6 = objc_msgSend(v4, sel_customName);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1A423C14C();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName);
  *v11 = v8;
  v11[1] = v10;
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v4, sel_hidden);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden) = v12;
  v13 = objc_msgSend(v4, sel_originatingAddressString);
  if (v13)
  {
    v14 = v13;
    v15 = sub_1A423C14C();
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  v18 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString);
  *v18 = v15;
  v18[1] = v17;
  swift_bridgeObjectRelease();
  v19 = (unsigned __int16)objc_msgSend(v4, sel_type);
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type) = v19;
  v20 = objc_msgSend(v4, sel_mapItem);
  v21 = v20;
  if (!v20)
    goto LABEL_13;
  v22 = objc_msgSend(v20, sel_mapItemStorage);

  if (!v22)
  {
    v21 = 0;
LABEL_13:
    v24 = 0xF000000000000000;
    goto LABEL_14;
  }
  v21 = (void *)sub_1A423BF54();
  v24 = v23;

LABEL_14:
  v25 = (_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage);
  v26 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage);
  v27 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8);
  *v25 = v21;
  v25[1] = v24;
  sub_1A40D7778(v26, v27);
  v28 = (unsigned __int16)objc_msgSend(v4, sel_source);
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source) = v28;
  v29 = objc_msgSend(v4, sel_shortcutIdentifier);
  if (v29)
  {
    v30 = v29;
    v31 = sub_1A423C14C();
    v33 = v32;

  }
  else
  {
    v31 = 0;
    v33 = 0;
  }
  v34 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier);
  *v34 = v31;
  v34[1] = v33;
  swift_bridgeObjectRelease();
  v35 = (unsigned __int16)objc_msgSend(v4, sel_version);
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version) = v35;
  v36 = objc_msgSend(v4, sel_latitude);
  v37 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude) = v36;

  v38 = objc_msgSend(v4, sel_longitude);
  v39 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude) = v38;

  v40 = objc_msgSend(v4, sel_muid);
  v41 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid) = v40;

  v42 = objc_msgSend(v4, sel_contactHandles);
  if (v42)
  {
    v43 = v42;
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C2CC();

  }
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__contactHandles) = 0;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A420BD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A420FDFC, v4);
  return swift_release();
}

id sub_1A420BDFC()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  type metadata accessor for MapsSyncMutableFavoriteItem();
  v0 = swift_dynamicCastClassUnconditional();
  v1 = OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject;
  result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject), sel_managedObjectContext);
  if (result)
  {
    v3 = result;
    sub_1A4143338(0, 0, result);
    v5 = v4;

    v6 = *(void **)(v0 + v1);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB4F0);
    swift_dynamicCast();
    v8 = v11;
    v9 = v12;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 88))(v5, v8, v9);
    return (id)__swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A420BFA8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage), *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

id MapsSyncFavoriteItem.__deallocating_deinit()
{
  return sub_1A40E5B7C(0, type metadata accessor for MapsSyncFavoriteItem);
}

void *sub_1A420C0FC()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude);
  v2 = v1;
  return v1;
}

void *sub_1A420C12C()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude);
  v2 = v1;
  return v1;
}

void *sub_1A420C15C()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = *(void **)(*v0 + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid);
  v2 = v1;
  return v1;
}

id MapsSyncMutableFavoriteItem.__allocating_init(proxyObject:)(void *a1)
{
  objc_class *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id MapsSyncMutableFavoriteItem.init(proxyObject:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  type metadata accessor for MapsSyncManagedFavoriteItem();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v3 = a1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_1A420C3C4()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_contactHandles);
  if (v1)
  {
    v2 = v1;
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C2CC();

  }
  return 0;
}

void sub_1A420C4D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  char *v24;
  id v25;
  id v26;
  uint64_t v27;

  v3 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  if (a1)
  {
    v5 = v1;
    v6 = objc_msgSend(v4, sel_contactHandles);
    if (v6)
    {
      v7 = v6;
      v27 = 0;
      type metadata accessor for MapsSyncManagedContactHandle();
      sub_1A420FE00();
      sub_1A423C2CC();

    }
    v24 = (char *)v3;
    v8 = 0;
    v27 = MEMORY[0x1E0DEE9E8];
    v9 = a1 + 56;
    v10 = 1 << *(_BYTE *)(a1 + 32);
    v11 = -1;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    v12 = v11 & *(_QWORD *)(a1 + 56);
    v13 = (unint64_t)(v10 + 63) >> 6;
    if (!v12)
      goto LABEL_8;
LABEL_7:
    for (v12 &= v12 - 1; ; v12 = (v15 - 1) & v15)
    {
      v17 = *(void **)(v5 + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
      swift_bridgeObjectRetain();
      v18 = objc_msgSend(v17, sel_managedObjectContext);
      if (!v18)
        break;
      v19 = v18;
      type metadata accessor for MapsSyncManagedContactHandle();
      v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v19);

      v21 = (void *)sub_1A423C140();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_setHandle_, v21);

      sub_1A416CE10(&v26, v20);
      if (v12)
        goto LABEL_7;
LABEL_8:
      v14 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        __break(1u);
        __break(1u);
LABEL_28:
        __break(1u);
        __break(1u);
        __break(1u);
        break;
      }
      if (v14 >= v13)
        goto LABEL_25;
      v15 = *(_QWORD *)(v9 + 8 * v14);
      ++v8;
      if (!v15)
      {
        v8 = v14 + 1;
        if (v14 + 1 >= v13)
          goto LABEL_25;
        v15 = *(_QWORD *)(v9 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 2;
          if (v14 + 2 >= v13)
            goto LABEL_25;
          v15 = *(_QWORD *)(v9 + 8 * v8);
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v13)
            {
LABEL_25:
              swift_release();
              v22 = *(void **)&v24[v5];
              type metadata accessor for MapsSyncManagedContactHandle();
              sub_1A420FE00();
              v23 = v22;
              v25 = (id)sub_1A423C2B4();
              swift_bridgeObjectRelease();
              objc_msgSend(v23, sel_setContactHandles_, v25);

              return;
            }
            v15 = *(_QWORD *)(v9 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                v8 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_28;
                if (v8 >= v13)
                  goto LABEL_25;
                v15 = *(_QWORD *)(v9 + 8 * v8);
                ++v16;
                if (v15)
                  goto LABEL_21;
              }
            }
            v8 = v16;
          }
        }
      }
LABEL_21:
      ;
    }
    __break(1u);
  }
  else
  {
    objc_msgSend(v4, sel_setContactHandles_, 0);
  }
}

void (*sub_1A420CB00(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  id v3;
  void *v4;

  a1[1] = v1;
  v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_contactHandles);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C2CC();

  }
  *a1 = 0;
  return sub_1A420CBC4;
}

void sub_1A420CBC4(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    sub_1A420C4D8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1A420C4D8(*a1);
  }
}

id sub_1A420CC08()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id result;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v1 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_contactHandles);
  if (v2)
  {
    v3 = v2;
    v8 = 0;
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C2CC();

  }
  result = objc_msgSend(*(id *)(v0 + v1), sel_managedObjectContext);
  if (result)
  {
    v5 = result;
    type metadata accessor for MapsSyncManagedContactHandle();
    v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v5);

    v7 = (void *)sub_1A423C140();
    objc_msgSend(v6, sel_setHandle_, v7);

    objc_msgSend(*(id *)(v0 + v1), sel_addContactHandlesObject_, v6);
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A420CDD8(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(a1, sel_handle);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1A423C14C();
    v7 = v6;

    *a2 = v5;
    a2[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

void sub_1A420CE90()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_contactHandles);
  if (v1)
  {
    v2 = v1;
    type metadata accessor for MapsSyncManagedContactHandle();
    sub_1A420FE00();
    sub_1A423C2CC();

  }
}

uint64_t sub_1A420D270()
{
  return sub_1A420DE0C((SEL *)&selRef_customName);
}

void sub_1A420D288(uint64_t a1, uint64_t a2)
{
  sub_1A420DF50(a1, a2, (SEL *)&selRef_setCustomName_);
}

void (*sub_1A420D294(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_customName);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423C14C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A420D310;
}

void sub_1A420D310(_QWORD *a1, char a2)
{
  sub_1A411C820(a1, a2, (SEL *)&selRef_setCustomName_);
}

id sub_1A420D334()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_hidden);
}

id sub_1A420D374(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setHidden_, a1 & 1);
}

id (*sub_1A420D394(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = objc_msgSend(*(id *)(v1 + v2), sel_hidden);
  return sub_1A420D3DC;
}

id sub_1A420D3DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)a1 + *(_QWORD *)(a1 + 8)), sel_setHidden_, *(unsigned __int8 *)(a1 + 16));
}

void sub_1A420D428()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;

  v1 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_mapItem));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, sel_mapItemStorage);

    if (v4)
    {
      v5 = sub_1A423BF54();
      v7 = v6;

      sub_1A40D778C(v5, v7);
      v8 = objc_msgSend(*(id *)(v0 + v1), sel_mapItem);
      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(v8, sel_mapItemStorage);

        if (v10)
        {
          v11 = sub_1A423BF54();
          v13 = v12;

          v14 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
          v15 = (void *)sub_1A423BF48();
          sub_1A40D778C(v11, v13);
          objc_msgSend(v14, sel_initWithData_, v15);

          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
}

void sub_1A420D5B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  v2 = v1;
  v4 = sub_1A423BF9C();
  v5 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v50 - v8;
  v10 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  v11 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  if (a1)
  {
    v50 = v7;
    v51 = v6;
    v12 = v11;
    objc_msgSend(a1, sel_coordinate);
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v13);
    objc_msgSend(v12, sel_setLatitude_, v14);

    v15 = *(id *)(v2 + v10);
    v16 = v4;
    objc_msgSend(a1, sel_coordinate);
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v17);
    objc_msgSend(v15, sel_setLongitude_, v18);

    v19 = *(id *)(v2 + v10);
    v20 = objc_msgSend(a1, sel__muid);
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedLongLong_, v20);
    objc_msgSend(v19, sel_setMuid_, v21);

    v22 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
    if (!v22)
    {
      v23 = *(id *)(v2 + v10);
      v24 = objc_msgSend(v23, sel_managedObjectContext);
      if (!v24)
      {
        __break(1u);
        return;
      }
      v25 = v24;
      type metadata accessor for MapsSyncManagedMixinMapItem();
      v26 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, v25);

      objc_msgSend(v23, sel_setMapItem_, v26);
      sub_1A423BF90();
      v27 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
      if (v27)
      {
        v28 = v27;
        v29 = (void *)sub_1A423BF6C();
        objc_msgSend(v28, sel_setCreateTime_, v29);

      }
      v30 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
      if (v30)
      {
        v31 = v30;
        v32 = (void *)sub_1A423BF6C();
        objc_msgSend(v31, sel_setModificationTime_, v32);

      }
      (*(void (**)(char *, uint64_t))(v51 + 8))(v9, v4);
    }
    v33 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
    if (v33)
    {
      v34 = v33;
      objc_msgSend(a1, sel_coordinate);
      objc_msgSend(v34, sel_setLatitude_);

    }
    v35 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
    if (v35)
    {
      v36 = v35;
      objc_msgSend(a1, sel_coordinate);
      objc_msgSend(v36, sel_setLongitude_, v37);

    }
    v38 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
    if (v38)
    {
      v39 = v38;
      v40 = objc_msgSend(a1, sel_data);
      if (v40)
      {
        v41 = sub_1A423BF54();
        v43 = v42;

        v40 = (id)sub_1A423BF48();
        sub_1A40D778C(v41, v43);
      }
      objc_msgSend(v39, sel_setMapItemStorage_, v40);

    }
    v44 = objc_msgSend(*(id *)(v2 + v10), sel_mapItem);
    if (v44)
    {
      v45 = v44;
      v46 = v50;
      sub_1A423BF90();
      v47 = (void *)sub_1A423BF6C();
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v46, v16);
      objc_msgSend(v45, sel_setModificationTime_, v47);

    }
  }
  else
  {
    v48 = objc_msgSend(v11, sel_mapItem);
    if (v48)
    {
      v49 = v48;
      objc_msgSend(v48, sel_setMapItemStorage_, 0);

    }
    objc_msgSend(*(id *)(v2 + v10), sel_setLatitude_, 0);
    objc_msgSend(*(id *)(v2 + v10), sel_setLongitude_, 0);
    objc_msgSend(*(id *)(v2 + v10), sel_setMuid_, 0);
  }
}

void (*sub_1A420DA98(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  sub_1A420D428();
  *a1 = v3;
  return sub_1A420DACC;
}

void sub_1A420DACC(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    sub_1A420D5B4(v2);

  }
  else
  {
    sub_1A420D5B4(*a1);
  }
}

uint64_t sub_1A420DB2C()
{
  return sub_1A420DE0C((SEL *)&selRef_originatingAddressString);
}

void sub_1A420DB44(uint64_t a1, uint64_t a2)
{
  sub_1A420DF50(a1, a2, (SEL *)&selRef_setOriginatingAddressString_);
}

void (*sub_1A420DB50(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_originatingAddressString);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423C14C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A420DBCC;
}

void sub_1A420DBCC(_QWORD *a1, char a2)
{
  sub_1A411C820(a1, a2, (SEL *)&selRef_setOriginatingAddressString_);
}

id sub_1A420DBF0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_type);
}

id sub_1A420DC30(__int16 a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setType_, a1);
}

id (*sub_1A420DC50(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = (unsigned __int16)objc_msgSend(*(id *)(v1 + v2), sel_type);
  return sub_1A412AF3C;
}

id sub_1A420DCB0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_source);
}

id sub_1A420DCF0(__int16 a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setSource_, a1);
}

id (*sub_1A420DD10(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = (unsigned __int16)objc_msgSend(*(id *)(v1 + v2), sel_source);
  return sub_1A420DD58;
}

id sub_1A420DD58(uint64_t a1, uint64_t a2)
{
  return sub_1A412AF48(a1, a2, (SEL *)&selRef_setSource_);
}

id sub_1A420DD70(char *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite];
  v5 = a1;
  v6 = objc_msgSend(v4, *a3);
  if (v6)
  {
    v7 = v6;
    sub_1A423C14C();

    v8 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }
  return v8;
}

uint64_t sub_1A420DE00()
{
  return sub_1A420DE0C((SEL *)&selRef_shortcutIdentifier);
}

uint64_t sub_1A420DE0C(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), *a1));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_1A423C14C();

  return v4;
}

void sub_1A420DE84(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  char *v11;
  id v12;
  id v13;

  if (!a3)
  {
    v6 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite];
    goto LABEL_5;
  }
  sub_1A423C14C();
  v6 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite];
  if (!v7)
  {
LABEL_5:
    v11 = a1;
    v9 = v6;
    v10 = 0;
    goto LABEL_6;
  }
  v8 = a1;
  v9 = v6;
  v12 = (id)sub_1A423C140();
  swift_bridgeObjectRelease();
  v10 = v12;
LABEL_6:
  v13 = v10;
  objc_msgSend(v9, *a4);

}

void sub_1A420DF44(uint64_t a1, uint64_t a2)
{
  sub_1A420DF50(a1, a2, (SEL *)&selRef_setShortcutIdentifier_);
}

void sub_1A420DF50(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  if (a2)
  {
    v6 = v5;
    v8 = (id)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = v5;
    v8 = 0;
  }
  objc_msgSend(v5, *a3, v8);

}

void sub_1A420DFDC(_QWORD *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), *a2));
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423C14C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_1A420E048(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = *(void **)(*a2 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite);
  if (*(_QWORD *)(a1 + 8))
  {
    swift_bridgeObjectRetain();
    v7 = v6;
    v9 = (id)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = v6;
    v9 = 0;
  }
  objc_msgSend(v6, *a5, v9);

}

void (*sub_1A420E0D8(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  a1[2] = v1;
  a1[3] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_shortcutIdentifier);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1A423C14C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a1 = v6;
  a1[1] = v8;
  return sub_1A420E154;
}

void sub_1A420E154(_QWORD *a1, char a2)
{
  sub_1A411C820(a1, a2, (SEL *)&selRef_setShortcutIdentifier_);
}

id sub_1A420E178()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_version);
}

id sub_1A420E1B8(__int16 a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setVersion_, a1);
}

id (*sub_1A420E1D8(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = (unsigned __int16)objc_msgSend(*(id *)(v1 + v2), sel_version);
  return sub_1A420E220;
}

id sub_1A420E220(uint64_t a1, uint64_t a2)
{
  return sub_1A412AF48(a1, a2, (SEL *)&selRef_setVersion_);
}

void sub_1A420E22C()
{
  uint64_t v0;

}

id MapsSyncMutableFavoriteItem.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableFavoriteItem);
}

uint64_t sub_1A420E258(void *a1)
{
  return sub_1A420E2C8(a1, (void (*)(_QWORD))type metadata accessor for Collection, (void (*)(void))sub_1A416E938, sub_1A416D0D0);
}

uint64_t sub_1A420E274(void *a1)
{
  return sub_1A420E2C8(a1, (void (*)(_QWORD))type metadata accessor for ReviewedPlace, (void (*)(void))sub_1A416EC80, sub_1A416D6A8);
}

uint64_t sub_1A420E290(void *a1)
{
  return sub_1A420E2C8(a1, (void (*)(_QWORD))type metadata accessor for RAPRecord, (void (*)(void))sub_1A416EC8C, sub_1A416D6BC);
}

uint64_t sub_1A420E2AC(void *a1)
{
  return sub_1A420E2C8(a1, (void (*)(_QWORD))type metadata accessor for CollectionItem, (void (*)(void))sub_1A416EC98, sub_1A416D6D0);
}

uint64_t sub_1A420E2C8(void *a1, void (*a2)(_QWORD), void (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v25;

  v7 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v7 < 0)
      v9 = *v4;
    else
      v9 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v10 = a1;
    v11 = sub_1A423C554();

    if ((v11 & 1) != 0)
    {
      v12 = sub_1A420E734(v9, (uint64_t)v10, a4, a2);
      swift_bridgeObjectRelease();
      return v12;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v14 = sub_1A423C440();
  v15 = -1 << *(_BYTE *)(v7 + 32);
  v16 = v14 & ~v15;
  if (((*(_QWORD *)(v7 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
    goto LABEL_15;
  a2(0);
  v17 = *(id *)(*(_QWORD *)(v7 + 48) + 8 * v16);
  v18 = sub_1A423C44C();

  if ((v18 & 1) == 0)
  {
    v19 = ~v15;
    do
    {
      v16 = (v16 + 1) & v19;
      if (((*(_QWORD *)(v7 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        goto LABEL_15;
      v20 = *(id *)(*(_QWORD *)(v7 + 48) + 8 * v16);
      v21 = sub_1A423C44C();

    }
    while ((v21 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v4;
  v25 = *v4;
  *v4 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v23 = v25;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v23 + 48) + 8 * v16);
  sub_1A420E8C4(v16);
  *v4 = v25;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1A420E4A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  v5 = sub_1A423C854();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 48);
  if (*(_QWORD *)(v8 + 8 * v7) != a1)
  {
    v9 = ~v6;
    do
    {
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v8 + 8 * v7) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A416ECA4();
    v11 = v14;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  sub_1A420EA64(v7);
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1A420E5A8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1A423C860();
  swift_bridgeObjectRetain();
  sub_1A423C170();
  v6 = sub_1A423C8A8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1A423C7B8() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1A423C7B8() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A416EACC();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1A420EBE8(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1A420E734(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t), void (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;

  v7 = v4;
  swift_bridgeObjectRelease();
  v8 = sub_1A423C518();
  v9 = swift_unknownObjectRetain();
  v10 = a3(v9, v8);
  v21 = v10;
  swift_retain();
  v11 = sub_1A423C440();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    a4(0);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v13);
    v15 = sub_1A423C44C();

    if ((v15 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v19 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v13);
      sub_1A420E8C4(v13);
      if ((sub_1A423C44C() & 1) != 0)
      {
        *v7 = v21;
        return v19;
      }
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v13);
        v18 = sub_1A423C44C();

        if ((v18 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_1A420E8C4(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1A423C4AC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v11 = sub_1A423C440();

        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(v3 + 48);
            v16 = (_QWORD *)(v15 + 8 * v2);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1A420EA64(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1A423C4AC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = sub_1A423C854() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1A420EBE8(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1A423C4AC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1A423C860();
        swift_bridgeObjectRetain();
        sub_1A423C170();
        v10 = sub_1A423C8A8();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1A420EDAC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    result = sub_1A420E4A0(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1A420EF0C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1A420E5A8(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1A420F0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t isStackAllocationSafe;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[2];
  _QWORD v33[6];

  v2 = a2;
  v33[5] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = 0;
    v6 = a1 + 56;
    v5 = *(_QWORD *)(a1 + 56);
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v32[0] = ~v7;
    if (-v7 < 64)
      v8 = ~(-1 << -(char)v7);
    else
      v8 = -1;
    v9 = v8 & v5;
    v10 = (unint64_t)(63 - v7) >> 6;
    v11 = a2 + 56;
    while (1)
    {
      do
      {
        if (v9)
        {
          v12 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v13 = v12 | (v4 << 6);
        }
        else
        {
          v14 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_36;
          }
          if (v14 >= v10)
            goto LABEL_33;
          v15 = *(_QWORD *)(v6 + 8 * v14);
          v16 = v4 + 1;
          if (!v15)
          {
            v16 = v4 + 2;
            if (v4 + 2 >= v10)
              goto LABEL_33;
            v15 = *(_QWORD *)(v6 + 8 * v16);
            if (!v15)
            {
              v16 = v4 + 3;
              if (v4 + 3 >= v10)
                goto LABEL_33;
              v15 = *(_QWORD *)(v6 + 8 * v16);
              if (!v15)
              {
                v16 = v4 + 4;
                if (v4 + 4 >= v10)
                  goto LABEL_33;
                v15 = *(_QWORD *)(v6 + 8 * v16);
                if (!v15)
                {
                  v17 = v4 + 5;
                  if (v4 + 5 >= v10)
                  {
LABEL_33:
                    swift_bridgeObjectRetain();
                    sub_1A40D19B8();
                    return v2;
                  }
                  v15 = *(_QWORD *)(v6 + 8 * v17);
                  if (!v15)
                  {
                    while (1)
                    {
                      v16 = v17 + 1;
                      if (__OFADD__(v17, 1))
                        break;
                      if (v16 >= v10)
                        goto LABEL_33;
                      v15 = *(_QWORD *)(v6 + 8 * v16);
                      ++v17;
                      if (v15)
                        goto LABEL_23;
                    }
LABEL_36:
                    __break(1u);
                  }
                  v16 = v4 + 5;
                }
              }
            }
          }
LABEL_23:
          v9 = (v15 - 1) & v15;
          v13 = __clz(__rbit64(v15)) + (v16 << 6);
          v4 = v16;
        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v13);
        v19 = sub_1A423C854();
        v20 = -1 << *(_BYTE *)(v2 + 32);
        v21 = v19 & ~v20;
      }
      while (((*(_QWORD *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0);
      v22 = *(_QWORD *)(v2 + 48);
      if (*(_QWORD *)(v22 + 8 * v21) == v18)
        break;
      while (1)
      {
        v21 = (v21 + 1) & ~v20;
        if (((*(_QWORD *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        if (*(_QWORD *)(v22 + 8 * v21) == v18)
          goto LABEL_28;
      }
    }
LABEL_28:
    v33[0] = a1;
    v33[1] = v6;
    v33[2] = v32[0];
    v33[3] = v4;
    v33[4] = v9;
    v23 = (unint64_t)(63 - v20) >> 6;
    v24 = 8 * v23;
    isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v23 < 0x81 || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      v27 = (char *)v32 - v26;
      memcpy((char *)v32 - v26, (const void *)(v2 + 56), v24);
      v28 = sub_1A420F8A4((uint64_t)v27, v23, v2, v21, v33);
      swift_release();
      sub_1A40D19B8();
      return v28;
    }
    else
    {
      v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      v30 = sub_1A420F8A4((uint64_t)v29, v23, v2, v21, v33);
      swift_release();
      sub_1A40D19B8();
      MEMORY[0x1A859C06C](v29, -1, -1);
      return v30;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1A420F43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_1A40D19B8();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1A423C860();
      swift_bridgeObjectRetain();
      sub_1A423C170();
      v19 = sub_1A423C8A8();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1A423C7B8() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1A423C7B8() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_1A420FAE4((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1A40D19B8();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_1A420FAE4((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1A40D19B8();
      MEMORY[0x1A859C06C](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1A420F8A4(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t i;
  unint64_t v31;

  v8 = (unint64_t *)result;
  v9 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v10 = v9 - 1;
  v11 = a3 + 56;
  while (1)
  {
    v16 = a5[3];
    v17 = a5[4];
    if (!v17)
      break;
    v18 = (v17 - 1) & v17;
    v19 = __clz(__rbit64(v17)) | (v16 << 6);
LABEL_22:
    v26 = *(_QWORD *)(*(_QWORD *)(*a5 + 48) + 8 * v19);
    a5[3] = v16;
    a5[4] = v18;
    result = sub_1A423C854();
    v27 = -1 << *(_BYTE *)(a3 + 32);
    v28 = result & ~v27;
    v12 = v28 >> 6;
    v13 = 1 << v28;
    if (((1 << v28) & *(_QWORD *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      v29 = *(_QWORD *)(a3 + 48);
      if (*(_QWORD *)(v29 + 8 * v28) == v26)
      {
LABEL_3:
        v14 = v12;
        v15 = v8[v12];
        v8[v14] = v15 & ~v13;
        if ((v13 & v15) != 0)
        {
          if (__OFSUB__(v10--, 1))
            goto LABEL_33;
          if (!v10)
            return MEMORY[0x1E0DEE9E8];
        }
      }
      else
      {
        for (i = v28 + 1; ; i = v31 + 1)
        {
          v31 = i & ~v27;
          if (((*(_QWORD *)(v11 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
            break;
          if (*(_QWORD *)(v29 + 8 * v31) == v26)
          {
            v12 = v31 >> 6;
            v13 = 1 << v31;
            goto LABEL_3;
          }
        }
      }
    }
  }
  v20 = v16 + 1;
  if (!__OFADD__(v16, 1))
  {
    v21 = (unint64_t)(a5[2] + 64) >> 6;
    v22 = a5[3];
    if (v20 >= v21)
      goto LABEL_31;
    v23 = a5[1];
    v24 = *(_QWORD *)(v23 + 8 * v20);
    if (!v24)
    {
      v22 = v16 + 1;
      if (v16 + 2 >= v21)
        goto LABEL_31;
      v24 = *(_QWORD *)(v23 + 8 * (v16 + 2));
      if (v24)
      {
        v20 = v16 + 2;
      }
      else
      {
        v22 = v16 + 2;
        if (v16 + 3 >= v21)
          goto LABEL_31;
        v24 = *(_QWORD *)(v23 + 8 * (v16 + 3));
        if (v24)
        {
          v20 = v16 + 3;
        }
        else
        {
          v20 = v16 + 4;
          v22 = v16 + 3;
          if (v16 + 4 >= v21)
            goto LABEL_31;
          v24 = *(_QWORD *)(v23 + 8 * v20);
          if (!v24)
          {
            v22 = v21 - 1;
            v25 = v16 + 5;
            while (v21 != v25)
            {
              v24 = *(_QWORD *)(v23 + 8 * v25++);
              if (v24)
              {
                v20 = v25 - 1;
                goto LABEL_21;
              }
            }
LABEL_31:
            a5[3] = v22;
            a5[4] = 0;
            swift_retain();
            return sub_1A416718C(v8, a2, v10, a3);
          }
        }
      }
    }
LABEL_21:
    v18 = (v24 - 1) & v24;
    v19 = __clz(__rbit64(v24)) + (v20 << 6);
    v16 = v20;
    goto LABEL_22;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1A420FAE4(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1A4166C94(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1A423C860();
        swift_bridgeObjectRetain();
        sub_1A423C170();
        v22 = sub_1A423C8A8();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1A423C7B8() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1A423C7B8() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1A420FDD8()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1A420FE00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE710710;
  if (!qword_1EE710710)
  {
    v1 = type metadata accessor for MapsSyncManagedContactHandle();
    result = MEMORY[0x1A859BF94](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE710710);
  }
  return result;
}

uint64_t type metadata accessor for MapsSyncMutableFavoriteItem()
{
  return objc_opt_self();
}

uint64_t sub_1A420FE68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1A420C3C4();
  *a1 = result;
  return result;
}

void sub_1A420FE90()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_1A420C4D8(v0);
}

void sub_1A420FEB8(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A420DFDC(a1, (SEL *)&selRef_customName, a2);
}

void sub_1A420FED4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A420E048(a1, a2, a3, a4, (SEL *)&selRef_setCustomName_);
}

id sub_1A420FEF0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_hidden);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1A420FF2C(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), sel_setHidden_, *a1);
}

void sub_1A420FF50(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1A420D428();
  *a1 = v2;
}

void sub_1A420FF78(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A420D5B4(v1);
}

void sub_1A420FFA4(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A420DFDC(a1, (SEL *)&selRef_originatingAddressString, a2);
}

void sub_1A420FFC0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A420E048(a1, a2, a3, a4, (SEL *)&selRef_setOriginatingAddressString_);
}

id sub_1A420FFDC@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_get_9Tm(a1, (SEL *)&selRef_type, a2);
}

id sub_1A420FFE8(__int16 *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (SEL *)&selRef_setType_);
}

id sub_1A420FFF4@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_get_9Tm(a1, (SEL *)&selRef_source, a2);
}

id sub_1A4210000(__int16 *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (SEL *)&selRef_setSource_);
}

void sub_1A421000C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1A420DFDC(a1, (SEL *)&selRef_shortcutIdentifier, a2);
}

void sub_1A4210028(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1A420E048(a1, a2, a3, a4, (SEL *)&selRef_setShortcutIdentifier_);
}

id sub_1A4210044@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  return keypath_get_9Tm(a1, (SEL *)&selRef_version, a2);
}

id keypath_get_9Tm@<X0>(_QWORD *a1@<X0>, SEL *a2@<X3>, _WORD *a3@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), *a2);
  *a3 = (_WORD)result;
  return result;
}

id sub_1A4210088(__int16 *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (SEL *)&selRef_setVersion_);
}

id keypath_set_10Tm(__int16 *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync27MapsSyncMutableFavoriteItem__proxyFavorite), *a5, *a1);
}

uint64_t sub_1A42100B0()
{
  return type metadata accessor for MapsSyncFavoriteItem();
}

uint64_t sub_1A42100B8()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncFavoriteItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.contactHandles.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x420))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.customName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x428))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.hidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x430))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.mapItemStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x438))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.originatingAddressString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x440))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x448))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.source.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x450))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.shortcutIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x458))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x460))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.latitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x468))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.longitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x470))();
}

uint64_t dispatch thunk of MapsSyncFavoriteItem.muid.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x478))();
}

uint64_t method lookup function for MapsSyncMutableFavoriteItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.contactHandles.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.contactHandles.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.contactHandles.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.addContactHandle(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.removeContactHandle(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.customName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.customName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.customName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.hidden.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.hidden.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.hidden.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.mapItemStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.mapItemStorage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.mapItemStorage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.originatingAddressString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.originatingAddressString.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.originatingAddressString.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.type.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.type.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.source.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.source.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.source.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.shortcutIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.shortcutIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.shortcutIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.version.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of MapsSyncMutableFavoriteItem.version.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t sub_1A42105C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[8];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1A423C2F0();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1A416C804(v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1A4210658()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A421067C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableFavoriteItem();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

uint64_t sub_1A42106C4(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  sub_1A40D19C0(0, &qword_1ED1AB630);
  sub_1A41E67CC();
  result = sub_1A423C2F0();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1A423C728();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x1A859B6A0](i, a1);
        sub_1A416CCFC(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_1A416CCFC(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A421081C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A4210840()
{
  uint64_t v0;

  return sub_1A420AA7C(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD *__return_ptr, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1A421084C()
{
  return swift_deallocObject();
}

uint64_t sub_1A421085C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1A423C2F0();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_1A416CD18(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

id CuratedCollectionRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CuratedCollectionRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id CuratedCollectionRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for CuratedCollection();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSCuratedCollectionRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id CuratedCollectionRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for CuratedCollection();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSCuratedCollectionRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CuratedCollectionRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for CuratedCollectionRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A4210B90()
{
  return sub_1A4210C58();
}

uint64_t sub_1A4210C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSCuratedCollectionRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for CuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for CuratedCollection();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4210F20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4210F38()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A4210F90;
  return sub_1A41EB994(0);
}

uint64_t sub_1A4210F90(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4211004()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for CuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for CuratedCollection();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A421130C(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A4211384;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A4211384()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for CuratedCollection();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A4211450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A4211468()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A42114C4;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A42114C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4211538()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for CuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for CuratedCollection();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4211854(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A42118E0;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A42118E0()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for CuratedCollection();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A42119B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A42119D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4211B44(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A4211B8C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4211BE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A4211BFC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4211D88(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A4211DDC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id CuratedCollectionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CuratedCollectionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for CuratedCollectionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CuratedCollectionRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CuratedCollectionRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CuratedCollectionRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CuratedCollectionRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of CuratedCollectionRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of CuratedCollectionRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of CuratedCollectionRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A42120A0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710788 + dword_1EE710788))(v2, v3, v4);
}

uint64_t sub_1A4212118()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710798 + dword_1EE710798))(v2, v3);
}

uint64_t sub_1A4212188()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE7107A8 + dword_1EE7107A8))(v2, v3, v4);
}

uint64_t sub_1A4212200()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE7107B8 + dword_1EE7107B8))(v2, v3);
}

id CuratedCollection.__allocating_init(curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  id v8;

  v4 = v3;
  v8 = objc_allocWithZone(v4);
  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v8, sel_initWithStore_curatedCollectionIdentifier_positionIndex_resultProviderIdentifier_, qword_1ED1AB9F0, a1, a2, a3);
}

id CuratedCollection.init(curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v4 = v3;
  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v4, sel_initWithStore_curatedCollectionIdentifier_positionIndex_resultProviderIdentifier_, qword_1ED1AB9F0, a1, a2, a3);
}

char *CuratedCollection.__allocating_init(store:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return CuratedCollection.init(store:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(a1, a2, a3, a4);
}

char *CuratedCollection.init(store:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v4;
  void *v5;
  char *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;

  v5 = v4;
  v10 = (char *)objc_msgSend(v5, sel_initWithStore_, a1);
  v11 = *(void **)&v10[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  v12 = v10;
  objc_msgSend(v11, sel_lock);
  *(_QWORD *)&v12[OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier] = a2;
  *(_QWORD *)&v12[OBJC_IVAR___MSCuratedCollection__positionIndex] = a3;
  *(_DWORD *)&v12[OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier] = a4;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  *(_DWORD *)(v13 + 32) = a4;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1A42126F4;
    *(_QWORD *)(v14 + 24) = v13;
    v15 = &v12[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks];
    swift_beginAccess();
    v16 = *(_QWORD **)v15;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v15 = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v16 = sub_1A40CF360(0, v16[2] + 1, 1, v16);
      *(_QWORD *)v15 = v16;
    }
    v19 = v16[2];
    v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      v16 = sub_1A40CF360((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
      *(_QWORD *)v15 = v16;
    }
    v16[2] = v19 + 1;
    v20 = &v16[2 * v19];
    v20[4] = sub_1A40D7370;
    v20[5] = v14;
    swift_endAccess();
  }
  swift_release();
  objc_msgSend(v11, sel_unlock);

  return v12;
}

void sub_1A4212628(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  id v10;

  type metadata accessor for MapsSyncManagedCuratedCollection();
  v8 = swift_dynamicCastClass();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = a1;
    objc_msgSend(v9, sel_setCuratedCollectionIdentifier_, a2);
    objc_msgSend(v9, sel_setPositionIndex_, a3);
    objc_msgSend(v9, sel_setResultProviderIdentifier_, a4);

  }
}

uint64_t sub_1A42126E4()
{
  return swift_deallocObject();
}

void sub_1A42126F4(void *a1)
{
  uint64_t v1;

  sub_1A4212628(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned int *)(v1 + 32));
}

uint64_t sub_1A4212820()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A42128B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_QWORD *)(v2 + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A42132D8;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id (*sub_1A4212A40(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v3, sel_unlock);
  *a1 = v4;
  return sub_1A4212AB0;
}

id sub_1A4212AB0(uint64_t *a1)
{
  return sub_1A42128B4(*a1);
}

uint64_t sub_1A4212B38()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSCuratedCollection__positionIndex);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A4212BCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_QWORD *)(v2 + OBJC_IVAR___MSCuratedCollection__positionIndex) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4213308;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id sub_1A4212D58(uint64_t a1, uint64_t a2, SEL *a3)
{
  id result;

  type metadata accessor for MapsSyncManagedCuratedCollection();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, *a3, a2);
  return result;
}

id (*sub_1A4212DB4(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__positionIndex);
  objc_msgSend(v3, sel_unlock);
  *a1 = v4;
  return sub_1A4212E24;
}

id sub_1A4212E24(uint64_t *a1)
{
  return sub_1A4212BCC(*a1);
}

uint64_t sub_1A4212EAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(unsigned int *)(v0 + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A4212F40(int a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_DWORD *)(v2 + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier) = a1;
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = a1;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A421335C;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id sub_1A42130CC(uint64_t a1, uint64_t a2)
{
  id result;

  type metadata accessor for MapsSyncManagedCuratedCollection();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setResultProviderIdentifier_, a2);
  return result;
}

id (*sub_1A421311C(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int v4;

  *(_QWORD *)a1 = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_DWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v3, sel_unlock);
  *(_DWORD *)(a1 + 8) = v4;
  return sub_1A421318C;
}

id sub_1A421318C(uint64_t a1)
{
  return sub_1A4212F40(*(_DWORD *)(a1 + 8));
}

id sub_1A42131B0(void *a1, void *a2, char a3)
{
  objc_class *v3;
  char *v7;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___MSCuratedCollection__positionIndex] = 0;
  *(_DWORD *)&v7[OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier] = 0;
  return sub_1A4185C24(a1, a2, a3);
}

id CuratedCollection.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CuratedCollection();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A42132C8()
{
  return swift_deallocObject();
}

id sub_1A42132D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4212D58(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_setCuratedCollectionIdentifier_);
}

uint64_t sub_1A42132F8()
{
  return swift_deallocObject();
}

id sub_1A4213308(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4212D58(a1, *(_QWORD *)(v1 + 16), (SEL *)&selRef_setPositionIndex_);
}

uint64_t sub_1A4213328()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A421334C()
{
  return swift_deallocObject();
}

id sub_1A421335C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A42130CC(a1, *(unsigned int *)(v1 + 16));
}

uint64_t type metadata accessor for CuratedCollection()
{
  uint64_t result;

  result = qword_1EE70DDC0;
  if (!qword_1EE70DDC0)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1A42133A0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v5;
  return result;
}

id sub_1A4213404(uint64_t *a1)
{
  return sub_1A42128B4(*a1);
}

id sub_1A4213428@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR___MSCuratedCollection__positionIndex);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v5;
  return result;
}

id sub_1A421348C(uint64_t *a1)
{
  return sub_1A4212BCC(*a1);
}

id sub_1A42134B0@<X0>(uint64_t *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  LODWORD(v3) = *(_DWORD *)(v3 + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v3;
  return result;
}

id sub_1A4213514(int *a1)
{
  return sub_1A4212F40(*a1);
}

uint64_t sub_1A4213538()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for CuratedCollection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CuratedCollection.curatedCollectionIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CuratedCollection.curatedCollectionIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of CuratedCollection.curatedCollectionIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of CuratedCollection.positionIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of CuratedCollection.positionIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CuratedCollection.positionIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CuratedCollection.resultProviderIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CuratedCollection.resultProviderIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of CuratedCollection.resultProviderIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

void sub_1A4213694(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  sub_1A4187884(a1);
  type metadata accessor for MapsSyncManagedCuratedCollection();
  v3 = swift_dynamicCastClass();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = a1;
    v6 = objc_msgSend(v4, sel_curatedCollectionIdentifier);
    *(_QWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier) = v6;
    v7 = objc_msgSend(v4, sel_positionIndex);
    *(_QWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__positionIndex) = v7;
    LODWORD(v4) = objc_msgSend(v4, sel_resultProviderIdentifier);

    *(_DWORD *)(v1 + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier) = (_DWORD)v4;
  }
}

void *sub_1A421374C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v2 = sub_1A423BFE4();
  v53 = *(_QWORD *)(v2 - 8);
  v54 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A423BF3C();
  v57 = *(_QWORD *)(v5 - 8);
  v58 = v5;
  v6 = MEMORY[0x1E0C80A78](v5);
  v55 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v56 = (char *)&v52 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AC910);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v52 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v52 - v16;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97C08]), sel_init);
  sub_1A41F3458();
  v19 = (void *)sub_1A423C434();
  objc_msgSend(v18, sel_setOption_forKey_, v19, *MEMORY[0x1E0C97900]);

  v20 = (void *)sub_1A423C434();
  v21 = v18;
  objc_msgSend(v18, sel_setOption_forKey_, v20, *MEMORY[0x1E0C97978]);

  v22 = v18;
  switch(a1)
  {
    case 0:
      return v22;
    case 1:
      v23 = objc_allocWithZone(MEMORY[0x1E0C97BC0]);
      v24 = (void *)sub_1A423C140();
      v25 = objc_msgSend(v23, sel_initWithContainerIdentifier_, v24);

      objc_msgSend(v25, sel_setUseDeviceToDeviceEncryption_, 1);
      objc_msgSend(v21, sel_setCloudKitContainerOptions_, v25);
      v26 = (void *)sub_1A423C140();
      objc_msgSend(v21, sel_setConfiguration_, v26);

      objc_msgSend(v21, sel_setType_, *MEMORY[0x1E0C979E8]);
      if (qword_1ED1ACAF8 != -1)
        swift_once();
      v27 = qword_1ED1ACB88;
      v28 = unk_1ED1ACB90;
      __swift_project_boxed_opaque_existential_0(qword_1ED1ACB70, qword_1ED1ACB88);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
      v30 = v57;
      v29 = v58;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v17, 1, v58) == 1)
      {
        v31 = 0;
      }
      else
      {
        v31 = (void *)sub_1A423BEF4();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v29);
      }
      objc_msgSend(v22, sel_setURL_, v31);

      goto LABEL_22;
    case 2:
      v32 = (void *)sub_1A423C140();
      objc_msgSend(v18, sel_setConfiguration_, v32);

      objc_msgSend(v18, sel_setType_, *MEMORY[0x1E0C979E8]);
      if (qword_1ED1ACAF8 != -1)
        swift_once();
      v33 = qword_1ED1ACB88;
      v34 = unk_1ED1ACB90;
      __swift_project_boxed_opaque_existential_0(qword_1ED1ACB70, qword_1ED1ACB88);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
      v36 = v57;
      v35 = v58;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v12, 1, v58) == 1)
        goto LABEL_16;
      v31 = (void *)sub_1A423BEF4();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v35);
      goto LABEL_21;
    case 3:
    case 7:
      v37 = (void *)sub_1A423C140();
      objc_msgSend(v18, (SEL)&selRef_countryCode, v37, *MEMORY[0x1E0C97A60]);

      v38 = (void *)sub_1A423C434();
      objc_msgSend(v18, (SEL)&selRef_countryCode, v38, *MEMORY[0x1E0C97A40]);

      v39 = (_QWORD *)MEMORY[0x1E0C97A70];
      goto LABEL_12;
    case 4:
    case 8:
      v45 = (void *)sub_1A423C140();
      objc_msgSend(v18, sel_setConfiguration_, v45);

      objc_msgSend(v18, sel_setType_, *MEMORY[0x1E0C979E8]);
      v46 = NSTemporaryDirectory();
      sub_1A423C14C();

      v47 = v55;
      sub_1A423BEE8();
      v22 = v18;
      swift_bridgeObjectRelease();
      sub_1A423BFD8();
      sub_1A423BFB4();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v4, v54);
      v48 = v56;
      sub_1A423BF0C();
      swift_bridgeObjectRelease();
      v49 = v58;
      v50 = *(void (**)(char *, uint64_t))(v57 + 8);
      v50(v47, v58);
      v31 = (void *)sub_1A423BEF4();
      v50(v48, v49);
      objc_msgSend(v21, sel_setURL_, v31);
      goto LABEL_22;
    case 5:
      v39 = (_QWORD *)MEMORY[0x1E0C979E8];
LABEL_12:
      objc_msgSend(v18, sel_setType_, *v39);
      return v22;
    case 6:
      v40 = (void *)sub_1A423C140();
      objc_msgSend(v18, sel_setConfiguration_, v40);

      objc_msgSend(v18, sel_setType_, *MEMORY[0x1E0C979E8]);
      if (qword_1ED1ACAF8 != -1)
        swift_once();
      v41 = qword_1ED1ACB88;
      v42 = unk_1ED1ACB90;
      __swift_project_boxed_opaque_existential_0(qword_1ED1ACB70, qword_1ED1ACB88);
      (*(void (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
      v44 = v57;
      v43 = v58;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v15, 1, v58) == 1)
      {
LABEL_16:
        v31 = 0;
      }
      else
      {
        v31 = (void *)sub_1A423BEF4();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v43);
      }
LABEL_21:
      objc_msgSend(v21, sel_setURL_, v31);
LABEL_22:

      return v22;
    default:
      v59 = a1;
      sub_1A423C7E8();
      __break(1u);
      JUMPOUT(0x1A4213EC0);
  }
}

uint64_t sub_1A4213EEC(char *a1, char *a2)
{
  return sub_1A40D7074(*a1, *a2);
}

uint64_t sub_1A4213EF8()
{
  sub_1A423C860();
  sub_1A423C170();
  swift_bridgeObjectRelease();
  return sub_1A423C8A8();
}

uint64_t sub_1A4213F64()
{
  sub_1A423C170();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A4213FA4()
{
  sub_1A423C860();
  sub_1A423C170();
  swift_bridgeObjectRelease();
  return sub_1A423C8A8();
}

uint64_t sub_1A421400C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1A423C77C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_1A4214068(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 0x6C61636F4CLL;
  if (*v1)
    v2 = 0x64756F6C43;
  *a1 = v2;
  a1[1] = 0xE500000000000000;
}

unint64_t MapsSyncContainerType.init(rawValue:)(unint64_t a1)
{
  return sub_1A4214464(a1);
}

unint64_t sub_1A42140B0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_1A4214464(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static MapsSyncStoreConfig.withConfig(primary:cache:)(uint64_t a1, uint64_t a2)
{
  objc_class *v4;
  char *v5;
  objc_super v7;

  v4 = (objc_class *)type metadata accessor for MapsSyncStoreConfig();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache] = a2;
  v7.receiver = v5;
  v7.super_class = v4;
  return objc_msgSendSuper2(&v7, sel_init);
}

id MapsSyncStoreConfig.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MapsSyncStoreConfig.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MapsSyncStoreConfig.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncStoreConfig();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s8MapsSync0aB11StoreConfigC07defaultcD0ACvgZ_0()
{
  char v0;
  Swift::Bool IsHostedByMaps;
  objc_class *v2;
  char *v3;
  objc_super *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  char *v8;
  char *v10;
  objc_super v11;
  uint64_t v12;
  unint64_t v13;

  v0 = MapsSyncAppAccessViaDaemon();
  IsHostedByMaps = MapsSyncIsHostedByMapsApp()();
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_1A423C5CC();
  sub_1A423C188();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  if (!IsHostedByMaps || (v0 & 1) != 0)
  {
    v5 = (void *)sub_1A423C140();
    v6 = MapsSyncSandboxAllowsXPCService(v5);

    if (v6)
      v7 = 7;
    else
      v7 = 5;
    v2 = (objc_class *)type metadata accessor for MapsSyncStoreConfig();
    v8 = (char *)objc_allocWithZone(v2);
    *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary] = 3;
    *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache] = v7;
    v11.receiver = v8;
    v4 = &v11;
  }
  else
  {
    v2 = (objc_class *)type metadata accessor for MapsSyncStoreConfig();
    v3 = (char *)objc_allocWithZone(v2);
    *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary] = 2;
    *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache] = 6;
    v10 = v3;
    v4 = (objc_super *)&v10;
  }
  v4->super_class = v2;
  return -[objc_super init](v4, sel_init, v10);
}

unint64_t sub_1A4214464(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t type metadata accessor for MapsSyncStoreConfig()
{
  return objc_opt_self();
}

unint64_t sub_1A4214498()
{
  unint64_t result;

  result = qword_1ED1ABCC0;
  if (!qword_1ED1ABCC0)
  {
    result = MEMORY[0x1A859BF94](&protocol conformance descriptor for MapsSyncContainerType, &type metadata for MapsSyncContainerType);
    atomic_store(result, (unint64_t *)&qword_1ED1ABCC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MapsSyncContainerType()
{
  return &type metadata for MapsSyncContainerType;
}

uint64_t method lookup function for MapsSyncStoreConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for MapsSyncConfiguration(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1A4214544 + 4 * byte_1A4247805[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A4214578 + 4 * byte_1A4247800[v4]))();
}

uint64_t sub_1A4214578(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A4214580(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A4214588);
  return result;
}

uint64_t sub_1A4214594(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A421459CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A42145A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A42145A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MapsSyncConfiguration()
{
  return &type metadata for MapsSyncConfiguration;
}

unint64_t sub_1A42145C8()
{
  unint64_t result;

  result = qword_1EE70DCD8;
  if (!qword_1EE70DCD8)
  {
    result = MEMORY[0x1A859BF94](&unk_1A4247990, &type metadata for MapsSyncConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EE70DCD8);
  }
  return result;
}

id CollectionItem.__allocating_init(collection:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCollection_, a1);

  return v3;
}

id CollectionItem.init(collection:)(void *a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_init);
  sub_1A40CEB18(a1, 0, (uint64_t)sub_1A40CEA1C, 0);

  return v3;
}

id VehicleRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id VehicleRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id VehicleRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for Vehicle();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSVehicleRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id VehicleRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for Vehicle();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSVehicleRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for VehicleRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for VehicleRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A4214960()
{
  return sub_1A4214A28();
}

uint64_t sub_1A4214A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSVehicleRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for Vehicle();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for Vehicle();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4214CF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4214D08()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A4214D60;
  return sub_1A41EB994(0);
}

uint64_t sub_1A4214D60(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4214DD4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for Vehicle();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for Vehicle();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42150DC(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A4215154;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A4215154()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for Vehicle();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A4215220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A4215238()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A4215294;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4215294(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4215308()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for Vehicle();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for Vehicle();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4215624(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A42156B0;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A42156B0()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for Vehicle();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A4215788()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A42157A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4215914(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A421595C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A42159B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A42159CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4215B58(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A4215BAC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id VehicleRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VehicleRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for VehicleRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VehicleRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of VehicleRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of VehicleRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of VehicleRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of VehicleRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of VehicleRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of VehicleRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A4215E70()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710820 + dword_1EE710820))(v2, v3, v4);
}

uint64_t sub_1A4215EE8()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710830 + dword_1EE710830))(v2, v3);
}

uint64_t sub_1A4215F58()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710840 + dword_1EE710840))(v2, v3, v4);
}

uint64_t sub_1A4215FD0()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710850 + dword_1EE710850))(v2, v3);
}

uint64_t type metadata accessor for MapsSyncStoreUtil()
{
  return objc_opt_self();
}

void sub_1A421605C(uint64_t a1, uint64_t a2)
{
  id v3;

  type metadata accessor for MapsSyncCollectionItem();
  v3 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

char *MapsSyncCollectionItemQuery.__allocating_init(options:delegate:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MapsSyncCollectionItemQuery.init(options:delegate:)(a1, a2);
}

char *MapsSyncCollectionItemQuery.init(options:delegate:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  char *v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;

  *(_QWORD *)(v2 + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionItemQuery__specifiedQuery) = 0;
  swift_unknownObjectRetain();
  v5 = sub_1A4162018(a2, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710900);
  v6 = swift_allocObject();
  v7 = a1;
  v8 = v5;
  v9 = sub_1A4216B04(a1, v8, v8, v8, 0, 0, v6);
  v10 = OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionItemQuery__specifiedQuery;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionItemQuery__specifiedQuery] = v9;
  swift_release();
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_genericQuery] = *(_QWORD *)&v8[v10];
  swift_retain();
  swift_unknownObjectRelease();
  v11 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  v12 = *(void **)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock];
  v13 = v8;
  objc_msgSend(v12, sel_lock);
  v13[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete] = 1;
  objc_msgSend(*(id *)&v8[v11], sel_unlock);

  swift_unknownObjectRelease();
  return v13;
}

id MapsSyncCollectionItemQuery.__allocating_init(delegate:)(uint64_t a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(v1), sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

id MapsSyncCollectionItemQuery.init(delegate:)(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(v1, sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1A4216318(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BB9B50, (void (*)(_QWORD, _QWORD))sub_1A4216FFC);
}

uint64_t sub_1A42163D0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BB9B78, (void (*)(_QWORD, _QWORD))sub_1A4217198);
}

uint64_t sub_1A42163E4(unint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = MEMORY[0x1E0DEE9D8];
  if (!v5)
  {
LABEL_12:
    a3(v6);
    return swift_bridgeObjectRelease();
  }
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = v8 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncCollectionItem();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v8 = v9;
      }
      while (v5 != v9);
    }
    else
    {
      v10 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncCollectionItem();
      do
      {
        v11 = *v10++;
        swift_dynamicCastClassUnconditional();
        v12 = v11;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v5;
      }
      while (v5);
    }
    v6 = v13;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A421664C(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BB9BA0, (void (*)(_QWORD, _QWORD))sub_1A4217004);
}

void sub_1A4216704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  type metadata accessor for MapsSyncCollectionItem();
  v5 = (void *)sub_1A423C1B8();
  if (a2)
    v6 = sub_1A423BEB8();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_1A4216784(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BB9BC8, (void (*)(_QWORD, _QWORD))sub_1A421719C);
}

uint64_t sub_1A4216798(unint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  id v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = MEMORY[0x1E0DEE9D8];
  if (!v6)
  {
LABEL_12:
    a3(v7, a2);
    return swift_bridgeObjectRelease();
  }
  v14 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v6 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v9 = 0;
      do
      {
        v10 = v9 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncCollectionItem();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v9 = v10;
      }
      while (v6 != v10);
    }
    else
    {
      v11 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncCollectionItem();
      do
      {
        v12 = *v11++;
        swift_dynamicCastClassUnconditional();
        v13 = v12;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v6;
      }
      while (v6);
    }
    v7 = v14;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4216AB4()
{
  return swift_release();
}

id MapsSyncCollectionItemQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncCollectionItemQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A4216B04(void *a1, void *a2, char *a3, void *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t ObjectType;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  int v33;
  void *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;

  v38 = a6;
  v33 = a5;
  v35 = a4;
  v36 = a3;
  v39 = a2;
  v34 = a1;
  v8 = sub_1A423C374();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A423C35C();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1A423C0D4();
  MEMORY[0x1E0C80A78](v13);
  v37 = a7 + 24;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 32) = 0;
  v32[1] = a7 + 40;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 48) = 0;
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC4A0);
  sub_1A423C0C8();
  v40 = MEMORY[0x1E0DEE9D8];
  sub_1A40F4FC0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC430);
  sub_1A40F5008();
  sub_1A423C4A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF8D0], v8);
  *(_QWORD *)(a7 + 56) = sub_1A423C398();
  swift_unknownObjectWeakInit();
  sub_1A423BF90();
  *(_QWORD *)(a7 + qword_1ED1ACB40) = 0;
  *(_BYTE *)(a7 + qword_1ED1AC138) = 0;
  v14 = qword_1ED1AC120;
  *(_QWORD *)(a7 + v14) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v15 = a7 + qword_1ED1AB758;
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  *(_BYTE *)(a7 + qword_1ED1ABA50) = 0;
  result = swift_unknownObjectWeakAssign();
  if ((v38 & 1) != 0)
  {
    if ((byte_1EE70EEE8 & 1) != 0)
    {
      v17 = v36;
      if (qword_1EE70E270 != -1)
        result = swift_once();
      v18 = &qword_1EE70EEE0;
    }
    else
    {
      v17 = v36;
      if (qword_1ED1AB520 != -1)
        result = swift_once();
      v18 = &qword_1ED1AB4E8;
    }
  }
  else if ((byte_1EE70EEE8 & 1) != 0)
  {
    v17 = v36;
    if (qword_1EE70E268 != -1)
      result = swift_once();
    v18 = &qword_1EE70EED8;
  }
  else
  {
    v17 = v36;
    if (qword_1ED1AC908 != -1)
      result = swift_once();
    v18 = qword_1ED1AC168;
  }
  v19 = (void *)*v18;
  *(_QWORD *)(a7 + 16) = *v18;
  if (*(_QWORD *)&v17[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate])
  {
    swift_unknownObjectWeakAssign();
    v20 = v35;
    swift_unknownObjectWeakAssign();
    v21 = *(void **)(a7 + 48);
    v22 = v34;
    *(_QWORD *)(a7 + 48) = v34;
    v23 = v19;
    v24 = v22;

    *(_BYTE *)(a7 + 64) = v33 & 1;
    ObjectType = swift_getObjectType();
    v26 = (*(uint64_t (**)(void))(ObjectType + 384))();
    v27 = swift_allocObject();
    swift_weakInit();
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v27;
    *(_QWORD *)(v28 + 24) = v22;
    v29 = v24;
    swift_retain();
    sub_1A4231DE4(0, (uint64_t)sub_1A421712C, v28);
    swift_release();
    swift_release();
    v30 = swift_allocObject();
    swift_weakInit();
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v30;
    *(_QWORD *)(v31 + 24) = v26;
    swift_retain();
    sub_1A4231DE4(0, (uint64_t)sub_1A4217160, v31);
    swift_release();
    swift_release();

    return a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A4216FD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A4216FFC(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42163E4(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1A4217004(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4216798(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t type metadata accessor for MapsSyncCollectionItemQuery()
{
  return objc_opt_self();
}

uint64_t method lookup function for MapsSyncCollectionItemQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncCollectionItemQuery.__allocating_init(options:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 600))();
}

uint64_t dispatch thunk of MapsSyncCollectionItemQuery.fetchContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of MapsSyncCollectionItemQuery.fetchContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of MapsSyncCollectionItemQuery.fetchQueryContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of MapsSyncCollectionItemQuery.fetchQueryContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t sub_1A42170B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A42170D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A4216704(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1A42170DC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A4217100()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A421712C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422D974(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1A4217134()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A4217160(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422DEF4(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD **)(v2 + 24));
}

uint64_t sub_1A42171A0(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncCollection();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE70E6E0);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B1E8;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_84;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710998);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A4217478(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncReviewedPlace();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA830);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B1CC;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_74_0;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA828);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A4217750(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncHistoryItem();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE70D9A0);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B1B0;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_64_0;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE710988);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A4217A28(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncCollectionItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710970);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B194;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_54;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE710978);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A4217D00(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncCollectionTransitItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710960);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B178;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_44_0;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710968);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A4217FD8(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncAnonymousCredential();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710950);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B15C;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40E0AB0;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_34;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710958);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t sub_1A42182B0(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  id v25;

  v25 = 0;
  sub_1A423C5CC();
  type metadata accessor for MapsSyncFavoriteItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710940);
  v4 = sub_1A423C8C0();
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v7 = objc_msgSend(a1, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v4, v6);
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = &v25;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1A421B140;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_1A40DE09C;
  v24 = v9;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A40D4EE4;
  v22 = &block_descriptor_44;
  v10 = _Block_copy(&aBlock);
  v11 = a1;
  v12 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_performBlockAndWait_, v10);
  _Block_release(v10);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    aBlock = 0;
    v20 = 0xE000000000000000;
    sub_1A423C5CC();
    v14 = sub_1A423C8C0();
    v16 = v15;
    swift_bridgeObjectRelease();
    aBlock = v14;
    v20 = v16;
    sub_1A423C188();
    v17 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710948);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v20);
    swift_bridgeObjectRelease();
    v18 = v25;
    swift_release();
    return (uint64_t)v18;
  }
  return result;
}

void sub_1A4218588(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v18[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v18);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = sub_1A41E39A4(v17);

    v16 = *a3;
    *a3 = v15;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A4218810(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v19[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v19);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = objc_allocWithZone((Class)type metadata accessor for MapsSyncReviewedPlace());
    v16 = sub_1A421CE20(v18);
    v17 = *a3;
    *a3 = v16;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A4218AA4(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v19[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v19);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = (char *)objc_allocWithZone((Class)type metadata accessor for MapsSyncHistoryItem());
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position] = 0;
    v16 = sub_1A41D033C(v18);
    v17 = *a3;
    *a3 = v16;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A4218D44(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v19[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v19);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = (char *)objc_allocWithZone((Class)type metadata accessor for MapsSyncCollectionItem());
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections] = 0;
    v16 = sub_1A41D033C(v18);
    v17 = *a3;
    *a3 = v16;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A4218FE4(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v19[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v19);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = (char *)objc_allocWithZone((Class)type metadata accessor for MapsSyncCollectionTransitItem());
    *(_OWORD *)&v15[OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__transitLineStorage] = xmmword_1A4243680;
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync29MapsSyncCollectionTransitItem__muid] = 0;
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections] = 0;
    v16 = sub_1A41D033C(v18);
    v17 = *a3;
    *a3 = v16;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A42192A4(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v21[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v21);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = (char *)objc_allocWithZone((Class)type metadata accessor for MapsSyncAnonymousCredential());
    *(_OWORD *)&v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId] = xmmword_1A4243680;
    *(_OWORD *)&v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken] = xmmword_1A4243680;
    v16 = &v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt];
    v17 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL] = 0;
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces] = 0;
    *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored] = MEMORY[0x1E0DEE9E8];
    v18 = sub_1A41D033C(v20);
    v19 = *a3;
    *a3 = v18;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1A42195B8(void *a1, uint64_t a2, void **a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19[5];

  v5 = objc_msgSend(a1, sel_predicate);
  if (v5)
  {
    v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1A4243A90;
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v8 = v6;
    *(_QWORD *)(v7 + 32) = sub_1A423C314();
    *(_QWORD *)(v7 + 40) = v8;
    v19[0] = v7;
    sub_1A423C1DC();
    v9 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
    v10 = v8;
    v11 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_initWithType_subpredicates_, 1, v11);

  }
  else
  {
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (id)sub_1A423C314();
  }
  objc_msgSend(a1, sel_setPredicate_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v13 = sub_1A423C3F8();
  v14 = sub_1A40E8A00(v13);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v14 + 16))
  {
    sub_1A40D1AAC(v14 + 32, (uint64_t)v19);
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    swift_dynamicCast();
    v15 = objc_allocWithZone((Class)type metadata accessor for MapsSyncFavoriteItem());
    v16 = sub_1A420AAF4(v18);
    v17 = *a3;
    *a3 = v16;
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t static MapsSyncFavoriteItem.fetch(_:_:_:sort:ascending:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t (*a6)(_QWORD, uint64_t), uint64_t a7)
{
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  char v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v32;
  _BYTE v33[32];
  _BYTE v34[32];

  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v14 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v14 = qword_1ED1AC168;
  }
  v15 = (char *)*v14;
  sub_1A40E5BF8(a3, (uint64_t)v34);
  sub_1A40E5BF8((uint64_t)v34, (uint64_t)v33);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a6;
  *(_QWORD *)(v16 + 24) = a7;
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  sub_1A40CD1EC((uint64_t)v34, v16 + 48);
  *(_QWORD *)(v16 + 80) = a4;
  v17 = a5 & 1;
  *(_BYTE *)(v16 + 88) = a5 & 1;
  v32 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v18 = *(void **)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
  swift_retain_n();
  v19 = v15;
  objc_msgSend(v18, sel_lock);
  v20 = *(void **)&v19[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext];
  if (v20)
  {
    v21 = v20;
    v22 = a4;
    v23 = v21;
    sub_1A4219AF0(v20, 0, a6, a7, a1, a2, (uint64_t)v33, v22, v17);

  }
  else
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_1A4219EC0;
    *(_QWORD *)(v24 + 24) = v16;
    v25 = &v19[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches];
    swift_beginAccess();
    v26 = *(_QWORD **)v25;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v25 = v26;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v26 = sub_1A40CF82C(0, v26[2] + 1, 1, v26);
      *(_QWORD *)v25 = v26;
    }
    v29 = v26[2];
    v28 = v26[3];
    if (v29 >= v28 >> 1)
    {
      v26 = sub_1A40CF82C((_QWORD *)(v28 > 1), v29 + 1, 1, v26);
      *(_QWORD *)v25 = v26;
    }
    v26[2] = v29 + 1;
    v30 = &v26[2 * v29];
    v30[4] = sub_1A40E75B4;
    v30[5] = v24;
    swift_endAccess();
  }
  objc_msgSend(*(id *)&v15[v32], sel_unlock);
  swift_release();
  swift_release();

  return sub_1A40CD40C((uint64_t)v33);
}

uint64_t sub_1A4219AF0(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  __int128 v27;
  uint64_t v28;
  __int128 v29;

  if (a2)
  {
    type metadata accessor for MapsSyncError();
    v11 = swift_dynamicCastClassUnconditional();
    return a3(MEMORY[0x1E0DEE9D8], v11);
  }
  else
  {
    v16 = 0xEA00000000007265;
    v17 = 0x696669746E656469;
    switch(a5)
    {
      case 0:
        goto LABEL_8;
      case 1:
        v17 = 0x6954657461657263;
        v16 = 0xEA0000000000656DLL;
        goto LABEL_8;
      case 2:
        v16 = 0x80000001A4248BA0;
        v17 = 0xD000000000000010;
        goto LABEL_8;
      case 3:
        v17 = 0x6E6F697469736F70;
        v16 = 0xED00007865646E49;
        goto LABEL_8;
      case 4:
        v17 = 0xD000000000000018;
        v16 = 0x80000001A424B3D0;
LABEL_8:
        sub_1A40E5BF8(a7, (uint64_t)&v27);
        if (!v28)
        {
          __break(1u);
LABEL_13:
          __break(1u);
LABEL_14:
          v26[0] = a5;
LABEL_15:
          sub_1A423C7E8();
          __break(1u);
          JUMPOUT(0x1A4219E94);
        }
        sub_1A40D1A9C(&v27, &v29);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
        swift_dynamicCast();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
        v18 = swift_allocObject();
        *(_OWORD *)(v18 + 16) = xmmword_1A4243A90;
        v19 = v18;
        switch(a8)
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
            v20 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
            v21 = (void *)sub_1A423C140();
            swift_bridgeObjectRelease();
            v22 = objc_msgSend(v20, sel_initWithKey_ascending_, v21, a9 & 1);

            *(_QWORD *)(v19 + 32) = v22;
            v23 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
            v24 = (void *)sub_1A423C140();
            v25 = objc_msgSend(v23, sel_initWithKey_ascending_, v24, a9 & 1);

            *(_QWORD *)(v19 + 40) = v25;
            sub_1A423C1DC();
            if (!a1)
              goto LABEL_13;
            sub_1A4221F58(v17, v16, a6, (uint64_t)v26, v19, a1, (uint64_t)a3, a4);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
            break;
          default:
            goto LABEL_15;
        }
        break;
      default:
        goto LABEL_14;
    }
  }
  return result;
}

void sub_1A4219F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  type metadata accessor for MapsSyncFavoriteItem();
  v5 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id, uint64_t))(a3 + 16))(a3, v5, a2);

}

void static MapsSyncFavoriteItem.fetchFavoriteItemForShortcutIdentifier(_:)(void *a1)
{
  sub_1A421ACB0(a1, (void (*)(void))sub_1A413CAF4);
}

void static MapsSyncFavoriteItem.fetchFavoriteItemForOriginatingAddressString(_:)(void *a1)
{
  sub_1A421ACB0(a1, (void (*)(void))sub_1A413CF34);
}

void sub_1A421A164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v10;
  id v11;
  uint64_t v12;

  *(_QWORD *)(swift_allocObject() + 16) = a8;
  if (!a2)
  {
    swift_release();
    v12 = 0x696669746E656469;
    sub_1A423C7E8();
    __break(1u);
    JUMPOUT(0x1A421A5B4);
  }
  type metadata accessor for MapsSyncError();
  v10 = swift_dynamicCastClassUnconditional();
  _Block_copy(a8);
  type metadata accessor for MapsSyncFavoriteItem();
  v11 = (id)sub_1A423C1B8();
  ((void (**)(_QWORD, id, uint64_t))a8)[2](a8, v11, v10);
  swift_release();

}

uint64_t sub_1A421A5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6)
{
  uint64_t v12;
  int v13;
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char *v35;
  _BYTE v36[32];
  _BYTE v37[32];

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a6;
  v13 = byte_1EE70EEE8;
  _Block_copy(a6);
  if (v13 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v14 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v14 = qword_1ED1AC168;
  }
  v15 = (char *)*v14;
  sub_1A40E5BF8(a3, (uint64_t)v37);
  sub_1A40E5BF8((uint64_t)v37, (uint64_t)v36);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1A421B08C;
  *(_QWORD *)(v16 + 24) = v12;
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  sub_1A40CD1EC((uint64_t)v37, v16 + 48);
  *(_QWORD *)(v16 + 80) = a4;
  v17 = a2;
  v18 = a5 & 1;
  *(_BYTE *)(v16 + 88) = a5 & 1;
  v19 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v20 = *(void **)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
  swift_retain_n();
  v35 = v15;
  v21 = v15;
  objc_msgSend(v20, sel_lock);
  v22 = *(void **)&v21[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext];
  if (v22)
  {
    _Block_copy(a6);
    v23 = v22;
    v24 = a4;
    v25 = v19;
    v26 = v23;
    sub_1A421A164((uint64_t)v22, 0, a1, v17, (uint64_t)v36, v24, v18, (void (**)(_QWORD, _QWORD, _QWORD))a6);
    _Block_release(a6);

    v19 = v25;
  }
  else
  {
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = sub_1A4219EC0;
    *(_QWORD *)(v27 + 24) = v16;
    v28 = &v21[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches];
    swift_beginAccess();
    v29 = *(_QWORD **)v28;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v28 = v29;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = sub_1A40CF82C(0, v29[2] + 1, 1, v29);
      *(_QWORD *)v28 = v29;
    }
    v32 = v29[2];
    v31 = v29[3];
    if (v32 >= v31 >> 1)
    {
      v29 = sub_1A40CF82C((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
      *(_QWORD *)v28 = v29;
    }
    v29[2] = v32 + 1;
    v33 = &v29[2 * v32];
    v33[4] = sub_1A40E7840;
    v33[5] = v27;
    swift_endAccess();
  }
  objc_msgSend(*(id *)&v35[v19], sel_unlock, v35);
  swift_release();
  swift_release();

  sub_1A40CD40C((uint64_t)v36);
  return swift_release();
}

void _s8MapsSync0aB12FavoriteItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  void (*v9)(_BYTE *, uint64_t);
  uint64_t *v10;
  void *v11;
  void *v12;
  void *ObjCClassFromMetadata;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  void *v27;
  _BYTE v28[16];
  objc_super v29;

  v0 = sub_1A423C0EC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v2);
  v6 = &v28[-v5];
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC4A0);
  v7 = sub_1A423C380();
  MapsSyncDispatchAssertNotQueue(v7);

  v8 = dispatch_semaphore_create(0);
  sub_1A413C6B4(v8);
  sub_1A423C0E0();
  MEMORY[0x1A859B19C](v4, 5.0);
  v9 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v9(v4, v0);
  sub_1A423C3C8();
  v9(v6, v0);
  if ((sub_1A423C0B0() & 1) == 0)
    goto LABEL_15;
  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v10 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v10 = qword_1ED1AC168;
  }
  v11 = (void *)*v10;
  v12 = *(void **)(*v10 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
  if (!v12)
  {
    v25 = (objc_class *)type metadata accessor for MapsSyncError();
    v26 = objc_allocWithZone(v25);
    v23 = v11;
    v27 = (void *)sub_1A423C140();
    v29.receiver = v26;
    v29.super_class = v25;
    v24 = objc_msgSendSuper2(&v29, sel_initWithDomain_code_userInfo_, v27, 5, 0);

    swift_willThrow();
    goto LABEL_14;
  }
  type metadata accessor for MapsSyncManagedFavoriteItem();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v14 = v12;
  v15 = objc_msgSend(ObjCClassFromMetadata, sel_entity);
  v16 = objc_msgSend(v15, sel_name);

  if (v16)
  {
    sub_1A423C14C();

    v17 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v18 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v17, sel_initWithEntityName_, v18);

    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1A4243A70;
    v21 = sub_1A423BFC0();
    *(_QWORD *)(v20 + 56) = sub_1A40D19C0(0, &qword_1EE70E6F0);
    *(_QWORD *)(v20 + 64) = sub_1A41D8678((unint64_t *)&qword_1EE710AE0, &qword_1EE70E6F0);
    *(_QWORD *)(v20 + 32) = v21;
    v22 = (void *)sub_1A423C314();
    -[NSObject setPredicate:](v19, sel_setPredicate_, v22);

    v23 = v14;
    sub_1A42182B0(v19, v23);

    v8 = v19;
    v24 = v23;
LABEL_14:

    v8 = v24;
LABEL_15:

    return;
  }
  __break(1u);
}

void sub_1A421ACB0(void *a1, void (*a2)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void (*v13)(_BYTE *, uint64_t);
  uint64_t *v14;
  void *v15;
  void *v16;
  void *ObjCClassFromMetadata;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  void *v31;
  _BYTE v32[16];
  objc_super v33;

  v4 = sub_1A423C0EC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v32[-v9];
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC4A0);
  v11 = sub_1A423C380();
  MapsSyncDispatchAssertNotQueue(v11);

  v12 = dispatch_semaphore_create(0);
  a2();
  sub_1A423C0E0();
  MEMORY[0x1A859B19C](v8, 5.0);
  v13 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v13(v8, v4);
  sub_1A423C3C8();
  v13(v10, v4);
  if ((sub_1A423C0B0() & 1) == 0)
    goto LABEL_15;
  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v14 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v14 = qword_1ED1AC168;
  }
  v15 = (void *)*v14;
  v16 = *(void **)(*v14 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
  if (!v16)
  {
    v29 = (objc_class *)type metadata accessor for MapsSyncError();
    v30 = objc_allocWithZone(v29);
    v27 = v15;
    v31 = (void *)sub_1A423C140();
    v33.receiver = v30;
    v33.super_class = v29;
    v28 = objc_msgSendSuper2(&v33, sel_initWithDomain_code_userInfo_, v31, 5, 0);

    swift_willThrow();
    goto LABEL_14;
  }
  type metadata accessor for MapsSyncManagedFavoriteItem();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v18 = v16;
  v19 = objc_msgSend(ObjCClassFromMetadata, sel_entity);
  v20 = objc_msgSend(v19, sel_name);

  if (v20)
  {
    sub_1A423C14C();

    v21 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v22 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v21, sel_initWithEntityName_, v22);

    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v24 + 56) = sub_1A40D19C0(0, &qword_1EE710930);
    *(_QWORD *)(v24 + 64) = sub_1A41D8678(&qword_1EE710938, &qword_1EE710930);
    *(_QWORD *)(v24 + 32) = a1;
    v25 = a1;
    v26 = (void *)sub_1A423C314();
    -[NSObject setPredicate:](v23, sel_setPredicate_, v26);

    v27 = v18;
    sub_1A42182B0(v23, v27);

    v12 = v23;
    v28 = v27;
LABEL_14:

    v12 = v28;
LABEL_15:

    return;
  }
  __break(1u);
}

void sub_1A421B08C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A4219F68(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1A421B098(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4219AF0(a1, a2, *(uint64_t (**)(_QWORD, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), v2 + 48, *(_QWORD *)(v2 + 80), *(_BYTE *)(v2 + 88));
}

uint64_t sub_1A421B0CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A421B0F0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A421B114()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A421B140()
{
  uint64_t v0;

  sub_1A42195B8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B14C()
{
  return swift_deallocObject();
}

void sub_1A421B15C()
{
  uint64_t v0;

  sub_1A42192A4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B168()
{
  return swift_deallocObject();
}

void sub_1A421B178()
{
  uint64_t v0;

  sub_1A4218FE4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B184()
{
  return swift_deallocObject();
}

void sub_1A421B194()
{
  uint64_t v0;

  sub_1A4218D44(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B1A0()
{
  return swift_deallocObject();
}

void sub_1A421B1B0()
{
  uint64_t v0;

  sub_1A4218AA4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B1BC()
{
  return swift_deallocObject();
}

void sub_1A421B1CC()
{
  uint64_t v0;

  sub_1A4218810(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B1D8()
{
  return swift_deallocObject();
}

void sub_1A421B1E8()
{
  uint64_t v0;

  sub_1A4218588(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_1A421B1F4()
{
  return swift_deallocObject();
}

uint64_t sub_1A421B2A8()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint64_t v18;
  unint64_t v19;

  v1 = v0;
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v15 + 1) = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  v18 = 60;
  v19 = 0xE100000000000000;
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for MapsSyncHistoryRideShareItem();
  v2 = objc_msgSendSuper2(&v17, sel_description, v15);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  v3 = 0;
  v4 = (uint64_t *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint];
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8];
  if (v5 >> 60 != 15)
  {
    v6 = *v4;
    sub_1A40D7734(*v4, *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8]);
    v3 = (void *)sub_1A423BF48();
    sub_1A40D7778(v6, v5);
  }
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v3);

  if (v7)
  {
    *((_QWORD *)&v16 + 1) = sub_1A421B6A0();
    *(_QWORD *)&v15 = v7;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  sub_1A40CD40C((uint64_t)&v15);
  sub_1A423C188();
  sub_1A423C188();
  v8 = (uint64_t *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint];
  v9 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8];
  if (v9 >> 60 == 15)
  {
    v10 = 0;
  }
  else
  {
    v11 = *v8;
    sub_1A40D7734(*v8, *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8]);
    v10 = (void *)sub_1A423BF48();
    sub_1A40D7778(v11, v9);
  }
  v12 = objc_allocWithZone(MEMORY[0x1E0D26FF8]);
  v13 = objc_msgSend(v12, sel_initWithData_, v10, (_QWORD)v15);

  if (v13)
  {
    *((_QWORD *)&v16 + 1) = sub_1A421B6A0();
    *(_QWORD *)&v15 = v13;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  sub_1A40CD40C((uint64_t)&v15);
  sub_1A423C188();
  sub_1A423C188();
  return v18;
}

id sub_1A421B508()
{
  return sub_1A421B5D0(&OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint);
}

id sub_1A421B520(char *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v4;
  unint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;

  v4 = (uint64_t *)&a1[*a3];
  v5 = v4[1];
  if (v5 >> 60 == 15)
  {
    v6 = a1;
    v7 = 0;
  }
  else
  {
    v8 = *v4;
    v9 = a1;
    sub_1A40D7720(v8, v5);
    v7 = (void *)sub_1A423BF48();
    sub_1A40D7778(v8, v5);
  }
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v7);

  return v10;
}

id sub_1A421B5C4()
{
  return sub_1A421B5D0(&OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
}

id sub_1A421B5D0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = v1 + *a1;
  v3 = *(_QWORD *)(v2 + 8);
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)v2;
    sub_1A40D7734(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
    v4 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v3);
  }
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v4);

  return v6;
}

uint64_t type metadata accessor for MapsSyncHistoryRideShareItem()
{
  uint64_t result;

  result = qword_1EE7109E8;
  if (!qword_1EE7109E8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1A421B6A0()
{
  unint64_t result;

  result = qword_1EE7109B0;
  if (!qword_1EE7109B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE7109B0);
  }
  return result;
}

uint64_t sub_1A421B6DC(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  unsigned int v10;
  uint64_t result;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  objc_super v28;
  __int128 v29;
  uint64_t v30;

  sub_1A40E5BF8(a1, (uint64_t)&v29);
  v3 = v30;
  if (v30)
  {
    v4 = __swift_project_boxed_opaque_existential_0(&v29, v30);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x1E0C80A78](v4);
    v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = sub_1A423C7AC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v29);
  }
  else
  {
    v8 = 0;
  }
  v9 = (objc_class *)type metadata accessor for MapsSyncHistoryRideShareItem();
  v28.receiver = v1;
  v28.super_class = v9;
  v10 = objc_msgSendSuper2(&v28, sel_isEqual_, v8);
  swift_unknownObjectRelease();
  if (!v10)
    return v10 & 1;
  sub_1A40E5BF8(a1, (uint64_t)&v29);
  if (!v30)
  {
    sub_1A40CD40C((uint64_t)&v29);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    LOBYTE(v10) = 0;
    return v10 & 1;
  }

  result = sub_1A40E5BF8(a1, (uint64_t)&v26);
  if (v27)
  {
    sub_1A40D1A9C(&v26, &v29);
    swift_dynamicCast();
    v12 = v25;
    v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint];
    v14 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8];
    v15 = *(_QWORD *)&v25[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint];
    v16 = *(_QWORD *)&v25[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8];
    if (v14 >> 60 == 15)
    {
      if (v16 >> 60 == 15)
        goto LABEL_15;
    }
    else if (v16 >> 60 != 15)
    {
      sub_1A40D7720(*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint], *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8]);
      sub_1A40D7720(v15, v16);
      sub_1A40E6DC0(v13, v14);
      v18 = v17;
      sub_1A40D7778(v15, v16);
      sub_1A40D7778(v13, v14);
      if ((v18 & 1) != 0)
      {
LABEL_15:
        v19 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint];
        v20 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8];
        v21 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint];
        v22 = *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8];
        if (v20 >> 60 == 15)
        {
          sub_1A40D7720(*(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint], *(_QWORD *)&v12[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8]);

          if (v22 >> 60 == 15)
          {
            LOBYTE(v10) = 1;
            return v10 & 1;
          }
        }
        else
        {
          if (v22 >> 60 != 15)
          {
            sub_1A40D7720(v19, v20);
            sub_1A40D7720(v21, v22);
            sub_1A40D7720(v19, v20);
            sub_1A40E6DC0(v19, v20);
            LOBYTE(v10) = v23;

            sub_1A40D7778(v21, v22);
            sub_1A40D7778(v19, v20);
            sub_1A40D7778(v19, v20);
            return v10 & 1;
          }
          sub_1A40D7734(v19, v20);

        }
        sub_1A40D7778(v19, v20);
        sub_1A40D7778(v21, v22);
        goto LABEL_22;
      }
LABEL_18:

      goto LABEL_22;
    }
    sub_1A40D7720(*(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint], *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8]);
    sub_1A40D7720(v15, v16);
    sub_1A40D7778(v13, v14);
    sub_1A40D7778(v15, v16);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_1A421BA8C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;

  sub_1A41CF8C8(a1);
  type metadata accessor for MapsSyncManagedHistoryItem();
  if (swift_dynamicCastClass())
  {
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_position);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = v3;
  }
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  if (swift_dynamicCastClass())
  {
    v4 = (void *)swift_dynamicCastClassUnconditional();
    v21 = a1;
    v5 = objc_msgSend(v4, sel_startWaypoint);
    if (v5)
    {
      v6 = v5;
      v7 = sub_1A423BF54();
      v9 = v8;

    }
    else
    {
      v7 = 0;
      v9 = 0xF000000000000000;
    }
    v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint);
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint);
    v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8);
    *v10 = v7;
    v10[1] = v9;
    sub_1A40D7778(v11, v12);
    v13 = objc_msgSend(v4, sel_endWaypoint);
    if (v13)
    {
      v14 = v13;
      v15 = sub_1A423BF54();
      v17 = v16;

    }
    else
    {
      v15 = 0;
      v17 = 0xF000000000000000;
    }
    v18 = (uint64_t *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
    v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
    v20 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8);
    *v18 = v15;
    v18[1] = v17;
    sub_1A40D7778(v19, v20);

  }
}

uint64_t sub_1A421BC88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1A421C83C;
  *(_QWORD *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126820, v5);
  swift_release();
  return swift_release();
}

void *sub_1A421BDF8(void *a1)
{
  objc_class *v1;
  char *v3;

  v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint] = xmmword_1A4243680;
  *(_OWORD *)&v3[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint] = xmmword_1A4243680;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position] = 0;
  return sub_1A41D033C(a1);
}

uint64_t sub_1A421BEAC()
{
  uint64_t v0;

  sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint), *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint + 8));
  return sub_1A40D7778(*(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint), *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint + 8));
}

id MapsSyncHistoryRideShareItem.__deallocating_deinit()
{
  return sub_1A40E5B7C(0, type metadata accessor for MapsSyncHistoryRideShareItem);
}

id MapsSyncMutableHistoryRideShareItem.__allocating_init(proxyObject:)(void *a1)
{
  objc_class *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id MapsSyncMutableHistoryRideShareItem.init(proxyObject:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v3 = a1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_1A421C160()
{
  return sub_1A421C348((SEL *)&selRef_startWaypoint);
}

void sub_1A421C1B4(void *a1)
{
  sub_1A421C43C(a1, (SEL *)&selRef_setStartWaypoint_);
}

void (*sub_1A421C1C0(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v3 = OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory;
  a1[1] = v1;
  a1[2] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_startWaypoint);
  if (v4)
  {
    v5 = sub_1A423BF54();
    v7 = v6;

    v4 = (id)sub_1A423BF48();
    sub_1A40D778C(v5, v7);
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v4);

  *a1 = v8;
  return sub_1A421C274;
}

void sub_1A421C274(uint64_t a1, char a2)
{
  sub_1A421C680(a1, a2, (SEL *)&selRef_setStartWaypoint_);
}

id sub_1A421C28C(char *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = *(void **)&a1[OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory];
  v5 = a1;
  v6 = objc_msgSend(v4, *a3);
  if (v6)
  {
    v7 = sub_1A423BF54();
    v9 = v8;

    v6 = (id)sub_1A423BF48();
    sub_1A40D778C(v7, v9);
  }
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v6);

  return v10;
}

id sub_1A421C33C()
{
  return sub_1A421C348((SEL *)&selRef_endWaypoint);
}

id sub_1A421C348(SEL *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;

  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory), *a1));
  if (v2)
  {
    v3 = sub_1A423BF54();
    v5 = v4;

    v2 = (id)sub_1A423BF48();
    sub_1A40D778C(v3, v5);
  }
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v2);

  return v6;
}

void sub_1A421C430(void *a1)
{
  sub_1A421C43C(a1, (SEL *)&selRef_setEndWaypoint_);
}

void sub_1A421C43C(void *a1, SEL *a2)
{
  uint64_t v2;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v5 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory);
  if (a1)
  {
    v11 = a1;
    v6 = v5;
    v7 = objc_msgSend(v11, sel_data);
    if (v7)
    {
      v8 = sub_1A423BF54();
      v10 = v9;

      v7 = (id)sub_1A423BF48();
      sub_1A40D778C(v8, v10);
    }
    objc_msgSend(v6, *a2, v7);

  }
  else
  {
    objc_msgSend(v5, *a2, 0);
  }
}

void sub_1A421C51C(_QWORD *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory), *a2));
  if (v4)
  {
    v5 = sub_1A423BF54();
    v7 = v6;

    v4 = (id)sub_1A423BF48();
    sub_1A40D778C(v5, v7);
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v4);

  *a3 = v8;
}

void (*sub_1A421C5C0(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v3 = OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory;
  a1[1] = v1;
  a1[2] = v3;
  v4 = objc_msgSend(*(id *)(v1 + v3), sel_endWaypoint);
  if (v4)
  {
    v5 = sub_1A423BF54();
    v7 = v6;

    v4 = (id)sub_1A423BF48();
    sub_1A40D778C(v5, v7);
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D26FF8]), sel_initWithData_, v4);

  *a1 = v8;
  return sub_1A421C674;
}

void sub_1A421C674(uint64_t a1, char a2)
{
  sub_1A421C680(a1, a2, (SEL *)&selRef_setEndWaypoint_);
}

void sub_1A421C680(uint64_t a1, char a2, SEL *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;

  v4 = *(id *)a1;
  v5 = *(void **)(*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16));
  if ((a2 & 1) != 0)
  {
    if (!v4)
    {
      objc_msgSend(v5, *a3, 0);
      v13 = 0;
      goto LABEL_12;
    }
    v6 = v5;
    v14 = v4;
    v4 = objc_msgSend(v14, sel_data);
    if (v4)
    {
      v7 = sub_1A423BF54();
      v9 = v8;

      v4 = (id)sub_1A423BF48();
      sub_1A40D778C(v7, v9);
    }
    objc_msgSend(v6, *a3, v4);

LABEL_10:
    v13 = v14;
LABEL_12:

    return;
  }
  if (v4)
  {
    v14 = v5;
    v6 = objc_msgSend(v4, sel_data);
    if (v6)
    {
      v10 = sub_1A423BF54();
      v12 = v11;

      v6 = (id)sub_1A423BF48();
      sub_1A40D778C(v10, v12);
    }
    objc_msgSend(v14, *a3, v6);
    goto LABEL_10;
  }
  objc_msgSend(v5, *a3, 0);
}

void sub_1A421C7EC()
{
  uint64_t v0;

}

id MapsSyncMutableHistoryRideShareItem.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableHistoryRideShareItem);
}

uint64_t sub_1A421C818()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for MapsSyncMutableHistoryRideShareItem()
{
  return objc_opt_self();
}

void sub_1A421C860(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1A421C51C(a1, (SEL *)&selRef_startWaypoint, a2);
}

void sub_1A421C87C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A421C1B4(v1);
}

void sub_1A421C8A8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  sub_1A421C51C(a1, (SEL *)&selRef_endWaypoint, a2);
}

void sub_1A421C8C4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A421C430(v1);
}

uint64_t sub_1A421C8F0()
{
  return type metadata accessor for MapsSyncHistoryRideShareItem();
}

uint64_t sub_1A421C8F8()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncHistoryRideShareItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncHistoryRideShareItem.startWaypoint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of MapsSyncHistoryRideShareItem.endWaypoint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x310))();
}

uint64_t method lookup function for MapsSyncMutableHistoryRideShareItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.startWaypoint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.startWaypoint.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.startWaypoint.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.endWaypoint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.endWaypoint.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryRideShareItem.endWaypoint.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t sub_1A421CA30()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A421CA54()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableHistoryRideShareItem();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

id sub_1A421CAFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryTransitItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedHistoryTransitItem()
{
  return objc_opt_self();
}

uint64_t sub_1A421CB4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MapsSyncManagedCuratedCollection();
  result = sub_1A423C5D8();
  *a1 = result;
  return result;
}

char *MapsSyncReviewedPlace.__allocating_init(anonymousCredential:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return MapsSyncReviewedPlace.init(anonymousCredential:)(a1);
}

char *MapsSyncReviewedPlace.init(anonymousCredential:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid) = 0;
  v3 = v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
  v4 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed) = 0;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude) = 0;
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredentialUnstored) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId) = 0;
  v5 = (char *)sub_1A41D033C(0);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential];
  *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential] = a1;

  return v5;
}

void *MapsSyncReviewedPlace.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return MapsSyncReviewedPlace.init()();
}

void *MapsSyncReviewedPlace.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid) = 0;
  v1 = v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
  v2 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed) = 0;
  *(_DWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude) = 0;
  *(_WORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredentialUnstored) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId) = 0;
  return sub_1A41D033C(0);
}

void *sub_1A421CDF0(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_1A421CE20(a1);
}

void *sub_1A421CE20(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid) = 0;
  v3 = v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
  v4 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed) = 0;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude) = 0;
  *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredentialUnstored) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId) = 0;
  return sub_1A41D033C(a1);
}

uint64_t sub_1A421CF38()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid);
}

void *sub_1A421CF58()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier);
  v2 = v1;
  return v1;
}

void *sub_1A421CF94()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating);
  v2 = v1;
  return v1;
}

void *sub_1A421CFD0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude);
  v2 = v1;
  return v1;
}

void *sub_1A421D00C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude);
  v2 = v1;
  return v1;
}

uint64_t sub_1A421D11C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
  swift_beginAccess();
  return sub_1A410356C(v3, a1, &qword_1ED1AB5D0);
}

uint64_t sub_1A421D184()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed);
}

uint64_t sub_1A421D1A4()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount);
}

uint64_t sub_1A421D1C4()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version);
}

id sub_1A421D1D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id result;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier);
  if (result
    && (v4 = objc_msgSend(result, sel_intValue),
        (result = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude)) != 0)
    && (objc_msgSend(result, sel_doubleValue),
        (result = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude)) != 0))
  {
    v6 = v5;
    result = objc_msgSend(result, sel_doubleValue);
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = v7;
    *(_DWORD *)(a1 + 24) = v4;
    *(_BYTE *)(a1 + 28) = 0;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 28) = 1;
  }
  return result;
}

void *sub_1A421D2A8()
{
  return sub_1A421D374((uint64_t)sub_1A421D2C4, sub_1A418A5B0, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__anonymousCredential);
}

id sub_1A421D2C4@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A421D3D4(a1, (SEL *)&selRef_anonymousCredential, (void (*)(_QWORD))type metadata accessor for MapsSyncAnonymousCredential, a2);
}

id sub_1A421D2F4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t *a5)
{
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a1;
  v8 = a4();
  v9 = *a5;
  v10 = *(void **)&v7[v9];
  *(_QWORD *)&v7[v9] = v8;

  v11 = *(id *)&v7[v9];
  return v11;
}

void *sub_1A421D358()
{
  return sub_1A421D374((uint64_t)sub_1A421D3C0, sub_1A418A81C, &OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__communityId);
}

void *sub_1A421D374(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2(v3, a1, 0);
  v6 = *a3;
  v7 = *(void **)(v3 + v6);
  *(_QWORD *)(v3 + v6) = v5;

  v8 = *(void **)(v3 + v6);
  v9 = v8;
  return v8;
}

id sub_1A421D3C0@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A421D3D4(a1, (SEL *)&selRef_communityID, (void (*)(_QWORD))type metadata accessor for MapsSyncCommunityID, a2);
}

id sub_1A421D3D4@<X0>(void *a1@<X0>, SEL *a2@<X1>, void (*a3)(_QWORD)@<X2>, _QWORD *a4@<X8>)
{
  id v8;
  id result;
  void *v10;
  void *v11;

  v8 = objc_msgSend(a1, *a2);

  if (!v8)
    goto LABEL_6;
  result = objc_msgSend(a1, *a2);
  if (result)
  {
    v10 = result;
    v11 = sub_1A41E3AF0(result);

    if (v11)
    {
      a3(0);
      result = (id)swift_dynamicCastClass();
      if (result)
      {
LABEL_7:
        *a4 = result;
        return result;
      }

    }
LABEL_6:
    result = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A421D47C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  unsigned int v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  uint64_t v20;

  sub_1A410356C(a1, (uint64_t)&v19, (uint64_t *)&unk_1ED1AC4F0);
  v3 = v20;
  if (v20)
  {
    v4 = __swift_project_boxed_opaque_existential_0(&v19, v20);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x1E0C80A78](v4);
    v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = sub_1A423C7AC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v19);
  }
  else
  {
    v8 = 0;
  }
  v9 = (objc_class *)type metadata accessor for MapsSyncReviewedPlace();
  v18.receiver = v1;
  v18.super_class = v9;
  v10 = objc_msgSendSuper2(&v18, sel_isEqual_, v8);
  swift_unknownObjectRelease();
  if (!v10)
    return 0;
  sub_1A410356C(a1, (uint64_t)&v19, (uint64_t *)&unk_1ED1AC4F0);
  if (!v20)
  {
    sub_1A410251C((uint64_t)&v19, (uint64_t *)&unk_1ED1AC4F0);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 0;

  result = sub_1A410356C(a1, (uint64_t)&v16, (uint64_t *)&unk_1ED1AC4F0);
  if (v17)
  {
    sub_1A40D1A9C(&v16, &v19);
    swift_dynamicCast();
    v12 = *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid];
    v13 = *(_QWORD *)&v15[OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid];

    return v12 == v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MapsSyncReviewedPlace()
{
  uint64_t result;

  result = qword_1ED1AA810;
  if (!qword_1ED1AA810)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1A421D704(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  unsigned __int16 v24;
  uint64_t v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A41CF8C8(a1);
  type metadata accessor for MapsSyncManagedReviewedPlace();
  if (swift_dynamicCastClass())
  {
    v6 = (void *)swift_dynamicCastClassUnconditional();
    v7 = a1;
    v8 = objc_msgSend(v6, sel_muid);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__muid) = v8;
    v9 = objc_msgSend(v6, sel_lastSuggestedReviewDate);
    if (v9)
    {
      v10 = v9;
      sub_1A423BF84();

      v11 = sub_1A423BF9C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 0, 1, v11);
    }
    else
    {
      v12 = sub_1A423BF9C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 1, 1, v12);
    }
    v13 = v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate;
    swift_beginAccess();
    sub_1A40F1FC8((uint64_t)v5, v13);
    swift_endAccess();
    v14 = objc_msgSend(v6, sel_hasUserReviewed);
    *(_BYTE *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__hasUserReviewed) = v14;
    v15 = objc_msgSend(v6, sel_latitude);
    v16 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__latitude) = v15;

    v17 = objc_msgSend(v6, sel_longitude);
    v18 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__longitude) = v17;

    v19 = objc_msgSend(v6, sel_rating);
    v20 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__rating) = v19;

    v21 = objc_msgSend(v6, sel_resultProviderIdentifier);
    v22 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__resultProviderIdentifier) = v21;

    v23 = objc_msgSend(v6, sel_uploadedPhotosCount);
    *(_DWORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__uploadedPhotosCount) = v23;
    v24 = (unsigned __int16)objc_msgSend(v6, sel_version);

    *(_WORD *)(v1 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__version) = v24;
  }
}

uint64_t sub_1A421D9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A421DA78, v4);
  return swift_release();
}

uint64_t sub_1A421DA54()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A421DB70()
{
  void *v0;
  id v1;
  objc_super v3;
  uint64_t v4;
  unint64_t v5;

  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  v4 = 60;
  v5 = 0xE100000000000000;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for MapsSyncReviewedPlace();
  v1 = objc_msgSendSuper2(&v3, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C7A0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  return v4;
}

void sub_1A421DCE0()
{
  uint64_t v0;

  sub_1A410251C(v0 + OBJC_IVAR____TtC8MapsSync21MapsSyncReviewedPlace__lastSuggestedReviewDate, &qword_1ED1AB5D0);

}

id MapsSyncReviewedPlace.__deallocating_deinit()
{
  return sub_1A40E5B7C(0, type metadata accessor for MapsSyncReviewedPlace);
}

id sub_1A421DE24@<X0>(uint64_t a1@<X8>)
{
  return sub_1A421D1D4(a1);
}

id MapsSyncMutableReviewedPlace.__allocating_init(proxyObject:)(void *a1)
{
  objc_class *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  type metadata accessor for MapsSyncManagedReviewedPlace();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id MapsSyncMutableReviewedPlace.init(proxyObject:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  type metadata accessor for MapsSyncManagedReviewedPlace();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v3 = a1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_1A421DFF0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_muid);
}

id sub_1A421E020(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setMuid_, a1);
}

id (*sub_1A421E03C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = objc_msgSend(*(id *)(v1 + v2), sel_muid);
  return sub_1A41066F8;
}

uint64_t sub_1A421E1DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_lastSuggestedReviewDate);
  if (v3)
  {
    v4 = v3;
    sub_1A423BF84();

    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_1A421E338(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  sub_1A410356C(a1, (uint64_t)v5, &qword_1ED1AB5D0);
  v7 = sub_1A423BF9C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  v10 = v6;
  v11 = 0;
  if (v9 != 1)
  {
    v11 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  objc_msgSend(v10, sel_setLastSuggestedReviewDate_, v11);

  return sub_1A410251C(a1, &qword_1ED1AB5D0);
}

uint64_t sub_1A421E44C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_lastSuggestedReviewDate);
  if (v3)
  {
    v4 = v3;
    sub_1A423BF84();

    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_1A423BF9C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_1A421E4DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A410356C(a1, (uint64_t)v4, &qword_1ED1AB5D0);
  return sub_1A421E338((uint64_t)v4);
}

void (*sub_1A421E560(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  v6 = malloc(v4);
  v7 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  v3[5] = v6;
  v3[6] = v7;
  v8 = objc_msgSend(*(id *)(v1 + v7), sel_lastSuggestedReviewDate);
  if (v8)
  {
    v9 = v8;
    sub_1A423BF84();

    v10 = sub_1A423BF9C();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    v11 = sub_1A423BF9C();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  sub_1A40F1F64((uint64_t)v5, (uint64_t)v6);
  return sub_1A421E67C;
}

void sub_1A421E67C(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;

  v2 = *a1;
  v3 = (*a1)[5];
  v4 = v2[6];
  if ((a2 & 1) != 0)
  {
    v6 = v2[1];
    v5 = v2[2];
    v7 = *v2;
    sub_1A410356C(v3, v5, &qword_1ED1AB5D0);
    v8 = *(void **)(v7 + v4);
    sub_1A410356C(v5, v6, &qword_1ED1AB5D0);
    v9 = sub_1A423BF9C();
    v10 = *(_QWORD *)(v9 - 8);
    LODWORD(v5) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9);
    v11 = v8;
    v12 = 0;
    if ((_DWORD)v5 != 1)
    {
      v13 = v2[1];
      v12 = (void *)sub_1A423BF6C();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    }
    v15 = (void *)v2[4];
    v14 = (void *)v2[5];
    v17 = (void *)v2[2];
    v16 = (void *)v2[3];
    v18 = (void *)v2[1];
    objc_msgSend(v11, sel_setLastSuggestedReviewDate_, v12);

    sub_1A410251C((uint64_t)v17, &qword_1ED1AB5D0);
  }
  else
  {
    v19 = v2[3];
    v20 = *(void **)(*v2 + v4);
    sub_1A410356C(v3, v19, &qword_1ED1AB5D0);
    v21 = sub_1A423BF9C();
    v22 = *(_QWORD *)(v21 - 8);
    LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21);
    v23 = v20;
    v24 = 0;
    if ((_DWORD)v19 != 1)
    {
      v25 = v2[3];
      v24 = (void *)sub_1A423BF6C();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
    }
    v15 = (void *)v2[4];
    v14 = (void *)v2[5];
    v17 = (void *)v2[2];
    v16 = (void *)v2[3];
    v18 = (void *)v2[1];
    objc_msgSend(v23, sel_setLastSuggestedReviewDate_, v24);

  }
  sub_1A410251C((uint64_t)v14, &qword_1ED1AB5D0);
  free(v14);
  free(v15);
  free(v16);
  free(v17);
  free(v18);
  free(v2);
}

id sub_1A421E86C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_hasUserReviewed);
}

id sub_1A421E8AC(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setHasUserReviewed_, a1 & 1);
}

id (*sub_1A421E8CC(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = objc_msgSend(*(id *)(v1 + v2), sel_hasUserReviewed);
  return sub_1A421E914;
}

id sub_1A421E914(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)a1 + *(_QWORD *)(a1 + 8)), sel_setHasUserReviewed_, *(unsigned __int8 *)(a1 + 16));
}

id sub_1A421E960()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_rating));
}

void sub_1A421E9A4(void *a1)
{
  uint64_t v1;
  id v2;

  v2 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  objc_msgSend(v2, sel_setRating_, a1);

}

void (*sub_1A421E9F8(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = objc_msgSend(*(id *)(v1 + v2), sel_rating);
  return sub_1A421EA48;
}

void sub_1A421EA48(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16));
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, sel_setRating_, v2);
    v4 = v2;
  }
  else
  {
    v5 = v3;
    objc_msgSend(v5, sel_setRating_, v2);

    v4 = v5;
  }

}

id sub_1A421EAC8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_uploadedPhotosCount);
}

id sub_1A421EAF8(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setUploadedPhotosCount_, a1);
}

id (*sub_1A421EB14(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = objc_msgSend(*(id *)(v1 + v2), sel_uploadedPhotosCount);
  return sub_1A421EB5C;
}

id sub_1A421EB5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)a1 + *(_QWORD *)(a1 + 8)), sel_setUploadedPhotosCount_, *(unsigned int *)(a1 + 16));
}

id sub_1A421EB90()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_version);
}

id sub_1A421EBD0(__int16 a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setVersion_, a1);
}

id (*sub_1A421EBF0(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = (unsigned __int16)objc_msgSend(*(id *)(v1 + v2), sel_version);
  return sub_1A421EC38;
}

id sub_1A421EC38(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)a1 + *(_QWORD *)(a1 + 8)), sel_setVersion_, *(__int16 *)(a1 + 16));
}

void sub_1A421EC54(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;

  v3 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  v4 = *(id *)(v1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  objc_msgSend(v4, sel_setMuid_, objc_msgSend(a1, sel_muid));

  v5 = *(id *)(v1 + v3);
  v6 = objc_msgSend(a1, sel_resultProviderID);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInt_, v6);
  objc_msgSend(v5, sel_setResultProviderIdentifier_, v7);

  v8 = *(id *)(v1 + v3);
  objc_msgSend(a1, sel_coordinate);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v9);
  objc_msgSend(v8, sel_setLatitude_, v10);

  v11 = *(id *)(v1 + v3);
  objc_msgSend(a1, sel_coordinate);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v12);
  objc_msgSend(v11, sel_setLongitude_, v13);

  v14 = *(id *)(v1 + v3);
  v15 = objc_msgSend(a1, sel_comparableRepresentation);
  v16 = sub_1A423BF54();
  v18 = v17;

  v19 = (id)sub_1A423BF48();
  sub_1A40D778C(v16, v18);
  objc_msgSend(v14, sel_setMapItemIdComparableRepresentation_, v19);

}

id sub_1A421EECC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id result;
  void *v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_anonymousCredential);

  if (!v2)
    return 0;
  result = objc_msgSend(*(id *)(v0 + v1), sel_anonymousCredential);
  if (result)
  {
    v4 = result;
    v5 = (char *)objc_allocWithZone((Class)type metadata accessor for MapsSyncAnonymousCredential());
    *(_OWORD *)&v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__anonymousId] = xmmword_1A4243680;
    *(_OWORD *)&v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsToken] = xmmword_1A4243680;
    v6 = &v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenCreatedAt];
    v7 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__mapsTokenTTL] = 0;
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlaces] = 0;
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync27MapsSyncAnonymousCredential__reviewedPlacesUnstored] = MEMORY[0x1E0DEE9E8];
    return sub_1A41D033C(v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A421F020(char *a1)
{
  sub_1A421F24C(a1, (SEL *)&selRef_setAnonymousCredential_, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedAnonymousCredential);
}

void (*sub_1A421F074(id *a1))(void **a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1A421EECC();
  return sub_1A421F0A8;
}

void sub_1A421F0A8(void **a1, char a2)
{
  sub_1A421F43C(a1, a2, (void (*)(void *))sub_1A421F020);
}

id sub_1A421F0E4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id result;
  void *v4;
  _BYTE *v5;
  _QWORD *v6;

  v1 = OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_communityID);

  if (!v2)
    return 0;
  result = objc_msgSend(*(id *)(v0 + v1), sel_communityID);
  if (result)
  {
    v4 = result;
    v5 = objc_allocWithZone((Class)type metadata accessor for MapsSyncCommunityID());
    v6 = &v5[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier];
    *v6 = 0;
    v6[1] = 0;
    v5[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired] = 0;
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount] = 0;
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces] = 0;
    *(_QWORD *)&v5[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords] = 0;
    return sub_1A41D033C(v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A421F1F8(char *a1)
{
  sub_1A421F24C(a1, (SEL *)&selRef_setCommunityID_, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCommunityID);
}

void sub_1A421F24C(char *a1, SEL *a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  void *v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = *(void **)(v3 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject);
  if (!a1)
  {
    objc_msgSend(v6, *a2, 0);
    return;
  }
  v8 = v6;
  v9 = objc_msgSend(v8, sel_managedObjectContext);
  if (v9)
  {
    v10 = *(_QWORD *)&a1[OBJC_IVAR____TtC8MapsSync21MapsSyncObjectWrapper__managedObjectID];
    if (v10)
    {
      v11 = v9;
      v19[0] = 0;
      v12 = a1;
      v13 = objc_msgSend(v11, sel_existingObjectWithID_error_, v10, v19);
      if (v13)
      {
        v14 = v13;
        v15 = v19[0];

        a3(0);
        v16 = (void *)swift_dynamicCastClass();
        v11 = v14;
        if (v16)
        {
LABEL_10:
          objc_msgSend(v8, *a2, v16);

          return;
        }
      }
      else
      {
        v17 = v19[0];
        v18 = (void *)sub_1A423BEC4();

        swift_willThrow();
      }

      v16 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void (*sub_1A421F3FC(id *a1))(void **a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1A421F0E4();
  return sub_1A421F430;
}

void sub_1A421F430(void **a1, char a2)
{
  sub_1A421F43C(a1, a2, (void (*)(void *))sub_1A421F1F8);
}

void sub_1A421F43C(void **a1, char a2, void (*a3)(void *))
{
  void *v4;
  id v5;

  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = v4;
    a3(v4);

  }
  else
  {
    a3(*a1);
  }
}

void sub_1A421F4A0()
{
  uint64_t v0;

}

id MapsSyncMutableReviewedPlace.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableReviewedPlace);
}

uint64_t type metadata accessor for MapsSyncMutableReviewedPlace()
{
  return objc_opt_self();
}

id sub_1A421F4DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_muid);
  *a2 = result;
  return result;
}

id sub_1A421F518(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setMuid_, *a1);
}

id sub_1A421F544@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_hasUserReviewed);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1A421F580(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setHasUserReviewed_, *a1);
}

id sub_1A421F5A4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_rating);
  *a2 = result;
  return result;
}

id sub_1A421F5E8(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setRating_, *a1);
}

id sub_1A421F60C@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_uploadedPhotosCount);
  *a2 = (_DWORD)result;
  return result;
}

id sub_1A421F648(unsigned int *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setUploadedPhotosCount_, *a1);
}

id sub_1A421F66C@<X0>(_QWORD *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_version);
  *a2 = (_WORD)result;
  return result;
}

id sub_1A421F6A8(__int16 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync28MapsSyncMutableReviewedPlace__proxyObject), sel_setVersion_, *a1);
}

id sub_1A421F6CC@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1A421EECC();
  *a1 = result;
  return result;
}

void sub_1A421F6F4(id *a1)
{
  char *v1;
  id v2;

  v1 = (char *)*a1;
  v2 = *a1;
  sub_1A421F020(v1);
}

id sub_1A421F720@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_1A421F0E4();
  *a1 = result;
  return result;
}

void sub_1A421F748(id *a1)
{
  char *v1;
  id v2;

  v1 = (char *)*a1;
  v2 = *a1;
  sub_1A421F1F8(v1);
}

uint64_t sub_1A421F774()
{
  return type metadata accessor for MapsSyncReviewedPlace();
}

void sub_1A421F77C()
{
  unint64_t v0;

  sub_1A40F2A6C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncReviewedPlace()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.__allocating_init(anonymousCredential:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1056))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1064))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.muid.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x430))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.resultProviderIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x438))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.rating.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x440))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.latitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x448))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.longitude.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x450))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.lastSuggestedReviewDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x458))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.hasUserReviewed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x460))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.uploadedPhotosCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x468))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x470))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.mapItemIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x478))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.anonymousCredential.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x480))();
}

uint64_t dispatch thunk of MapsSyncReviewedPlace.communityId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x488))();
}

uint64_t method lookup function for MapsSyncMutableReviewedPlace()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.muid.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.muid.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.muid.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.lastSuggestedReviewDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.lastSuggestedReviewDate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.lastSuggestedReviewDate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.hasUserReviewed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.hasUserReviewed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.hasUserReviewed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.rating.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.rating.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.rating.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.uploadedPhotosCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.uploadedPhotosCount.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.uploadedPhotosCount.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.version.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.version.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.setMapItemIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.anonymousCredential.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.anonymousCredential.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.anonymousCredential.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.communityID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.communityID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of MapsSyncMutableReviewedPlace.communityID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t sub_1A421FC78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1A421FC9C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableReviewedPlace();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

uint64_t sub_1A421FCE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MapsSyncManagedReviewedPlace();
  result = sub_1A423C5D8();
  *a1 = result;
  return result;
}

void sub_1A421FD28(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  sub_1A4187884(a1);
  type metadata accessor for MapsSyncManagedHistoryItem();
  v3 = swift_dynamicCastClass();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = a1;
    objc_msgSend(v4, sel_position);
    *(_QWORD *)(v1 + OBJC_IVAR___MSHistoryItem__position) = v6;
    v7 = objc_msgSend(v4, sel_positionIndex);

    *(_QWORD *)(v1 + OBJC_IVAR___MSHistoryItem__positionIndex) = v7;
  }
}

double sub_1A421FDB4()
{
  uint64_t v0;
  void *v1;
  double v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(double *)(v0 + OBJC_IVAR___MSHistoryItem__position);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A421FE10(double a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(double *)(v1 + OBJC_IVAR___MSHistoryItem__position) = a1;
  v5 = swift_allocObject();
  *(double *)(v5 + 16) = a1;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4220914;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D7370;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id (*sub_1A421FFA4(_QWORD *a1))(double *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___MSHistoryItem__position);
  objc_msgSend(v3, sel_unlock);
  *a1 = v4;
  return sub_1A422001C;
}

id sub_1A422001C(double *a1)
{
  return sub_1A421FE10(*a1);
}

uint64_t sub_1A4220040()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v1, sel_lock);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSHistoryItem__positionIndex);
  objc_msgSend(v1, sel_unlock);
  return v2;
}

id sub_1A4220094(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = v1;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  *(_QWORD *)(v2 + OBJC_IVAR___MSHistoryItem__positionIndex) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4220B24;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = (_QWORD **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
    swift_beginAccess();
    v8 = *v7;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = sub_1A40CF360(0, v8[2] + 1, 1, v8);
      *v7 = v8;
    }
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1A40CF360((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = v8;
    }
    v8[2] = v11 + 1;
    v12 = &v8[2 * v11];
    v12[4] = sub_1A40D8018;
    v12[5] = v6;
    swift_endAccess();
  }
  swift_release();
  return objc_msgSend(v4, sel_unlock);
}

id (*sub_1A4220220(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v3, sel_lock);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___MSHistoryItem__positionIndex);
  objc_msgSend(v3, sel_unlock);
  *a1 = v4;
  return sub_1A4220290;
}

id sub_1A4220290(uint64_t *a1)
{
  return sub_1A4220094(*a1);
}

id HistoryItem.__allocating_init(position:positionIndex:)(uint64_t a1, double a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v5, sel_initWithStore_position_positionIndex_, qword_1ED1AB9F0, a1, a2);
}

id HistoryItem.init(position:positionIndex:)(uint64_t a1, double a2)
{
  void *v2;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v2, sel_initWithStore_position_positionIndex_, qword_1ED1AB9F0, a1, a2);
}

char *HistoryItem.__allocating_init(store:position:positionIndex:)(void *a1, uint64_t a2, double a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return HistoryItem.init(store:position:positionIndex:)(a1, a2, a3);
}

char *HistoryItem.init(store:position:positionIndex:)(void *a1, uint64_t a2, double a3)
{
  void *v3;
  char *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;

  v7 = (char *)objc_msgSend(v3, sel_initWithStore_, a1);
  v8 = *(void **)&v7[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  v9 = v7;
  objc_msgSend(v8, sel_lock);
  *(double *)&v9[OBJC_IVAR___MSHistoryItem__position] = a3;
  *(_QWORD *)&v9[OBJC_IVAR___MSHistoryItem__positionIndex] = a2;
  v10 = swift_allocObject();
  *(double *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a2;
  sub_1A40D7334();
  if ((sub_1A423C44C() & 1) != 0)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_1A4220B3C;
    *(_QWORD *)(v11 + 24) = v10;
    v12 = &v9[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks];
    swift_beginAccess();
    v13 = *(_QWORD **)v12;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v12 = v13;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v13 = sub_1A40CF360(0, v13[2] + 1, 1, v13);
      *(_QWORD *)v12 = v13;
    }
    v16 = v13[2];
    v15 = v13[3];
    if (v16 >= v15 >> 1)
    {
      v13 = sub_1A40CF360((_QWORD *)(v15 > 1), v16 + 1, 1, v13);
      *(_QWORD *)v12 = v13;
    }
    v13[2] = v16 + 1;
    v17 = &v13[2 * v16];
    v17[4] = sub_1A40D8018;
    v17[5] = v11;
    swift_endAccess();
  }
  swift_release();
  objc_msgSend(v8, sel_unlock);

  return v9;
}

void sub_1A422063C(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  type metadata accessor for MapsSyncManagedHistoryItem();
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a1;
    objc_msgSend(v7, sel_setPosition_, a3);
    objc_msgSend(v7, sel_setPositionIndex_, a2);

  }
}

uint64_t sub_1A4220734()
{
  return type metadata accessor for MapsSyncManagedHistoryItem();
}

id sub_1A42208A8(double a1)
{
  id result;

  type metadata accessor for MapsSyncManagedHistoryItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setPosition_, a1);
  return result;
}

uint64_t sub_1A4220904()
{
  return swift_deallocObject();
}

id sub_1A4220914()
{
  uint64_t v0;

  return sub_1A42208A8(*(double *)(v0 + 16));
}

id sub_1A42209C4(uint64_t a1, uint64_t a2)
{
  id result;

  type metadata accessor for MapsSyncManagedHistoryItem();
  result = (id)swift_dynamicCastClass();
  if (result)
    return objc_msgSend(result, sel_setPositionIndex_, a2);
  return result;
}

id sub_1A4220A14(void *a1, void *a2, char a3)
{
  objc_class *v3;
  char *v7;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR___MSHistoryItem__position] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___MSHistoryItem__positionIndex] = 0;
  return sub_1A4185C24(a1, a2, a3);
}

id HistoryItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HistoryItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A4220B14()
{
  return swift_deallocObject();
}

id sub_1A4220B24(uint64_t a1)
{
  uint64_t v1;

  return sub_1A42209C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A4220B2C()
{
  return swift_deallocObject();
}

void sub_1A4220B3C(void *a1)
{
  uint64_t v1;

  sub_1A422063C(a1, *(_QWORD *)(v1 + 24), *(double *)(v1 + 16));
}

uint64_t sub_1A4220B48()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for HistoryItem()
{
  uint64_t result;

  result = qword_1ED1AB1A8;
  if (!qword_1ED1AB1A8)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1A4220BA8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR___MSHistoryItem__position);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v5;
  return result;
}

id sub_1A4220C14(double *a1)
{
  return sub_1A421FE10(*a1);
}

id sub_1A4220C38@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id result;

  v3 = *a1;
  v4 = *(void **)(*a1 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v4, sel_lock);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR___MSHistoryItem__positionIndex);
  result = objc_msgSend(v4, sel_unlock);
  *a2 = v5;
  return result;
}

id sub_1A4220C9C(uint64_t *a1)
{
  return sub_1A4220094(*a1);
}

uint64_t sub_1A4220CC0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for HistoryItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HistoryItem.position.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of HistoryItem.position.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of HistoryItem.position.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of HistoryItem.positionIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of HistoryItem.positionIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of HistoryItem.positionIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t sub_1A4220DC4(unint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  result = MEMORY[0x1E0DEE9D8];
  if (!a1)
    return result;
  v10 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1A423C728();
    v3 = result;
    if (result)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v3)
    goto LABEL_20;
LABEL_4:
  if (v3 >= 1)
  {
    v4 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1A859B6A0](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      v7 = sub_1A41E3AF0(v5);
      if (v7)
      {
        v8 = v7;
        type metadata accessor for MapsSyncCollectionPlaceItem();
        if (swift_dynamicCastClass())
        {
          v9 = v8;
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();

          goto LABEL_8;
        }
        sub_1A423C5CC();
        sub_1A423C188();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710AC0);
        sub_1A423C158();
        sub_1A423C188();
        swift_bridgeObjectRelease();
        sub_1A423C188();
        _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);

      }
      else
      {
        sub_1A423C5CC();
        sub_1A423C188();
        type metadata accessor for MapsSyncCollectionPlaceItem();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710AC0);
        sub_1A423C158();
        sub_1A423C188();
        swift_bridgeObjectRelease();
        sub_1A423C188();
        _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);

      }
      swift_bridgeObjectRelease();
LABEL_8:
      if (v3 == ++v4)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42210B8(unint64_t a1)
{
  return sub_1A422132C(a1, (void (*)(_QWORD))type metadata accessor for MapsSyncCollectionItem, &qword_1EE710970);
}

uint64_t sub_1A42210CC(unint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  result = MEMORY[0x1E0DEE9D8];
  if (!a1)
    return result;
  v9 = MEMORY[0x1E0DEE9D8];
  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_4;
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v3 = result;
  if (!result)
    goto LABEL_17;
LABEL_4:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1A859B6A0](i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      v7 = sub_1A41E3AF0(v5);
      if (v7)
      {
        v8 = v7;
        MEMORY[0x1A859B250](v8);
        if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A423C1F4();
        sub_1A423C224();
        sub_1A423C1DC();

      }
      else
      {
        sub_1A423C5CC();
        sub_1A423C188();
        type metadata accessor for MapsSyncBaseItem();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE710A80);
        sub_1A423C158();
        sub_1A423C188();
        swift_bridgeObjectRelease();
        sub_1A423C188();
        _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);

        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t sub_1A42212F0(unint64_t a1)
{
  return sub_1A422132C(a1, (void (*)(_QWORD))type metadata accessor for MapsSyncHistoryPlaceItem, (uint64_t *)&unk_1EE710AB0);
}

uint64_t sub_1A4221304(unint64_t a1)
{
  return sub_1A422132C(a1, (void (*)(_QWORD))type metadata accessor for MapsSyncFavoriteItem, &qword_1EE710940);
}

uint64_t sub_1A4221318(unint64_t a1)
{
  return sub_1A422132C(a1, (void (*)(_QWORD))type metadata accessor for MapsSyncCachedCuratedCollection, (uint64_t *)&unk_1EE710A70);
}

uint64_t sub_1A422132C(unint64_t a1, void (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;

  result = MEMORY[0x1E0DEE9D8];
  if (!a1)
    return result;
  v14 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1A423C728();
    v6 = result;
    if (result)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_20;
LABEL_4:
  if (v6 >= 1)
  {
    v7 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x1A859B6A0](v7, a1);
      else
        v8 = *(id *)(a1 + 8 * v7 + 32);
      v9 = v8;
      v10 = sub_1A41E3AF0(v8);
      if (v10)
      {
        v11 = v10;
        a2(0);
        if (swift_dynamicCastClass())
        {
          v12 = v11;
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();

          goto LABEL_8;
        }
        sub_1A423C5CC();
        sub_1A423C188();
        __swift_instantiateConcreteTypeFromMangledName(a3);
        sub_1A423C158();
        sub_1A423C188();
        swift_bridgeObjectRelease();
        sub_1A423C188();
        _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);

      }
      else
      {
        sub_1A423C5CC();
        sub_1A423C188();
        a2(0);
        __swift_instantiateConcreteTypeFromMangledName(a3);
        sub_1A423C158();
        sub_1A423C188();
        swift_bridgeObjectRelease();
        sub_1A423C188();
        _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0, 0xE000000000000000);

      }
      swift_bridgeObjectRelease();
LABEL_8:
      if (v6 == ++v7)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
  }
  __break(1u);
  return result;
}

void sub_1A4221620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  type metadata accessor for MapsSyncHistoryItem();
  v5 = (void *)sub_1A423C1B8();
  if (a2)
    v6 = sub_1A423BEB8();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_1A42216A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  __int128 v27[2];

  v15 = sub_1A417DA64("GenericFetch", 12, 2u, 1);
  v22 = 0xE000000000000000;
  sub_1A423C5CC();
  *(_QWORD *)&v27[0] = 0;
  *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
  type metadata accessor for MapsSyncReviewedPlace();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA830);
  sub_1A423C8C0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  aBlock = a3;
  sub_1A423C65C();
  sub_1A423C188();
  sub_1A40E9A98(a4, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  aBlock = a5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(*(uint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  swift_bridgeObjectRelease();
  sub_1A40E9A98(a4, (uint64_t)v27);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  sub_1A415E9A4(v27, (uint64_t)(v16 + 5));
  v16[10] = a5;
  v16[11] = a6;
  v16[12] = a7;
  v16[13] = a8;
  v16[14] = v15;
  v25 = sub_1A4225984;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A40CBC44;
  v24 = &block_descriptor_82_0;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = a6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
  return swift_release();
}

uint64_t sub_1A4221988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  __int128 v27[2];

  v15 = sub_1A417DA64("GenericFetch", 12, 2u, 1);
  v22 = 0xE000000000000000;
  sub_1A423C5CC();
  *(_QWORD *)&v27[0] = 0;
  *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
  type metadata accessor for MapsSyncVehicle();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E810);
  sub_1A423C8C0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  aBlock = a3;
  sub_1A423C65C();
  sub_1A423C188();
  sub_1A40E9A98(a4, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  aBlock = a5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(*(uint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  swift_bridgeObjectRelease();
  sub_1A40E9A98(a4, (uint64_t)v27);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  sub_1A415E9A4(v27, (uint64_t)(v16 + 5));
  v16[10] = a5;
  v16[11] = a6;
  v16[12] = a7;
  v16[13] = a8;
  v16[14] = v15;
  v25 = sub_1A4225970;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A40CBC44;
  v24 = &block_descriptor_70;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = a6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
  return swift_release();
}

uint64_t sub_1A4221C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  __int128 v27[2];

  v15 = sub_1A417DA64("GenericFetch", 12, 2u, 1);
  v22 = 0xE000000000000000;
  sub_1A423C5CC();
  *(_QWORD *)&v27[0] = 0;
  *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
  type metadata accessor for MapsSyncCachedCuratedCollection();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE710A70);
  sub_1A423C8C0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  aBlock = a3;
  sub_1A423C65C();
  sub_1A423C188();
  sub_1A40E9A98(a4, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  aBlock = a5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(*(uint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  swift_bridgeObjectRelease();
  sub_1A40E9A98(a4, (uint64_t)v27);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  sub_1A415E9A4(v27, (uint64_t)(v16 + 5));
  v16[10] = a5;
  v16[11] = a6;
  v16[12] = a7;
  v16[13] = a8;
  v16[14] = v15;
  v25 = sub_1A422595C;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A40CBC44;
  v24 = &block_descriptor_58;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = a6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
  return swift_release();
}

uint64_t sub_1A4221F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  __int128 v27[2];

  v15 = sub_1A417DA64("GenericFetch", 12, 2u, 1);
  v22 = 0xE000000000000000;
  sub_1A423C5CC();
  *(_QWORD *)&v27[0] = 0;
  *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
  type metadata accessor for MapsSyncFavoriteItem();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710940);
  sub_1A423C8C0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  aBlock = a3;
  sub_1A423C65C();
  sub_1A423C188();
  sub_1A40E9A98(a4, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  aBlock = a5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(*(uint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  swift_bridgeObjectRelease();
  sub_1A40E9A98(a4, (uint64_t)v27);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  sub_1A415E9A4(v27, (uint64_t)(v16 + 5));
  v16[10] = a5;
  v16[11] = a6;
  v16[12] = a7;
  v16[13] = a8;
  v16[14] = v15;
  v25 = sub_1A4225948;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A40CBC44;
  v24 = &block_descriptor_46_2;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = a6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
  return swift_release();
}

uint64_t sub_1A4222240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  __int128 v27[2];

  v15 = sub_1A417DA64("GenericFetch", 12, 2u, 1);
  v22 = 0xE000000000000000;
  sub_1A423C5CC();
  *(_QWORD *)&v27[0] = 0;
  *((_QWORD *)&v27[0] + 1) = 0xE000000000000000;
  type metadata accessor for MapsSyncHistoryItem();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE70D9A0);
  sub_1A423C8C0();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  sub_1A423C188();
  sub_1A423C188();
  aBlock = a3;
  sub_1A423C65C();
  sub_1A423C188();
  sub_1A40E9A98(a4, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  aBlock = a5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(*(uint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  swift_bridgeObjectRelease();
  sub_1A40E9A98(a4, (uint64_t)v27);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  sub_1A415E9A4(v27, (uint64_t)(v16 + 5));
  v16[10] = a5;
  v16[11] = a6;
  v16[12] = a7;
  v16[13] = a8;
  v16[14] = v15;
  v25 = sub_1A42258E4;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A40CBC44;
  v24 = &block_descriptor_45;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = a6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v17);
  _Block_release(v17);
  return swift_release();
}

void sub_1A4222528(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1A422257C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionPlaceItem, &qword_1EE710AC8, (void (*)(uint64_t))sub_1A40E8C3C);
}

void sub_1A4222544(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1A422257C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedHistoryPlaceItem, &qword_1ED1AA1D8, (void (*)(uint64_t))sub_1A40E9028);
}

void sub_1A4222560(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1A422257C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedFavoriteItem, &qword_1EE710A68, (void (*)(uint64_t))sub_1A40E9174);
}

void sub_1A422257C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;

  sub_1A423C5CC();
  a4(0);
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = sub_1A423C8C0();
  v12 = v11;
  swift_bridgeObjectRelease();
  v32 = v10;
  sub_1A423C188();
  v13 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9E0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA9B0);
  sub_1A423C158();
  sub_1A423C188();
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v32, v12);
  swift_bridgeObjectRelease();
  v14 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
  v15 = objc_msgSend(v14, sel_name);

  if (v15)
  {
    sub_1A423C14C();

    v16 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v17 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v16, sel_initWithEntityName_, v17);

    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_1A4243A90;
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v20 = v13;
      *(_QWORD *)(v19 + 32) = sub_1A423C314();
      *(_QWORD *)(v19 + 40) = v20;
      sub_1A423C1DC();
      v21 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
      v22 = v20;
      v23 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      v24 = objc_msgSend(v21, sel_initWithType_subpredicates_, 1, v23);

    }
    else
    {
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v24 = (id)sub_1A423C314();
    }
    objc_msgSend(v18, sel_setPredicate_, v24);

    if (a2)
    {
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      v25 = (void *)sub_1A423C1B8();
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v18, sel_setSortDescriptors_, v25);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
    v26 = sub_1A423C3F8();
    v27 = sub_1A40E8A00(v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A423C5CC();
    v28 = sub_1A423C8C0();
    v30 = v29;
    swift_bridgeObjectRelease();
    sub_1A423C188();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AA9D0);
    sub_1A423C158();
    sub_1A423C188();
    swift_bridgeObjectRelease();
    sub_1A423C188();
    _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v28, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v27 + 16))
    {
      a6(v27);
      swift_bridgeObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1A4222A54(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1A422257C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCachedCuratedCollection, &qword_1ED1AA998, (void (*)(uint64_t))sub_1A40E93E0);
}

uint64_t sub_1A4222A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock;
  unint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v30 = a7;
  v31 = a8;
  v15 = sub_1A423C0BC();
  v34 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1A423C0D4();
  v32 = *(_QWORD *)(v18 - 8);
  v33 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)sub_1A411152C(a1, a2, a3, a4);
  sub_1A422257C(v21, a5, a6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedReviewedPlace, (uint64_t *)&unk_1EE710AA0, (void (*)(uint64_t))sub_1A40E8EE8);
  v23 = sub_1A422132C(v22, (void (*)(_QWORD))type metadata accessor for MapsSyncReviewedPlace, &qword_1ED1AA830);
  swift_bridgeObjectRelease();
  aBlock = 0;
  v37 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000019;
  v37 = 0x80000001A4250400;
  v24 = type metadata accessor for MapsSyncReviewedPlace();
  v25 = swift_bridgeObjectRetain();
  MEMORY[0x1A859B274](v25, v24);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v37);
  swift_bridgeObjectRelease();
  if (qword_1EE70D9C0 != -1)
    swift_once();
  v26 = (_QWORD *)swift_allocObject();
  v27 = v31;
  v26[2] = v30;
  v26[3] = v27;
  v26[4] = v23;
  v26[5] = a9;
  v40 = sub_1A42258F4;
  v41 = v26;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1A40CBC44;
  v39 = &block_descriptor_88_0;
  v28 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1A423C0C8();
  v35 = MEMORY[0x1E0DEE9D8];
  sub_1A40E75D4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
  sub_1A40E761C();
  sub_1A423C4A0();
  MEMORY[0x1A859B430](0, v20, v17, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v20, v33);
  return swift_release();
}

uint64_t sub_1A4222D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock;
  unint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v30 = a7;
  v31 = a8;
  v15 = sub_1A423C0BC();
  v34 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1A423C0D4();
  v32 = *(_QWORD *)(v18 - 8);
  v33 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)sub_1A411152C(a1, a2, a3, a4);
  sub_1A422257C(v21, a5, a6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedVehicle, (uint64_t *)&unk_1EE710A90, (void (*)(uint64_t))sub_1A40E8EF4);
  v23 = sub_1A422132C(v22, (void (*)(_QWORD))type metadata accessor for MapsSyncVehicle, &qword_1EE70E810);
  swift_bridgeObjectRelease();
  aBlock = 0;
  v37 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000019;
  v37 = 0x80000001A4250400;
  v24 = type metadata accessor for MapsSyncVehicle();
  v25 = swift_bridgeObjectRetain();
  MEMORY[0x1A859B274](v25, v24);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v37);
  swift_bridgeObjectRelease();
  if (qword_1EE70D9C0 != -1)
    swift_once();
  v26 = (_QWORD *)swift_allocObject();
  v27 = v31;
  v26[2] = v30;
  v26[3] = v27;
  v26[4] = v23;
  v26[5] = a9;
  v40 = sub_1A42258F4;
  v41 = v26;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1A40CBC44;
  v39 = &block_descriptor_76_0;
  v28 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1A423C0C8();
  v35 = MEMORY[0x1E0DEE9D8];
  sub_1A40E75D4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
  sub_1A40E761C();
  sub_1A423C4A0();
  MEMORY[0x1A859B430](0, v20, v17, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v20, v33);
  return swift_release();
}

uint64_t sub_1A4223080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock;
  unint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t (*v39)();
  _QWORD *v40;

  v29 = a7;
  v30 = a8;
  v15 = sub_1A423C0BC();
  v33 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1A423C0D4();
  v31 = *(_QWORD *)(v18 - 8);
  v32 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)sub_1A411152C(a1, a2, a3, a4);
  sub_1A422257C(v21, a5, a6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCachedCuratedCollection, &qword_1ED1AA998, (void (*)(uint64_t))sub_1A40E93E0);
  v23 = sub_1A422132C(v22, (void (*)(_QWORD))type metadata accessor for MapsSyncCachedCuratedCollection, (uint64_t *)&unk_1EE710A70);
  swift_bridgeObjectRelease();
  aBlock = 0;
  v36 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000019;
  v36 = 0x80000001A4250400;
  v24 = type metadata accessor for MapsSyncCachedCuratedCollection();
  MEMORY[0x1A859B274](v23, v24);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v36);
  swift_bridgeObjectRelease();
  if (qword_1EE70D9C0 != -1)
    swift_once();
  v25 = (_QWORD *)swift_allocObject();
  v26 = v30;
  v25[2] = v29;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a9;
  v39 = sub_1A42258F4;
  v40 = v25;
  aBlock = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  v37 = sub_1A40CBC44;
  v38 = &block_descriptor_64_1;
  v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1A423C0C8();
  v34 = MEMORY[0x1E0DEE9D8];
  sub_1A40E75D4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
  sub_1A40E761C();
  sub_1A423C4A0();
  MEMORY[0x1A859B430](0, v20, v17, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v32);
  return swift_release();
}

uint64_t sub_1A4223374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock;
  unint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t (*v39)();
  _QWORD *v40;

  v29 = a7;
  v30 = a8;
  v15 = sub_1A423C0BC();
  v33 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1A423C0D4();
  v31 = *(_QWORD *)(v18 - 8);
  v32 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)sub_1A411152C(a1, a2, a3, a4);
  sub_1A422257C(v21, a5, a6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedFavoriteItem, &qword_1EE710A68, (void (*)(uint64_t))sub_1A40E9174);
  v23 = sub_1A422132C(v22, (void (*)(_QWORD))type metadata accessor for MapsSyncFavoriteItem, &qword_1EE710940);
  swift_bridgeObjectRelease();
  aBlock = 0;
  v36 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000019;
  v36 = 0x80000001A4250400;
  v24 = type metadata accessor for MapsSyncFavoriteItem();
  MEMORY[0x1A859B274](v23, v24);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v36);
  swift_bridgeObjectRelease();
  if (qword_1EE70D9C0 != -1)
    swift_once();
  v25 = (_QWORD *)swift_allocObject();
  v26 = v30;
  v25[2] = v29;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a9;
  v39 = sub_1A42258F4;
  v40 = v25;
  aBlock = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  v37 = sub_1A40CBC44;
  v38 = &block_descriptor_52;
  v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1A423C0C8();
  v34 = MEMORY[0x1E0DEE9D8];
  sub_1A40E75D4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
  sub_1A40E761C();
  sub_1A423C4A0();
  MEMORY[0x1A859B430](0, v20, v17, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v32);
  return swift_release();
}

uint64_t sub_1A4223668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock;
  unint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t (*v39)();
  _QWORD *v40;

  v29 = a7;
  v30 = a8;
  v15 = sub_1A423C0BC();
  v33 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1A423C0D4();
  v31 = *(_QWORD *)(v18 - 8);
  v32 = v18;
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)sub_1A411152C(a1, a2, a3, a4);
  sub_1A422257C(v21, a5, a6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedHistoryItem, (uint64_t *)&unk_1EE70D9B0, (void (*)(uint64_t))sub_1A40E93EC);
  v23 = sub_1A422132C(v22, (void (*)(_QWORD))type metadata accessor for MapsSyncHistoryItem, (uint64_t *)&unk_1EE70D9A0);
  swift_bridgeObjectRelease();
  aBlock = 0;
  v36 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000019;
  v36 = 0x80000001A4250400;
  v24 = type metadata accessor for MapsSyncHistoryItem();
  MEMORY[0x1A859B274](v23, v24);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  sub_1A423C188();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(aBlock, v36);
  swift_bridgeObjectRelease();
  if (qword_1EE70D9C0 != -1)
    swift_once();
  v25 = (_QWORD *)swift_allocObject();
  v26 = v30;
  v25[2] = v29;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a9;
  v39 = sub_1A42258F4;
  v40 = v25;
  aBlock = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  v37 = sub_1A40CBC44;
  v38 = &block_descriptor_40_2;
  v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  sub_1A423C0C8();
  v34 = MEMORY[0x1E0DEE9D8];
  sub_1A40E75D4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
  sub_1A40E761C();
  sub_1A423C4A0();
  MEMORY[0x1A859B430](0, v20, v17, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v15);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v32);
  return swift_release();
}

double sub_1A422395C()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position);
}

id sub_1A422396C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory), sel_position);
}

id sub_1A4223984()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory), sel_setPosition_);
}

id (*sub_1A422399C(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory;
  a1[1] = v1;
  a1[2] = v3;
  objc_msgSend(*(id *)(v1 + v3), sel_position);
  *a1 = v4;
  return sub_1A42239E4;
}

id sub_1A42239E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16)), sel_setPosition_, *(double *)a1);
}

id sub_1A4223A00(void *a1)
{
  uint64_t v1;
  id result;
  uint64_t v3;

  sub_1A41CF8C8(a1);
  type metadata accessor for MapsSyncManagedHistoryItem();
  result = (id)swift_dynamicCastClass();
  if (result)
  {
    result = objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_position);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = v3;
  }
  return result;
}

uint64_t sub_1A4223A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A42246B8, v4);
  return swift_release();
}

id MapsSyncMutableHistoryItem.init(proxyObject:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  type metadata accessor for MapsSyncManagedHistoryItem();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v3 = a1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t static MapsSyncHistoryItem.fetch(_:_:_:sort:ascending:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t (*a6)(_QWORD, uint64_t), uint64_t a7)
{
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  char v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v32;
  _BYTE v33[32];
  _BYTE v34[32];

  if (byte_1EE70EEE8 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v14 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v14 = qword_1ED1AC168;
  }
  v15 = (char *)*v14;
  sub_1A40E5BF8(a3, (uint64_t)v34);
  sub_1A40E5BF8((uint64_t)v34, (uint64_t)v33);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a6;
  *(_QWORD *)(v16 + 24) = a7;
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  sub_1A40CD1EC((uint64_t)v34, v16 + 48);
  *(_QWORD *)(v16 + 80) = a4;
  v17 = a5 & 1;
  *(_BYTE *)(v16 + 88) = a5 & 1;
  v32 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v18 = *(void **)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
  swift_retain_n();
  v19 = v15;
  objc_msgSend(v18, sel_lock);
  v20 = *(void **)&v19[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext];
  if (v20)
  {
    v21 = v20;
    v22 = a4;
    v23 = v21;
    sub_1A4223E08(v20, 0, a6, a7, a1, a2, (uint64_t)v33, v22, v17);

  }
  else
  {
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_1A42246C0;
    *(_QWORD *)(v24 + 24) = v16;
    v25 = &v19[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches];
    swift_beginAccess();
    v26 = *(_QWORD **)v25;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v25 = v26;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v26 = sub_1A40CF82C(0, v26[2] + 1, 1, v26);
      *(_QWORD *)v25 = v26;
    }
    v29 = v26[2];
    v28 = v26[3];
    if (v29 >= v28 >> 1)
    {
      v26 = sub_1A40CF82C((_QWORD *)(v28 > 1), v29 + 1, 1, v26);
      *(_QWORD *)v25 = v26;
    }
    v26[2] = v29 + 1;
    v30 = &v26[2 * v29];
    v30[4] = sub_1A40E75B4;
    v30[5] = v24;
    swift_endAccess();
  }
  objc_msgSend(*(id *)&v15[v32], sel_unlock);
  swift_release();
  swift_release();

  return sub_1A40CD40C((uint64_t)v33);
}

uint64_t sub_1A4223E08(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  uint64_t v25;
  __int128 v26;

  if (a2)
  {
    type metadata accessor for MapsSyncError();
    v11 = swift_dynamicCastClassUnconditional();
    return a3(MEMORY[0x1E0DEE9D8], v11);
  }
  else
  {
    v16 = 0xEA00000000007265;
    v17 = 0x696669746E656469;
    switch(a5)
    {
      case 0:
        goto LABEL_7;
      case 1:
        v17 = 0x6954657461657263;
        v16 = 0xEA0000000000656DLL;
        goto LABEL_7;
      case 2:
        v16 = 0x80000001A4248BA0;
        v17 = 0xD000000000000010;
        goto LABEL_7;
      case 3:
        v17 = 0x6E6F697469736F70;
        v16 = 0xED00007865646E49;
LABEL_7:
        sub_1A40E5BF8(a7, (uint64_t)&v24);
        if (!v25)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          v23[0] = a5;
LABEL_14:
          sub_1A423C7E8();
          __break(1u);
          JUMPOUT(0x1A4224118);
        }
        sub_1A40D1A9C(&v24, &v26);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
        swift_dynamicCast();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
        v18 = swift_allocObject();
        *(_OWORD *)(v18 + 16) = xmmword_1A4243670;
        v19 = v18;
        switch(a8)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            v20 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
            v21 = (void *)sub_1A423C140();
            swift_bridgeObjectRelease();
            v22 = objc_msgSend(v20, sel_initWithKey_ascending_, v21, a9 & 1);

            *(_QWORD *)(v19 + 32) = v22;
            sub_1A423C1DC();
            if (!a1)
              goto LABEL_12;
            sub_1A4222240(v17, v16, a6, (uint64_t)v23, v19, a1, (uint64_t)a3, a4);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
            break;
          default:
            goto LABEL_14;
        }
        break;
      default:
        goto LABEL_13;
    }
  }
  return result;
}

void sub_1A42241DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  type metadata accessor for MapsSyncHistoryItem();
  v5 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id, uint64_t))(a3 + 16))(a3, v5, a2);

}

uint64_t static MapsSyncHistoryItem.fetch(_:_:_:sort:ascending:completionWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(_QWORD, uint64_t), uint64_t a7)
{
  swift_retain();
  sub_1A42253DC(a1, a2, a3, 1, 0, a6, a7);
  return swift_release();
}

uint64_t sub_1A4224360(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  unsigned int v10;
  uint64_t result;
  double v12;
  double v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  uint64_t v20;

  sub_1A40E5BF8(a1, (uint64_t)&v19);
  v3 = v20;
  if (v20)
  {
    v4 = __swift_project_boxed_opaque_existential_0(&v19, v20);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x1E0C80A78](v4);
    v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = sub_1A423C7AC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v19);
  }
  else
  {
    v8 = 0;
  }
  v9 = (objc_class *)type metadata accessor for MapsSyncHistoryItem();
  v18.receiver = v1;
  v18.super_class = v9;
  v10 = objc_msgSendSuper2(&v18, sel_isEqual_, v8);
  swift_unknownObjectRelease();
  if (!v10)
    return 0;
  sub_1A40E5BF8(a1, (uint64_t)&v19);
  if (!v20)
  {
    sub_1A40CD40C((uint64_t)&v19);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 0;

  result = sub_1A40E5BF8(a1, (uint64_t)&v16);
  if (v17)
  {
    sub_1A40D1A9C(&v16, &v19);
    swift_dynamicCast();
    v12 = *(double *)&v1[OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position];
    v13 = *(double *)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position];

    return v12 == v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A4224648(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  type metadata accessor for MapsSyncMutableHistoryItem();
  v3 = swift_dynamicCastClassUnconditional();
  return a2(v3);
}

uint64_t sub_1A4224694()
{
  swift_release();
  return swift_deallocObject();
}

void *sub_1A4224764(void *a1)
{
  objc_class *v1;
  char *v3;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position] = 0;
  return sub_1A41D033C(a1);
}

id MapsSyncHistoryItem.__deallocating_deinit()
{
  return sub_1A40E5B7C(0, type metadata accessor for MapsSyncHistoryItem);
}

id MapsSyncMutableHistoryItem.__allocating_init(proxyObject:)(void *a1)
{
  objc_class *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory] = swift_dynamicCastClassUnconditional();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject] = a1;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a1;
  return objc_msgSendSuper2(&v6, sel_init);
}

void sub_1A422492C()
{
  uint64_t v0;

}

id MapsSyncMutableHistoryItem.__deallocating_deinit(uint64_t a1)
{
  return sub_1A40E5B7C(a1, type metadata accessor for MapsSyncMutableHistoryItem);
}

void sub_1A4224958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v10;
  id v11;
  uint64_t v12;

  *(_QWORD *)(swift_allocObject() + 16) = a8;
  if (!a2)
  {
    swift_release();
    v12 = 0x696669746E656469;
    sub_1A423C7E8();
    __break(1u);
    JUMPOUT(0x1A4224D14);
  }
  type metadata accessor for MapsSyncError();
  v10 = swift_dynamicCastClassUnconditional();
  _Block_copy(a8);
  type metadata accessor for MapsSyncHistoryItem();
  v11 = (id)sub_1A423C1B8();
  ((void (**)(_QWORD, id, uint64_t))a8)[2](a8, v11, v10);
  swift_release();

}

uint64_t sub_1A4224D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6)
{
  uint64_t v12;
  int v13;
  uint64_t *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char *v35;
  _BYTE v36[32];
  _BYTE v37[32];

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a6;
  v13 = byte_1EE70EEE8;
  _Block_copy(a6);
  if (v13 == 1)
  {
    if (qword_1EE70E268 != -1)
      swift_once();
    v14 = &qword_1EE70EED8;
  }
  else
  {
    if (qword_1ED1AC908 != -1)
      swift_once();
    v14 = qword_1ED1AC168;
  }
  v15 = (char *)*v14;
  sub_1A40E5BF8(a3, (uint64_t)v37);
  sub_1A40E5BF8((uint64_t)v37, (uint64_t)v36);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1A42258D4;
  *(_QWORD *)(v16 + 24) = v12;
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  sub_1A40CD1EC((uint64_t)v37, v16 + 48);
  *(_QWORD *)(v16 + 80) = a4;
  v17 = a2;
  v18 = a5 & 1;
  *(_BYTE *)(v16 + 88) = a5 & 1;
  v19 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v20 = *(void **)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
  swift_retain_n();
  v35 = v15;
  v21 = v15;
  objc_msgSend(v20, sel_lock);
  v22 = *(void **)&v21[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext];
  if (v22)
  {
    _Block_copy(a6);
    v23 = v22;
    v24 = a4;
    v25 = v19;
    v26 = v23;
    sub_1A4224958((uint64_t)v22, 0, a1, v17, (uint64_t)v36, v24, v18, (void (**)(_QWORD, _QWORD, _QWORD))a6);
    _Block_release(a6);

    v19 = v25;
  }
  else
  {
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = sub_1A42246C0;
    *(_QWORD *)(v27 + 24) = v16;
    v28 = &v21[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches];
    swift_beginAccess();
    v29 = *(_QWORD **)v28;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v28 = v29;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = sub_1A40CF82C(0, v29[2] + 1, 1, v29);
      *(_QWORD *)v28 = v29;
    }
    v32 = v29[2];
    v31 = v29[3];
    if (v32 >= v31 >> 1)
    {
      v29 = sub_1A40CF82C((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
      *(_QWORD *)v28 = v29;
    }
    v29[2] = v32 + 1;
    v33 = &v29[2 * v32];
    v33[4] = sub_1A40E7840;
    v33[5] = v27;
    swift_endAccess();
  }
  objc_msgSend(*(id *)&v35[v19], sel_unlock, v35);
  swift_release();
  swift_release();

  sub_1A40CD40C((uint64_t)v36);
  return swift_release();
}

uint64_t sub_1A4225020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(_QWORD, uint64_t), uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a8;
  *(_QWORD *)(v11 + 24) = a9;
  if (!a2)
  {
    swift_release();
    v14 = 0x696669746E656469;
    sub_1A423C7E8();
    __break(1u);
    JUMPOUT(0x1A42253BCLL);
  }
  type metadata accessor for MapsSyncError();
  v12 = swift_dynamicCastClassUnconditional();
  swift_retain();
  a8(MEMORY[0x1E0DEE9D8], v12);
  return swift_release();
}

uint64_t sub_1A42253DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void (*a6)(_QWORD, uint64_t), uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  void (*v34)(_QWORD, uint64_t);
  char *v35;
  uint64_t v36;
  _BYTE v37[32];
  _BYTE v38[32];

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a6;
  *(_QWORD *)(v14 + 24) = a7;
  v34 = a6;
  if (byte_1EE70EEE8 == 1)
  {
    v15 = qword_1EE70E268;
    swift_retain();
    if (v15 != -1)
      swift_once();
    v16 = &qword_1EE70EED8;
  }
  else
  {
    v17 = qword_1ED1AC908;
    swift_retain();
    if (v17 != -1)
      swift_once();
    v16 = qword_1ED1AC168;
  }
  v18 = (char *)*v16;
  sub_1A40E5BF8(a3, (uint64_t)v38);
  sub_1A40E5BF8((uint64_t)v38, (uint64_t)v37);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_1A40D713C;
  *(_QWORD *)(v19 + 24) = v14;
  *(_QWORD *)(v19 + 32) = a1;
  *(_QWORD *)(v19 + 40) = a2;
  sub_1A40CD1EC((uint64_t)v38, v19 + 48);
  *(_QWORD *)(v19 + 80) = a4;
  v20 = a4;
  v21 = a5 & 1;
  *(_BYTE *)(v19 + 88) = a5 & 1;
  v36 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v22 = *(void **)&v18[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
  swift_retain_n();
  v35 = v18;
  v23 = v18;
  objc_msgSend(v22, sel_lock);
  v24 = *(void **)&v23[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext];
  if (v24)
  {
    v25 = v24;
    swift_retain();
    sub_1A4225020((uint64_t)v24, 0, a1, a2, (uint64_t)v37, v20, v21, v34, a7);

    swift_release();
  }
  else
  {
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = sub_1A42246C0;
    *(_QWORD *)(v26 + 24) = v19;
    v27 = &v23[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches];
    swift_beginAccess();
    v28 = *(_QWORD **)v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *(_QWORD *)v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    if (v31 >= v30 >> 1)
    {
      v28 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      *(_QWORD *)v27 = v28;
    }
    v28[2] = v31 + 1;
    v32 = &v28[2 * v31];
    v32[4] = sub_1A40E7840;
    v32[5] = v26;
    swift_endAccess();
  }
  objc_msgSend(*(id *)&v35[v36], sel_unlock);
  swift_release();
  swift_release();

  sub_1A40CD40C((uint64_t)v37);
  return swift_release();
}

uint64_t type metadata accessor for MapsSyncHistoryItem()
{
  uint64_t result;

  result = qword_1ED1ABFD0;
  if (!qword_1ED1ABFD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for MapsSyncMutableHistoryItem()
{
  return objc_opt_self();
}

id sub_1A4225734@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory), sel_position);
  *a2 = v4;
  return result;
}

id sub_1A4225770(double *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory), sel_setPosition_, *a1);
}

uint64_t sub_1A4225794()
{
  return type metadata accessor for MapsSyncHistoryItem();
}

uint64_t sub_1A422579C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MapsSyncHistoryItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncHistoryItem.position.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t method lookup function for MapsSyncMutableHistoryItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryItem.position.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryItem.position.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MapsSyncMutableHistoryItem.position.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t sub_1A4225868()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  type metadata accessor for MapsSyncMutableHistoryItem();
  v2 = swift_dynamicCastClassUnconditional();
  return v1(v2);
}

uint64_t sub_1A42258B0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A42258D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A42241DC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1A42258E4()
{
  return sub_1A4225990((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A4223668);
}

uint64_t objectdestroy_33Tm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 40);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A4225948()
{
  return sub_1A4225990((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A4223374);
}

uint64_t sub_1A422595C()
{
  return sub_1A4225990((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A4223080);
}

uint64_t sub_1A4225970()
{
  return sub_1A4225990((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A4222D78);
}

uint64_t sub_1A4225984()
{
  return sub_1A4225990((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A4222A70);
}

uint64_t sub_1A4225990(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1 + 5, v1[10], v1[11], v1[12], v1[13], v1[14]);
}

uint64_t objectdestroy_36Tm_1()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A4225A04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  (*(void (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), 0);
  return sub_1A417DF3C("GenericFetch", 12, 2u, v1, 1);
}

uint64_t sub_1A4225A4C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4223E08(a1, a2, *(uint64_t (**)(_QWORD, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), v2 + 48, *(_QWORD *)(v2 + 80), *(_BYTE *)(v2 + 88));
}

id sub_1A4225B18(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  objc_class *Predicate;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t inited;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  objc_class *v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  unint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v42;
  id v43;
  void *v44;
  id v45;
  objc_super v46;
  objc_super v47;
  objc_super v48;
  objc_super v49;
  objc_super v50;
  uint64_t v51;

  type metadata accessor for HistoryItem();
  if (__swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB218) == v1
    || (type metadata accessor for HistoryPlaceItem(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB370) == v1))
  {
    v44 = a1;
    sub_1A40E8D14(MEMORY[0x1E0DEE9D8]);
    Predicate = (objc_class *)type metadata accessor for MapsSyncQueryPredicate();
    v7 = objc_allocWithZone(Predicate);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1A4243670;
    v9 = (void *)sub_1A423C140();
    v10 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v43 = (id)objc_opt_self();
    v11 = objc_msgSend(v43, sel_predicateWithFormat_argumentArray_, v9, v10);

    *(_QWORD *)(v8 + 32) = v11;
    v51 = v8;
    sub_1A423C1DC();
    sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
    v12 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v50.receiver = v7;
    v50.super_class = Predicate;
    v45 = objc_msgSendSuper2(&v50, sel_initWithType_subpredicates_, 1, v12);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A4243A70;
    *(_QWORD *)(inited + 56) = MEMORY[0x1E0DEA968];
    v14 = sub_1A40E766C();
    *(_QWORD *)(inited + 32) = 0xD000000000000010;
    *(_QWORD *)(inited + 64) = v14;
    *(_QWORD *)(inited + 40) = 0x80000001A4249750;
    sub_1A40E8D14(inited);
    v15 = objc_allocWithZone(Predicate);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1A4243670;
    v17 = (void *)sub_1A423C140();
    v18 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v43, sel_predicateWithFormat_argumentArray_, v17, v18);

    *(_QWORD *)(v16 + 32) = v19;
    v51 = v16;
    sub_1A423C1DC();
    v20 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v49.receiver = v15;
    v49.super_class = Predicate;
    v21 = Predicate;
    v22 = objc_msgSendSuper2(&v49, sel_initWithType_subpredicates_, 1, v20);

    v23 = v21;
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
    swift_arrayDestroy();
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1A4243A90;
    *(_QWORD *)(v24 + 32) = v22;
    *(_QWORD *)(v24 + 40) = v45;
    v51 = v24;
    sub_1A423C1DC();
    v25 = v51;
    v26 = objc_allocWithZone(v23);
    v27 = v22;
    v28 = v45;
    swift_bridgeObjectRetain();
    if (v25 >> 62)
    {
      sub_1A423C71C();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1A423C7C4();
    }
    swift_bridgeObjectRelease();
    v29 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v48.receiver = v26;
    v48.super_class = v23;
    v30 = objc_msgSendSuper2(&v48, (SEL)&MapsSyncVehicleQuery.ivars + 1, 1, v29);

    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1A4243A90;
    v32 = objc_allocWithZone(v23);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1A4243670;
    *(_QWORD *)(v33 + 32) = v22;
    v51 = v33;
    sub_1A423C1DC();
    v34 = v22;
    v35 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v47.receiver = v32;
    v47.super_class = v23;
    v36 = objc_msgSendSuper2(&v47, (SEL)&MapsSyncVehicleQuery.ivars + 1, 0, v35);

    *(_QWORD *)(v31 + 32) = v36;
    *(_QWORD *)(v31 + 40) = v30;
    v51 = v31;
    sub_1A423C1DC();
    v37 = v51;
    v38 = objc_allocWithZone(v23);
    v39 = v30;
    swift_bridgeObjectRetain();
    if (v37 >> 62)
    {
      sub_1A423C71C();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1A423C7C4();
    }
    swift_bridgeObjectRelease();
    v40 = (void *)sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v46.receiver = v38;
    v46.super_class = v23;
    v4 = objc_msgSendSuper2(&v46, (SEL)&MapsSyncVehicleQuery.ivars + 1, 2, v40);

    v5 = sub_1A41D82EC(v44, v4, 0);
    goto LABEL_10;
  }
  if (a1)
  {
    v3 = objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryOptions());
    v4 = a1;
    v5 = sub_1A41D8134((uint64_t)v4);
LABEL_10:

    return v5;
  }
  v42 = objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryOptions());
  return sub_1A41D7E8C(0, 0, 0);
}

uint64_t sub_1A4226160(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v6;
  id v7;
  id v8;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7 = a1;
  v8 = a2;
  sub_1A42080B8((uint64_t)sub_1A4226684, (uint64_t)v6);
  return swift_release();
}

void sub_1A42261E0(void *a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  id v6;
  char *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v19[0] = 0;
  v5 = (char *)objc_msgSend(a1, sel_countForFetchRequest_error_, a2, v19);
  if (v19[0])
  {
    v6 = v19[0];
    swift_willThrow();

  }
  else
  {
    v7 = v5;
    if ((uint64_t)v5 > a3)
    {
      type metadata accessor for MapsSyncManagedHistoryItem();
      v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchRequest);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1A4243670;
      v10 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
      v11 = (void *)sub_1A423C140();
      v12 = objc_msgSend(v10, sel_initWithKey_ascending_, v11, 1);

      *(_QWORD *)(v9 + 32) = v12;
      v19[0] = (id)v9;
      sub_1A423C1DC();
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      v13 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setSortDescriptors_, v13);

      if (__OFSUB__(v7, a3))
        __break(1u);
      objc_msgSend(v8, sel_setFetchLimit_, &v7[-a3]);
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97A90]), sel_initWithFetchRequest_, v8);
      v19[0] = 0;
      v15 = objc_msgSend(a1, sel_executeRequest_error_, v14, v19);
      if (v15)
      {
        v16 = v15;
        v17 = v19[0];

      }
      else
      {
        v18 = v19[0];
        sub_1A423BEC4();

        swift_willThrow();
      }
    }
  }
}

void sub_1A4226474()
{
  uint64_t isEscapingClosureAtFileLocation;
  char v1;
  char v2;
  uint64_t MaxHistoryItems;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  sub_1A4154774();
  isEscapingClosureAtFileLocation = (uint64_t)sub_1A412CBF8();
  v2 = v1;
  swift_release();
  if ((v2 & 1) == 0)
  {
    MaxHistoryItems = MapsSyncGetMaxHistoryItems();
    type metadata accessor for MapsSyncManagedHistoryItem();
    v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchRequest);
    v5 = (_QWORD *)swift_allocObject();
    v5[2] = isEscapingClosureAtFileLocation;
    v5[3] = v4;
    v5[4] = MaxHistoryItems;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_1A4226668;
    *(_QWORD *)(v6 + 24) = v5;
    v9[4] = sub_1A40DE09C;
    v9[5] = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1A40D4EE4;
    v9[3] = &block_descriptor_46;
    v7 = _Block_copy(v9);
    sub_1A40D715C((id)isEscapingClosureAtFileLocation);
    v8 = v4;
    swift_retain();
    swift_release();
    objc_msgSend((id)isEscapingClosureAtFileLocation, sel_performBlockAndWait_, v7);
    sub_1A40D70E8((id)isEscapingClosureAtFileLocation);

    _Block_release(v7);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return;
    __break(1u);
  }
  v9[0] = isEscapingClosureAtFileLocation;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
  swift_willThrowTypedImpl();
  sub_1A40D70E8((id)isEscapingClosureAtFileLocation);
}

uint64_t sub_1A422663C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A4226668()
{
  uint64_t v0;

  return sub_1A4226160(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1A4226674()
{
  return swift_deallocObject();
}

void sub_1A4226684()
{
  uint64_t v0;

  sub_1A42261E0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

char *MapsSyncCuratedCollectionQuery.__allocating_init(options:delegate:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MapsSyncCuratedCollectionQuery.init(options:delegate:)(a1, a2);
}

char *MapsSyncCuratedCollectionQuery.init(options:delegate:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  char *v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;

  *(_QWORD *)(v2 + OBJC_IVAR____TtC8MapsSync30MapsSyncCuratedCollectionQuery__specifiedQuery) = 0;
  swift_unknownObjectRetain();
  v5 = sub_1A4162018(a2, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA7D8);
  v6 = swift_allocObject();
  v7 = a1;
  v8 = v5;
  v9 = sub_1A422714C(a1, v8, v8, v8, 0, 0, v6);
  v10 = OBJC_IVAR____TtC8MapsSync30MapsSyncCuratedCollectionQuery__specifiedQuery;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync30MapsSyncCuratedCollectionQuery__specifiedQuery] = v9;
  swift_release();
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_genericQuery] = *(_QWORD *)&v8[v10];
  swift_retain();
  swift_unknownObjectRelease();
  v11 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  v12 = *(void **)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock];
  v13 = v8;
  objc_msgSend(v12, sel_lock);
  v13[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete] = 1;
  objc_msgSend(*(id *)&v8[v11], sel_unlock);

  swift_unknownObjectRelease();
  return v13;
}

id MapsSyncCuratedCollectionQuery.__allocating_init(delegate:)(uint64_t a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(v1), sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

id MapsSyncCuratedCollectionQuery.init(delegate:)(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(v1, sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1A422690C(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BBAC68, (void (*)(_QWORD, _QWORD))sub_1A4227644);
}

void sub_1A42269C4(uint64_t a1, uint64_t a2)
{
  id v3;

  type metadata accessor for MapsSyncCuratedCollection();
  v3 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t sub_1A4226A18(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BBAC90, (void (*)(_QWORD, _QWORD))sub_1A42277E8);
}

uint64_t sub_1A4226A2C(unint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = MEMORY[0x1E0DEE9D8];
  if (!v5)
  {
LABEL_12:
    a3(v6);
    return swift_bridgeObjectRelease();
  }
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = v8 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncCuratedCollection();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v8 = v9;
      }
      while (v5 != v9);
    }
    else
    {
      v10 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncCuratedCollection();
      do
      {
        v11 = *v10++;
        swift_dynamicCastClassUnconditional();
        v12 = v11;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v5;
      }
      while (v5);
    }
    v6 = v13;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4226C94(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BBACB8, (void (*)(_QWORD, _QWORD))sub_1A422764C);
}

void sub_1A4226D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  type metadata accessor for MapsSyncCuratedCollection();
  v5 = (void *)sub_1A423C1B8();
  if (a2)
    v6 = sub_1A423BEB8();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_1A4226DCC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BBACE0, (void (*)(_QWORD, _QWORD))sub_1A42277EC);
}

uint64_t sub_1A4226DE0(unint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  id v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = MEMORY[0x1E0DEE9D8];
  if (!v6)
  {
LABEL_12:
    a3(v7, a2);
    return swift_bridgeObjectRelease();
  }
  v14 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v6 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v9 = 0;
      do
      {
        v10 = v9 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncCuratedCollection();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v9 = v10;
      }
      while (v6 != v10);
    }
    else
    {
      v11 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncCuratedCollection();
      do
      {
        v12 = *v11++;
        swift_dynamicCastClassUnconditional();
        v13 = v12;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v6;
      }
      while (v6);
    }
    v7 = v14;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42270FC()
{
  return swift_release();
}

id MapsSyncCuratedCollectionQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncCuratedCollectionQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A422714C(void *a1, void *a2, char *a3, void *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t ObjectType;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  int v33;
  void *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;

  v38 = a6;
  v33 = a5;
  v35 = a4;
  v36 = a3;
  v39 = a2;
  v34 = a1;
  v8 = sub_1A423C374();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A423C35C();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1A423C0D4();
  MEMORY[0x1E0C80A78](v13);
  v37 = a7 + 24;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 32) = 0;
  v32[1] = a7 + 40;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 48) = 0;
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC4A0);
  sub_1A423C0C8();
  v40 = MEMORY[0x1E0DEE9D8];
  sub_1A40F4FC0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC430);
  sub_1A40F5008();
  sub_1A423C4A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF8D0], v8);
  *(_QWORD *)(a7 + 56) = sub_1A423C398();
  swift_unknownObjectWeakInit();
  sub_1A423BF90();
  *(_QWORD *)(a7 + qword_1ED1ACB40) = 0;
  *(_BYTE *)(a7 + qword_1ED1AC138) = 0;
  v14 = qword_1ED1AC120;
  *(_QWORD *)(a7 + v14) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v15 = a7 + qword_1ED1AB758;
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  *(_BYTE *)(a7 + qword_1ED1ABA50) = 0;
  result = swift_unknownObjectWeakAssign();
  if ((v38 & 1) != 0)
  {
    if ((byte_1EE70EEE8 & 1) != 0)
    {
      v17 = v36;
      if (qword_1EE70E270 != -1)
        result = swift_once();
      v18 = &qword_1EE70EEE0;
    }
    else
    {
      v17 = v36;
      if (qword_1ED1AB520 != -1)
        result = swift_once();
      v18 = &qword_1ED1AB4E8;
    }
  }
  else if ((byte_1EE70EEE8 & 1) != 0)
  {
    v17 = v36;
    if (qword_1EE70E268 != -1)
      result = swift_once();
    v18 = &qword_1EE70EED8;
  }
  else
  {
    v17 = v36;
    if (qword_1ED1AC908 != -1)
      result = swift_once();
    v18 = qword_1ED1AC168;
  }
  v19 = (void *)*v18;
  *(_QWORD *)(a7 + 16) = *v18;
  if (*(_QWORD *)&v17[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate])
  {
    swift_unknownObjectWeakAssign();
    v20 = v35;
    swift_unknownObjectWeakAssign();
    v21 = *(void **)(a7 + 48);
    v22 = v34;
    *(_QWORD *)(a7 + 48) = v34;
    v23 = v19;
    v24 = v22;

    *(_BYTE *)(a7 + 64) = v33 & 1;
    ObjectType = swift_getObjectType();
    v26 = (*(uint64_t (**)(void))(ObjectType + 384))();
    v27 = swift_allocObject();
    swift_weakInit();
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v27;
    *(_QWORD *)(v28 + 24) = v22;
    v29 = v24;
    swift_retain();
    sub_1A4232170(0, (uint64_t)sub_1A422777C, v28);
    swift_release();
    swift_release();
    v30 = swift_allocObject();
    swift_weakInit();
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v30;
    *(_QWORD *)(v31 + 24) = v26;
    swift_retain();
    sub_1A4232170(0, (uint64_t)sub_1A42277B0, v31);
    swift_release();
    swift_release();

    return a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A4227620()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A4227644(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4226A2C(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1A422764C(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4226DE0(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t type metadata accessor for MapsSyncCuratedCollectionQuery()
{
  return objc_opt_self();
}

uint64_t method lookup function for MapsSyncCuratedCollectionQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncCuratedCollectionQuery.__allocating_init(options:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 600))();
}

uint64_t dispatch thunk of MapsSyncCuratedCollectionQuery.fetchContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of MapsSyncCuratedCollectionQuery.fetchContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of MapsSyncCuratedCollectionQuery.fetchQueryContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of MapsSyncCuratedCollectionQuery.fetchQueryContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t sub_1A42276F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A422771C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A4226D4C(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1A4227724(uint64_t a1)
{
  uint64_t v1;

  sub_1A42269C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A422772C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A4227750()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A422777C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422D980(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1A4227784()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A42277B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422DF10(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD **)(v2 + 24));
}

void sub_1A42277F0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  swift_getObjectType();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    v6 = *(void **)(v4 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
    v9 = a1;
    objc_msgSend(v6, sel_lock);
    v7 = *(_QWORD *)(v5 + OBJC_IVAR___MSFavoriteItem__positionIndex);
    objc_msgSend(v6, sel_unlock);
    if (!v7)
    {
      sub_1A4143338(0, 0, a2);
      sub_1A4201F4C(v8);
    }

  }
}

uint64_t sub_1A42279B4(void **a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  int v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  void *v28;
  id v29;
  int v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[24];
  uint64_t v40;
  unsigned __int16 v41;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v34 - v8;
  v10 = sub_1A423BF9C();
  v11 = *(_QWORD **)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v36 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v34 - v14;
  v16 = *a1;
  v17 = *a2;
  v18 = (void *)sub_1A423C140();
  v19 = objc_msgSend(v16, sel_valueForKey_, v18);

  if (v19)
  {
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  sub_1A40CD1EC((uint64_t)&v37, (uint64_t)v39);
  if (!v40)
    goto LABEL_13;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_14;
  LODWORD(v35) = (__int16)v41;
  v20 = (void *)sub_1A423C140();
  v21 = objc_msgSend(v17, sel_valueForKey_, v20);

  if (v21)
  {
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  sub_1A40CD1EC((uint64_t)&v37, (uint64_t)v39);
  if (!v40)
  {
LABEL_13:
    sub_1A410251C((uint64_t)v39, (uint64_t *)&unk_1ED1AC4F0);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) != 0 && v41 != (unsigned __int16)v35)
  {
    v22 = (int)v35 < (__int16)v41;
    return v22 & 1;
  }
LABEL_14:
  v23 = (void *)sub_1A423C140();
  v24 = objc_msgSend(v17, sel_valueForKey_, v23);

  if (v24)
  {
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  sub_1A40CD1EC((uint64_t)&v37, (uint64_t)v39);
  if (v40)
  {
    v25 = swift_dynamicCast();
    v26 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v11[7];
    v26(v9, v25 ^ 1u, 1, v10);
    v27 = (unsigned int (*)(char *, uint64_t, uint64_t))v11[6];
    if (v27(v9, 1, v10) != 1)
    {
      v35 = (void (*)(char *, char *, uint64_t))v11[4];
      v35(v15, v9, v10);
      v28 = (void *)sub_1A423C140();
      v29 = objc_msgSend(v16, sel_valueForKey_, v28);

      if (v29)
      {
        sub_1A423C488();
        swift_unknownObjectRelease();
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
      }
      sub_1A40CD1EC((uint64_t)&v37, (uint64_t)v39);
      if (v40)
      {
        v30 = swift_dynamicCast();
        v26(v7, v30 ^ 1u, 1, v10);
        if (v27(v7, 1, v10) != 1)
        {
          v31 = v36;
          v35(v36, v7, v10);
          v22 = sub_1A423BF78();
          v32 = (void (*)(char *, uint64_t))v11[1];
          v32(v31, v10);
          v32(v15, v10);
          return v22 & 1;
        }
      }
      else
      {
        sub_1A410251C((uint64_t)v39, (uint64_t *)&unk_1ED1AC4F0);
        v26(v7, 1, 1, v10);
      }
      ((void (*)(char *, uint64_t))v11[1])(v15, v10);
      sub_1A410251C((uint64_t)v7, &qword_1ED1AB5D0);
      v22 = 0;
      return v22 & 1;
    }
  }
  else
  {
    sub_1A410251C((uint64_t)v39, (uint64_t *)&unk_1ED1AC4F0);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v11[7])(v9, 1, 1, v10);
  }
  sub_1A410251C((uint64_t)v9, &qword_1ED1AB5D0);
  v22 = 1;
  return v22 & 1;
}

void sub_1A4227EF8(uint64_t a1)
{
  void *v1;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  __int128 v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t j;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  id ObjCClassFromMetadata;
  _QWORD *v72;
  uint64_t v73;
  _OWORD v74[2];
  __int128 v75;
  __int128 v76;
  objc_super v77;

  v3 = (objc_class *)(*MEMORY[0x1E0DEEDD8] & *(_QWORD *)type metadata accessor for FavoriteItem());
  v77.receiver = v1;
  v77.super_class = v3;
  v4 = objc_msgSendSuper2(&v77, sel_findDuplicatesWithContext_, a1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB910);
  v72 = (_QWORD *)sub_1A423C1C4();

  v5 = (void *)sub_1A423C140();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_expressionForKeyPath_, v5);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC4D0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1A4243A70;
  *(_QWORD *)(v8 + 56) = sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC470);
  *(_QWORD *)(v8 + 32) = v7;
  v70 = v7;
  v9 = (void *)sub_1A423C140();
  v10 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v6, sel_expressionForFunction_arguments_, v9, v10);

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97B30]), sel_init);
  v69 = v11;
  objc_msgSend(v12, sel_setExpression_, v11);
  v13 = v12;
  v14 = (void *)sub_1A423C140();
  objc_msgSend(v13, sel_setName_, v14);

  objc_msgSend(v13, sel_setExpressionResultType_, 300);
  type metadata accessor for MapsSyncManagedFavoriteItem();
  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  v15 = objc_msgSend(ObjCClassFromMetadata, sel_entity);
  v16 = objc_msgSend(v15, sel_name);

  if (!v16)
  {
LABEL_61:
    __break(1u);
    return;
  }
  sub_1A423C14C();

  v17 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v18 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithEntityName_, v18);

  objc_msgSend(v19, sel_setReturnsObjectsAsFaults_, 0);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1A4243A70;
  v21 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v20 + 32) = 0xD000000000000018;
  *(_QWORD *)(v20 + 40) = 0x80000001A424B3D0;
  v22 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setPropertiesToGroupBy_, v22);

  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1A4243A80;
  *(_QWORD *)(v23 + 56) = v21;
  *(_QWORD *)(v23 + 32) = 0xD000000000000018;
  *(_QWORD *)(v23 + 40) = 0x80000001A424B3D0;
  *(_QWORD *)(v23 + 88) = sub_1A40D19C0(0, &qword_1ED1AC4B0);
  *(_QWORD *)(v23 + 64) = v13;
  v24 = v13;
  v25 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setPropertiesToFetch_, v25);

  objc_msgSend(v19, sel_setResultType_, 2);
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  v26 = (void *)sub_1A423C314();
  objc_msgSend(v19, sel_setPredicate_, v26);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB6C0);
  v27 = sub_1A423C3F8();
  v66 = v24;
  v67 = v19;
  v28 = sub_1A40E8A00(v27);
  swift_bridgeObjectRelease();
  v29 = sub_1A40E8F00(v28);
  swift_bridgeObjectRelease();
  v30 = *(_QWORD *)(v29 + 16);
  v31 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v30)
  {
    v32 = v29 + 32;
    while (1)
    {
      v33 = *(_QWORD *)v32;
      if (!*(_QWORD *)(*(_QWORD *)v32 + 16))
        break;
      swift_bridgeObjectRetain();
      v34 = sub_1A41585AC(0x746E756F63, 0xE500000000000000);
      if ((v35 & 1) == 0)
        goto LABEL_58;
      sub_1A40D1AAC(*(_QWORD *)(v33 + 56) + 32 * v34, (uint64_t)v74);
      sub_1A40D1A9C(v74, &v75);
      swift_dynamicCast();
      if (v73 <= 1)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v31 = sub_1A40CF968(0, v31[2] + 1, 1, v31);
        v37 = v31[2];
        v36 = v31[3];
        if (v37 >= v36 >> 1)
          v31 = sub_1A40CF968((_QWORD *)(v36 > 1), v37 + 1, 1, v31);
        v31[2] = v37 + 1;
        v31[v37 + 4] = v33;
      }
      v32 += 8;
      if (!--v30)
        goto LABEL_14;
    }
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  v38 = v31[2];
  if (v38)
  {
    v39 = v31 + 4;
    swift_bridgeObjectRetain();
    v40 = 0;
    v41 = MEMORY[0x1E0DEA968];
    v68 = v38;
    while (1)
    {
      if (v40 >= v31[2])
        goto LABEL_59;
      v42 = v39[v40];
      if (!*(_QWORD *)(v42 + 16))
        break;
      swift_bridgeObjectRetain();
      v43 = sub_1A41585AC(0xD000000000000018, 0x80000001A424B3D0);
      if ((v44 & 1) != 0)
      {
        sub_1A40D1AAC(*(_QWORD *)(v42 + 56) + 32 * v43, (uint64_t)&v75);
      }
      else
      {
        v75 = 0u;
        v76 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v76 + 1))
        goto LABEL_17;
      if ((swift_dynamicCast() & 1) != 0)
      {
        v45 = v74[0];
        v46 = objc_msgSend(ObjCClassFromMetadata, sel_fetchRequest);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
        v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_1A4243A70;
        *(_QWORD *)(v47 + 56) = v41;
        *(_QWORD *)(v47 + 64) = sub_1A40E766C();
        *(_OWORD *)(v47 + 32) = v45;
        v48 = (void *)sub_1A423C314();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
        v49 = swift_allocObject();
        *(_OWORD *)(v49 + 16) = xmmword_1A4243A90;
        v50 = v48;
        v51 = MEMORY[0x1E0DEE9D8];
        *(_QWORD *)(v49 + 32) = sub_1A423C314();
        *(_QWORD *)(v49 + 40) = v50;
        *(_QWORD *)&v75 = v49;
        sub_1A423C1DC();
        v52 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
        v53 = v50;
        v54 = (void *)sub_1A423C1B8();
        swift_bridgeObjectRelease();
        v55 = objc_msgSend(v52, sel_initWithType_subpredicates_, 1, v54);

        objc_msgSend(v46, sel_setPredicate_, v55);
        v56 = sub_1A423C3F8();
        v57 = v56;
        *(_QWORD *)&v75 = v51;
        if (v56 >> 62)
        {
          swift_bridgeObjectRetain();
          v58 = sub_1A423C728();
          if (v58)
          {
LABEL_28:
            if (v58 < 1)
              goto LABEL_60;
            if ((v57 & 0xC000000000000001) != 0)
            {
              for (i = 0; i != v58; ++i)
              {
                MEMORY[0x1A859B6A0](i, v57);
                objc_opt_self();
                if (swift_dynamicCastObjCClass())
                {
                  MEMORY[0x1A859B250]();
                  if (*(_QWORD *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                    sub_1A423C1F4();
                  sub_1A423C224();
                  sub_1A423C1DC();
                }
                else
                {
                  swift_unknownObjectRelease();
                }
              }
            }
            else
            {
              for (j = 0; j != v58; ++j)
              {
                objc_opt_self();
                if (swift_dynamicCastObjCClass())
                {
                  v61 = swift_unknownObjectRetain();
                  MEMORY[0x1A859B250](v61);
                  if (*(_QWORD *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                    sub_1A423C1F4();
                  sub_1A423C224();
                  sub_1A423C1DC();
                }
              }
            }
          }
        }
        else
        {
          v58 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v58)
            goto LABEL_28;
        }
        swift_bridgeObjectRelease();
        v62 = v75;
        swift_bridgeObjectRelease();
        if (v62 >> 62)
        {
          swift_bridgeObjectRetain();
          v63 = sub_1A423C728();
          swift_bridgeObjectRelease();
        }
        else
        {
          v63 = *(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        v41 = MEMORY[0x1E0DEA968];
        if (v63 >= 2)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v72 = sub_1A40CF954(0, v72[2] + 1, 1, v72);
          v65 = v72[2];
          v64 = v72[3];
          if (v65 >= v64 >> 1)
            v72 = sub_1A40CF954((_QWORD *)(v64 > 1), v65 + 1, 1, v72);
          v72[2] = v65 + 1;
          v72[v65 + 4] = v62;

          v39 = v31 + 4;
          v38 = v68;
        }
        else
        {

          swift_bridgeObjectRelease();
          v38 = v68;
          v39 = v31 + 4;
        }
      }
LABEL_18:
      if (++v40 == v38)
        goto LABEL_56;
    }
    v75 = 0u;
    v76 = 0u;
LABEL_17:
    sub_1A410251C((uint64_t)&v75, (uint64_t *)&unk_1ED1AC4F0);
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
LABEL_56:

  swift_bridgeObjectRelease_n();
}

uint64_t FavoriteItem.moveToFront(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_1A4228E1C(a1, a2, (void (*)(uint64_t, char *, uint64_t, uint64_t))sub_1A415DD48);
}

void sub_1A4228ACC(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  if (a1 || !a2)
    goto LABEL_15;
  if (!(a2 >> 62))
  {
    v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  if (!sub_1A423C728())
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    a4(a1);
    return;
  }
LABEL_5:
  if ((a2 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x1A859B6A0](0, a2);
LABEL_8:
    v17 = v9;
    swift_bridgeObjectRelease();
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v10 = swift_dynamicCastClass();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = *(id *)(a3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154774();

      v13 = sub_1A412CBF8();
      LOBYTE(v12) = v14;
      swift_release();
      if ((v12 & 1) == 0)
      {
        sub_1A4143338(0, 1, v13);
        v15 = (void *)sub_1A423C83C();
        v16 = (void *)sub_1A423C140();
        objc_msgSend(v11, sel_setValue_forKey_, v15, v16);

        a4(0);
        sub_1A40D70E8(v13);

        return;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
      swift_willThrowTypedImpl();

      sub_1A40D70E8(v13);
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(a2 + 32);
    goto LABEL_8;
  }
  __break(1u);
}

void sub_1A4228DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1A423BEB8();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t FavoriteItem.moveToBack(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_1A4228E1C(a1, a2, (void (*)(uint64_t, char *, uint64_t, uint64_t))sub_1A415E03C);
}

uint64_t sub_1A4228E1C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *, uint64_t, uint64_t))
{
  char *v3;
  void *v7;
  uint64_t inited;
  char *v9;
  id v10;
  uint64_t v12;

  v7 = *(void **)&v3[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243670;
  *(_QWORD *)(inited + 32) = v3;
  v12 = inited;
  sub_1A423C1DC();
  v9 = v3;
  swift_retain();
  v10 = v7;
  a3(v12, v9, a1, a2);

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1A4228EDC(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  if (a1 || !a2)
    goto LABEL_15;
  if (!(a2 >> 62))
  {
    v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  if (!sub_1A423C728())
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    a4(a1);
    return;
  }
LABEL_5:
  if ((a2 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x1A859B6A0](0, a2);
LABEL_8:
    v17 = v9;
    swift_bridgeObjectRelease();
    type metadata accessor for MapsSyncManagedFavoriteItem();
    v10 = swift_dynamicCastClass();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = *(id *)(a3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
      sub_1A4154774();

      v13 = sub_1A412CBF8();
      LOBYTE(v12) = v14;
      swift_release();
      if ((v12 & 1) == 0)
      {
        sub_1A4143338(0, 0, v13);
        v15 = (void *)sub_1A423C83C();
        v16 = (void *)sub_1A423C140();
        objc_msgSend(v11, sel_setValue_forKey_, v15, v16);

        a4(0);
        sub_1A40D70E8(v13);

        return;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
      swift_willThrowTypedImpl();

      sub_1A40D70E8(v13);
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(a2 + 32);
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t FavoriteItem.moveBefore(item:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A4229514(a1, a2, a3, (void (*)(uint64_t, char *, uint64_t, uint64_t, id))sub_1A415E330);
}

void sub_1A42291E0(uint64_t a1, unint64_t a2, char *a3, void (*a4)(void), uint64_t a5, void *a6)
{
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  char v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;

  if (a1)
    goto LABEL_9;
  if (!a2)
    goto LABEL_9;
  v10 = sub_1A41BD3D0(a2);
  if (!v10)
    goto LABEL_9;
  v11 = v10;
  v12 = *(id *)&a3[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store];
  sub_1A4154774();

  v13 = sub_1A412CBF8();
  LOBYTE(v12) = v14;
  swift_release();
  if ((v12 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    swift_bridgeObjectRelease();
    sub_1A40D70E8(v13);
LABEL_9:
    ((void (*)(uint64_t))a4)(a1);
    return;
  }
  v15 = a3;
  v16 = sub_1A422B7BC(v11, (uint64_t)v15);

  if (!v16)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_1A412FD68();
    v21 = (void *)swift_allocError();
    *v22 = 3;
    a4();

    goto LABEL_13;
  }
  v17 = a6;
  v18 = sub_1A422B7BC(v11, (uint64_t)v17);
  swift_bridgeObjectRelease();

  if (!v18)
  {

    goto LABEL_12;
  }
  sub_1A4143338(v18, 1, v13);
  v19 = (void *)sub_1A423C83C();
  v20 = (void *)sub_1A423C140();
  objc_msgSend(v16, sel_setValue_forKey_, v19, v20);

  ((void (*)(_QWORD))a4)(0);
LABEL_13:
  sub_1A40D70E8(v13);
}

uint64_t FavoriteItem.moveAfter(item:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A4229514(a1, a2, a3, (void (*)(uint64_t, char *, uint64_t, uint64_t, id))sub_1A415E624);
}

uint64_t sub_1A4229514(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *, uint64_t, uint64_t, id))
{
  char *v4;
  void *v9;
  uint64_t inited;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v9 = *(void **)&v4[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243A90;
  *(_QWORD *)(inited + 32) = v4;
  *(_QWORD *)(inited + 40) = a1;
  v15 = inited;
  sub_1A423C1DC();
  v11 = v4;
  swift_retain();
  v12 = a1;
  v13 = v9;
  a4(v15, v11, a2, a3, v12);

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1A42295EC(uint64_t a1, unint64_t a2, char *a3, void (*a4)(void), uint64_t a5, void *a6)
{
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  char v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;

  if (a1)
    goto LABEL_9;
  if (!a2)
    goto LABEL_9;
  v10 = sub_1A41BD3D0(a2);
  if (!v10)
    goto LABEL_9;
  v11 = v10;
  v12 = *(id *)&a3[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store];
  sub_1A4154774();

  v13 = sub_1A412CBF8();
  LOBYTE(v12) = v14;
  swift_release();
  if ((v12 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABA40);
    swift_willThrowTypedImpl();
    swift_bridgeObjectRelease();
    sub_1A40D70E8(v13);
LABEL_9:
    ((void (*)(uint64_t))a4)(a1);
    return;
  }
  v15 = a3;
  v16 = sub_1A422B7BC(v11, (uint64_t)v15);

  if (!v16)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_1A412FD68();
    v21 = (void *)swift_allocError();
    *v22 = 3;
    a4();

    goto LABEL_13;
  }
  v17 = a6;
  v18 = sub_1A422B7BC(v11, (uint64_t)v17);
  swift_bridgeObjectRelease();

  if (!v18)
  {

    goto LABEL_12;
  }
  sub_1A4143338(v18, 0, v13);
  v19 = (void *)sub_1A423C83C();
  v20 = (void *)sub_1A423C140();
  objc_msgSend(v16, sel_setValue_forKey_, v19, v20);

  ((void (*)(_QWORD))a4)(0);
LABEL_13:
  sub_1A40D70E8(v13);
}

void FavoriteItem.placeItemNote.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t inited;
  uint64_t v12;
  objc_class *Predicate;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A423BFE4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)(v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v8, sel_lock);
  v9 = v0 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier;
  swift_beginAccess();
  sub_1A410356C(v9, (uint64_t)v3, (uint64_t *)&unk_1ED1ABCE0);
  objc_msgSend(v8, sel_unlock);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1A410251C((uint64_t)v3, (uint64_t *)&unk_1ED1ABCE0);
    return;
  }
  v10 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v32 = v4;
  v10(v7, v3, v4);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
  inited = swift_initStackObject();
  v29 = xmmword_1A4243A70;
  *(_OWORD *)(inited + 16) = xmmword_1A4243A70;
  v31 = v7;
  v12 = sub_1A423BFC0();
  *(_QWORD *)(inited + 56) = sub_1A40D19C0(0, &qword_1EE70E6F0);
  *(_QWORD *)(inited + 64) = sub_1A40ECAEC();
  *(_QWORD *)(inited + 32) = v12;
  sub_1A40E8D14(inited);
  Predicate = (objc_class *)type metadata accessor for MapsSyncQueryPredicate();
  v14 = objc_allocWithZone(Predicate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1A4243670;
  v16 = (void *)sub_1A423C140();
  v17 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend((id)objc_opt_self(), sel_predicateWithFormat_argumentArray_, v16, v17);

  *(_QWORD *)(v15 + 32) = v18;
  v33 = v15;
  sub_1A423C1DC();
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  v19 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v34.receiver = v14;
  v34.super_class = Predicate;
  v20 = objc_msgSendSuper2(&v34, sel_initWithType_subpredicates_, 1, v19);

  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  swift_arrayDestroy();
  objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryOptions());
  v21 = v20;
  v22 = sub_1A41D7E8C(v20, 0, 0);

  v23 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionPlaceItemRequest()), sel_init);
  v24 = v22;
  v25 = sub_1A41EA380();

  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_1A423C728();
    swift_bridgeObjectRelease();
    if (v28)
      goto LABEL_5;
LABEL_10:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v31, v32);

    return;
  }
  if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_5:
  if ((v25 & 0xC000000000000001) != 0)
  {
    v26 = (id)MEMORY[0x1A859B6A0](0, v25);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v26 = *(id *)(v25 + 32);
LABEL_8:
    v27 = v26;
    swift_bridgeObjectRelease();
    sub_1A410002C();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v31, v32);
    return;
  }
  __break(1u);
}

void FavoriteItem.placeItemNote.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t inited;
  uint64_t v22;
  objc_class *Predicate;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  objc_super v70;

  v67 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v4);
  v66 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v55 - v10;
  v12 = sub_1A423BFE4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)(v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  objc_msgSend(v16, sel_lock);
  v17 = v2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier;
  swift_beginAccess();
  v65 = v17;
  v18 = v17;
  v19 = v16;
  sub_1A410356C(v18, (uint64_t)v11, (uint64_t *)&unk_1ED1ABCE0);
  objc_msgSend(v16, sel_unlock);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1A410251C((uint64_t)v11, (uint64_t *)&unk_1ED1ABCE0);
    return;
  }
  v55 = v9;
  v56 = v2;
  v64 = a2;
  v62 = v13;
  v20 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v63 = v12;
  v20(v15, v11, v12);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
  inited = swift_initStackObject();
  v59 = xmmword_1A4243A70;
  *(_OWORD *)(inited + 16) = xmmword_1A4243A70;
  v61 = v15;
  v22 = sub_1A423BFC0();
  *(_QWORD *)(inited + 56) = sub_1A40D19C0(0, &qword_1EE70E6F0);
  *(_QWORD *)(inited + 64) = sub_1A40ECAEC();
  *(_QWORD *)(inited + 32) = v22;
  sub_1A40E8D14(inited);
  Predicate = (objc_class *)type metadata accessor for MapsSyncQueryPredicate();
  v24 = objc_allocWithZone(Predicate);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v25 = swift_allocObject();
  v57 = xmmword_1A4243670;
  *(_OWORD *)(v25 + 16) = xmmword_1A4243670;
  v26 = (void *)sub_1A423C140();
  v27 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend((id)objc_opt_self(), sel_predicateWithFormat_argumentArray_, v26, v27);

  *(_QWORD *)(v25 + 32) = v28;
  v68 = v25;
  sub_1A423C1DC();
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
  v29 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  v70.receiver = v24;
  v70.super_class = Predicate;
  v30 = objc_msgSendSuper2(&v70, sel_initWithType_subpredicates_, 1, v29);

  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB100);
  swift_arrayDestroy();
  v31 = objc_allocWithZone((Class)type metadata accessor for MapsSyncQueryOptions());
  v32 = v30;
  v33 = sub_1A41D7E8C(v30, 0, 0);

  v34 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionPlaceItemRequest()), sel_init);
  v35 = v33;
  v36 = sub_1A41EA380();

  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    v37 = (id)sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v37 = *(id *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v38 = v67;
  if (v37)
  {
    if ((v36 & 0xC000000000000001) != 0)
    {
      v37 = (id)MEMORY[0x1A859B6A0](0, v36);
      v39 = v64;
    }
    else
    {
      v39 = v64;
      if (!*(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_17;
      }
      v37 = *(id *)(v36 + 32);
    }
    swift_bridgeObjectRelease();
    sub_1A41037F4(v38, v39);
    swift_bridgeObjectRelease();
    if (qword_1ED1AB880 == -1)
    {
LABEL_10:
      v40 = swift_initStackObject();
      *(_OWORD *)(v40 + 16) = v57;
      *(_QWORD *)(v40 + 32) = v37;
      v68 = v40;
      sub_1A423C1DC();
      v41 = v68;
      v42 = v37;
      sub_1A4154D78(v41);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
      swift_bridgeObjectRelease();

      return;
    }
LABEL_17:
    swift_once();
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  v43 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CollectionPlaceItem()), sel_init);
  objc_msgSend(v19, sel_lock);
  v44 = v56 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__createTime;
  swift_beginAccess();
  v45 = v44;
  v46 = v66;
  sub_1A410356C(v45, v66, &qword_1ED1AB5D0);
  objc_msgSend(v19, sel_unlock);
  sub_1A4184D98(v46, 1);
  sub_1A410251C(v46, &qword_1ED1AB5D0);
  sub_1A41005C8(2);
  objc_msgSend(v19, sel_lock);
  v47 = (uint64_t)v55;
  sub_1A410356C(v65, (uint64_t)v55, (uint64_t *)&unk_1ED1ABCE0);
  objc_msgSend(v19, sel_unlock);
  sub_1A40FF8A4(v47);
  v48 = sub_1A41FEFBC();
  sub_1A41025B8(v48, v49);
  swift_bridgeObjectRelease();
  v50 = (void *)sub_1A4202F3C();
  v51 = *(void **)&v43[OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock];
  objc_msgSend(v51, sel_lock);
  sub_1A4101094((uint64_t)v51, v50, v43);
  objc_msgSend(v51, sel_unlock);

  sub_1A41037F4(v38, v64);
  swift_bridgeObjectRelease();
  if (qword_1ED1AB880 != -1)
    swift_once();
  v52 = swift_initStackObject();
  *(_OWORD *)(v52 + 16) = v57;
  *(_QWORD *)(v52 + 32) = v43;
  v69 = v52;
  sub_1A423C1DC();
  v53 = v69;
  v54 = v43;
  sub_1A4154D78(v53);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
  swift_bridgeObjectRelease();

}

void sub_1A422A8E0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_placeItemNote);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1A423C14C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1A422A944(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1A423C140();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setPlaceItemNote_);

}

uint64_t sub_1A422A9A4(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_1A422B7A8();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1A422AA1C(v6);
  return sub_1A423C620();
}

void sub_1A422AA1C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  int v19;
  void **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  char v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  char v94;
  char v95;
  void *v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  void **__dst;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;

  v3 = a1[1];
  v4 = sub_1A423C794();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_143;
    if (v3)
      sub_1A422B1D0(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_152;
  v6 = v4;
  v109 = a1;
  if (v3 < 2)
  {
    v9 = (char *)MEMORY[0x1E0DEE9D8];
    v122 = MEMORY[0x1E0DEE9D8];
    __dst = (void **)((MEMORY[0x1E0DEE9D8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v36 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      goto LABEL_104;
    }
  }
  else
  {
    v7 = v5 >> 1;
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    v8 = sub_1A423C20C();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    __dst = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v122 = v8;
  }
  v10 = 0;
  v11 = *a1;
  v110 = *a1 + 16;
  v108 = *a1 - 8;
  v9 = (char *)MEMORY[0x1E0DEE9D8];
  v117 = v3;
  v113 = v6;
  v119 = *a1;
  while (1)
  {
    v12 = v10;
    v13 = v10 + 1;
    if (v10 + 1 < v3)
    {
      v114 = v9;
      v14 = *(void **)(v11 + 8 * v13);
      v120 = *(void **)(v11 + 8 * v10);
      v15 = v120;
      v121 = v14;
      v16 = v14;
      v17 = v15;
      v18 = sub_1A42279B4(&v121, &v120);
      if (v1)
      {
        swift_bridgeObjectRelease();

LABEL_121:
        *(_QWORD *)((v122 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_1A423C1DC();
        swift_bridgeObjectRelease();
        return;
      }
      v19 = v18;

      v13 = v12 + 2;
      if (v12 + 2 < v3)
      {
        v111 = v12;
        v20 = (void **)(v110 + 8 * v12);
        while (1)
        {
          v21 = v13;
          v22 = *v20;
          v120 = *(v20 - 1);
          v23 = v120;
          v121 = v22;
          v24 = v22;
          v25 = v23;
          v26 = sub_1A42279B4(&v121, &v120);

          if (((v19 ^ v26) & 1) != 0)
            break;
          v13 = v21 + 1;
          ++v20;
          v3 = v117;
          if (v117 == v21 + 1)
          {
            v13 = v117;
            v6 = v113;
            goto LABEL_21;
          }
        }
        v3 = v117;
        v6 = v113;
        v13 = v21;
LABEL_21:
        v12 = v111;
      }
      v9 = v114;
      v11 = v119;
      if ((v19 & 1) != 0)
      {
        if (v13 < v12)
          goto LABEL_147;
        if (v12 < v13)
        {
          v27 = (uint64_t *)(v108 + 8 * v13);
          v28 = v13;
          v29 = v12;
          v30 = (uint64_t *)(v119 + 8 * v12);
          do
          {
            if (v29 != --v28)
            {
              if (!v119)
                goto LABEL_150;
              v31 = *v30;
              *v30 = *v27;
              *v27 = v31;
            }
            ++v29;
            --v27;
            ++v30;
          }
          while (v29 < v28);
        }
      }
    }
    if (v13 >= v3)
      goto LABEL_40;
    if (__OFSUB__(v13, v12))
      goto LABEL_144;
    if (v13 - v12 >= v6)
    {
LABEL_40:
      if (v13 < v12)
        goto LABEL_142;
      goto LABEL_41;
    }
    if (__OFADD__(v12, v6))
      goto LABEL_145;
    v32 = v12 + v6 >= v3 ? v3 : v12 + v6;
    if (v32 < v12)
      break;
    if (v13 == v32)
      goto LABEL_40;
    v116 = v9;
    v85 = v108 + 8 * v13;
    v112 = v12;
    v107 = v32;
    do
    {
      v86 = *(void **)(v11 + 8 * v13);
      v87 = v12;
      v88 = v85;
      v89 = v85;
      while (1)
      {
        v90 = v13;
        v120 = *(void **)v89;
        v91 = v120;
        v121 = v86;
        v92 = v86;
        v93 = v91;
        v94 = sub_1A42279B4(&v121, &v120);
        if (v1)
        {
          swift_bridgeObjectRelease();

          goto LABEL_121;
        }
        v95 = v94;

        if ((v95 & 1) == 0)
          break;
        v11 = v119;
        if (!v119)
          goto LABEL_149;
        v96 = *(void **)v89;
        v86 = *(void **)(v89 + 8);
        *(_QWORD *)v89 = v86;
        *(_QWORD *)(v89 + 8) = v96;
        v89 -= 8;
        ++v87;
        v13 = v90;
        if (v90 == v87)
          goto LABEL_98;
      }
      v11 = v119;
      v13 = v90;
LABEL_98:
      ++v13;
      v85 = v88 + 8;
      v12 = v112;
    }
    while (v13 != v107);
    v13 = v107;
    v9 = v116;
    if (v107 < v112)
      goto LABEL_142;
LABEL_41:
    v33 = v9;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v9 = v33;
    else
      v9 = sub_1A422B5F0(0, *((_QWORD *)v33 + 2) + 1, 1, v33);
    v35 = *((_QWORD *)v9 + 2);
    v34 = *((_QWORD *)v9 + 3);
    v36 = v35 + 1;
    v11 = v119;
    if (v35 >= v34 >> 1)
    {
      v97 = sub_1A422B5F0((char *)(v34 > 1), v35 + 1, 1, v9);
      v11 = v119;
      v9 = v97;
    }
    *((_QWORD *)v9 + 2) = v36;
    v37 = v9 + 32;
    v38 = &v9[16 * v35 + 32];
    *(_QWORD *)v38 = v12;
    *((_QWORD *)v38 + 1) = v13;
    v115 = v13;
    if (v35)
    {
LABEL_46:
      v39 = v36 - 1;
      if (v36 >= 4)
      {
        v44 = &v37[16 * v36];
        v45 = *((_QWORD *)v44 - 8);
        v46 = *((_QWORD *)v44 - 7);
        v50 = __OFSUB__(v46, v45);
        v47 = v46 - v45;
        if (v50)
          goto LABEL_127;
        v49 = *((_QWORD *)v44 - 6);
        v48 = *((_QWORD *)v44 - 5);
        v50 = __OFSUB__(v48, v49);
        v42 = v48 - v49;
        v43 = v50;
        if (v50)
          goto LABEL_128;
        v51 = v36 - 2;
        v52 = &v37[16 * v36 - 32];
        v54 = *(_QWORD *)v52;
        v53 = *((_QWORD *)v52 + 1);
        v50 = __OFSUB__(v53, v54);
        v55 = v53 - v54;
        if (v50)
          goto LABEL_130;
        v50 = __OFADD__(v42, v55);
        v56 = v42 + v55;
        if (v50)
          goto LABEL_133;
        if (v56 >= v47)
        {
          v74 = &v37[16 * v39];
          v76 = *(_QWORD *)v74;
          v75 = *((_QWORD *)v74 + 1);
          v50 = __OFSUB__(v75, v76);
          v77 = v75 - v76;
          if (v50)
            goto LABEL_137;
          v67 = v42 < v77;
        }
        else
        {
LABEL_59:
          if ((v43 & 1) != 0)
            goto LABEL_129;
          v51 = v36 - 2;
          v57 = &v37[16 * v36 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v60 = __OFSUB__(v58, v59);
          v61 = v58 - v59;
          v62 = v60;
          if (v60)
            goto LABEL_132;
          v63 = &v37[16 * v39];
          v65 = *(_QWORD *)v63;
          v64 = *((_QWORD *)v63 + 1);
          v50 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          if (v50)
            goto LABEL_135;
          if (__OFADD__(v61, v66))
            goto LABEL_136;
          if (v61 + v66 < v42)
            goto LABEL_71;
          v67 = v42 < v66;
        }
        if (v67)
          v39 = v51;
      }
      else
      {
        if (v36 == 3)
        {
          v41 = *((_QWORD *)v9 + 4);
          v40 = *((_QWORD *)v9 + 5);
          v50 = __OFSUB__(v40, v41);
          v42 = v40 - v41;
          v43 = v50;
          goto LABEL_59;
        }
        v68 = *((_QWORD *)v9 + 4);
        v69 = *((_QWORD *)v9 + 5);
        v50 = __OFSUB__(v69, v68);
        v61 = v69 - v68;
        v62 = v50;
LABEL_71:
        if ((v62 & 1) != 0)
          goto LABEL_131;
        v70 = &v37[16 * v39];
        v72 = *(_QWORD *)v70;
        v71 = *((_QWORD *)v70 + 1);
        v50 = __OFSUB__(v71, v72);
        v73 = v71 - v72;
        if (v50)
          goto LABEL_134;
        if (v73 < v61)
          goto LABEL_88;
      }
      v78 = v39 - 1;
      if (v39 - 1 >= v36)
      {
        __break(1u);
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
        break;
      }
      if (!v11)
        goto LABEL_148;
      v79 = v9;
      v80 = &v37[16 * v78];
      v81 = *(_QWORD *)v80;
      v82 = &v37[16 * v39];
      v83 = *((_QWORD *)v82 + 1);
      sub_1A422B2BC((void **)(v11 + 8 * *(_QWORD *)v80), (void **)(v11 + 8 * *(_QWORD *)v82), v11 + 8 * v83, __dst);
      if (v1)
        goto LABEL_120;
      if (v83 < v81)
        goto LABEL_124;
      if (v39 > *((_QWORD *)v79 + 2))
        goto LABEL_125;
      *(_QWORD *)v80 = v81;
      *(_QWORD *)&v37[16 * v78 + 8] = v83;
      v84 = *((_QWORD *)v79 + 2);
      if (v39 >= v84)
        goto LABEL_126;
      v36 = v84 - 1;
      memmove(&v37[16 * v39], v82 + 16, 16 * (v84 - 1 - v39));
      v9 = v79;
      *((_QWORD *)v79 + 2) = v84 - 1;
      v11 = v119;
      if (v84 <= 2)
        goto LABEL_88;
      goto LABEL_46;
    }
    v36 = 1;
LABEL_88:
    v10 = v115;
    v3 = v117;
    v6 = v113;
    if (v115 >= v117)
    {
LABEL_104:
      if (v36 >= 2)
      {
        v98 = *v109;
        do
        {
          v99 = v36 - 2;
          if (v36 < 2)
            goto LABEL_138;
          if (!v98)
            goto LABEL_151;
          v100 = (uint64_t)v9;
          v101 = *(_QWORD *)&v9[16 * v99 + 32];
          v102 = *(_QWORD *)&v9[16 * v36 + 24];
          sub_1A422B2BC((void **)(v98 + 8 * v101), (void **)(v98 + 8 * *(_QWORD *)&v9[16 * v36 + 16]), v98 + 8 * v102, __dst);
          if (v1)
            break;
          if (v102 < v101)
            goto LABEL_139;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            v103 = (char *)v100;
          else
            v103 = sub_1A422B794(v100);
          if (v99 >= *((_QWORD *)v103 + 2))
            goto LABEL_140;
          v104 = &v103[16 * v99 + 32];
          *(_QWORD *)v104 = v101;
          *((_QWORD *)v104 + 1) = v102;
          v105 = *((_QWORD *)v103 + 2);
          if (v36 > v105)
            goto LABEL_141;
          v106 = v103;
          memmove(&v103[16 * v36 + 16], &v103[16 * v36 + 32], 16 * (v105 - v36));
          v9 = v106;
          *((_QWORD *)v106 + 2) = v105 - 1;
          v36 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_120:
      swift_bridgeObjectRelease();
      goto LABEL_121;
    }
  }
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  sub_1A423C704();
  __break(1u);
}

void sub_1A422B1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  void *v18;
  void *v19;

  if (a3 != a2)
  {
    v5 = a3;
    v6 = a1;
    v7 = *a4;
    v8 = *a4 + 8 * a3 - 8;
LABEL_4:
    v9 = *(void **)(v7 + 8 * v5);
    v10 = v8;
    while (1)
    {
      v19 = v9;
      v18 = *(void **)v10;
      v11 = v18;
      v12 = v9;
      v13 = v11;
      v14 = sub_1A42279B4(&v19, &v18);

      if (v4)
        break;
      if ((v14 & 1) != 0)
      {
        if (!v7)
        {
          __break(1u);
          return;
        }
        v15 = *(void **)v10;
        v9 = *(void **)(v10 + 8);
        *(_QWORD *)v10 = v9;
        *(_QWORD *)(v10 + 8) = v15;
        v10 -= 8;
        if (v5 != ++v6)
          continue;
      }
      ++v5;
      v8 += 8;
      v6 = a1;
      if (v5 != a2)
        goto LABEL_4;
      return;
    }
  }
}

uint64_t sub_1A422B2BC(void **__src, void **a2, unint64_t a3, void **__dst)
{
  void **v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void **v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  char v19;
  void **v20;
  void **v21;
  void **v22;
  void **v23;
  void **v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  char v30;
  void **v31;
  void **v32;
  uint64_t result;
  void **v34;
  void **v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void **v39;
  void **v40;
  void **v41;

  v35 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v41 = __src;
  v40 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (__dst != a2 || &a2[v12] <= __dst)
      {
        memmove(__dst, a2, 8 * v12);
        __dst = v35;
      }
      v21 = &__dst[v12];
      v39 = v21;
      v41 = v5;
      if (v6 < v5 && v10 >= 8)
      {
        v22 = (void **)(a3 - 8);
        v23 = v5;
        v34 = v6;
        while (1)
        {
          v24 = v21;
          v25 = *--v21;
          v38 = v25;
          v26 = *--v23;
          v37 = v26;
          v27 = v38;
          v28 = v26;
          v29 = sub_1A42279B4(&v38, &v37);
          if (v36)
            break;
          v30 = v29;
          v36 = 0;
          v31 = v22 + 1;

          if ((v30 & 1) != 0)
          {
            v32 = v35;
            if (v31 != v5 || v22 >= v5)
              *v22 = *v23;
            v41 = v23;
            v21 = v24;
          }
          else
          {
            v39 = v21;
            v32 = v35;
            if (v31 < v24 || v22 >= v24 || v31 != v24)
              *v22 = *v21;
            v23 = v5;
          }
          if (v23 > v34)
          {
            --v22;
            v5 = v23;
            if (v21 > v32)
              continue;
          }
          goto LABEL_48;
        }

      }
      goto LABEL_48;
    }
  }
  else if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst)
    {
      memmove(__dst, __src, 8 * v9);
      __dst = v35;
    }
    v13 = &__dst[v9];
    v39 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      while (1)
      {
        v38 = *v5;
        v14 = __dst;
        v37 = *__dst;
        v15 = v37;
        v16 = v38;
        v17 = v15;
        v18 = sub_1A42279B4(&v38, &v37);
        if (v36)
          break;
        v19 = v18;

        if ((v19 & 1) != 0)
        {
          v20 = v5 + 1;
          if (v6 < v5 || v6 >= v20 || v6 != v5)
            *v6 = *v5;
          __dst = v14;
        }
        else
        {
          if (v6 != v14)
            *v6 = *v14;
          __dst = v14 + 1;
          v40 = v14 + 1;
          v20 = v5;
        }
        v36 = 0;
        v41 = ++v6;
        if (__dst < v13)
        {
          v5 = v20;
          if ((unint64_t)v20 < a3)
            continue;
        }
        goto LABEL_48;
      }

    }
LABEL_48:
    sub_1A422B6EC((void **)&v41, (const void **)&v40, &v39);
    return 1;
  }
  result = sub_1A423C770();
  __break(1u);
  return result;
}

char *sub_1A422B5F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE710AE8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A422B6EC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_1A423C770();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_1A422B794(uint64_t a1)
{
  return sub_1A422B5F0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_1A422B7A8()
{
  JUMPOUT(0x1A859B82CLL);
}

id sub_1A422B7BC(unint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char v34;
  void (*v35)(char *, uint64_t);
  _QWORD v37[2];
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  v3 = v2;
  v6 = sub_1A423BFE4();
  v48 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v38 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AA1D0);
  MEMORY[0x1E0C80A78](v47);
  v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)v37 - v15;
  MEMORY[0x1E0C80A78](v14);
  v41 = (uint64_t)v37 - v17;
  if (a1 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    v18 = sub_1A423C728();
    if (v18)
      goto LABEL_3;
  }
  else
  {
    v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18)
    {
LABEL_3:
      v40 = v13;
      v37[1] = v3;
      v44 = *(id *)(a2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
      v45 = a2 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier;
      v46 = a1 & 0xC000000000000001;
      swift_beginAccess();
      v19 = 4;
      v42 = v18;
      v43 = a1;
      a2 = v41;
      v39 = v9;
      while (1)
      {
        v13 = (char *)(v19 - 4);
        if (v46)
          v21 = (id)MEMORY[0x1A859B6A0](v19 - 4, a1);
        else
          v21 = *(id *)(a1 + 8 * v19);
        v3 = v21;
        v22 = v19 - 3;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
          goto LABEL_23;
        }
        v23 = objc_msgSend(v21, sel_identifier);
        v49 = v3;
        if (v23)
        {
          v24 = v23;
          sub_1A423BFCC();

          v25 = 0;
        }
        else
        {
          v25 = 1;
        }
        v26 = v48;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(a2, v25, 1, v6);
        v27 = v44;
        objc_msgSend(v44, sel_lock);
        sub_1A410356C(v45, (uint64_t)v16, (uint64_t *)&unk_1ED1ABCE0);
        objc_msgSend(v27, sel_unlock);
        v28 = (uint64_t)&v9[*(int *)(v47 + 48)];
        sub_1A410356C(a2, (uint64_t)v9, (uint64_t *)&unk_1ED1ABCE0);
        sub_1A410356C((uint64_t)v16, v28, (uint64_t *)&unk_1ED1ABCE0);
        v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
        if (v29(v9, 1, v6) == 1)
          break;
        v30 = (uint64_t)v9;
        v31 = (uint64_t)v40;
        sub_1A410356C(v30, (uint64_t)v40, (uint64_t *)&unk_1ED1ABCE0);
        if (v29((char *)v28, 1, v6) == 1)
        {
          sub_1A410251C((uint64_t)v16, (uint64_t *)&unk_1ED1ABCE0);
          a2 = v41;
          sub_1A410251C(v41, (uint64_t *)&unk_1ED1ABCE0);
          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v31, v6);
          a1 = v43;
          v9 = v39;
LABEL_5:
          sub_1A410251C((uint64_t)v9, &qword_1ED1AA1D0);
          goto LABEL_6;
        }
        v32 = v48;
        v33 = v38;
        (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v38, v28, v6);
        sub_1A418F508();
        v34 = sub_1A423C134();
        v35 = *(void (**)(char *, uint64_t))(v32 + 8);
        v35(v33, v6);
        sub_1A410251C((uint64_t)v16, (uint64_t *)&unk_1ED1ABCE0);
        a2 = v41;
        sub_1A410251C(v41, (uint64_t *)&unk_1ED1ABCE0);
        v35((char *)v31, v6);
        v9 = v39;
        sub_1A410251C((uint64_t)v39, (uint64_t *)&unk_1ED1ABCE0);
        a1 = v43;
        if ((v34 & 1) != 0)
          goto LABEL_21;
LABEL_6:

        ++v19;
        if (v22 == v42)
          goto LABEL_24;
      }
      sub_1A410251C((uint64_t)v16, (uint64_t *)&unk_1ED1ABCE0);
      sub_1A410251C(a2, (uint64_t *)&unk_1ED1ABCE0);
      v20 = v29((char *)v28, 1, v6);
      a1 = v43;
      if (v20 == 1)
      {
        sub_1A410251C((uint64_t)v9, (uint64_t *)&unk_1ED1ABCE0);
LABEL_21:
        swift_bridgeObjectRelease();
        return v49;
      }
      goto LABEL_5;
    }
  }
LABEL_24:
  swift_bridgeObjectRelease();
  return 0;
}

char *keypath_get_selector_placeItemNote()
{
  return sel_placeItemNote;
}

char *sub_1A422BC48(void *a1)
{
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  char *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A4243A90;
  v3 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  v4 = (void *)sub_1A423C140();
  v5 = objc_msgSend(v3, sel_initWithKey_ascending_, v4, 1);

  *(_QWORD *)(v2 + 32) = v5;
  v6 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  v7 = (void *)sub_1A423C140();
  v8 = objc_msgSend(v6, sel_initWithKey_ascending_, v7, 1);

  *(_QWORD *)(v2 + 40) = v8;
  sub_1A423C1DC();
  v9 = sub_1A41D82EC(a1, 0, v2);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1A422BD7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  v13 = 0x80000001A4250510;
  v2 = sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  MEMORY[0x1A859B274](a1, v2);
  sub_1A423C188();
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(0xD00000000000001DLL, 0x80000001A4250510);
  swift_bridgeObjectRelease();
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    v11 = swift_bridgeObjectRetain();
    v3 = (uint64_t)sub_1A40CFBD4(v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v12 = v3;
  sub_1A422A9A4(&v12);
  v4 = v12;
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_1A423C5CC();
  swift_bridgeObjectRelease();
  v12 = 0xD000000000000010;
  v13 = 0x80000001A424A320;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x1A859B6A0](0, v4);
  }
  else
  {
    if (!*(_QWORD *)(v4 + 16))
    {
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
    v5 = *(id *)(v4 + 32);
  }
  v6 = v5;
  v7 = objc_msgSend(v5, sel_description);
  sub_1A423C14C();

  sub_1A423C188();
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC8MapsSyncE5debugyySSFZ_0(v12, v13);
  swift_bridgeObjectRelease();
  if ((v4 & 0xC000000000000001) != 0)
    v8 = (id)MEMORY[0x1A859B6A0](0, v4);
  else
    v8 = *(id *)(v4 + 32);
  v9 = v8;
  swift_release();
  return (uint64_t)v9;
}

uint64_t sub_1A422BF74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A422BF98(uint64_t a1)
{
  uint64_t v1;

  sub_1A4228DC4(a1, *(_QWORD *)(v1 + 16));
}

id IncidentReportRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IncidentReportRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id IncidentReportRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for IncidentReport();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSIncidentReportRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id IncidentReportRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for IncidentReport();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSIncidentReportRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for IncidentReportRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for IncidentReportRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A422C208()
{
  return sub_1A422C2D0();
}

uint64_t sub_1A422C2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSIncidentReportRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for IncidentReport();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for IncidentReport();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A422C598()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A422C5B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A422C608;
  return sub_1A41EB994(0);
}

uint64_t sub_1A422C608(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A422C67C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for IncidentReport();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for IncidentReport();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A422C984(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A422C9FC;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A422C9FC()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for IncidentReport();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A422CAC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A422CAE0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A422CB3C;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A422CB3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A422CBB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for IncidentReport();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for IncidentReport();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A422CECC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A422CF58;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A422CF58()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for IncidentReport();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A422D030()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A422D048()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A422D1BC(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A422D204()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A422D25C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A422D274()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A422D400(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A422D454()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id IncidentReportRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IncidentReportRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for IncidentReportRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IncidentReportRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of IncidentReportRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of IncidentReportRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of IncidentReportRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of IncidentReportRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of IncidentReportRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of IncidentReportRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A422D718()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710B40 + dword_1EE710B40))(v2, v3, v4);
}

uint64_t sub_1A422D790()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710B50 + dword_1EE710B50))(v2, v3);
}

uint64_t sub_1A422D800()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710B60 + dword_1EE710B60))(v2, v3, v4);
}

uint64_t sub_1A422D878()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710B70 + dword_1EE710B70))(v2, v3);
}

uint64_t sub_1A422D8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4232888);
}

uint64_t sub_1A422D8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4232BE0);
}

uint64_t sub_1A422D8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4232F38);
}

uint64_t sub_1A422D908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4233290);
}

uint64_t sub_1A422D914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A42335E8);
}

uint64_t sub_1A422D920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4233940);
}

uint64_t sub_1A422D92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4233C98);
}

uint64_t sub_1A422D938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4233FF0);
}

uint64_t sub_1A422D944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4234340);
}

uint64_t sub_1A422D950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4234698);
}

uint64_t sub_1A422D95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A42349F0);
}

uint64_t sub_1A422D968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4234D48);
}

uint64_t sub_1A422D974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A42350A0);
}

uint64_t sub_1A422D980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A422D98C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1A42353F8);
}

uint64_t sub_1A422D98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v10;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (a4)
      v10 = *(unsigned __int8 *)(a4 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_notifyOnLoad);
    else
      v10 = 1;
    a5(a1, a2, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422DA28(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedHistoryItem, (uint64_t)&unk_1E4BBC778, (uint64_t)sub_1A4237B20);
}

uint64_t sub_1A422DA44(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedRAPRecord, (uint64_t)&unk_1E4BBC610, (uint64_t)sub_1A4237AE0);
}

uint64_t sub_1A422DA60(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(_QWORD), uint64_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v11 = result;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a4 = sub_1A40CF844(0, a4[2] + 1, 1, a4);
    v13 = a4[2];
    v12 = a4[3];
    if (v13 >= v12 >> 1)
      a4 = sub_1A40CF844((_QWORD *)(v12 > 1), v13 + 1, 1, a4);
    v14 = a5(0);
    a4[2] = v13 + 1;
    a4[v13 + 4] = v14;
    v15 = *(char **)(v11 + 16);
    v16 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
    v17 = *(void **)&v15[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
    v18 = v15;
    objc_msgSend(v17, sel_lock);
    v19 = *(_QWORD *)&v18[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__historyAnalyzer];
    v20 = *(void **)&v15[v16];
    swift_retain();
    objc_msgSend(v20, sel_unlock);

    if (v19)
    {
      v21 = swift_allocObject();
      swift_weakInit();
      swift_retain();
      v22 = sub_1A41E48CC((uint64_t)a4, a7, v21);
      swift_release();
      swift_bridgeObjectRelease();
      swift_release_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      v22 = 0;
    }
    v23 = v11 + qword_1ED1AB758;
    *(_QWORD *)v23 = v22;
    *(_BYTE *)(v23 + 8) = v19 == 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422DC2C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedIncidentReport, (uint64_t)&unk_1E4BBC4A8, (uint64_t)sub_1A4237AA0);
}

uint64_t sub_1A422DC48(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedServerEvaluationStatus, (uint64_t)&unk_1E4BBC340, (uint64_t)sub_1A4237A60);
}

uint64_t sub_1A422DC64(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedAnalyticsIdentifier, (uint64_t)&unk_1E4BBC1D8, (uint64_t)sub_1A4237A20);
}

uint64_t sub_1A422DC80(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCommunityID, (uint64_t)&unk_1E4BBC070, (uint64_t)sub_1A42379E0);
}

uint64_t sub_1A422DC9C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCollection, (uint64_t)&unk_1E4BBBF08, (uint64_t)sub_1A42379A0);
}

uint64_t sub_1A422DCB8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = result;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a4 = sub_1A40CF844(0, a4[2] + 1, 1, a4);
    v8 = a4[2];
    v7 = a4[3];
    if (v8 >= v7 >> 1)
      a4 = sub_1A40CF844((_QWORD *)(v7 > 1), v8 + 1, 1, a4);
    v9 = sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
    a4[2] = v8 + 1;
    a4[v8 + 4] = v9;
    v10 = *(char **)(v6 + 16);
    v11 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
    v12 = *(void **)&v10[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock];
    v13 = v10;
    objc_msgSend(v12, sel_lock);
    v14 = *(_QWORD *)&v13[OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__historyAnalyzer];
    v15 = *(void **)&v10[v11];
    swift_retain();
    objc_msgSend(v15, sel_unlock);

    if (v14)
    {
      v16 = swift_allocObject();
      swift_weakInit();
      swift_retain();
      v17 = sub_1A41E48CC((uint64_t)a4, (uint64_t)sub_1A4237960, v16);
      swift_release();
      swift_bridgeObjectRelease();
      swift_release_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      v17 = 0;
    }
    v18 = v6 + qword_1ED1AB758;
    *(_QWORD *)v18 = v17;
    *(_BYTE *)(v18 + 8) = v14 == 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422DE84(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedReviewedPlace, (uint64_t)&unk_1E4BBBC38, (uint64_t)sub_1A4237920);
}

uint64_t sub_1A422DEA0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionTransitItem, (uint64_t)&unk_1E4BBBAD0, (uint64_t)sub_1A42378E0);
}

uint64_t sub_1A422DEBC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionPlaceItem, (uint64_t)&unk_1E4BBB968, (uint64_t)sub_1A42378A0);
}

uint64_t sub_1A422DED8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedFavoriteItem, (uint64_t)&unk_1E4BBB800, (uint64_t)sub_1A4237860);
}

uint64_t sub_1A422DEF4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionItem, (uint64_t)&unk_1E4BBB698, (uint64_t)sub_1A4237820);
}

uint64_t sub_1A422DF10(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  return sub_1A422DA60(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedCuratedCollection, (uint64_t)&unk_1E4BBB530, (uint64_t)sub_1A42377BC);
}

uint64_t sub_1A422DF2C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A422F354(0, (uint64_t)sub_1A4237B28, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E084()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A422F6E0(0, (uint64_t)sub_1A4237AE8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E1DC()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A422FA6C(0, (uint64_t)sub_1A4237AA8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E334()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A422FDF8(0, (uint64_t)sub_1A4237A68, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E48C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4230184(0, (uint64_t)sub_1A4237A28, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E5E4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4230510(0, (uint64_t)sub_1A42379E8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E73C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A423089C(0, (uint64_t)sub_1A42379A8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E894()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4230C28(0, (uint64_t)sub_1A4237968, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422E9EC()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4230FB4(0, (uint64_t)sub_1A4237928, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422EB44()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4231340(0, (uint64_t)sub_1A42378E8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422EC9C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A42316CC(0, (uint64_t)sub_1A42378A8, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422EDF4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4231A58(0, (uint64_t)sub_1A4237868, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422EF4C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4231DE4(0, (uint64_t)sub_1A4237828, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422F0A4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A4232170(0, (uint64_t)sub_1A42377C4, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422F1FC()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A423C320();
    if (qword_1ED1ACAE8 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1A4243A70;
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 64) = sub_1A40E766C();
    *(_QWORD *)(v1 + 32) = 0xD000000000000027;
    *(_QWORD *)(v1 + 40) = 0x80000001A42505A0;
    sub_1A423C020();
    swift_bridgeObjectRelease();
    v2 = swift_allocObject();
    swift_weakInit();
    sub_1A42324FC(0, (uint64_t)sub_1A4237760, v2);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A422F354(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_581;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_570;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A422F6E0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_545;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_534;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A422FA6C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_509;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_498;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A422FDF8(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_473;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_462;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4230184(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_437;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_426;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4230510(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_401;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_390;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A423089C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_365;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_354;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4230C28(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_329;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_318;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4230FB4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_293;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_282;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4231340(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_257;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_246;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A42316CC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_221;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_210;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4231A58(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_185;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_174;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4231DE4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_149_0;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_138;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4232170(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t aBlock;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v40 = sub_1A4237DE8;
      v41 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v37 = 1107296256;
      v14 = &block_descriptor_113_1;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v27 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v28 = *v27;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v28 = sub_1A40CF82C(0, v28[2] + 1, 1, v28);
      *v27 = v28;
    }
    v31 = v28[2];
    v30 = v28[3];
    v32 = v31 + 1;
    if (v31 >= v30 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v30 > 1), v31 + 1, 1, v28);
      v32 = v31 + 1;
      v28 = v35;
      *v27 = v35;
    }
    v28[2] = v32;
    v26 = &v28[2 * v31];
LABEL_18:
    v26[4] = sub_1A40E7840;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4237DE4;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v34 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v34;
      *v20 = v34;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v40 = sub_1A4237DE8;
  v41 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v14 = &block_descriptor_102;
LABEL_7:
  v38 = sub_1A40CBC44;
  v39 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A42324FC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t (*v27)();
  _QWORD **v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  uint64_t (*v41)();
  _QWORD *v42;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_BYTE *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 16);
  v10 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock;
  v11 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
  swift_retain_n();
  objc_msgSend(v11, sel_lock);
  if ((v8 & 1) != 0 || (a1 & 1) != 0)
  {
    v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
    if (v12)
    {
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = a2;
      v15[3] = a3;
      v15[4] = v12;
      v41 = sub_1A4237DE8;
      v42 = v15;
      aBlock = MEMORY[0x1E0C809B0];
      v38 = 1107296256;
      v14 = &block_descriptor_77;
      goto LABEL_7;
    }
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4111214;
    *(_QWORD *)(v19 + 24) = v7;
    v28 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingBackgroundReadContextFetches);
    swift_beginAccess();
    v29 = *v28;
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v28 = v29;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = sub_1A40CF82C(0, v29[2] + 1, 1, v29);
      *v28 = v29;
    }
    v32 = v29[2];
    v31 = v29[3];
    v33 = v32 + 1;
    if (v32 >= v31 >> 1)
    {
      v36 = sub_1A40CF82C((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
      v33 = v32 + 1;
      v29 = v36;
      *v28 = v36;
    }
    v29[2] = v33;
    v26 = &v29[2 * v32];
    v27 = sub_1A40E7840;
LABEL_18:
    v26[4] = v27;
    v26[5] = v19;
    swift_endAccess();
    goto LABEL_19;
  }
  v12 = *(void **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
  if (!v12)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_1A4111214;
    *(_QWORD *)(v19 + 24) = v7;
    v20 = (_QWORD **)(v9 + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__pendingReadContextFetches);
    swift_beginAccess();
    v21 = *v20;
    swift_retain();
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v21;
    if ((v22 & 1) == 0)
    {
      v21 = sub_1A40CF82C(0, v21[2] + 1, 1, v21);
      *v20 = v21;
    }
    v24 = v21[2];
    v23 = v21[3];
    v25 = v24 + 1;
    if (v24 >= v23 >> 1)
    {
      v35 = sub_1A40CF82C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
      v25 = v24 + 1;
      v21 = v35;
      *v20 = v35;
    }
    v21[2] = v25;
    v26 = &v21[2 * v24];
    v27 = (uint64_t (*)())sub_1A40E75B4;
    goto LABEL_18;
  }
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v12;
  v41 = sub_1A42377AC;
  v42 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v38 = 1107296256;
  v14 = &block_descriptor_66_3;
LABEL_7:
  v39 = sub_1A40CBC44;
  v40 = v14;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_retain();
  v18 = v17;
  swift_release();
  objc_msgSend(v18, sel_performBlock_, v16);
  _Block_release(v16);

LABEL_19:
  objc_msgSend(*(id *)(v9 + v10), sel_unlock);
  swift_release();
  return swift_release();
}

uint64_t sub_1A4232888(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedHistoryItem);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A422F354(0, (uint64_t)sub_1A4237B28, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4232BE0(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedRAPRecord);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A422F6E0(0, (uint64_t)sub_1A4237AE8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4232F38(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedIncidentReport);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A422FA6C(0, (uint64_t)sub_1A4237AA8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4233290(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedServerEvaluationStatus);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A422FDF8(0, (uint64_t)sub_1A4237A68, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A42335E8(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedAnalyticsIdentifier);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4230184(0, (uint64_t)sub_1A4237A28, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4233940(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCommunityID);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4230510(0, (uint64_t)sub_1A42379E8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4233C98(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollection);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A423089C(0, (uint64_t)sub_1A42379A8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4233FF0(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235F24((uint64_t)v7, v4, v6);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4230C28(0, (uint64_t)sub_1A4237968, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4234340(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedReviewedPlace);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4230FB4(0, (uint64_t)sub_1A4237928, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4234698(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionTransitItem);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4231340(0, (uint64_t)sub_1A42378E8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A42349F0(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionPlaceItem);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A42316CC(0, (uint64_t)sub_1A42378A8, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4234D48(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedFavoriteItem);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4231A58(0, (uint64_t)sub_1A4237868, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A42350A0(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCollectionItem);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4231DE4(0, (uint64_t)sub_1A4237828, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A42353F8(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedCuratedCollection);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A4232170(0, (uint64_t)sub_1A42377C4, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1A4235750(uint64_t result, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;

  if (!*(_QWORD *)(v3 + 32))
  {
    v4 = result;
    if (result)
    {
      result = MEMORY[0x1A859C108](v3 + 40);
      if (result)
      {
        v6 = result;
        v7 = *(void **)(v3 + 48);
        v8 = v7;
        sub_1A4235AA8((uint64_t)v7, v4, v6, (void (*)(_QWORD))type metadata accessor for MapsSyncManagedVehicle);
        v10 = v9;

        v11 = *(void **)(v3 + 32);
        *(_QWORD *)(v3 + 32) = v10;

        v12 = qword_1ED1AC120;
        objc_msgSend(*(id *)(v3 + qword_1ED1AC120), sel_lock);
        *(_BYTE *)(v3 + qword_1ED1AC138) = 1;
        objc_msgSend(*(id *)(v3 + v12), sel_unlock);
        v13 = (void *)MEMORY[0x1A859C108](v3 + 24);
        if (v13)
        {
          objc_msgSend(v13, sel_queryIsReady);
          swift_unknownObjectRelease();
        }
        if ((a3 & 1) != 0)
        {
          sub_1A423C320();
          if (qword_1ED1ACAE8 != -1)
            swift_once();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
          v14 = swift_allocObject();
          *(_OWORD *)(v14 + 16) = xmmword_1A4243A70;
          *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
          *(_QWORD *)(v14 + 64) = sub_1A40E766C();
          *(_QWORD *)(v14 + 32) = 0xD000000000000027;
          *(_QWORD *)(v14 + 40) = 0x80000001A42505F0;
          sub_1A423C020();
          swift_bridgeObjectRelease();
          v15 = swift_allocObject();
          swift_weakInit();
          sub_1A42324FC(0, (uint64_t)sub_1A4237760, v15);
          swift_unknownObjectRelease();
          return swift_release();
        }
        else
        {
          return swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_1A423C5CC();
      swift_bridgeObjectRelease();
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE70E618);
      sub_1A423C158();
      sub_1A423C188();
      swift_bridgeObjectRelease();
      sub_1A423C338();
      if (qword_1ED1ACAE8 != -1)
        swift_once();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ACAB0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A4243A70;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v18 + 64) = sub_1A40E766C();
      *(_QWORD *)(v18 + 32) = 0xD000000000000017;
      *(_QWORD *)(v18 + 40) = 0x80000001A42505D0;
      swift_bridgeObjectRetain();
      sub_1A423C020();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_1A4235AA8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void **v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void **v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;

  a4(0);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
  v8 = objc_msgSend(v7, sel_name);

  if (v8)
  {
    sub_1A423C14C();

    v9 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v10 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v9, sel_initWithEntityName_, v10);

    if (a1
      && (v12 = (void **)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_predicate),
          swift_beginAccess(),
          (v13 = *v12) != 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1A4243A90;
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v15 = v13;
      *(_QWORD *)(v14 + 32) = sub_1A423C314();
      *(_QWORD *)(v14 + 40) = v15;
      sub_1A423C1DC();
      v16 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
      v17 = v15;
      v18 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v16, sel_initWithType_subpredicates_, 1, v18);

    }
    else
    {
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v19 = (id)sub_1A423C314();
    }
    objc_msgSend(v11, sel_setPredicate_, v19);

    objc_msgSend(v11, sel_setFetchBatchSize_, 100);
    if (a1
      && (v20 = (_QWORD *)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors),
          swift_beginAccess(),
          *v20))
    {
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      swift_bridgeObjectRetain();
      v21 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setSortDescriptors_, v21);

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1A4243670;
      v23 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
      v24 = (void *)sub_1A423C140();
      v25 = objc_msgSend(v23, sel_initWithKey_ascending_, v24, 1);

      *(_QWORD *)(v22 + 32) = v25;
      sub_1A423C1DC();
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      v26 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v11, sel_setSortDescriptors_, v26);

      if (!a1)
      {
LABEL_12:
        objc_msgSend(objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97B68]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v11, a2, 0, 0), sel_setDelegate_, a3);

        return;
      }
    }
    v27 = (void **)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_range);
    swift_beginAccess();
    v28 = (char *)*v27;
    if (*v27)
    {
      v29 = &v28[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
      v30 = *(_QWORD *)&v28[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
      v31 = v28;
      objc_msgSend(v11, sel_setFetchOffset_, v30);
      objc_msgSend(v11, sel_setFetchLimit_, *((_QWORD *)v29 + 1));

    }
    goto LABEL_12;
  }
  __break(1u);
}

void sub_1A4235F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void **v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;

  v6 = objc_msgSend((id)objc_opt_self(), sel_entity);
  v7 = objc_msgSend(v6, sel_name);

  if (v7)
  {
    sub_1A423C14C();

    v8 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
    v9 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v8, sel_initWithEntityName_, v9);

    if (a1
      && (v11 = (void **)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_predicate),
          swift_beginAccess(),
          (v12 = *v11) != 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1A4243A90;
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v14 = v12;
      *(_QWORD *)(v13 + 32) = sub_1A423C314();
      *(_QWORD *)(v13 + 40) = v14;
      sub_1A423C1DC();
      v15 = objc_allocWithZone(MEMORY[0x1E0CB3528]);
      v16 = v14;
      v17 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v15, sel_initWithType_subpredicates_, 1, v17);

    }
    else
    {
      sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC460);
      v18 = (id)sub_1A423C314();
    }
    objc_msgSend(v10, sel_setPredicate_, v18);

    objc_msgSend(v10, sel_setFetchBatchSize_, 100);
    if (a1
      && (v19 = (_QWORD *)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors),
          swift_beginAccess(),
          *v19))
    {
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      swift_bridgeObjectRetain();
      v20 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setSortDescriptors_, v20);

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1A4243670;
      v22 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
      v23 = (void *)sub_1A423C140();
      v24 = objc_msgSend(v22, sel_initWithKey_ascending_, v23, 1);

      *(_QWORD *)(v21 + 32) = v24;
      sub_1A423C1DC();
      sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
      v25 = (void *)sub_1A423C1B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setSortDescriptors_, v25);

      if (!a1)
      {
LABEL_12:
        objc_msgSend(objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97B68]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v10, a2, 0, 0), sel_setDelegate_, a3);

        return;
      }
    }
    v26 = (void **)(a1 + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_range);
    swift_beginAccess();
    v27 = (char *)*v26;
    if (*v26)
    {
      v28 = &v27[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
      v29 = *(_QWORD *)&v27[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
      v30 = v27;
      objc_msgSend(v10, sel_setFetchOffset_, v29);
      objc_msgSend(v10, sel_setFetchLimit_, *((_QWORD *)v28 + 1));

    }
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t sub_1A42363A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v8 = sub_1A423C0BC();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1A423C0D4();
  v11 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v15 = *(id *)(result + 56);
    swift_release();
    v16 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    aBlock[4] = a5;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A40CBC44;
    aBlock[3] = a6;
    v17 = _Block_copy(aBlock);
    swift_retain();
    sub_1A423C0C8();
    v21 = MEMORY[0x1E0DEE9D8];
    sub_1A40D0EE8((unint64_t *)&qword_1ED1AC160, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC400);
    sub_1A413FED0((unint64_t *)&qword_1ED1AC410, (uint64_t *)&unk_1ED1AC400);
    sub_1A423C4A0();
    MEMORY[0x1A859B430](0, v13, v10, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

char *MapsSyncVehicleQuery.__allocating_init(options:delegate:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MapsSyncVehicleQuery.init(options:delegate:)(a1, a2);
}

char *MapsSyncVehicleQuery.init(options:delegate:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  char *v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;

  *(_QWORD *)(v2 + OBJC_IVAR____TtC8MapsSync20MapsSyncVehicleQuery__specifiedQuery) = 0;
  swift_unknownObjectRetain();
  v5 = sub_1A4162018(a2, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABD08);
  v6 = swift_allocObject();
  v7 = a1;
  v8 = v5;
  v9 = sub_1A42370A4(a1, v8, v8, v8, 0, 0, v6);
  v10 = OBJC_IVAR____TtC8MapsSync20MapsSyncVehicleQuery__specifiedQuery;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync20MapsSyncVehicleQuery__specifiedQuery] = v9;
  swift_release();
  *(_QWORD *)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_genericQuery] = *(_QWORD *)&v8[v10];
  swift_retain();
  swift_unknownObjectRelease();
  v11 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  v12 = *(void **)&v8[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock];
  v13 = v8;
  objc_msgSend(v12, sel_lock);
  v13[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete] = 1;
  objc_msgSend(*(id *)&v8[v11], sel_unlock);

  swift_unknownObjectRelease();
  return v13;
}

id MapsSyncVehicleQuery.__allocating_init(delegate:)(uint64_t a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(v1), sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

id MapsSyncVehicleQuery.init(delegate:)(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(v1, sel_initWithOptions_delegate_, 0, a1);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1A4236864(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BBB198, (void (*)(_QWORD, _QWORD))sub_1A42375C8);
}

void sub_1A423691C(uint64_t a1, uint64_t a2)
{
  id v3;

  type metadata accessor for MapsSyncVehicle();
  v3 = (id)sub_1A423C1B8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t sub_1A4236970(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BBB1C0, (void (*)(_QWORD, _QWORD))sub_1A4237DDC);
}

uint64_t sub_1A4236984(unint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  id v12;
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = MEMORY[0x1E0DEE9D8];
  if (!v5)
  {
LABEL_12:
    a3(v6);
    return swift_bridgeObjectRelease();
  }
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v5 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = v8 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncVehicle();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v8 = v9;
      }
      while (v5 != v9);
    }
    else
    {
      v10 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncVehicle();
      do
      {
        v11 = *v10++;
        swift_dynamicCastClassUnconditional();
        v12 = v11;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v5;
      }
      while (v5);
    }
    v6 = v13;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4236BEC(uint64_t a1, uint64_t a2)
{
  return sub_1A40F3930(a1, a2, (uint64_t)&unk_1E4BBB1E8, (void (*)(_QWORD, _QWORD))sub_1A42375D0);
}

void sub_1A4236CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  type metadata accessor for MapsSyncVehicle();
  v5 = (void *)sub_1A423C1B8();
  if (a2)
    v6 = sub_1A423BEB8();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_1A4236D24(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1A40F3A50(a1, a2, a3, (uint64_t)&unk_1E4BBB210, (void (*)(_QWORD, _QWORD))sub_1A4237DE0);
}

uint64_t sub_1A4236D38(unint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  id v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1A423C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = MEMORY[0x1E0DEE9D8];
  if (!v6)
  {
LABEL_12:
    a3(v7, a2);
    return swift_bridgeObjectRelease();
  }
  v14 = MEMORY[0x1E0DEE9D8];
  result = sub_1A423C62C();
  if ((v6 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v9 = 0;
      do
      {
        v10 = v9 + 1;
        MEMORY[0x1A859B6A0]();
        type metadata accessor for MapsSyncVehicle();
        swift_dynamicCastClassUnconditional();
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        v9 = v10;
      }
      while (v6 != v10);
    }
    else
    {
      v11 = (void **)(a1 + 32);
      type metadata accessor for MapsSyncVehicle();
      do
      {
        v12 = *v11++;
        swift_dynamicCastClassUnconditional();
        v13 = v12;
        sub_1A423C614();
        sub_1A423C638();
        sub_1A423C644();
        sub_1A423C620();
        --v6;
      }
      while (v6);
    }
    v7 = v14;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4237054()
{
  return swift_release();
}

id MapsSyncVehicleQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncVehicleQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A42370A4(void *a1, void *a2, char *a3, void *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t ObjectType;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  id v40;
  uint64_t v41;

  v39 = a6;
  v33 = a5;
  v35 = a4;
  v36 = a3;
  v40 = a2;
  v34 = a1;
  v37 = sub_1A423C374();
  v8 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A423C35C();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v11);
  v13 = sub_1A423C0D4();
  MEMORY[0x1E0C80A78](v13);
  v38 = a7 + 24;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 32) = 0;
  v32 = a7 + 40;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 48) = 0;
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1AC4A0);
  sub_1A423C0C8();
  v41 = MEMORY[0x1E0DEE9D8];
  sub_1A40D0EE8((unint64_t *)&qword_1ED1AC490, v12, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC430);
  sub_1A413FED0((unint64_t *)&qword_1ED1AC440, (uint64_t *)&unk_1ED1AC430);
  sub_1A423C4A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF8D0], v37);
  *(_QWORD *)(a7 + 56) = sub_1A423C398();
  swift_unknownObjectWeakInit();
  sub_1A423BF90();
  *(_QWORD *)(a7 + qword_1ED1ACB40) = 0;
  *(_BYTE *)(a7 + qword_1ED1AC138) = 0;
  v14 = qword_1ED1AC120;
  *(_QWORD *)(a7 + v14) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v15 = a7 + qword_1ED1AB758;
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  *(_BYTE *)(a7 + qword_1ED1ABA50) = 0;
  result = swift_unknownObjectWeakAssign();
  if ((v39 & 1) != 0)
  {
    if ((byte_1EE70EEE8 & 1) != 0)
    {
      v17 = v36;
      if (qword_1EE70E270 != -1)
        result = swift_once();
      v18 = &qword_1EE70EEE0;
    }
    else
    {
      v17 = v36;
      if (qword_1ED1AB520 != -1)
        result = swift_once();
      v18 = &qword_1ED1AB4E8;
    }
  }
  else if ((byte_1EE70EEE8 & 1) != 0)
  {
    v17 = v36;
    if (qword_1EE70E268 != -1)
      result = swift_once();
    v18 = &qword_1EE70EED8;
  }
  else
  {
    v17 = v36;
    if (qword_1ED1AC908 != -1)
      result = swift_once();
    v18 = qword_1ED1AC168;
  }
  v19 = (void *)*v18;
  *(_QWORD *)(a7 + 16) = *v18;
  if (*(_QWORD *)&v17[OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate])
  {
    swift_unknownObjectWeakAssign();
    v20 = v35;
    swift_unknownObjectWeakAssign();
    v21 = *(void **)(a7 + 48);
    v22 = v34;
    *(_QWORD *)(a7 + 48) = v34;
    v23 = v19;
    v24 = v22;

    *(_BYTE *)(a7 + 64) = v33 & 1;
    ObjectType = swift_getObjectType();
    v26 = (*(uint64_t (**)(void))(ObjectType + 384))();
    v27 = swift_allocObject();
    swift_weakInit();
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v27;
    *(_QWORD *)(v28 + 24) = v22;
    v29 = v24;
    swift_retain();
    sub_1A42324FC(0, (uint64_t)sub_1A42376DC, v28);
    swift_release();
    swift_release();
    v30 = swift_allocObject();
    swift_weakInit();
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v30;
    *(_QWORD *)(v31 + 24) = v26;
    swift_retain();
    sub_1A42324FC(0, (uint64_t)sub_1A4237728, v31);
    swift_release();
    swift_release();

    return a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A42375A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A42375C8(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4236984(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t sub_1A42375D0(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A4236D38(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t type metadata accessor for MapsSyncVehicleQuery()
{
  return objc_opt_self();
}

uint64_t method lookup function for MapsSyncVehicleQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MapsSyncVehicleQuery.__allocating_init(options:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 600))();
}

uint64_t dispatch thunk of MapsSyncVehicleQuery.fetchContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of MapsSyncVehicleQuery.fetchContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of MapsSyncVehicleQuery.fetchQueryContents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of MapsSyncVehicleQuery.fetchQueryContents(callbackQueue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t sub_1A423767C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A42376A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A4236CA4(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1A42376A8(uint64_t a1)
{
  uint64_t v1;

  sub_1A423691C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A42376B0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1A42376DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422D98C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (void (*)(uint64_t, uint64_t, uint64_t))sub_1A4235750);
}

uint64_t sub_1A42376FC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A4237728(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A422DA60(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD **)(v2 + 24), (uint64_t (*)(_QWORD))type metadata accessor for MapsSyncManagedVehicle, (uint64_t)&unk_1E4BBB378, (uint64_t)sub_1A4237758);
}

uint64_t sub_1A4237758()
{
  return sub_1A422F1FC();
}

uint64_t sub_1A4237760(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBB378, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_47);
}

uint64_t sub_1A4237790()
{
  return sub_1A410AFC8();
}

uint64_t sub_1A42377AC()
{
  uint64_t v0;

  return sub_1A410ABA8(*(uint64_t (**)(uint64_t, _QWORD))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1A42377BC()
{
  return sub_1A422F0A4();
}

uint64_t sub_1A42377C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBB530, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_87_0);
}

uint64_t sub_1A42377FC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A4237820()
{
  return sub_1A422EF4C();
}

uint64_t sub_1A4237828(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBB698, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_123);
}

uint64_t sub_1A4237860()
{
  return sub_1A422EDF4();
}

uint64_t sub_1A4237868(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBB800, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_159_0);
}

uint64_t sub_1A42378A0()
{
  return sub_1A422EC9C();
}

uint64_t sub_1A42378A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBB968, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_195);
}

uint64_t sub_1A42378E0()
{
  return sub_1A422EB44();
}

uint64_t sub_1A42378E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBBAD0, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_231);
}

uint64_t sub_1A4237920()
{
  return sub_1A422E9EC();
}

uint64_t sub_1A4237928(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBBC38, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_267);
}

uint64_t sub_1A4237960()
{
  return sub_1A422E894();
}

uint64_t sub_1A4237968(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBBDA0, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_303);
}

uint64_t sub_1A42379A0()
{
  return sub_1A422E73C();
}

uint64_t sub_1A42379A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBBF08, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_339);
}

uint64_t sub_1A42379E0()
{
  return sub_1A422E5E4();
}

uint64_t sub_1A42379E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC070, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_375);
}

uint64_t sub_1A4237A20()
{
  return sub_1A422E48C();
}

uint64_t sub_1A4237A28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC1D8, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_411);
}

uint64_t sub_1A4237A60()
{
  return sub_1A422E334();
}

uint64_t sub_1A4237A68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC340, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_447);
}

uint64_t sub_1A4237AA0()
{
  return sub_1A422E1DC();
}

uint64_t sub_1A4237AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC4A8, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_483);
}

uint64_t sub_1A4237AE0()
{
  return sub_1A422E084();
}

uint64_t sub_1A4237AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC610, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_519);
}

uint64_t sub_1A4237B20()
{
  return sub_1A422DF2C();
}

uint64_t sub_1A4237B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A42363A0(a1, a2, v2, (uint64_t)&unk_1E4BBC778, (uint64_t)sub_1A4237790, (uint64_t)&block_descriptor_555);
}

id sub_1A4237E40()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedUserRoute();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedUserRoute()
{
  return objc_opt_self();
}

uint64_t sub_1A4237E90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MapsSyncManagedUserRoute();
  result = sub_1A423C5D8();
  *a1 = result;
  return result;
}

id HistoryCuratedCollectionRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HistoryCuratedCollectionRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id HistoryCuratedCollectionRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for HistoryCuratedCollection();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSHistoryCuratedCollectionRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id HistoryCuratedCollectionRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for HistoryCuratedCollection();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSHistoryCuratedCollectionRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for HistoryCuratedCollectionRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for HistoryCuratedCollectionRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A4238124()
{
  return sub_1A42381EC();
}

uint64_t sub_1A42381EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSHistoryCuratedCollectionRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for HistoryCuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for HistoryCuratedCollection();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42384B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A42384CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A4238524;
  return sub_1A41EB994(0);
}

uint64_t sub_1A4238524(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4238598()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for HistoryCuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for HistoryCuratedCollection();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A42388A0(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A4238918;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A4238918()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for HistoryCuratedCollection();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A42389E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A42389FC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A4238A58;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A4238A58(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4238ACC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for HistoryCuratedCollection();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for HistoryCuratedCollection();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4238DE8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A4238E74;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A4238E74()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for HistoryCuratedCollection();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A4238F4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4238F64()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A42390D8(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A4239120()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A4239178(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A4239190()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A423931C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A4239370()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id HistoryCuratedCollectionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HistoryCuratedCollectionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HistoryCuratedCollectionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of HistoryCuratedCollectionRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A4239634()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710BF8 + dword_1EE710BF8))(v2, v3, v4);
}

uint64_t sub_1A42396AC()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710C08 + dword_1EE710C08))(v2, v3);
}

uint64_t sub_1A423971C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710C18 + dword_1EE710C18))(v2, v3, v4);
}

uint64_t sub_1A4239794()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710C28 + dword_1EE710C28))(v2, v3);
}

id AnonymousCredentialRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AnonymousCredentialRequest.init()()
{
  void *v0;

  if (qword_1ED1AB880 != -1)
    swift_once();
  return objc_msgSend(v0, sel_initWithStore_, qword_1ED1AB9F0);
}

id AnonymousCredentialRequest.__allocating_init(store:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = type metadata accessor for AnonymousCredential();
  type metadata accessor for MapsSyncRequest();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v4;
  *(_QWORD *)&v3[OBJC_IVAR___MSAnonymousCredentialRequest__request] = v5;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id AnonymousCredentialRequest.init(store:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = type metadata accessor for AnonymousCredential();
  type metadata accessor for MapsSyncRequest();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)&v1[OBJC_IVAR___MSAnonymousCredentialRequest__request] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for AnonymousCredentialRequest();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for AnonymousCredentialRequest()
{
  return objc_opt_self();
}

uint64_t sub_1A4239A54()
{
  return sub_1A4239B1C();
}

uint64_t sub_1A4239B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR___MSAnonymousCredentialRequest__request);
  v3 = sub_1A41EC050();
  if (v1)
    return v2;
  v4 = v3;
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_4;
LABEL_20:
    swift_bridgeObjectRelease();
    v2 = v10;
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v5 = result;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v5 >= 1)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        MEMORY[0x1A859B6A0](i, v4);
        type metadata accessor for AnonymousCredential();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      type metadata accessor for AnonymousCredential();
      for (j = 0; j != v5; ++j)
      {
        v9 = *(void **)(v4 + 8 * j + 32);
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v9);
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
      }
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A4239DE4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A4239DFC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A4239E54;
  return sub_1A41EB994(0);
}

uint64_t sub_1A4239E54(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A4239EC8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 32));
        type metadata accessor for AnonymousCredential();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 32) + 32);
      type metadata accessor for AnonymousCredential();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A423A1D0(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1A423A248;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_1A423A248()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_1A423BEB8();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    type metadata accessor for AnonymousCredential();
    v7 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1A423A314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A423A32C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A423A388;
  return sub_1A41EB994(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A423A388(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1A423A3FC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void **v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 40);
  v7 = MEMORY[0x1E0DEE9D8];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  swift_bridgeObjectRetain();
  result = sub_1A423C728();
  v2 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v2 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1A859B6A0](i, *(_QWORD *)(v0 + 40));
        type metadata accessor for AnonymousCredential();
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250]();
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      v5 = (void **)(*(_QWORD *)(v0 + 40) + 32);
      type metadata accessor for AnonymousCredential();
      do
      {
        v6 = *v5;
        if (swift_dynamicCastClass())
        {
          MEMORY[0x1A859B250](v6);
          if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A423C1F4();
          sub_1A423C224();
          sub_1A423C1DC();
        }
        ++v5;
        --v2;
      }
      while (v2);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A423A718(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1A423A7A4;
  v8[2] = a1;
  v8[3] = v7;
  return swift_task_switch();
}

uint64_t sub_1A423A7A4()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_1A423BEB8();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    type metadata accessor for AnonymousCredential();
    v8 = sub_1A423C1B8();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1A423A87C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1A423A894()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2BF4;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A423AA08(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_1A423AA50()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2E04;
  return sub_1A41ECAC4(0);
}

uint64_t sub_1A423AAA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1A423AAC0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D2F84;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A423AC4C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch();
}

uint64_t sub_1A423ACA0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1A40D31B8;
  return sub_1A41ECAC4(*(_QWORD *)(v0 + 16));
}

id AnonymousCredentialRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnonymousCredentialRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AnonymousCredentialRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.__allocating_init(store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.fetchSync()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.fetchSync(options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.fetch(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D394C;
  return v7(a1);
}

uint64_t dispatch thunk of AnonymousCredentialRequest.count()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1A40D394C;
  return v5();
}

uint64_t dispatch thunk of AnonymousCredentialRequest.count(options:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3558;
  return v7(a1);
}

uint64_t sub_1A423AF64()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710CA8 + dword_1EE710CA8))(v2, v3, v4);
}

uint64_t sub_1A423AFD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1A40D3948;
  return v6();
}

uint64_t sub_1A423B028(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1A40D3948;
  return v7();
}

uint64_t sub_1A423B080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1A423C29C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1A423C290();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1A423B1C4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A423C26C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1A423B1C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1ABA28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A423B204(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1A423B268;
  return v6(a1);
}

uint64_t sub_1A423B268()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A423B2B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A423B2D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A40D3618;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE710CC8 + dword_1EE710CC8))(a1, v4);
}

uint64_t sub_1A423B34C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710CD8 + dword_1EE710CD8))(v2, v3);
}

uint64_t sub_1A423B3BC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1A40D3948;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EE710CF8 + dword_1EE710CF8))(v2, v3, v4);
}

uint64_t sub_1A423B434()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1A40D3948;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EE710D18 + dword_1EE710D18))(v2, v3);
}

id MapsSyncMapItemWithClientAttributes(mapItemStorage:identifier:classType:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  objc_class *ObjCClassFromMetadata;
  id v16;
  NSString *v17;
  void *v18;
  id v19;
  uint64_t v21;
  id v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1;
  v8 = objc_msgSend(v7, sel__clientAttributes);
  if (!v8)
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D271B0]), sel_init);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D271C8]), sel_init);
  if (v9)
  {
    sub_1A423B718(a2, (uint64_t)v6);
    v10 = sub_1A423BFE4();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10);
    v13 = v9;
    if (v12 == 1)
    {
      sub_1A40ECAAC((uint64_t)v6);
      v14 = 0;
    }
    else
    {
      sub_1A423BFB4();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
      v14 = (void *)sub_1A423C140();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v13, sel_setMapsSyncIdentifier_, v14);

    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v16 = v13;
    v17 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v17)
    {
      sub_1A423C14C();
      v17 = (NSString *)sub_1A423C140();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v16, sel_setMapsSyncObjectType_, v17);

  }
  objc_msgSend(v8, sel_setMapsSyncAttributes_, v9);
  v18 = (void *)objc_opt_self();
  v22 = v7;
  v19 = objc_msgSend(v18, sel_mapItemStorageForGEOMapItem_clientAttributes_, v22, v8);

  if (v19)
    return v19;
  else
    return v22;
}

uint64_t sub_1A423B718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id MapsSyncCategoryForMapItem(mapItem:)(void *a1)
{
  swift_getObjectType();
  return sub_1A42054F4(a1);
}

Swift::Bool __swiftcall MapsSyncIsHostedByMapsSyncDaemon()()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (!v1)
    return 0;
  v2 = sub_1A423C14C();
  v4 = v3;

  if (v2 == 0xD000000000000018 && v4 == 0x80000001A424B380)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

Swift::Bool __swiftcall MapsSyncIsHostedByMapsApp()()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  Swift::Bool result;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (!v2)
  {
    sub_1A423C14C();
    goto LABEL_10;
  }
  v3 = sub_1A423C14C();
  v5 = v4;

  v6 = sub_1A423C14C();
  if (!v5)
  {
LABEL_10:
    swift_bridgeObjectRelease();
LABEL_11:
    v10 = objc_msgSend(v0, sel_mainBundle);
    v11 = objc_msgSend(v10, sel_bundleIdentifier);

    if (!v11)
      return 0;
    v12 = sub_1A423C14C();
    v14 = v13;

    if (v12 != 0xD000000000000012 || v14 != 0x80000001A424B340)
    {
      v15 = sub_1A423C7B8();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v15 & 1) == 0)
        return result;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v3 != v6 || v5 != v7)
  {
    v9 = sub_1A423C7B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      goto LABEL_19;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_bridgeObjectRelease();
LABEL_19:
  v17 = (void *)objc_opt_self();
  v18 = objc_msgSend(v17, sel_processInfo);
  v19 = objc_msgSend(v18, sel_processName);

  v20 = sub_1A423C14C();
  v22 = v21;

  if (v20 == 1936744781 && v22 == 0xE400000000000000)
    goto LABEL_24;
  v23 = sub_1A423C7B8();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
    return 1;
  v24 = objc_msgSend(v17, sel_processInfo);
  v25 = objc_msgSend(v24, sel_processName);

  v26 = sub_1A423C14C();
  v28 = v27;

  if (v26 == 0x7370614D6F6E614ELL && v28 == 0xE800000000000000)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    return 1;
  }
  v29 = sub_1A423C7B8();
  swift_bridgeObjectRelease();
  return v29 & 1;
}

uint64_t MapsSyncObjectIdentifierForMapItem(mapItem:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v8;

  v3 = objc_msgSend(a1, sel__clientAttributes);
  if (v3
    && (v4 = v3, v5 = objc_msgSend(v3, sel_mapsSyncAttributes), v4, v5)
    && (v6 = objc_msgSend(v5, sel_mapsSyncIdentifier), v5, v6))
  {
    sub_1A423C14C();

    sub_1A423BFA8();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_1A423BFE4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a2, 1, 1, v8);
  }
}

double sub_1A423BC58()
{
  double result;

  result = *MEMORY[0x1E0D26650] + 20.0;
  *(double *)&qword_1ED1AA290 = result;
  return result;
}

double MapsSyncDeduplicationRadiusMeters.getter()
{
  if (qword_1ED1AA388 != -1)
    swift_once();
  return *(double *)&qword_1ED1AA290;
}

id MapsSyncClassTypeForMapItem(mapItem:)(void *a1)
{
  id result;
  void *v2;
  id v3;
  id v4;
  NSString *v5;
  Class v6;

  result = objc_msgSend(a1, sel__clientAttributes);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_mapsSyncAttributes);

    if (!v3)
      return 0;
    v4 = objc_msgSend(v3, sel_mapsSyncObjectType);

    if (!v4)
      return 0;
    sub_1A423C14C();

    v5 = (NSString *)sub_1A423C140();
    swift_bridgeObjectRelease();
    v6 = NSClassFromString(v5);

    if (v6)
      return (id)swift_getObjCClassMetadata();
    else
      return 0;
  }
  return result;
}

id sub_1A423BDDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedVehicle();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MapsSyncManagedVehicle()
{
  return objc_opt_self();
}

void MapsSyncSimulatedCrash_cold_1()
{
  dlerror();
  abort_report_np();
  sub_1A423BE4C();
}

uint64_t sub_1A423BE4C()
{
  return MEMORY[0x1E0CAE610]();
}

uint64_t sub_1A423BE58()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1A423BE64()
{
  return MEMORY[0x1E0CAE620]();
}

uint64_t sub_1A423BE70()
{
  return MEMORY[0x1E0CAE628]();
}

uint64_t sub_1A423BE7C()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1A423BE88()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1A423BE94()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A423BEA0()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A423BEAC()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A423BEB8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A423BEC4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A423BED0()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1A423BEDC()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1A423BEE8()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1A423BEF4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A423BF00()
{
  return MEMORY[0x1E0CAFE50]();
}

uint64_t sub_1A423BF0C()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1A423BF18()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1A423BF24()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A423BF30()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1A423BF3C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A423BF48()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1A423BF54()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A423BF60()
{
  return MEMORY[0x1E0CB0580]();
}

uint64_t sub_1A423BF6C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A423BF78()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1A423BF84()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A423BF90()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A423BF9C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A423BFA8()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1A423BFB4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A423BFC0()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1A423BFCC()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A423BFD8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A423BFE4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A423BFF0()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1A423BFFC()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1A423C008()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1A423C014()
{
  return MEMORY[0x1E0DEFCD0]();
}

uint64_t sub_1A423C020()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1A423C02C()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1A423C038()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1A423C044()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1A423C050()
{
  return MEMORY[0x1E0DF2148]();
}

uint64_t sub_1A423C05C()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1A423C068()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1A423C074()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1A423C080()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1A423C08C()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1A423C098()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1A423C0A4()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1A423C0B0()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1A423C0BC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A423C0C8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A423C0D4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A423C0E0()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A423C0EC()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A423C0F8()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1A423C104()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A423C110()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A423C11C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A423C128()
{
  return MEMORY[0x1E0DE9F18]();
}

uint64_t sub_1A423C134()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A423C140()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A423C14C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A423C158()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A423C164()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1A423C170()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A423C17C()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1A423C188()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A423C194()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A423C1A0()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1A423C1AC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A423C1B8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A423C1C4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A423C1D0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1A423C1DC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A423C1E8()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A423C1F4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A423C200()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A423C20C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A423C218()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A423C224()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A423C230()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1A423C23C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A423C248()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A423C254()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A423C260()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1A423C26C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A423C278()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1A423C284()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A423C290()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A423C29C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A423C2A8()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1A423C2B4()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1A423C2C0()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t sub_1A423C2CC()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1A423C2D8()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1A423C2E4()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1A423C2F0()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1A423C2FC()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1A423C308()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1A423C314()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1A423C320()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1A423C32C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1A423C338()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A423C344()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1A423C350()
{
  return MEMORY[0x1E0DEF808]();
}

uint64_t sub_1A423C35C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A423C368()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1A423C374()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A423C380()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A423C38C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A423C398()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A423C3A4()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1A423C3B0()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1A423C3BC()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1A423C3C8()
{
  return MEMORY[0x1E0DEFA60]();
}

uint64_t sub_1A423C3D4()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1A423C3E0()
{
  return MEMORY[0x1E0C977B8]();
}

uint64_t sub_1A423C3EC()
{
  return MEMORY[0x1E0C977C8]();
}

uint64_t sub_1A423C3F8()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1A423C404()
{
  return MEMORY[0x1E0C977E0]();
}

uint64_t sub_1A423C410()
{
  return MEMORY[0x1E0CB1FA0]();
}

uint64_t sub_1A423C41C()
{
  return MEMORY[0x1E0CB1FE8]();
}

uint64_t sub_1A423C428()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1A423C434()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1A423C440()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1A423C44C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A423C458()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1A423C464()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A423C470()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A423C47C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A423C488()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A423C494()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A423C4A0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A423C4AC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A423C4B8()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1A423C4C4()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1A423C4D0()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1A423C4DC()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1A423C4E8()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1A423C4F4()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1A423C500()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1A423C50C()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1A423C518()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1A423C524()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1A423C530()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1A423C53C()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1A423C548()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1A423C554()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1A423C560()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1A423C56C()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1A423C578()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A423C584()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1A423C590()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1A423C59C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A423C5A8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A423C5B4()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1A423C5C0()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A423C5CC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A423C5D8()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_1A423C5E4()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1A423C5F0()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A423C5FC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A423C608()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A423C614()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A423C620()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A423C62C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A423C638()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A423C644()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A423C650()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1A423C65C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A423C668()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t sub_1A423C674()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1A423C680()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t sub_1A423C68C()
{
  return MEMORY[0x1E0DECB58]();
}

uint64_t sub_1A423C698()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t sub_1A423C6A4()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t sub_1A423C6B0()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1A423C6BC()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t sub_1A423C6C8()
{
  return MEMORY[0x1E0DECB98]();
}

uint64_t sub_1A423C6D4()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1A423C6E0()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1A423C6EC()
{
  return MEMORY[0x1E0DECBC0]();
}

uint64_t sub_1A423C6F8()
{
  return MEMORY[0x1E0DECBD8]();
}

uint64_t sub_1A423C704()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A423C710()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A423C71C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1A423C728()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A423C734()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1A423C740()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A423C74C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A423C758()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1A423C764()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A423C770()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A423C77C()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A423C788()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1A423C794()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1A423C7A0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A423C7AC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A423C7B8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A423C7C4()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1A423C7D0()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1A423C7DC()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1A423C7E8()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1A423C7F4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A423C800()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A423C80C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A423C818()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A423C824()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A423C830()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A423C83C()
{
  return MEMORY[0x1E0CB2688]();
}

uint64_t sub_1A423C848()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1A423C854()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1A423C860()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A423C86C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A423C878()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1A423C884()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1A423C890()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1A423C89C()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1A423C8A8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A423C8B4()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1A423C8C0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return MEMORY[0x1E0D01510]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1E0D26498]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x1E0D264B8]();
}

uint64_t GEOConfigGetUint64()
{
  return MEMORY[0x1E0D264D8]();
}

uint64_t GEOCoordinateRegionMakeWithDistance()
{
  return MEMORY[0x1E0D26548]();
}

uint64_t GEOMapItemIsEqualToMapItemForPurpose()
{
  return MEMORY[0x1E0D26658]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

