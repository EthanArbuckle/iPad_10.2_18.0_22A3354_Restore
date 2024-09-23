@implementation ASGeoCodeResult

- (ASGeoCodeResult)initWithAddress:(id)a3 location:(id)a4 updated:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASGeoCodeResult *v12;
  ASGeoCodeResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASGeoCodeResult;
  v12 = -[ASGeoCodeResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_address, a3);
    objc_storeStrong((id *)&v13->_location, a4);
    objc_storeStrong((id *)&v13->_updated, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CNPostalAddress *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updated, CFSTR("updated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));

}

- (ASGeoCodeResult)initWithCoder:(id)a3
{
  id v4;
  ASGeoCodeResult *v5;
  void *v6;
  CNPostalAddress *v7;
  void *v8;
  NSDate *v9;
  void *v10;
  CLLocation *v11;
  CNPostalAddress *address;
  CNPostalAddress *v13;
  NSDate *updated;
  NSDate *v15;
  CLLocation *location;
  ASGeoCodeResult *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASGeoCodeResult;
  v5 = -[ASGeoCodeResult init](&v19, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("address"));
    v7 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("updated"));
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("location"));
    v11 = (CLLocation *)objc_claimAutoreleasedReturnValue();

    if (!v7 || !v9)
    {

      v17 = 0;
      goto LABEL_7;
    }
    address = v5->_address;
    v5->_address = v7;
    v13 = v7;

    updated = v5->_updated;
    v5->_updated = v9;
    v15 = v9;

    location = v5->_location;
    v5->_location = v11;

  }
  v17 = v5;
LABEL_7:

  return v17;
}

- (CNPostalAddress)address
{
  return (CNPostalAddress *)objc_getProperty(self, a2, 8, 1);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)updated
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
