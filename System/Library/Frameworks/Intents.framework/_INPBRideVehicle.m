@implementation _INPBRideVehicle

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (void)setMapAnnotationImage:(id)a3
{
  objc_storeStrong((id *)&self->_mapAnnotationImage, a3);
}

- (BOOL)hasMapAnnotationImage
{
  return self->_mapAnnotationImage != 0;
}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  model = self->_model;
  self->_model = v4;

}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setRegistrationPlate:(id)a3
{
  NSString *v4;
  NSString *registrationPlate;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  registrationPlate = self->_registrationPlate;
  self->_registrationPlate = v4;

}

- (BOOL)hasRegistrationPlate
{
  return self->_registrationPlate != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideVehicleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[_INPBRideVehicle location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRideVehicle location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideVehicle manufacturer](self, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideVehicle model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[_INPBRideVehicle registrationPlate](self, "registrationPlate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    v11 = v12;
  }

}

- (_INPBRideVehicle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideVehicle *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideVehicle *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideVehicle *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideVehicle initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRideVehicle data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideVehicle *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = -[_INPBRideVehicle init](+[_INPBRideVehicle allocWithZone:](_INPBRideVehicle, "allocWithZone:"), "init");
  v6 = (void *)-[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBRideVehicle setLocation:](v5, "setLocation:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_manufacturer, "copyWithZone:", a3);
  -[_INPBRideVehicle setManufacturer:](v5, "setManufacturer:", v7);

  v8 = -[_INPBImageValue copyWithZone:](self->_mapAnnotationImage, "copyWithZone:", a3);
  -[_INPBRideVehicle setMapAnnotationImage:](v5, "setMapAnnotationImage:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  -[_INPBRideVehicle setModel:](v5, "setModel:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_registrationPlate, "copyWithZone:", a3);
  -[_INPBRideVehicle setRegistrationPlate:](v5, "setRegistrationPlate:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBRideVehicle location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRideVehicle location](self, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRideVehicle location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRideVehicle manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRideVehicle manufacturer](self, "manufacturer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRideVehicle manufacturer](self, "manufacturer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manufacturer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapAnnotationImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapAnnotationImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRideVehicle model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRideVehicle model](self, "model");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRideVehicle model](self, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRideVehicle registrationPlate](self, "registrationPlate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationPlate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRideVehicle registrationPlate](self, "registrationPlate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBRideVehicle registrationPlate](self, "registrationPlate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registrationPlate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;

  v3 = -[GEOLocation hash](self->_location, "hash");
  v4 = -[NSString hash](self->_manufacturer, "hash") ^ v3;
  v5 = -[_INPBImageValue hash](self->_mapAnnotationImage, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_model, "hash");
  return v6 ^ -[NSString hash](self->_registrationPlate, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRideVehicle location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("location"));

  if (self->_manufacturer)
  {
    -[_INPBRideVehicle manufacturer](self, "manufacturer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("manufacturer"));

  }
  -[_INPBRideVehicle mapAnnotationImage](self, "mapAnnotationImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mapAnnotationImage"));

  if (self->_model)
  {
    -[_INPBRideVehicle model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("model"));

  }
  if (self->_registrationPlate)
  {
    -[_INPBRideVehicle registrationPlate](self, "registrationPlate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("registrationPlate"));

  }
  return v3;
}

- (GEOLocation)location
{
  return self->_location;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (_INPBImageValue)mapAnnotationImage
{
  return self->_mapAnnotationImage;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)registrationPlate
{
  return self->_registrationPlate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationPlate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mapAnnotationImage, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
