@implementation RTLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)locationOfInterestTypeIsValid:(int64_t)a3
{
  return (unint64_t)(a3 + 1) < 5;
}

+ (id)locationOfInterestTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E4FB1680[a3];
}

+ (id)locationOfInterestTypeSourceToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a3)
  {
    v6 = CFSTR("None");
LABEL_16:
    objc_msgSend(v5, "addObject:", v6);
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("MeCard"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Aggregate Inferred"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v5, "addObject:", CFSTR("Pattern Based"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v5, "addObject:", CFSTR("Top Median"));
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v5, "addObject:", CFSTR("User"));
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    v6 = CFSTR("Fallback");
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)geoMapItemSource
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[RTMapItem source](self->_mapItem, "source") & 1;
  v4 = v3 | (2 * ((-[RTMapItem source](self->_mapItem, "source") >> 2) & 1));
  v5 = -[RTMapItem source](self->_mapItem, "source") & 8;
  v6 = v5 | -[RTMapItem source](self->_mapItem, "source") & 0x10;
  v7 = v4 | v6 | -[RTMapItem source](self->_mapItem, "source") & 0x40;
  v8 = -[RTMapItem source](self->_mapItem, "source") & 0x80;
  v9 = v8 | -[RTMapItem source](self->_mapItem, "source") & 0x100;
  v10 = v9 | -[RTMapItem source](self->_mapItem, "source") & 0x200;
  v11 = v7 | v10 | -[RTMapItem source](self->_mapItem, "source") & 0x400;
  v12 = ((unsigned __int16)-[RTMapItem source](self->_mapItem, "source") << 10) & 0x800;
  v13 = v12 | (2 * -[RTMapItem source](self->_mapItem, "source")) & 0x1000;
  v14 = v13 | (2 * -[RTMapItem source](self->_mapItem, "source")) & 0x2000;
  v15 = v11 | v14 | (2 * -[RTMapItem source](self->_mapItem, "source")) & 0x4000;
  v16 = (unsigned __int16)(2 * -[RTMapItem source](self->_mapItem, "source")) & 0x8000;
  return v15 | v16 | (2 * -[RTMapItem source](self->_mapItem, "source")) & 0x10000;
}

