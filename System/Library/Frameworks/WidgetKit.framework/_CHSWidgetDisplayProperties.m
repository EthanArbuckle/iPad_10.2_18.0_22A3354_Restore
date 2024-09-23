@implementation _CHSWidgetDisplayProperties

- (_CHSWidgetDisplayProperties)initWithScale:(double)a3 colorGamut:(unint64_t)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CHSWidgetDisplayPropertiesCodable();
  return -[CHSWidgetDisplayProperties initWithScale:colorGamut:](&v7, sel_initWithScale_colorGamut_, a4, a3);
}

- (_CHSWidgetDisplayProperties)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CHSWidgetDisplayPropertiesCodable();
  return -[CHSWidgetDisplayProperties initWithCoder:](&v5, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CHSWidgetDisplayProperties)initWithDisplayConfiguration:(id)a3
{
  sub_190A1D8D8((uint64_t)self, (uint64_t)a2, a3);
}

- (_CHSWidgetDisplayProperties)initWithWidgetDisplayProperties:(id)a3
{
  sub_190A1D8D8((uint64_t)self, (uint64_t)a2, a3);
}

- (_CHSWidgetDisplayProperties)initWithSize:(CGSize)a3 scale:(double)a4 colorGamut:(unint64_t)a5
{
  _CHSWidgetDisplayProperties *result;

  result = (_CHSWidgetDisplayProperties *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
