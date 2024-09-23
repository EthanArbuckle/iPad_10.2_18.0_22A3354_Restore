@implementation CPLPlaceAnnotation

- (CPLPlaceAnnotation)initWithCoder:(id)a3
{
  id v4;
  CPLPlaceAnnotation *v5;
  CPLPlaceAnnotation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPlaceAnnotation;
  v5 = -[CPLPlaceAnnotation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)placeLevel
{
  return self->_placeLevel;
}

- (void)setPlaceLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_placeLevel, 0);
}

@end
