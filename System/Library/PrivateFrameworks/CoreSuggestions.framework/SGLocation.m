@implementation SGLocation

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 accuracy:(double)a9 quality:(double)a10
{
  return -[SGLocation initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](self, "initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", a3, a4, a5, a6, a7, a8, NAN, NAN, a9, a10, 0);
}

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 airportCode:(id)a7 latitude:(double)a8 longitude:(double)a9 accuracy:(double)a10 quality:(double)a11
{
  return -[SGLocation initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](self, "initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", a3, a4, a5, a6, 0, a7, a8, a9, a10, a11, 0);
}

- (SGLocation)initWithLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6 handle:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  SGLocation *v22;

  v12 = a7;
  v13 = a3;
  objc_msgSend(v13, "recordId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "origin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "locationType");
  objc_msgSend(v13, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "address");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "airportCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quality");
  v21 = v20;

  v22 = -[SGLocation initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](self, "initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v14, v15, v16, v17, v18, v19, a4, a5, a6, v21, v12);
  return v22;
}

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 latitude:(double)a9 longitude:(double)a10 accuracy:(double)a11 quality:(double)a12 handle:(id)a13
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  SGLocation *v34;
  SGLocation *v35;
  uint64_t v36;
  NSString *label;
  uint64_t v38;
  NSString *address;
  uint64_t v40;
  NSString *airportCode;
  uint64_t v42;
  NSData *handle;
  void *v45;
  void *v46;
  objc_super v47;

  v24 = a3;
  v25 = a4;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a13;
  if (a9 < -90.0 || a9 > 90.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGLocation.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isnan(latitude) || (-90 <= latitude && latitude <= 90)"));

  }
  if (a10 < -180.0 || a10 > 180.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGLocation.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isnan(longitude) || (-180 <= longitude && longitude <= 180)"));

  }
  v30 = fabs(a11);
  if (v30 >= INFINITY && v30 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGLocation.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(accuracy)"));

  }
  v32 = fabs(a12);
  if (v32 >= INFINITY && v32 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGLocation.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(quality)"));

  }
  v47.receiver = self;
  v47.super_class = (Class)SGLocation;
  v34 = -[SGObject initWithRecordId:origin:](&v47, sel_initWithRecordId_origin_, v24, v25);
  v35 = v34;
  if (v34)
  {
    v34->_locationType = a5;
    v36 = objc_msgSend(v26, "copy");
    label = v35->_label;
    v35->_label = (NSString *)v36;

    v38 = objc_msgSend(v27, "copy");
    address = v35->_address;
    v35->_address = (NSString *)v38;

    v40 = objc_msgSend(v28, "copy");
    airportCode = v35->_airportCode;
    v35->_airportCode = (NSString *)v40;

    v35->_latitude = a9;
    v35->_longitude = a10;
    v35->_accuracy = a11;
    v35->_quality = a12;
    v42 = objc_msgSend(v29, "copy");
    handle = v35->_handle;
    v35->_handle = (NSData *)v42;

  }
  return v35;
}

- (SGLocation)initWithCoder:(id)a3
{
  id v4;
  SGLocation *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  void *v9;
  uint64_t v10;
  NSString *address;
  void *v12;
  uint64_t v13;
  NSString *airportCode;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  NSData *handle;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGLocation;
  v5 = -[SGObject initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_locationType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("locationType"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("label"));
    v7 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("address"));
    v10 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("airportCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    airportCode = v5->_airportCode;
    v5->_airportCode = (NSString *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v5->_latitude = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v5->_longitude = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accuracy"));
    v5->_accuracy = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("quality"));
    v5->_quality = v18;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("handle"));
    v20 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSData *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGLocation;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_locationType, CFSTR("locationType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_airportCode, CFSTR("airportCode"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("accuracy"), self->_accuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("quality"), self->_quality);
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, CFSTR("handle"));

}

