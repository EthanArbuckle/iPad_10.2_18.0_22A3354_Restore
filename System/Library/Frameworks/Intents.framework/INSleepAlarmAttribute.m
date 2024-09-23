@implementation INSleepAlarmAttribute

- (INSleepAlarmAttribute)initWithBedtime:(id)a3 override:(id)a4
{
  id v6;
  id v7;
  INSleepAlarmAttribute *v8;
  uint64_t v9;
  NSDateComponents *bedtime;
  uint64_t v11;
  NSNumber *override;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INSleepAlarmAttribute;
  v8 = -[INSleepAlarmAttribute init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bedtime = v8->_bedtime;
    v8->_bedtime = (NSDateComponents *)v9;

    v11 = objc_msgSend(v7, "copy");
    override = v8->_override;
    v8->_override = (NSNumber *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDateComponents hash](self->_bedtime, "hash");
  return -[NSNumber hash](self->_override, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INSleepAlarmAttribute *v4;
  INSleepAlarmAttribute *v5;
  NSDateComponents *bedtime;
  NSNumber *override;
  BOOL v8;

  v4 = (INSleepAlarmAttribute *)a3;
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
      bedtime = self->_bedtime;
      v8 = 0;
      if (bedtime == v5->_bedtime || -[NSDateComponents isEqual:](bedtime, "isEqual:"))
      {
        override = self->_override;
        if (override == v5->_override || -[NSNumber isEqual:](override, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INSleepAlarmAttribute)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INSleepAlarmAttribute *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bedtime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("override"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INSleepAlarmAttribute initWithBedtime:override:](self, "initWithBedtime:override:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateComponents *bedtime;
  id v5;

  bedtime = self->_bedtime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bedtime, CFSTR("bedtime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_override, CFSTR("override"));

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
  objc_msgSend(v6, "encodeObject:", self->_bedtime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("bedtime"));

  objc_msgSend(v6, "encodeObject:", self->_override);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("override"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSleepAlarmAttribute descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INSleepAlarmAttribute;
  -[INSleepAlarmAttribute description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSleepAlarmAttribute _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSDateComponents *bedtime;
  void *v4;
  NSNumber *override;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bedtime");
  bedtime = self->_bedtime;
  v4 = bedtime;
  if (!bedtime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("override");
  v10[0] = v4;
  override = self->_override;
  v6 = override;
  if (!override)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!override)
  {

    if (bedtime)
      return v7;
LABEL_9:

    return v7;
  }
  if (!bedtime)
    goto LABEL_9;
  return v7;
}

- (NSDateComponents)bedtime
{
  return self->_bedtime;
}

- (NSNumber)override
{
  return self->_override;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_override, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);
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
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bedtime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("override"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBedtime:override:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
