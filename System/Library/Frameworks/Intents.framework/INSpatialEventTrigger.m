@implementation INSpatialEventTrigger

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  INSpatialEvent v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v5 = a3;
  -[INSpatialEventTrigger placemark](self, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INSpatialEventTrigger event](self, "event");
  if (v8)
  {
    if (v8 == INSpatialEventDepart)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = CFSTR("Leaving: %@");
      goto LABEL_7;
    }
    if (v8 == INSpatialEventArrive)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = CFSTR("Arriving: %@");
LABEL_7:
      INLocalizedStringWithLocalizer(v10, v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self = (INSpatialEventTrigger *)objc_msgSend(v9, "initWithFormat:locale:", v11, v12, v7);

    }
  }
  else
  {
    self = v7;
  }

  return self;
}

- (INSpatialEventTrigger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INSpatialEventTrigger;
  return -[INSpatialEventTrigger init](&v3, sel_init);
}

- (INSpatialEventTrigger)initWithPlacemark:(CLPlacemark *)placemark event:(INSpatialEvent)event
{
  CLPlacemark *v6;
  INSpatialEventTrigger *v7;
  uint64_t v8;
  CLPlacemark *v9;
  objc_super v11;

  v6 = placemark;
  v11.receiver = self;
  v11.super_class = (Class)INSpatialEventTrigger;
  v7 = -[INSpatialEventTrigger init](&v11, sel_init);
  if (v7)
  {
    v8 = -[CLPlacemark copy](v6, "copy");
    v9 = v7->_placemark;
    v7->_placemark = (CLPlacemark *)v8;

    v7->_event = event;
  }

  return v7;
}

- (INSpatialEventTrigger)initWithPlacemark:(id)a3 event:(int64_t)a4 suggestedValues:(id)a5 mobileSpace:(int64_t)a6
{
  id v10;
  id v11;
  INSpatialEventTrigger *v12;
  uint64_t v13;
  CLPlacemark *placemark;
  uint64_t v15;
  NSArray *suggestedValues;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)INSpatialEventTrigger;
  v12 = -[INSpatialEventTrigger init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    placemark = v12->_placemark;
    v12->_placemark = (CLPlacemark *)v13;

    v12->_event = a4;
    v15 = objc_msgSend(v11, "copy");
    suggestedValues = v12->_suggestedValues;
    v12->_suggestedValues = (NSArray *)v15;

    v12->_mobileSpace = a6;
  }

  return v12;
}

- (INSpatialEventTrigger)initWithMobileSpace:(int64_t)a3 event:(int64_t)a4
{
  INSpatialEventTrigger *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INSpatialEventTrigger;
  result = -[INSpatialEventTrigger init](&v7, sel_init);
  if (result)
  {
    result->_event = a4;
    result->_mobileSpace = a3;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[CLPlacemark hash](self->_placemark, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSArray hash](self->_suggestedValues, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mobileSpace);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  INSpatialEventTrigger *v4;
  INSpatialEventTrigger *v5;
  CLPlacemark *placemark;
  NSArray *suggestedValues;
  BOOL v8;

  v4 = (INSpatialEventTrigger *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      placemark = self->_placemark;
      v8 = (placemark == v5->_placemark || -[CLPlacemark isEqual:](placemark, "isEqual:"))
        && self->_event == v5->_event
        && ((suggestedValues = self->_suggestedValues, suggestedValues == v5->_suggestedValues)
         || -[NSArray isEqual:](suggestedValues, "isEqual:"))
        && self->_mobileSpace == v5->_mobileSpace;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INSpatialEventTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  INSpatialEventTrigger *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("event"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("suggestedValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mobileSpace"));
  v12 = -[INSpatialEventTrigger initWithPlacemark:event:suggestedValues:mobileSpace:](self, "initWithPlacemark:event:suggestedValues:mobileSpace:", v5, v6, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  CLPlacemark *placemark;
  id v5;

  placemark = self->_placemark;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", placemark, CFSTR("placemark"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_event, CFSTR("event"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedValues, CFSTR("suggestedValues"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mobileSpace, CFSTR("mobileSpace"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t event;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_placemark);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("placemark"));

  event = self->_event;
  v10 = CFSTR("unknown");
  if (event == 2)
    v10 = CFSTR("depart");
  if (event == 1)
    v11 = CFSTR("arrive");
  else
    v11 = (__CFString *)v10;
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("event"));

  objc_msgSend(v6, "encodeObject:", self->_suggestedValues);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("suggestedValues"));
  if (self->_mobileSpace == 1)
    v14 = CFSTR("car");
  else
    v14 = CFSTR("unknown");
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("mobileSpace"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSpatialEventTrigger descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INSpatialEventTrigger;
  -[INSpatialEventTrigger description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSpatialEventTrigger _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  CLPlacemark *placemark;
  void *v4;
  void *v5;
  NSArray *suggestedValues;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("placemark");
  placemark = self->_placemark;
  v4 = placemark;
  if (!placemark)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("suggestedValues");
  suggestedValues = self->_suggestedValues;
  v7 = suggestedValues;
  if (!suggestedValues)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v7;
  v11[3] = CFSTR("mobileSpace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mobileSpace);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!suggestedValues)
  if (!placemark)

  return v9;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (INSpatialEvent)event
{
  return self->_event;
}

- (NSArray)suggestedValues
{
  return self->_suggestedValues;
}

- (int64_t)mobileSpace
{
  return self->_mobileSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedValues, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placemark"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INSpatialEventWithString(v12);

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestedValues"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mobileSpace"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("car"));

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlacemark:event:suggestedValues:mobileSpace:", v11, v13, v16, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
