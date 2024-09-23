@implementation SGStorageLocation

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 accuracy:(double)a7 quality:(double)a8
{
  return -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](self, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", *(_QWORD *)&a3, a4, a5, a6, 0, NAN, NAN, a7, a8);
}

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 airportCode:(id)a5 latitude:(double)a6 longitude:(double)a7 accuracy:(double)a8 quality:(double)a9
{
  return -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](self, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", *(_QWORD *)&a3, a4, 0, a5, 0, a6, a7, a8, a9);
}

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 latitude:(double)a7 longitude:(double)a8 accuracy:(double)a9 quality:(double)a10 handle:(id)a11
{
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  SGStorageLocation *v29;
  SGStorageLocation *v30;
  uint64_t v31;
  NSString *label;
  uint64_t v33;
  NSString *address;
  uint64_t v35;
  NSString *airportCode;
  uint64_t v37;
  NSData *handle;
  void *v40;
  void *v41;
  objc_super v42;

  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a11;
  if (a7 < -90.0 || a7 > 90.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageLocation.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isnan(latitude) || (-90 <= latitude && latitude <= 90)"));

  }
  if (a8 < -180.0 || a8 > 180.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageLocation.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isnan(longitude) || (-180 <= longitude && longitude <= 180)"));

  }
  v25 = fabs(a9);
  if (v25 >= INFINITY && v25 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageLocation.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(accuracy)"));

  }
  v27 = fabs(a10);
  if (v27 >= INFINITY && v27 <= INFINITY)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStorageLocation.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(quality)"));

  }
  v42.receiver = self;
  v42.super_class = (Class)SGStorageLocation;
  v29 = -[SGStorageLocation init](&v42, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_locationType = a3;
    v31 = objc_msgSend(v21, "copy");
    label = v30->_label;
    v30->_label = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    address = v30->_address;
    v30->_address = (NSString *)v33;

    v35 = objc_msgSend(v23, "copy");
    airportCode = v30->_airportCode;
    v30->_airportCode = (NSString *)v35;

    v30->_latitude = a7;
    v30->_longitude = a8;
    v30->_accuracy = a9;
    v30->_quality = a10;
    v37 = objc_msgSend(v24, "copy");
    handle = v30->_handle;
    v30->_handle = (NSData *)v37;

  }
  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t locationType;
  id v5;

  locationType = self->_locationType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", locationType, CFSTR("locationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_airportCode, CFSTR("airportCode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accuracy"), self->_accuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("quality"), self->_quality);
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));

}

- (SGStorageLocation)initWithCoder:(id)a3
{
  id v4;
  SGStorageLocation *v5;
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
  v23.super_class = (Class)SGStorageLocation;
  v5 = -[SGStorageLocation init](&v23, sel_init);
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

- (BOOL)isEqualToStorageLocation:(id)a3
{
  id *v4;
  id *v5;
  BOOL v6;
  NSString *address;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  NSString *airportCode;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSData *handle;
  NSData *v19;
  NSData *v20;
  NSData *v21;
  char v22;
  NSString *label;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  char v27;

  v4 = (id *)a3;
  v5 = v4;
  if (self->_latitude != *((double *)v4 + 5) || self->_longitude != *((double *)v4 + 6))
    goto LABEL_3;
  address = self->_address;
  v9 = (NSString *)v4[3];
  if (address == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = address;
    v12 = -[NSString isEqual:](v11, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_3;
  }
  airportCode = self->_airportCode;
  v14 = (NSString *)v5[4];
  if (airportCode == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = airportCode;
    v17 = -[NSString isEqual:](v16, "isEqual:", v15);

    if ((v17 & 1) == 0)
      goto LABEL_3;
  }
  handle = self->_handle;
  v19 = (NSData *)v5[9];
  if (handle == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = handle;
    v22 = -[NSData isEqual:](v21, "isEqual:", v20);

    if ((v22 & 1) == 0)
      goto LABEL_3;
  }
  label = self->_label;
  v24 = (NSString *)v5[2];
  if (label == v24)
  {

  }
  else
  {
    v25 = v24;
    v26 = label;
    v27 = -[NSString isEqual:](v26, "isEqual:", v25);

    if ((v27 & 1) == 0)
      goto LABEL_3;
  }
  if (self->_locationType == *((_DWORD *)v5 + 2) && self->_accuracy == *((double *)v5 + 7))
  {
    v6 = self->_quality == *((double *)v5 + 8);
    goto LABEL_4;
  }
LABEL_3:
  v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SGStorageLocation *v4;
  SGStorageLocation *v5;
  BOOL v6;

  v4 = (SGStorageLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStorageLocation isEqualToStorageLocation:](self, "isEqualToStorageLocation:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_address, "hash");
  v4 = -[NSString hash](self->_airportCode, "hash") - v3 + 32 * v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  return v8;
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
    v7 = *((double *)v5 + 8);
    if (quality >= v7)
      v8 = 1;
    else
      v8 = -1;
    if (quality >= v7 && quality <= v7)
    {
      v9 = -[NSString length](self->_label, "length");
      v10 = -[NSString length](self->_address, "length") + v9;
      v11 = objc_msgSend(*((id *)v5 + 2), "length");
      v12 = objc_msgSend(*((id *)v5 + 3), "length");
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

- (id)convertToLocationWithId:(id)a3 origin:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0D19848];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithId:origin:type:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v8, v7, self->_locationType, self->_label, self->_address, self->_airportCode, self->_latitude, self->_longitude, self->_accuracy, self->_quality, self->_handle);

  return v9;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGStorageLocation@%0.2f/%0.2f label: '%@' address: '%@' airportCode: '%@'"), *(_QWORD *)&self->_latitude, *(_QWORD *)&self->_longitude, self->_label, self->_address, self->_airportCode);
}

- (BOOL)geocodeIsStart
{
  return -[SGStorageLocation locationType](self, "locationType") != 3;
}

- (BOOL)geocodeIsEnd
{
  return -[SGStorageLocation locationType](self, "locationType") != 2;
}

- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8
{
  id v14;
  id v15;
  id v16;
  SGStorageLocation *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  SGStorageLocation *v23;

  v14 = a8;
  v15 = a4;
  v16 = a3;
  v17 = [SGStorageLocation alloc];
  v18 = -[SGStorageLocation locationType](self, "locationType");
  v19 = v16;
  if (!v16)
  {
    -[SGStorageLocation label](self, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v15;
  if (!v15)
  {
    -[SGStorageLocation address](self, "address");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SGStorageLocation airportCode](self, "airportCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageLocation quality](self, "quality");
  v23 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v17, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v18, v19, v20, v21, v14, a5, a6, a7, v22);

  if (!v15)
  {

    if (v16)
      return v23;
LABEL_9:

    return v23;
  }
  if (!v16)
    goto LABEL_9;
  return v23;
}

- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6
{
  id v10;
  SGStorageLocation *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  SGStorageLocation *v17;

  v10 = a6;
  v11 = [SGStorageLocation alloc];
  v12 = -[SGStorageLocation locationType](self, "locationType");
  -[SGStorageLocation label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageLocation address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageLocation airportCode](self, "airportCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStorageLocation quality](self, "quality");
  v17 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v11, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v12, v13, v14, v15, v10, a3, a4, a5, v16);

  return v17;
}

- (int)locationType
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

- (NSString)airportCode
{
  return self->_airportCode;
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
