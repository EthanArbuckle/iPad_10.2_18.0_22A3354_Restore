@implementation CPPeoplePickerConfiguration

- (CPPeoplePickerConfiguration)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPPeoplePickerConfiguration_shareSheetSessionID);
  v4 = (objc_class *)type metadata accessor for PeoplePickerConfiguration();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CPPeoplePickerConfiguration init](&v6, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  CPPeoplePickerConfiguration *v4;
  CPPeoplePickerConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PeoplePickerConfiguration.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  void (*v3)(void);
  CPPeoplePickerConfiguration *v4;
  uint64_t v5;
  Swift::Int v6;

  Hasher.init()();
  v3 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v4 = self;
  v3();
  if (v5)
  {
    Hasher._combine(_:)(1u);
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v6 = Hasher.finalize()();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPeoplePickerConfiguration)initWithCoder:(id)a3
{
  id v3;
  CPPeoplePickerConfiguration *v4;

  v3 = a3;
  v4 = (CPPeoplePickerConfiguration *)specialized PeoplePickerConfiguration.init(coder:)();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  CPPeoplePickerConfiguration *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x58);
  v5 = a3;
  v6 = self;
  v7 = v4();
  if (v8)
  {
    v9 = MEMORY[0x1AF4480F4](v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = (id)MEMORY[0x1AF4480F4](0xD000000000000013, 0x80000001ACF83C40);
  objc_msgSend(v5, sel_encodeObject_forKey_, v9, v10);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
