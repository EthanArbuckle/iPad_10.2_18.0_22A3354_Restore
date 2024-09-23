@implementation AMSCodableResponseDecoder

- (AMSCodableResponseDecoder)initWithRootClass:(Class)a3
{
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  return (AMSCodableResponseDecoder *)CodableResponseDecoder.init(rootClass:)(ObjCClassMetadata);
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5;
  AMSCodableResponseDecoder *v6;

  v5 = a3;
  v6 = self;
  sub_18C9541E0(v5);

  return v5;
}

- (AMSCodableResponseDecoder)init
{
  CodableResponseDecoder.init()();
}

@end
