@implementation INTimer

- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7 type:(int64_t)a8
{
  id v14;
  id v15;
  INTimer *v16;
  uint64_t v17;
  INSpeakableString *label;
  uint64_t v19;
  NSString *identifier;
  objc_super v22;

  v14 = a3;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INTimer;
  v16 = -[INTimer init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    label = v16->_label;
    v16->_label = (INSpeakableString *)v17;

    v16->_duration = a4;
    v16->_remainingTime = a5;
    v19 = objc_msgSend(v15, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;

    v16->_state = a7;
    v16->_type = a8;
  }

  return v16;
}

- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7
{
  return -[INTimer initWithLabel:duration:remainingTime:identifier:state:type:](self, "initWithLabel:duration:remainingTime:identifier:state:type:", a3, a6, a7, 0, a4, a5);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[INSpeakableString hash](self->_label, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_remainingTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  INTimer *v4;
  INTimer *v5;
  INSpeakableString *label;
  BOOL v7;
  NSString *identifier;

  v4 = (INTimer *)a3;
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
      label = self->_label;
      v7 = (label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
        && self->_duration == v5->_duration
        && self->_remainingTime == v5->_remainingTime
        && ((identifier = self->_identifier, identifier == v5->_identifier)
         || -[NSString isEqual:](identifier, "isEqual:"))
        && self->_state == v5->_state
        && self->_type == v5->_type;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INTimer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  INTimer *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("remainingTime"));
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  v16 = -[INTimer initWithLabel:duration:remainingTime:identifier:state:type:](self, "initWithLabel:duration:remainingTime:identifier:state:type:", v5, v13, v14, v15, v7, v9);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("remainingTime"), self->_remainingTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t state;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  int64_t type;
  const __CFString *v17;
  __CFString *v18;
  __CFString *v19;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_label);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("label"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_remainingTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("remainingTime"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("identifier"));
  state = self->_state;
  v13 = CFSTR("unknown");
  if (state == 2)
    v13 = CFSTR("timerPaused");
  if (state == 1)
    v14 = CFSTR("timerRunning");
  else
    v14 = (__CFString *)v13;
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("state"));

  type = self->_type;
  v17 = CFSTR("unknown");
  if (type == 2)
    v17 = CFSTR("sleepTimer");
  if (type == 1)
    v18 = CFSTR("defaultType");
  else
    v18 = (__CFString *)v17;
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("type"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTimer descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INTimer;
  -[INTimer description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTimer _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSpeakableString *label;
  void *v4;
  void *v5;
  void *v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("label");
  label = self->_label;
  v4 = label;
  if (!label)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("remainingTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_remainingTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("identifier");
  identifier = self->_identifier;
  v8 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v8;
  v13[4] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!identifier)
  if (!label)

  return v11;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (double)duration
{
  return self->_duration;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
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
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("remainingTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = INTimerStateWithString(v19);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = INTimerTypeWithString(v21);

    v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:duration:remainingTime:identifier:state:type:", v11, v18, v20, v22, v14, v17);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
