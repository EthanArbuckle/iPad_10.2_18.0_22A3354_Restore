@implementation INSupportedTrafficIncidentType

- (INSupportedTrafficIncidentType)initWithType:(int64_t)a3 localizedDisplayString:(id)a4
{
  id v6;
  INSupportedTrafficIncidentType *v7;
  INSupportedTrafficIncidentType *v8;
  uint64_t v9;
  NSString *localizedDisplayString;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSupportedTrafficIncidentType;
  v7 = -[INSupportedTrafficIncidentType init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    localizedDisplayString = v8->_localizedDisplayString;
    v8->_localizedDisplayString = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_localizedDisplayString, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INSupportedTrafficIncidentType *v4;
  INSupportedTrafficIncidentType *v5;
  NSString *localizedDisplayString;
  BOOL v7;

  v4 = (INSupportedTrafficIncidentType *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = 0;
      if (self->_type == v5->_type)
      {
        localizedDisplayString = self->_localizedDisplayString;
        if (localizedDisplayString == v5->_localizedDisplayString
          || -[NSString isEqual:](localizedDisplayString, "isEqual:"))
        {
          v7 = 1;
        }
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INSupportedTrafficIncidentType)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  INSupportedTrafficIncidentType *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INSupportedTrafficIncidentType initWithType:localizedDisplayString:](self, "initWithType:localizedDisplayString:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayString, CFSTR("localizedDisplayString"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_type - 1;
  if (v8 > 4)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E22952F8[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_localizedDisplayString);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("localizedDisplayString"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSupportedTrafficIncidentType descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INSupportedTrafficIncidentType;
  -[INSupportedTrafficIncidentType description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSupportedTrafficIncidentType _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *localizedDisplayString;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("localizedDisplayString");
  v9[0] = v3;
  localizedDisplayString = self->_localizedDisplayString;
  v5 = localizedDisplayString;
  if (!localizedDisplayString)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!localizedDisplayString)

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)localizedDisplayString
{
  return self->_localizedDisplayString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INTrafficIncidentTypeWithString(v9);

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("localizedDisplayString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:localizedDisplayString:", v10, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
