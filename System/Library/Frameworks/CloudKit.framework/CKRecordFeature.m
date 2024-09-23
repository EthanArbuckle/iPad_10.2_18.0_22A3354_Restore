@implementation CKRecordFeature

- (CKRecordFeature)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (CKRecordFeature *)sub_18A635EA0(&OBJC_IVAR___CKRecordFeature__wrapped, (Class *)off_1E1F54278, v2, v3, v4, v5, v6, v7);
}

- (CKRecordFeature)initWithName:(id)a3 value:(id)a4
{
  CKRecordFeature *result;

  sub_18A6357D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))CKRecordFeature.init(name:value:));
  return result;
}

- (NSString)name
{
  return (NSString *)sub_18A6355D0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CKRecordFeature.name.getter);
}

- (NSString)value
{
  return (NSString *)sub_18A6355D0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))CKRecordFeature.value.getter);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A637378(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKRecordFeature.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18A61E268(self, (uint64_t)a2, CKRecordFeature.description.getter);
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
  CKRecordFeature.encode(with:)((NSCoder)v4);
}

- (CKRecordFeature)initWithCoder:(id)a3
{
  CKRecordFeature *result;

  CKRecordFeature.init(coder:)(a3);
  return result;
}

- (void).cxx_destruct
{
  sub_18A635E50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKRecordFeature__wrapped);
}

@end
