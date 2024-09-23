@implementation HomeAttributeValue

- (BOOL)isEqual:(id)a3
{
  return sub_220A00F88(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))HomeAttributeValue.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_2208DB9D8(self, (uint64_t)a2, (void (*)(void))HomeAttributeValue.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HomeAttributeValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v6 = sub_220C98A84();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_220C98A84();
  v11 = v10;
  if (a5)
  {
    v12 = sub_220C98A84();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  return (HomeAttributeValue *)HomeAttributeValue.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (HomeAttributeValue)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeAttributeValue();
  return -[HomeAttributeValue initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
