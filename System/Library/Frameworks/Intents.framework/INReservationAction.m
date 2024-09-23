@implementation INReservationAction

- (INReservationAction)initWithType:(INReservationActionType)type validDuration:(INDateComponentsRange *)validDuration userActivity:(NSUserActivity *)userActivity
{
  INDateComponentsRange *v8;
  NSUserActivity *v9;
  INReservationAction *v10;
  INReservationAction *v11;
  uint64_t v12;
  INDateComponentsRange *v13;
  uint64_t v14;
  NSUserActivity *v15;
  objc_super v17;

  v8 = validDuration;
  v9 = userActivity;
  v17.receiver = self;
  v17.super_class = (Class)INReservationAction;
  v10 = -[INReservationAction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = type;
    v12 = -[INDateComponentsRange copy](v8, "copy");
    v13 = v11->_validDuration;
    v11->_validDuration = (INDateComponentsRange *)v12;

    -[NSUserActivity _intents_copy](v9, "_intents_copy");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v11->_userActivity;
    v11->_userActivity = (NSUserActivity *)v14;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[INDateComponentsRange hash](self->_validDuration, "hash");
  v6 = v5 ^ -[NSUserActivity hash](self->_userActivity, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INReservationAction *v4;
  INReservationAction *v5;
  INDateComponentsRange *validDuration;
  NSUserActivity *userActivity;
  BOOL v8;

  v4 = (INReservationAction *)a3;
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
      v8 = 0;
      if (self->_type == v5->_type)
      {
        validDuration = self->_validDuration;
        if (validDuration == v5->_validDuration || -[INDateComponentsRange isEqual:](validDuration, "isEqual:"))
        {
          userActivity = self->_userActivity;
          if (userActivity == v5->_userActivity || -[NSUserActivity isEqual:](userActivity, "isEqual:"))
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

- (INReservationAction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  INReservationAction *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  INUserActivityDeserializeFromData(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INReservationAction initWithType:validDuration:userActivity:](self, "initWithType:validDuration:userActivity:", v5, v6, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  id v6;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validDuration, CFSTR("validDuration"));
  INUserActivitySerializeToData(self->_userActivity);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("userActivity"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_type == 1)
    v8 = CFSTR("checkIn");
  else
    v8 = CFSTR("unknown");
  v9 = v8;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_validDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("validDuration"));

  INUserActivitySerializeToData(self->_userActivity);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("userActivity"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INReservationAction descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INReservationAction;
  -[INReservationAction description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INReservationAction _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  INDateComponentsRange *validDuration;
  void *v5;
  NSUserActivity *userActivity;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("validDuration");
  validDuration = self->_validDuration;
  v5 = validDuration;
  if (!validDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v5;
  v10[2] = CFSTR("userActivity");
  userActivity = self->_userActivity;
  v7 = userActivity;
  if (!userActivity)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!userActivity)
  {

    if (validDuration)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!validDuration)
    goto LABEL_9;
LABEL_7:

  return v8;
}

- (INReservationActionType)type
{
  return self->_type;
}

- (INDateComponentsRange)validDuration
{
  return self->_validDuration;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_validDuration, 0);
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("checkIn"));

  v11 = objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("validDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodeObjectOfClass:from:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userActivity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "decodeObjectOfClass:from:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  INUserActivityDeserializeFromData(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:validDuration:userActivity:", v10, v13, v17);

  return v18;
}

@end
