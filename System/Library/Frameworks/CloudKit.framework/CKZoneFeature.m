@implementation CKZoneFeature

- (CKZoneFeature)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (CKZoneFeature *)sub_18A635EA0(&OBJC_IVAR___CKZoneFeature__wrapped, (Class *)&off_1E1F54598, v2, v3, v4, v5, v6, v7);
}

- (CKZoneFeature)initWithName:(id)a3 value:(id)a4
{
  CKZoneFeature *result;

  sub_18A6357D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKZoneFeature.init(name:value:));
  return result;
}

- (NSString)name
{
  return (NSString *)sub_18A6355D0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CKZoneFeature.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18A6355D0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CKZoneFeature.value.getter);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A637378(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKZoneFeature.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18A61E268(self, (uint64_t)a2, CKZoneFeature.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  self;
  CKZoneFeature.encode(with:)((NSCoder)v4);
}

- (CKZoneFeature)initWithCoder:(id)a3
{
  CKZoneFeature *result;

  CKZoneFeature.init(coder:)(a3);
  return result;
}

- (void).cxx_destruct
{
  sub_18A635E50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKZoneFeature__wrapped);
}

@end
