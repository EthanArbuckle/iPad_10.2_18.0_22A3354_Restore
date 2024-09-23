@implementation INPlace

- (INPlace)initWithPlaceType:(id)a3 placeSubType:(id)a4 placeDescriptors:(id)a5 personalPlaceType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  INPlace *v13;
  uint64_t v14;
  NSString *placeType;
  uint64_t v16;
  NSString *placeSubType;
  uint64_t v18;
  NSArray *placeDescriptors;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)INPlace;
  v13 = -[INPlace init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    placeType = v13->_placeType;
    v13->_placeType = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    placeSubType = v13->_placeSubType;
    v13->_placeSubType = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    placeDescriptors = v13->_placeDescriptors;
    v13->_placeDescriptors = (NSArray *)v18;

    v13->_personalPlaceType = a6;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_placeType, "hash");
  v4 = -[NSString hash](self->_placeSubType, "hash") ^ v3;
  v5 = v4 ^ -[NSArray hash](self->_placeDescriptors, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_personalPlaceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INPlace *v4;
  INPlace *v5;
  NSString *placeType;
  NSString *placeSubType;
  NSArray *placeDescriptors;
  BOOL v9;

  v4 = (INPlace *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      placeType = self->_placeType;
      v9 = (placeType == v5->_placeType || -[NSString isEqual:](placeType, "isEqual:"))
        && ((placeSubType = self->_placeSubType, placeSubType == v5->_placeSubType)
         || -[NSString isEqual:](placeSubType, "isEqual:"))
        && ((placeDescriptors = self->_placeDescriptors, placeDescriptors == v5->_placeDescriptors)
         || -[NSArray isEqual:](placeDescriptors, "isEqual:"))
        && self->_personalPlaceType == v5->_personalPlaceType;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INPlace)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  INPlace *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeSubType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("placeDescriptors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personalPlaceType"));
  v12 = -[INPlace initWithPlaceType:placeSubType:placeDescriptors:personalPlaceType:](self, "initWithPlaceType:placeSubType:placeDescriptors:personalPlaceType:", v5, v6, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *placeType;
  id v5;

  placeType = self->_placeType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", placeType, CFSTR("placeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeSubType, CFSTR("placeSubType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeDescriptors, CFSTR("placeDescriptors"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_personalPlaceType, CFSTR("personalPlaceType"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t personalPlaceType;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_placeType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("placeType"));

  objc_msgSend(v6, "encodeObject:", self->_placeSubType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("placeSubType"));

  objc_msgSend(v6, "encodeObject:", self->_placeDescriptors);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("placeDescriptors"));
  personalPlaceType = self->_personalPlaceType;
  v12 = CFSTR("unknown");
  if (personalPlaceType == 2)
    v12 = CFSTR("work");
  if (personalPlaceType == 1)
    v13 = CFSTR("home");
  else
    v13 = (__CFString *)v12;
  v14 = v13;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("personalPlaceType"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPlace descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPlace;
  -[INPlace description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPlace _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *placeType;
  void *v4;
  NSString *placeSubType;
  void *v6;
  NSArray *placeDescriptors;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("placeType");
  placeType = self->_placeType;
  v4 = placeType;
  if (!placeType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("placeSubType");
  placeSubType = self->_placeSubType;
  v6 = placeSubType;
  if (!placeSubType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v6;
  v12[2] = CFSTR("placeDescriptors");
  placeDescriptors = self->_placeDescriptors;
  v8 = placeDescriptors;
  if (!placeDescriptors)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v8;
  v12[3] = CFSTR("personalPlaceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_personalPlaceType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (placeDescriptors)
  {
    if (placeSubType)
      goto LABEL_9;
LABEL_12:

    if (placeType)
      return v10;
LABEL_13:

    return v10;
  }

  if (!placeSubType)
    goto LABEL_12;
LABEL_9:
  if (!placeType)
    goto LABEL_13;
  return v10;
}

- (NSString)placeType
{
  return self->_placeType;
}

- (NSString)placeSubType
{
  return self->_placeSubType;
}

- (NSArray)placeDescriptors
{
  return self->_placeDescriptors;
}

- (int64_t)personalPlaceType
{
  return self->_personalPlaceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDescriptors, 0);
  objc_storeStrong((id *)&self->_placeSubType, 0);
  objc_storeStrong((id *)&self->_placeType, 0);
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
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeSubType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeDescriptors"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personalPlaceType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = INPersonalPlaceTypeWithString(v18);

    v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlaceType:placeSubType:placeDescriptors:personalPlaceType:", v11, v14, v17, v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
