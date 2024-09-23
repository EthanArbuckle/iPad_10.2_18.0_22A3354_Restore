@implementation CLSLocationOfInterest

- (CLSLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 location:(id)a5 placemarkRegion:(id)a6 businessItemMuid:(unint64_t)a7 radius:(double)a8
{
  id v15;
  id v16;
  id v17;
  CLSLocationOfInterest *v18;
  CLSLocationOfInterest *v19;
  uint64_t v20;
  NSMutableArray *visits;
  objc_super v23;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CLSLocationOfInterest;
  v18 = -[CLSLocationOfInterest init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19->_type = a4;
    v19->_radius = a8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    visits = v19->_visits;
    v19->_visits = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v19->_location, a5);
    v19->_businessItemMuid = a7;
    objc_storeStrong((id *)&v19->_placemarkRegion, a6);
  }

  return v19;
}

- (CLSLocationOfInterest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CLSLocationOfInterest *v15;
  CLSLocationOfInterest *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessItemMuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemarkRegion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && !v14)
  {
    objc_msgSend(v13, "region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = -[CLSLocationOfInterest initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:](self, "initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:", v5, v7, v10, v14, v12, v9);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_placemark, v13);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("radius"), self->_radius);
  objc_msgSend(v7, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_businessItemMuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("businessItemMuid"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_placemark, CFSTR("placemark"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_placemarkRegion, CFSTR("placemarkRegion"));

}

- (id)placemarkWithLocationCache:(id)a3
{
  id v4;
  void *v5;
  CLSLitePlacemark *placemark;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *p_super;
  CLSLitePlacemark *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  CLSLitePlacemark *v21;
  CLSLitePlacemark *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_placemarkRegion)
  {
    placemark = self->_placemark;
    if (placemark)
    {
LABEL_13:
      v14 = placemark;
      goto LABEL_14;
    }
    objc_msgSend(v4, "placemarksForLocation:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
LABEL_12:
        objc_msgSend(v7, "firstObject");
        v21 = (CLSLitePlacemark *)objc_claimAutoreleasedReturnValue();
        v22 = self->_placemark;
        self->_placemark = v21;

        placemark = self->_placemark;
        goto LABEL_13;
      }
      -[CLCircularRegion center](self->_placemarkRegion, "center");
      v9 = v8;
      v11 = v10;
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      p_super = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v24 = 134283777;
        v25 = v9;
        v26 = 2049;
        v27 = v11;
        _os_log_error_impl(&dword_1CAB79000, p_super, OS_LOG_TYPE_ERROR, "More than one placemark found for location {%{private}f, %{private}f}", (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      -[CLCircularRegion center](self->_placemarkRegion, "center");
      v16 = v15;
      v18 = v17;
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134283777;
        v25 = v16;
        v26 = 2049;
        v27 = v18;
        _os_log_impl(&dword_1CAB79000, v20, OS_LOG_TYPE_DEFAULT, "No placemark found for location {%{private}f, %{private}f}", (uint8_t *)&v24, 0x16u);
      }

      p_super = &self->_placemarkRegion->super.super;
      self->_placemarkRegion = 0;
    }

    goto LABEL_12;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)addVisit:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_visits, "containsObject:") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_visits, "addObject:", v4);
    objc_msgSend(v4, "setLocationOfInterest:", self);
  }

}

- (void)removeVisit:(id)a3
{
  NSMutableArray *visits;
  id v4;

  visits = self->_visits;
  v4 = a3;
  -[NSMutableArray removeObject:](visits, "removeObject:", v4);
  objc_msgSend(v4, "setLocationOfInterest:", 0);

}

- (double)placemarkLocationDistanceFromLocation:(id)a3 locationCache:(id)a4
{
  id v6;
  double v7;
  CLCircularRegion *placemarkRegion;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CLLocationDegrees v14;
  double v15;
  CLLocationDegrees v16;
  double v17;
  CLLocationCoordinate2D v19;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D v21;

  v6 = a4;
  v7 = *MEMORY[0x1E0C9E318];
  objc_msgSend(a3, "coordinate");
  if (CLLocationCoordinate2DIsValid(v19))
  {
    placemarkRegion = self->_placemarkRegion;
    if (placemarkRegion)
    {
      -[CLCircularRegion center](placemarkRegion, "center");
      if (CLLocationCoordinate2DIsValid(v20))
      {
        CLLocationCoordinate2DGetDistanceFrom();
        v7 = v9;
      }
      -[CLSLocationOfInterest placemarkWithLocationCache:](self, "placemarkWithLocationCache:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "coordinate");
        v14 = v13;
        v16 = v15;

        v21.latitude = v14;
        v21.longitude = v16;
        if (CLLocationCoordinate2DIsValid(v21))
        {
          CLLocationCoordinate2DGetDistanceFrom();
          if (v17 < v7)
            v7 = v17;
        }
      }

    }
  }

  return v7;
}

- (id)description
{
  CLSLitePlacemark *placemark;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t type;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  objc_super v20;

  placemark = self->_placemark;
  if (placemark)
  {
    -[CLSLitePlacemark location](placemark, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

    v9 = CFSTR("placemark");
  }
  else
  {
    -[CLCircularRegion center](self->_placemarkRegion, "center");
    v6 = v10;
    v8 = v11;
    v9 = CFSTR("region");
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)CLSLocationOfInterest;
  -[CLSLocationOfInterest description](&v20, sel_description);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  type = self->_type;
  v16 = CFSTR("Unknown");
  if (type == 1)
    v16 = CFSTR("Work");
  if (type)
    v17 = v16;
  else
    v17 = CFSTR("Home");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - {%f, %f} (%@) - %@"), v13, v6, v8, v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  CLSLocationOfInterest *v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = (CLSLocationOfInterest *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[CLSLocationOfInterest identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (CLLocation)location
{
  return self->_location;
}

- (CLCircularRegion)placemarkRegion
{
  return self->_placemarkRegion;
}

- (double)radius
{
  return self->_radius;
}

- (NSArray)visits
{
  return &self->_visits->super;
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemarkRegion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_visits, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
