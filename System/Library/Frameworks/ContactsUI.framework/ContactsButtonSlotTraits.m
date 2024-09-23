@implementation ContactsButtonSlotTraits

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EDF9A190;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EDF9A190 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ContactsButtonSlotTraits *v5;

  v4 = a3;
  v5 = self;
  sub_18AD2B1C0(v4);

}

- (ContactsButtonSlotTraits)initWithCoder:(id)a3
{
  ContactsButtonSlotTraits *result;

  ContactsButtonSlotTraits.init(coder:)(a3);
  return result;
}

- (ContactsButtonSlotTraits)init
{
  return (ContactsButtonSlotTraits *)sub_18AD2BE48();
}

- (NSString)debugDescription
{
  ContactsButtonSlotTraits *v2;
  void *v3;

  v2 = self;
  sub_18AD2C0EC();

  v3 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
