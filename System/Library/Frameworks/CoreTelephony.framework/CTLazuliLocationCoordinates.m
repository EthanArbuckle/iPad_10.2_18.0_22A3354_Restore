@implementation CTLazuliLocationCoordinates

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliLocationCoordinates longitude](self, "longitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", longitude = %@"), v4);

  -[CTLazuliLocationCoordinates latitude](self, "latitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", latitude = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliLocationCoordinates:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  BOOL v15;

  v4 = a3;
  -[CTLazuliLocationCoordinates longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v4, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v7 == v9)
  {
    -[CTLazuliLocationCoordinates latitude](self, "latitude");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v4, "latitude");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v12 == v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliLocationCoordinates *v4;
  CTLazuliLocationCoordinates *v5;
  BOOL v6;

  v4 = (CTLazuliLocationCoordinates *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliLocationCoordinates isEqualToCTLazuliLocationCoordinates:](self, "isEqualToCTLazuliLocationCoordinates:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliLocationCoordinates *v4;

  v4 = +[CTLazuliLocationCoordinates allocWithZone:](CTLazuliLocationCoordinates, "allocWithZone:", a3);
  -[CTLazuliLocationCoordinates setLongitude:](v4, "setLongitude:", self->_longitude);
  -[CTLazuliLocationCoordinates setLatitude:](v4, "setLatitude:", self->_latitude);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_longitude, CFSTR("kLongitudeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_latitude, CFSTR("kLatitudeKey"));

}

- (CTLazuliLocationCoordinates)initWithCoder:(id)a3
{
  id v4;
  CTLazuliLocationCoordinates *v5;
  uint64_t v6;
  NSNumber *longitude;
  uint64_t v8;
  NSNumber *latitude;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliLocationCoordinates;
  v5 = -[CTLazuliLocationCoordinates init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLongitudeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLatitudeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v8;

  }
  return v5;
}

- (CTLazuliLocationCoordinates)initWithReflection:(const LocationCoordinates *)a3
{
  CTLazuliLocationCoordinates *v4;
  uint64_t v5;
  NSNumber *longitude;
  uint64_t v7;
  NSNumber *latitude;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliLocationCoordinates;
  v4 = -[CTLazuliLocationCoordinates init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var0);
    v5 = objc_claimAutoreleasedReturnValue();
    longitude = v4->_longitude;
    v4->_longitude = (NSNumber *)v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var1);
    v7 = objc_claimAutoreleasedReturnValue();
    latitude = v4->_latitude;
    v4->_latitude = (NSNumber *)v7;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
}

@end
