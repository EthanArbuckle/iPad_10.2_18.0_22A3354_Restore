@implementation MKMapItemIdentifier

- (MKMapItemIdentifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapItemIdentifier;

  return 0;
}

- (MKMapItemIdentifier)initWithIdentifierString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  MKMapItemIdentifier *v7;
  MKMapItemIdentifier *v8;
  MKMapItemIdentifier *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x1E0D271C0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMapsIdentifierString:", v5);

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)MKMapItemIdentifier;
    v7 = -[MKMapItemIdentifier init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_geoMapItemIdentifier, v6);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3
{
  MKMapItemIdentifier *v4;
  uint64_t v5;
  GEOMapItemIdentifier *geoMapItemIdentifier;
  MKMapItemIdentifier *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMapItemIdentifier;
  v4 = -[MKMapItemIdentifier init](&v9, sel_init);
  if (v4
    && (v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:", a3),
        geoMapItemIdentifier = v4->_geoMapItemIdentifier,
        v4->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v5,
        geoMapItemIdentifier,
        v4->_geoMapItemIdentifier))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  MKMapItemIdentifier *v7;
  uint64_t v8;
  GEOMapItemIdentifier *geoMapItemIdentifier;
  MKMapItemIdentifier *v10;
  objc_super v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v12.receiver = self;
  v12.super_class = (Class)MKMapItemIdentifier;
  v7 = -[MKMapItemIdentifier init](&v12, sel_init);
  if (v7
    && (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:coordinate:", a3, latitude, longitude),
        geoMapItemIdentifier = v7->_geoMapItemIdentifier,
        v7->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v8,
        geoMapItemIdentifier,
        v7->_geoMapItemIdentifier))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  uint64_t v7;
  MKMapItemIdentifier *v9;
  uint64_t v10;
  GEOMapItemIdentifier *geoMapItemIdentifier;
  MKMapItemIdentifier *v12;
  objc_super v14;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v7 = *(_QWORD *)&a4;
  v14.receiver = self;
  v14.super_class = (Class)MKMapItemIdentifier;
  v9 = -[MKMapItemIdentifier init](&v14, sel_init);
  if (v9
    && (v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:resultProviderID:coordinate:", a3, v7, latitude, longitude), geoMapItemIdentifier = v9->_geoMapItemIdentifier, v9->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v10, geoMapItemIdentifier, v9->_geoMapItemIdentifier))
  {
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MKMapItemIdentifier)initWithGEOMapItemIdentifier:(id)a3
{
  id v5;
  MKMapItemIdentifier *v6;
  MKMapItemIdentifier *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)MKMapItemIdentifier,
        v6 = -[MKMapItemIdentifier init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_geoMapItemIdentifier, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifierString
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[GEOMapItemIdentifier mapsIdentifierString](self->_geoMapItemIdentifier, "mapsIdentifierString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E20DFC00;
  v4 = v2;

  return v4;
}

- (unint64_t)muid
{
  return -[GEOMapItemIdentifier muid](self->_geoMapItemIdentifier, "muid");
}

- (id)geoMapItemIdentifier
{
  return self->_geoMapItemIdentifier;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MKMapItemIdentifier %p { %@ }>"), self, self->_geoMapItemIdentifier);
}

- (unint64_t)hash
{
  return -[GEOMapItemIdentifier hash](self->_geoMapItemIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MKMapItemIdentifier *v4;
  MKMapItemIdentifier *v5;
  char v6;

  v4 = (MKMapItemIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[GEOMapItemIdentifier isEqual:](self->_geoMapItemIdentifier, "isEqual:", v5->_geoMapItemIdentifier);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_geoMapItemIdentifier, CFSTR("MKIdentifier"));
}

- (MKMapItemIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MKMapItemIdentifier *v6;
  MKMapItemIdentifier *v7;
  MKMapItemIdentifier *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKMapItemIdentifier;
    v6 = -[MKMapItemIdentifier init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_geoMapItemIdentifier, v5);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemIdentifier, 0);
}

@end