+ (id)geoMapItemSourceToString:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a3)
  {
    v6 = CFSTR("None");
LABEL_38:
    objc_msgSend(v5, "addObject:", v6);
    goto LABEL_39;
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("Reverse Geocode"));
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_23;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Contacts"));
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v5, "addObject:", CFSTR("Maps Support"));
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v5, "addObject:", CFSTR("User"));
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v5, "addObject:", CFSTR("Maps Support Favorite"));
  if ((a3 & 0x20) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v5, "addObject:", CFSTR("Maps Support History Entry"));
  if ((a3 & 0x40) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v5, "addObject:", CFSTR("Maps Support History Entry Route"));
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v5, "addObject:", CFSTR("Maps Support History Entry Place Display"));
  if ((a3 & 0x100) == 0)
  {
LABEL_11:
    if ((a3 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v5, "addObject:", CFSTR("Event Kit"));
  if ((a3 & 0x200) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v5, "addObject:", CFSTR("Local Search"));
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v5, "addObject:", CFSTR("MapItem Handle"));
  if ((a3 & 0x800) == 0)
  {
LABEL_14:
    if ((a3 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v5, "addObject:", CFSTR("Forward Geocode"));
  if ((a3 & 0x1000) == 0)
  {
LABEL_15:
    if ((a3 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v5, "addObject:", CFSTR("Proactive Experts"));
  if ((a3 & 0x2000) == 0)
  {
LABEL_16:
    if ((a3 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v5, "addObject:", CFSTR("Portrait"));
  if ((a3 & 0x4000) == 0)
  {
LABEL_17:
    if ((a3 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v5, "addObject:", CFSTR("Learned Place"));
  if ((a3 & 0x8000) == 0)
  {
LABEL_18:
    if ((a3 & 0x10000) == 0)
      goto LABEL_39;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v5, "addObject:", CFSTR("Blue POI"));
  if ((a3 & 0x10000) != 0)
  {
LABEL_37:
    v6 = CFSTR("MapItemURL");
    goto LABEL_38;
  }
LABEL_39:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)latitude
{
  double result;

  -[RTLocation latitude](self->_location, "latitude");
  return result;
}

- (void)setLatitude:(double)a3
{
  -[RTLocation setLatitude:](self->_location, "setLatitude:", a3);
}

- (double)longitude
{
  double result;

  -[RTLocation longitude](self->_location, "longitude");
  return result;
}

- (void)setLongitude:(double)a3
{
  -[RTLocation setLongitude:](self->_location, "setLongitude:", a3);
}

- (double)uncertainty
{
  double result;

  -[RTLocation uncertainty](self->_location, "uncertainty");
  return result;
}

- (void)setUncertainty:(double)a3
{
  -[RTLocation setHorizontalUncertainty:](self->_location, "setHorizontalUncertainty:", a3);
}

- (RTLocationOfInterest)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_confidence_identifier_type_typeSource_visits_customLabel_mapItem_);
}

- (RTLocationOfInterest)initWithLocation:(id)a3 confidence:(double)a4 identifier:(id)a5 type:(int64_t)a6 typeSource:(unint64_t)a7 visits:(id)a8 customLabel:(id)a9 mapItem:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  RTLocationOfInterest *v22;
  RTLocationOfInterest *v23;
  uint64_t v24;
  NSUUID *identifier;
  uint64_t v26;
  NSArray *visits;
  RTLocationOfInterest *v28;
  NSObject *v29;
  id v31;
  objc_super v32;
  uint8_t buf[16];

  v31 = a3;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (v18)
  {
    v32.receiver = self;
    v32.super_class = (Class)RTLocationOfInterest;
    v22 = -[RTLocationOfInterest init](&v32, sel_init);
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_location, a3);
      v23->_confidence = a4;
      v24 = objc_msgSend(v18, "copy");
      identifier = v23->_identifier;
      v23->_identifier = (NSUUID *)v24;

      v23->_type = a6;
      v23->_typeSource = a7;
      v26 = objc_msgSend(v19, "copy");
      visits = v23->_visits;
      v23->_visits = (NSArray *)v26;

      objc_storeStrong((id *)&v23->_customLabel, a9);
      objc_storeStrong((id *)&v23->_mapItem, a10);
    }
    self = v23;
    v28 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v28 = 0;
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLocationOfInterest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  RTLocationOfInterest *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeSource"));
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("visits"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[RTLocationOfInterest initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:](self, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v5, v8, v9, v10, v14, v15, v7, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  RTLocation *location;
  id v5;

  location = self->_location;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", location, CFSTR("location"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_typeSource, CFSTR("typeSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visits, CFSTR("visits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customLabel, CFSTR("customLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItem, CFSTR("mapItem"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTLocationOfInterest *v5;
  RTLocationOfInterest *v6;
  RTLocationOfInterest *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (RTLocationOfInterest *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[RTLocationOfInterest identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[RTLocationOfInterest identifier](v7, "identifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLocationOfInterest identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationOfInterest identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RTLocationOfInterest identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLocationOfInterest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterest location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterest confidence](self, "confidence");
  v8 = v7;
  +[RTLocationOfInterest locationOfInterestTypeToString:](RTLocationOfInterest, "locationOfInterestTypeToString:", -[RTLocationOfInterest type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLocationOfInterest locationOfInterestTypeSourceToString:](RTLocationOfInterest, "locationOfInterestTypeSourceToString:", -[RTLocationOfInterest typeSource](self, "typeSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterest mapItem](self, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterest customLabel](self, "customLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterest preferredName](self, "preferredName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("id, %@, %@, confidence, %f, type, %@, typeSource, %@, mapItem, %@, customLabel, %@, preferredName, %@"), v5, v6, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)preferredName
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  RTMapItem *mapItem;
  void *v10;

  if (!-[NSString length](self->_customLabel, "length"))
  {
    -[RTLocationOfInterest nameFromType:](self, "nameFromType:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = v4;
    }
    else
    {
      -[RTMapItem name](self->_mapItem, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      mapItem = self->_mapItem;
      if (!v7)
      {
        -[RTMapItem address](mapItem, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mergedThoroughfare");
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      -[RTMapItem name](mapItem, "name");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v5;
LABEL_8:

    return v3;
  }
  v3 = self->_customLabel;
  return v3;
}

- (id)nameFromType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutine_LocalizedStringForKey:", off_1E4FB1680[a3], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)recentCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;

  v4 = a3;
  -[RTLocationOfInterest visits](self, "visits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "exitDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "exitDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);
  if (!v11)
  {
    -[RTLocationOfInterest visits](self, "visits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    objc_msgSend(v4, "visits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v13 < v15)
      v11 = -1;
    else
      v11 = v13 > v15;
  }

  return v11;
}

- (id)pruneVisitsWithDateInterval:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  RTLocationOfInterest *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  RTLocationOfInterest *v31;
  RTLocationOfInterest *v33;
  void *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v33 = self;
    -[RTLocationOfInterest visits](self, "visits");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v38 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1A85B6AB0]();
          objc_msgSend(v8, "exitDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "entryDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isOnOrBefore:", v11);

          if (v12)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "entryDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringFromDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "exitDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringFromDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v42 = v14;
              v43 = 2112;
              v44 = v16;
              v45 = 2112;
              v46 = v18;
              v47 = 2080;
              v48 = "-[RTLocationOfInterest pruneVisitsWithDateInterval:]";
              v49 = 1024;
              v50 = 457;
              _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, "location of interest visit, %@, has one or more malformed dates, entry, %@, exit, %@ (in %s:%d)", buf, 0x30u);

            }
          }
          else
          {
            v19 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v8, "entryDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "exitDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v19, "initWithStartDate:endDate:", v20, v21);

            if (-[NSObject intersectsDateInterval:](v13, "intersectsDateInterval:", v35))
              objc_msgSend(v34, "addObject:", v8);
          }

          objc_autoreleasePoolPop(v9);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v5);
    }

    v22 = [RTLocationOfInterest alloc];
    -[RTLocationOfInterest location](v33, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationOfInterest confidence](v33, "confidence");
    v25 = v24;
    -[RTLocationOfInterest identifier](v33, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[RTLocationOfInterest type](v33, "type");
    v28 = -[RTLocationOfInterest typeSource](v33, "typeSource");
    -[RTLocationOfInterest customLabel](v33, "customLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationOfInterest mapItem](v33, "mapItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[RTLocationOfInterest initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:](v22, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v23, v26, v27, v28, v34, v29, v25, v30);

  }
  else
  {
    v31 = self;
  }

  return v31;
}

- (RTLocation)location
{
  return self->_location;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (NSArray)visits
{
  return self->_visits;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

@end
