@implementation WKTextExtractionEditable

- (NSString)label
{
  return (NSString *)sub_2354A1508();
}

- (NSString)placeholder
{
  return (NSString *)sub_2354A1508();
}

- (BOOL)isSecure
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isSecure);
}

- (BOOL)isFocused
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isFocused);
}

- (WKTextExtractionEditable)initWithLabel:(id)a3 placeholder:(id)a4 isSecure:(BOOL)a5 isFocused:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  objc_super v17;

  v9 = sub_2354A3AA4();
  v11 = v10;
  v12 = sub_2354A3AA4();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionEditable_label);
  *v13 = v9;
  v13[1] = v11;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionEditable_placeholder);
  *v14 = v12;
  v14[1] = v15;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isSecure) = a5;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___WKTextExtractionEditable_isFocused) = a6;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for WKTextExtractionEditable();
  return -[WKTextExtractionEditable init](&v17, sel_init);
}

- (WKTextExtractionEditable)init
{
  WKTextExtractionEditable *result;

  result = (WKTextExtractionEditable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2354A185C();
}

@end
