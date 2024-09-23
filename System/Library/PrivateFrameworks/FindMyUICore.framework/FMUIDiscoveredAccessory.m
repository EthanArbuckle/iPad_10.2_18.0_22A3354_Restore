@implementation FMUIDiscoveredAccessory

- (FMUIDiscoveredAccessory)initWithIdentifier:(id)a3 productType:(int64_t)a4 productImage:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  FMUIDiscoveredAccessory *v12;
  uint64_t v14;

  v7 = sub_23BB889CC();
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB889B4();
  v11 = a5;
  v12 = (FMUIDiscoveredAccessory *)sub_23BAA95B4((uint64_t)v10, a4, a5);

  return v12;
}

- (FMUIDiscoveredAccessory)init
{
  FMUIDiscoveredAccessory *result;

  result = (FMUIDiscoveredAccessory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___FMUIDiscoveredAccessory_identifier;
  v4 = sub_23BB889CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