- (BOOL)isEqual:(id)a3
{
  SGLocation *v4;
  SGLocation *v5;
  BOOL v6;

  v4 = (SGLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGLocation isEqualToLocation:](self, "isEqualToLocation:", v5);

  return v6;
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4;
  NSString *address;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *airportCode;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSData *handle;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  char v19;
  NSString *label;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  BOOL v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SGLocation;
  if (!-[SGObject isEqualToSuggestion:](&v27, sel_isEqualToSuggestion_, v4))
    goto LABEL_26;
  if (-[SGLocation isGeocoded](self, "isGeocoded"))
  {
    if (self->_latitude != *((double *)v4 + 6) || self->_longitude != *((double *)v4 + 7))
      goto LABEL_26;
  }
  else if ((objc_msgSend(v4, "isGeocoded") & 1) != 0)
  {
LABEL_26:
    v25 = 0;
    goto LABEL_27;
  }
  address = self->_address;
  v6 = (NSString *)*((id *)v4 + 5);
  if (address == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = address;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_26;
  }
  airportCode = self->_airportCode;
  v11 = (NSString *)*((id *)v4 + 10);
  if (airportCode == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = airportCode;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_26;
  }
  handle = self->_handle;
  v16 = (NSData *)*((id *)v4 + 11);
  if (handle == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = handle;
    v19 = -[NSData isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_26;
  }
  label = self->_label;
  v21 = (NSString *)*((id *)v4 + 4);
  if (label == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = label;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_26;
  }
  if (self->_locationType != *((_QWORD *)v4 + 3) || self->_accuracy != *((double *)v4 + 8))
    goto LABEL_26;
  v25 = self->_quality == *((double *)v4 + 9);
LABEL_27:

  return v25;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_address, "hash");
  v4 = -[NSString hash](self->_airportCode, "hash");
  v5 = (unint64_t)self->_latitude - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return (unint64_t)self->_longitude - v5 + 32 * v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  double quality;
  double v7;
  int64_t v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    quality = self->_quality;
    v7 = *((double *)v5 + 9);
    if (quality >= v7)
      v8 = 1;
    else
      v8 = -1;
    if (quality >= v7 && quality <= v7)
    {
      v9 = -[NSString length](self->_label, "length");
      v10 = -[NSString length](self->_address, "length") + v9;
      v11 = objc_msgSend(*((id *)v5 + 4), "length");
      v12 = objc_msgSend(*((id *)v5 + 5), "length");
      if (v10 > v12 + v11)
        v13 = 1;
      else
        v13 = v8;
      if (v10 < v12 + v11)
        v13 = -1;
      if (v10 == v12 + v11)
        v8 = 0;
      else
        v8 = v13;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isGeocoded
{
  return 1;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGLocation@%0.2f/%0.2f label: '%@' address: '%@'>"), *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude, self->_label, self->_address);
}

- (BOOL)geocodeIsStart
{
  return -[SGLocation locationType](self, "locationType") != 3;
}

- (BOOL)geocodeIsEnd
{
  return -[SGLocation locationType](self, "locationType") != 2;
}

- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  SGLocation *v24;
  SGLocation *v26;

  v14 = a8;
  v15 = a4;
  v16 = a3;
  v26 = [SGLocation alloc];
  -[SGObject recordId](self, "recordId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGObject origin](self, "origin");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SGLocation locationType](self, "locationType");
  v20 = v16;
  if (!v16)
  {
    -[SGLocation label](self, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v15;
  if (!v15)
  {
    -[SGLocation address](self, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SGLocation airportCode](self, "airportCode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGLocation quality](self, "quality");
  v24 = -[SGLocation initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v26, "initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v17, v18, v19, v20, v21, v22, a5, a6, a7, v23, v14);

  if (!v15)
  {

    if (v16)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v16)
    goto LABEL_9;
LABEL_7:

  return v24;
}

- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6
{
  id v10;
  SGLocation *v11;

  v10 = a6;
  v11 = -[SGLocation initWithLocation:latitude:longitude:accuracy:handle:]([SGLocation alloc], "initWithLocation:latitude:longitude:accuracy:handle:", self, v10, a3, a4, a5);

  return v11;
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)address
{
  return self->_address;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)quality
{
  return self->_quality;
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (NSData)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_airportCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
