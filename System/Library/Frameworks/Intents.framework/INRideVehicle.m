@implementation INRideVehicle

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD *);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = (void (**)(id, void *, _QWORD *))a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INRideVehicle copy](self, "copy");
    -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __75__INRideVehicle_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E2292618;
      v10[4] = v8;
      v11 = v7;
      v6[2](v6, v9, v10);

    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }

  }
}

uint64_t __75__INRideVehicle_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setMapAnnotationImage:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[CLLocation hash](self->_location, "hash");
  v4 = -[NSString hash](self->_registrationPlate, "hash") ^ v3;
  v5 = -[NSString hash](self->_manufacturer, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_model, "hash");
  return v6 ^ -[INImage hash](self->_mapAnnotationImage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  CLLocation *location;
  NSString *registrationPlate;
  NSString *manufacturer;
  NSString *model;
  INImage *mapAnnotationImage;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    location = self->_location;
    v11 = 0;
    if (location == (CLLocation *)v5[1] || -[CLLocation isEqual:](location, "isEqual:"))
    {
      registrationPlate = self->_registrationPlate;
      if (registrationPlate == (NSString *)v5[2] || -[NSString isEqual:](registrationPlate, "isEqual:"))
      {
        manufacturer = self->_manufacturer;
        if (manufacturer == (NSString *)v5[3] || -[NSString isEqual:](manufacturer, "isEqual:"))
        {
          model = self->_model;
          if (model == (NSString *)v5[4] || -[NSString isEqual:](model, "isEqual:"))
          {
            mapAnnotationImage = self->_mapAnnotationImage;
            if (mapAnnotationImage == (INImage *)v5[5] || -[INImage isEqual:](mapAnnotationImage, "isEqual:"))
              v11 = 1;
          }
        }
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLocation:", self->_location);
  objc_msgSend(v4, "setRegistrationPlate:", self->_registrationPlate);
  objc_msgSend(v4, "setManufacturer:", self->_manufacturer);
  objc_msgSend(v4, "setModel:", self->_model);
  objc_msgSend(v4, "setMapAnnotationImage:", self->_mapAnnotationImage);
  return v4;
}

- (INRideVehicle)initWithCoder:(id)a3
{
  id v4;
  INRideVehicle *v5;
  uint64_t v6;
  CLLocation *location;
  uint64_t v8;
  NSString *registrationPlate;
  uint64_t v10;
  NSString *manufacturer;
  uint64_t v12;
  NSString *model;
  uint64_t v14;
  INImage *mapAnnotationImage;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INRideVehicle;
  v5 = -[INRideVehicle init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationPlate"));
    v8 = objc_claimAutoreleasedReturnValue();
    registrationPlate = v5->_registrationPlate;
    v5->_registrationPlate = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturer"));
    v10 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v12 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapAnnotationImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    mapAnnotationImage = v5->_mapAnnotationImage;
    v5->_mapAnnotationImage = (INImage *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CLLocation *location;
  id v5;

  location = self->_location;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_registrationPlate, CFSTR("registrationPlate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturer, CFSTR("manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapAnnotationImage, CFSTR("mapAnnotationImage"));

}

- (NSString)description
{
  return (NSString *)-[INRideVehicle descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRideVehicle;
  -[INRideVehicle description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRideVehicle _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  CLLocation *location;
  uint64_t v4;
  NSString *registrationPlate;
  void *v6;
  NSString *manufacturer;
  void *v8;
  NSString *model;
  void *v10;
  INImage *mapAnnotationImage;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("location");
  location = self->_location;
  v4 = (uint64_t)location;
  if (!location)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v4;
  v22[0] = v4;
  v18 = CFSTR("registrationPlate");
  registrationPlate = self->_registrationPlate;
  v6 = registrationPlate;
  if (!registrationPlate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v4, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v6;
  v19 = CFSTR("manufacturer");
  manufacturer = self->_manufacturer;
  v8 = manufacturer;
  if (!manufacturer)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v8;
  v20 = CFSTR("model");
  model = self->_model;
  v10 = model;
  if (!model)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v10;
  v21 = CFSTR("mapAnnotationImage");
  mapAnnotationImage = self->_mapAnnotationImage;
  v12 = mapAnnotationImage;
  if (!mapAnnotationImage)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (mapAnnotationImage)
  {
    if (model)
      goto LABEL_13;
  }
  else
  {

    if (model)
    {
LABEL_13:
      if (manufacturer)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (manufacturer)
  {
LABEL_14:
    if (registrationPlate)
      goto LABEL_15;
LABEL_20:

    if (location)
      return v13;
LABEL_21:

    return v13;
  }
LABEL_19:

  if (!registrationPlate)
    goto LABEL_20;
LABEL_15:
  if (!location)
    goto LABEL_21;
  return v13;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(CLLocation *)location
{
  objc_setProperty_nonatomic_copy(self, a2, location, 8);
}

- (NSString)registrationPlate
{
  return self->_registrationPlate;
}

- (void)setRegistrationPlate:(NSString *)registrationPlate
{
  objc_setProperty_nonatomic_copy(self, a2, registrationPlate, 16);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(NSString *)manufacturer
{
  objc_setProperty_nonatomic_copy(self, a2, manufacturer, 24);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(NSString *)model
{
  objc_setProperty_nonatomic_copy(self, a2, model, 32);
}

- (INImage)mapAnnotationImage
{
  return self->_mapAnnotationImage;
}

- (void)setMapAnnotationImage:(INImage *)mapAnnotationImage
{
  objc_setProperty_nonatomic_copy(self, a2, mapAnnotationImage, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapAnnotationImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_registrationPlate, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cacheableObjectForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheableObjectForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_imageSize");
        objc_msgSend(v12, "_setImageSize:");

      }
    }
  }

}

@end
