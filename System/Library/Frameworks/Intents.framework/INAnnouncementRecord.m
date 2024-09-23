@implementation INAnnouncementRecord

- (INAnnouncementRecord)initWithOriginator:(id)a3 identifier:(id)a4 duration:(id)a5
{
  id v8;
  id v9;
  id v10;
  INAnnouncementRecord *v11;
  uint64_t v12;
  INHomeFilter *originator;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSNumber *duration;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INAnnouncementRecord;
  v11 = -[INAnnouncementRecord init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    originator = v11->_originator;
    v11->_originator = (INHomeFilter *)v12;

    v14 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    duration = v11->_duration;
    v11->_duration = (NSNumber *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[INHomeFilter hash](self->_originator, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_duration, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INAnnouncementRecord *v4;
  INAnnouncementRecord *v5;
  INHomeFilter *originator;
  NSString *identifier;
  NSNumber *duration;
  BOOL v9;

  v4 = (INAnnouncementRecord *)a3;
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
      originator = self->_originator;
      v9 = 0;
      if (originator == v5->_originator || -[INHomeFilter isEqual:](originator, "isEqual:"))
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          duration = self->_duration;
          if (duration == v5->_duration || -[NSNumber isEqual:](duration, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INAnnouncementRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  INAnnouncementRecord *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INAnnouncementRecord initWithOriginator:identifier:duration:](self, "initWithOriginator:identifier:duration:", v5, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  INHomeFilter *originator;
  id v5;

  originator = self->_originator;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originator, CFSTR("originator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("duration"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_originator);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("originator"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_duration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("duration"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAnnouncementRecord descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INAnnouncementRecord;
  -[INAnnouncementRecord description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAnnouncementRecord _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INHomeFilter *originator;
  void *v4;
  NSString *identifier;
  void *v6;
  NSNumber *duration;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("originator");
  originator = self->_originator;
  v4 = originator;
  if (!originator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("identifier");
  identifier = self->_identifier;
  v6 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("duration");
  duration = self->_duration;
  v8 = duration;
  if (!duration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (duration)
  {
    if (identifier)
      goto LABEL_9;
LABEL_12:

    if (originator)
      return v9;
LABEL_13:

    return v9;
  }

  if (!identifier)
    goto LABEL_12;
LABEL_9:
  if (!originator)
    goto LABEL_13;
  return v9;
}

- (INHomeFilter)originator
{
  return self->_originator;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originator, 0);
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
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("originator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOriginator:identifier:duration:", v11, v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
