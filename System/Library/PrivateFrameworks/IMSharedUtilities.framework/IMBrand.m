@implementation IMBrand

+ (id)brandWithBSBrand:(id)a3
{
  if (qword_1EE504468 != -1)
    dispatch_once(&qword_1EE504468, &unk_1E3FB3C68);
  return -[_IMBSBrand _initWithBSBrand:]([_IMBSBrand alloc], "_initWithBSBrand:", a3);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMBrand;
  return -[IMBrand init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMBrand;
  -[IMBrand dealloc](&v3, sel_dealloc);
}

- (NSString)brandURI
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (NSString)primaryPhoneNumber
{
  return 0;
}

- (BOOL)isVerified
{
  return 0;
}

- (NSString)localizedResponseTime
{
  return 0;
}

- (NSData)logoFingerprint
{
  return 0;
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD, CGSize, __n128))a4 + 2))(a4, 0, 0, a3, *(__n128 *)&a3.height);
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD, CGSize, __n128))a4 + 2))(a4, 0, 0, a3, *(__n128 *)&a3.height);
}

- (void)clearCachedAssets:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (id)placeholderNameForBrandURI:(id)a3
{
  if (!MEMORY[0x1A1AE7CF8](a3, a2))
    return a3;
  if (qword_1EE504468 != -1)
    dispatch_once(&qword_1EE504468, &unk_1E3FB3C68);
  return (id)MEMORY[0x1E0DE7D20](qword_1EE504470, sel_placeholderName);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD, CGSize, __n128))a6 + 2))(a6, 0, 0, a4, *(__n128 *)&a4.height);
}

- (void)_setBrand:(id)a3
{
  BSBrand *brand;

  brand = self->_brand;
  if (brand != a3)
  {

    self->_brand = (BSBrand *)a3;
  }
}

- (BSBrand)brand
{
  return self->_brand;
}

@end
