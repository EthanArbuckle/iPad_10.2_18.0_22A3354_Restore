@implementation MapsSyncMutableVehicle

- (_TtC8MapsSync22MapsSyncMutableVehicle)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedVehicle();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)colorHex
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_colorHex);
}

- (void)setColorHex:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setColorHex_);
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A41F6BEC((char *)self, (uint64_t)a2, (SEL *)&selRef_currentVehicleState);
}

- (void)setCurrentVehicleState:(id)a3
{
  sub_1A41F6D04((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setCurrentVehicleState_);
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A41F5A04((char *)self, (uint64_t)a2, (SEL *)&selRef_dateOfVehicleIngestion);
}

- (void)setDateOfVehicleIngestion:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A41F55E4);
}

- (NSString)displayName
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_displayName);
}

- (void)setDisplayName:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setDisplayName_);
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_headUnitBluetoothIdentifier);
}

- (void)setHeadUnitBluetoothIdentifier:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setHeadUnitBluetoothIdentifier_);
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_headUnitMacAddress);
}

- (void)setHeadUnitMacAddress:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setHeadUnitMacAddress_);
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_iapIdentifier);
}

- (void)setIapIdentifier:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setIapIdentifier_);
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A41F5A04((char *)self, (uint64_t)a2, (SEL *)&selRef_lastStateUpdateDate);
}

- (void)setLastStateUpdateDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A41F5C08);
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_licensePlate);
}

- (void)setLicensePlate:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setLicensePlate_);
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_lprPowerType);
}

- (void)setLprPowerType:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setLprPowerType_);
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_lprVehicleType);
}

- (void)setLprVehicleType:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setLprVehicleType_);
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_manufacturer);
}

- (void)setManufacturer:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setManufacturer_);
}

- (NSString)model
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_model);
}

- (void)setModel:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setModel_);
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_pairedAppIdentifier);
}

- (void)setPairedAppIdentifier:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setPairedAppIdentifier_);
}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A41F6BEC((char *)self, (uint64_t)a2, (SEL *)&selRef_powerByConnector);
}

- (void)setPowerByConnector:(id)a3
{
  sub_1A41F6D04((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setPowerByConnector_);
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_siriIntentsIdentifier);
}

- (void)setSiriIntentsIdentifier:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setSiriIntentsIdentifier_);
}

- (NSNumber)supportedConnectors
{
  return (NSNumber *)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_supportedConnectors);
}

- (void)setSupportedConnectors:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_setSupportedConnectors_, a3);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A41F6584((char *)self, (uint64_t)a2, (SEL *)&selRef_vehicleIdentifier);
}

- (void)setVehicleIdentifier:(id)a3
{
  sub_1A41F6698((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setVehicleIdentifier_);
}

- (NSNumber)vehicleType
{
  return (NSNumber *)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_vehicleType);
}

- (void)setVehicleType:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_setVehicleType_, a3);
}

- (NSNumber)year
{
  return (NSNumber *)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_year);
}

- (void)setYear:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncMutableVehicle__proxy), sel_setYear_, a3);
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A41F6BEC((char *)self, (uint64_t)a2, (SEL *)&selRef_preferredChargingNetworks);
}

- (void)setPreferredChargingNetworks:(id)a3
{
  sub_1A41F6D04((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setPreferredChargingNetworks_);
}

- (void).cxx_destruct
{

}

@end
