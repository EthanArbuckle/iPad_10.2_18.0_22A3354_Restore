@implementation HomeFilter

- (int64_t)hash
{
  HomeFilter *v2;
  int64_t v3;

  v2 = self;
  v3 = HomeFilter.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_220A00F88(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))HomeFilter.isEqual(_:));
}

- (NSString)description
{
  HomeFilter *v2;
  void *v3;

  v2 = self;
  HomeFilter.description.getter();

  v3 = (void *)sub_220C98A60();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HomeFilter)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
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
  return (HomeFilter *)HomeFilter.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (HomeFilter)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeFilter();
  return -[HomeFilter initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
