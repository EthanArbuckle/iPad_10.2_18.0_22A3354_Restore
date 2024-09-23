@implementation FUAirport

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FUAirport IATACode](self, "IATACode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IATACode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[FUAirport IATACode](self, "IATACode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "IATACode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v5))
      {
        v10 = 0;
        goto LABEL_35;
      }
    }
    -[FUAirport name](self, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v11;
    if ((void *)v11 != v12)
    {
      -[FUAirport name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v14))
      {
        v10 = 0;
LABEL_33:

LABEL_34:
        if (v8 == v9)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_35:

        goto LABEL_36;
      }
      v39 = v14;
      v40 = v13;
    }
    -[FUAirport city](self, "city");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "city");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15 == (void *)v16)
    {
      v35 = v15;
    }
    else
    {
      v4 = (void *)v16;
      -[FUAirport city](self, "city");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "city");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        v10 = 0;
        v17 = v4;
LABEL_31:

LABEL_32:
        v13 = v40;
        v14 = v39;
        if (v41 == v12)
          goto LABEL_34;
        goto LABEL_33;
      }
      v35 = v15;
      v17 = v4;
    }
    -[FUAirport timeZone](self, "timeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZone");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v38)
    {
      v33 = v5;
      v34 = v3;
    }
    else
    {
      -[FUAirport timeZone](self, "timeZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZone");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v4;
      if (!objc_msgSend(v4, "isEqual:"))
      {
        v10 = 0;
        v22 = (void *)v38;
LABEL_29:

LABEL_30:
        v15 = v35;
        if (v35 == v17)
          goto LABEL_32;
        goto LABEL_31;
      }
      v33 = v5;
      v34 = v3;
    }
    -[FUAirport placemark](self, "placemark");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placemark");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == v21
      || (-[FUAirport placemark](self, "placemark"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "placemark"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "isEqual:")))
    {
      -[FUAirport location](self, "location");
      v24 = v23;
      objc_msgSend(v7, "location");
      if (v24 == v25)
      {
        -[FUAirport location](self, "location");
        v27 = v26;
        objc_msgSend(v7, "location");
        v10 = v27 == v28;
      }
      else
      {
        v10 = 0;
      }
      if (v20 == v21)
      {
LABEL_28:

        v22 = (void *)v38;
        v5 = v33;
        v3 = v34;
        if (v19 == (void *)v38)
          goto LABEL_30;
        goto LABEL_29;
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_28;
  }
  v10 = 0;
LABEL_37:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[FUAirport IATACode](self, "IATACode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIATACode:", v6);

  -[FUAirport name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setName:", v8);

  -[FUAirport city](self, "city");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCity:", v10);

  -[FUAirport timeZone](self, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setTimeZone:", v12);

  -[FUAirport location](self, "location");
  objc_msgSend(v4, "setLocation:");
  -[FUAirport placemark](self, "placemark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setPlacemark:", v14);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FUAirport IATACode](self, "IATACode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirport name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUAirport location](self, "location");
  v7 = v6;
  -[FUAirport location](self, "location");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Airport: %@ (%@) [%f,%f]"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)fetchPlacemarkWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;

  v4 = a3;
  -[FUAirport placemark](self, "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke;
    block[3] = &unk_24D21BA38;
    block[4] = self;
    v15 = v4;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v7 = v15;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBFA68]);
    v8 = objc_alloc(MEMORY[0x24BDBFA80]);
    -[FUAirport location](self, "location");
    v10 = v9;
    -[FUAirport location](self, "location");
    v7 = (void *)objc_msgSend(v8, "initWithLatitude:longitude:", v10);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_24D21BA10;
    v12[4] = self;
    v13 = v4;
    v11 = v4;
    objc_msgSend(v6, "reverseGeocodeLocation:completionHandler:", v7, v12);

  }
}

void __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "placemark");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPlacemark:", v5);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  -[FUAirport IATACode](self, "IATACode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUAirport IATACode](self, "IATACode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("IATACode"));

  }
  -[FUAirport name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FUAirport name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v7, CFSTR("name"));

  }
  -[FUAirport city](self, "city");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FUAirport city](self, "city");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v9, CFSTR("city"));

  }
  -[FUAirport timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FUAirport timeZone](self, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v11, CFSTR("timeZone"));

  }
  -[FUAirport placemark](self, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FUAirport placemark](self, "placemark");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "encodeObject:forKey:", v13, CFSTR("placemark"));

  }
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[FUAirport location](self, "location");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("location.latitude"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[FUAirport location](self, "location");
  objc_msgSend(v16, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v18, CFSTR("location.longitude"));

}

- (FUAirport)initWithCoder:(id)a3
{
  id v4;
  FUAirport *v5;
  uint64_t v6;
  NSString *IATACode;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *city;
  uint64_t v12;
  NSTimeZone *timeZone;
  uint64_t v14;
  CLPlacemark *placemark;
  void *v16;
  CLLocationDegrees v17;
  void *v18;
  CLLocationDegrees v19;
  FUAirport *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FUAirport;
  v5 = -[FUAirport init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IATACode"));
    v6 = objc_claimAutoreleasedReturnValue();
    IATACode = v5->_IATACode;
    v5->_IATACode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v10 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
    v14 = objc_claimAutoreleasedReturnValue();
    placemark = v5->_placemark;
    v5->_placemark = (CLPlacemark *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location.latitude"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_location.latitude = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location.longitude"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_location.longitude = v19;

    v20 = v5;
  }

  return v5;
}

- (NSString)IATACode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIATACode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)city
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (CLLocationCoordinate2D)location
{
  double v2;
  double v3;
  _QWORD v4[2];
  CLLocationCoordinate2D result;

  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3;

  v3 = a3;
  objc_copyStruct(&self->_location, &v3, 16, 1, 0);
}

- (CLPlacemark)placemark
{
  return (CLPlacemark *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPlacemark:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_IATACode, 0);
}

@end
