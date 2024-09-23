@implementation GEOJunction

- (GEOJunction)initWithStep:(id)a3
{
  id v4;
  GEOJunction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *elementsData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOJunction;
  v5 = -[GEOJunction init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "geoStep");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maneuverType = objc_msgSend(v6, "maneuverType");

    v5->_drivingSide = objc_msgSend(v4, "drivingSide");
    objc_msgSend(v4, "geoStep");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_junctionType = objc_msgSend(v7, "junctionType");

    v8 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v4, "geoStep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "junctionElements");
    objc_msgSend(v4, "geoStep");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithBytes:length:", v10, 16 * objc_msgSend(v11, "junctionElementsCount"));
    v12 = objc_claimAutoreleasedReturnValue();
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v12;

  }
  return v5;
}

- (GEOJunction)initWithManeuverType:(int)a3 drivingSide:(int)a4
{
  GEOJunction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOJunction;
  result = -[GEOJunction init](&v7, sel_init);
  if (result)
  {
    result->_maneuverType = a3;
    result->_drivingSide = a4;
  }
  return result;
}

- (GEOJunction)initWithJunctionInfo:(id)a3
{
  id v4;
  GEOJunction *v5;
  uint64_t v6;
  NSData *elementsData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOJunction;
  v5 = -[GEOJunction init](&v9, sel_init);
  if (v5)
  {
    v5->_maneuverType = objc_msgSend(v4, "maneuverType");
    v5->_drivingSide = objc_msgSend(v4, "drivingSide");
    v5->_junctionType = objc_msgSend(v4, "junctionType");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v4, "junctionElements"), 16 * objc_msgSend(v4, "junctionElementsCount"));
    v6 = objc_claimAutoreleasedReturnValue();
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v6;

  }
  return v5;
}

- (GEOJunctionElement)elements
{
  return (GEOJunctionElement *)-[NSData bytes](self->_elementsData, "bytes");
}

- (unint64_t)numElements
{
  return -[NSData length](self->_elementsData, "length") >> 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOJunction)initWithCoder:(id)a3
{
  id v4;
  GEOJunction *v5;
  uint64_t v6;
  NSData *elementsData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOJunction;
  v5 = -[GEOJunction init](&v9, sel_init);
  if (v5)
  {
    v5->_maneuverType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ManeuverType"));
    v5->_drivingSide = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DrivingSide"));
    v5->_junctionType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("JunctionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ElementsData"));
    v6 = objc_claimAutoreleasedReturnValue();
    elementsData = v5->_elementsData;
    v5->_elementsData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *elementsData;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction maneuverType](self, "maneuverType"), CFSTR("ManeuverType"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction drivingSide](self, "drivingSide"), CFSTR("DrivingSide"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[GEOJunction junctionType](self, "junctionType"), CFSTR("JunctionType"));
  elementsData = self->_elementsData;
  if (elementsData)
    objc_msgSend(v5, "encodeObject:forKey:", elementsData, CFSTR("ElementsData"));

}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (int)junctionType
{
  return self->_junctionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsData, 0);
}

@end
