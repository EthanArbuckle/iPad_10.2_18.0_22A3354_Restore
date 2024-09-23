@implementation CNPostalAddressValueTransformer

+ (Class)transformedValueClass
{
  sub_233168668(0, &qword_254247E48);
  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_23320C60C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))CNPostalAddressValueTransformer.transformedValue(_:));
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_23320C60C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr, _OWORD *))CNPostalAddressValueTransformer.reverseTransformedValue(_:));
}

- (_TtC10FinanceKit31CNPostalAddressValueTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CNPostalAddressValueTransformer init](&v3, sel_init);
}

@end
