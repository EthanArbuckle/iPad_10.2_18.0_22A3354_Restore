@implementation CKDeviceCapabilityCheckOptions

- (CKDeviceCapabilityCheckOptions)init
{
  return (CKDeviceCapabilityCheckOptions *)sub_18A60E188();
}

- (CKDeviceCapabilityCheckOptions)initWithExcludeDevicesWithoutCapabilityCheckingSupport:(BOOL)a3 excludeZoneAccessBefore:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDeviceCapabilityCheckOptions *result;
  uint64_t v12;

  v6 = sub_18A5F101C(&qword_1EDF6A680);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = type metadata accessor for Date();
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for Date();
    v10 = 1;
  }
  sub_18A5F1010((uint64_t)v8, v10, 1, v9);
  CKDeviceCapabilityCheckOptions.init(excludeDevicesWithoutCapabilityCheckingSupport:excludeZoneAccessBefore:)(a3, (uint64_t)v8);
  return result;
}

- (BOOL)excludeDevicesWithoutCapabilityCheckingSupport
{
  return CKDeviceCapabilityCheckOptions.excludeDevicesWithoutCapabilityCheckingSupport.getter() & 1;
}

- (NSDate)excludeZoneAccessBefore
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  Class isa;
  uint64_t v8;

  v2 = sub_18A5F101C(&qword_1EDF6A680);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  CKDeviceCapabilityCheckOptions.excludeZoneAccessBefore.getter((uint64_t)v4);
  v5 = type metadata accessor for Date();
  isa = 0;
  if (sub_18A5F105C((uint64_t)v4, 1, v5) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKDeviceCapabilityCheckOptions *v5;

  v4 = a3;
  v5 = self;
  CKDeviceCapabilityCheckOptions.encode(with:)((NSCoder)v4);

}

- (CKDeviceCapabilityCheckOptions)initWithCoder:(id)a3
{
  CKDeviceCapabilityCheckOptions *result;

  CKDeviceCapabilityCheckOptions.init(coder:)(a3);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  CKDeviceCapabilityCheckOptions *v3;
  void *v4;
  char *v6[4];

  v3 = self;
  CKDeviceCapabilityCheckOptions.copy(with:)((uint64_t)v3, v6);

  sub_18A608B00(v6, (uint64_t)v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_18A608B60((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A60F094(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapabilityCheckOptions.isEqual(_:));
}

- (NSString)description
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapabilityCheckOptions.description.getter);
}

- (void).cxx_destruct
{

}

@end
