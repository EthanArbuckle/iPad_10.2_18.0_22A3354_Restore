@implementation INGeographicalFeature

- (INGeographicalFeature)initWithGeographicalFeatureType:(id)a3 geographicalFeatureDescriptors:(id)a4
{
  id v6;
  id v7;
  INGeographicalFeature *v8;
  uint64_t v9;
  NSString *geographicalFeatureType;
  uint64_t v11;
  NSArray *geographicalFeatureDescriptors;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INGeographicalFeature;
  v8 = -[INGeographicalFeature init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    geographicalFeatureType = v8->_geographicalFeatureType;
    v8->_geographicalFeatureType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    geographicalFeatureDescriptors = v8->_geographicalFeatureDescriptors;
    v8->_geographicalFeatureDescriptors = (NSArray *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_geographicalFeatureType, "hash");
  return -[NSArray hash](self->_geographicalFeatureDescriptors, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INGeographicalFeature *v4;
  INGeographicalFeature *v5;
  NSString *geographicalFeatureType;
  NSArray *geographicalFeatureDescriptors;
  BOOL v8;

  v4 = (INGeographicalFeature *)a3;
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
      geographicalFeatureType = self->_geographicalFeatureType;
      v8 = 0;
      if (geographicalFeatureType == v5->_geographicalFeatureType
        || -[NSString isEqual:](geographicalFeatureType, "isEqual:"))
      {
        geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
        if (geographicalFeatureDescriptors == v5->_geographicalFeatureDescriptors
          || -[NSArray isEqual:](geographicalFeatureDescriptors, "isEqual:"))
        {
          v8 = 1;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INGeographicalFeature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INGeographicalFeature *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geographicalFeatureType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("geographicalFeatureDescriptors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INGeographicalFeature initWithGeographicalFeatureType:geographicalFeatureDescriptors:](self, "initWithGeographicalFeatureType:geographicalFeatureDescriptors:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *geographicalFeatureType;
  id v5;

  geographicalFeatureType = self->_geographicalFeatureType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", geographicalFeatureType, CFSTR("geographicalFeatureType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geographicalFeatureDescriptors, CFSTR("geographicalFeatureDescriptors"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_geographicalFeatureType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("geographicalFeatureType"));

  objc_msgSend(v6, "encodeObject:", self->_geographicalFeatureDescriptors);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("geographicalFeatureDescriptors"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INGeographicalFeature descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INGeographicalFeature;
  -[INGeographicalFeature description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGeographicalFeature _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *geographicalFeatureType;
  void *v4;
  NSArray *geographicalFeatureDescriptors;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("geographicalFeatureType");
  geographicalFeatureType = self->_geographicalFeatureType;
  v4 = geographicalFeatureType;
  if (!geographicalFeatureType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("geographicalFeatureDescriptors");
  v10[0] = v4;
  geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  v6 = geographicalFeatureDescriptors;
  if (!geographicalFeatureDescriptors)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!geographicalFeatureDescriptors)
  {

    if (geographicalFeatureType)
      return v7;
LABEL_9:

    return v7;
  }
  if (!geographicalFeatureType)
    goto LABEL_9;
  return v7;
}

- (NSString)geographicalFeatureType
{
  return self->_geographicalFeatureType;
}

- (NSArray)geographicalFeatureDescriptors
{
  return self->_geographicalFeatureDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geographicalFeatureDescriptors, 0);
  objc_storeStrong((id *)&self->_geographicalFeatureType, 0);
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
  void *v15;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("geographicalFeatureType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("geographicalFeatureDescriptors"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGeographicalFeatureType:geographicalFeatureDescriptors:", v11, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
