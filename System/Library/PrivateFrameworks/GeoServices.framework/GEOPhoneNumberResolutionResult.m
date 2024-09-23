@implementation GEOPhoneNumberResolutionResult

- (GEOPhoneNumberResolutionResult)initWithLocationName:(id)a3
{
  id v5;
  GEOPhoneNumberResolutionResult *v6;
  GEOPhoneNumberResolutionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPhoneNumberResolutionResult;
  v6 = -[GEOPhoneNumberResolutionResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locationName, a3);

  return v7;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationName, 0);
}

@end
