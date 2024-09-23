@implementation INTemporalEventTrigger

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  return 0;
}

- (INTemporalEventTrigger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INTemporalEventTrigger;
  return -[INTemporalEventTrigger init](&v3, sel_init);
}

- (INTemporalEventTrigger)initWithDateComponentsRange:(INDateComponentsRange *)dateComponentsRange
{
  INDateComponentsRange *v4;
  INTemporalEventTrigger *v5;
  uint64_t v6;
  INDateComponentsRange *v7;
  objc_super v9;

  v4 = dateComponentsRange;
  v9.receiver = self;
  v9.super_class = (Class)INTemporalEventTrigger;
  v5 = -[INTemporalEventTrigger init](&v9, sel_init);
  if (v5)
  {
    v6 = -[INDateComponentsRange copy](v4, "copy");
    v7 = v5->_dateComponentsRange;
    v5->_dateComponentsRange = (INDateComponentsRange *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[INDateComponentsRange hash](self->_dateComponentsRange, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INTemporalEventTrigger *v4;
  INTemporalEventTrigger *v5;
  INDateComponentsRange *dateComponentsRange;
  BOOL v7;

  v4 = (INTemporalEventTrigger *)a3;
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
      dateComponentsRange = self->_dateComponentsRange;
      v7 = dateComponentsRange == v5->_dateComponentsRange
        || -[INDateComponentsRange isEqual:](dateComponentsRange, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INTemporalEventTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INTemporalEventTrigger *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponentsRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[INTemporalEventTrigger initWithDateComponentsRange:](self, "initWithDateComponentsRange:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateComponentsRange, CFSTR("dateComponentsRange"));
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_dateComponentsRange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("dateComponentsRange"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTemporalEventTrigger descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INTemporalEventTrigger;
  -[INTemporalEventTrigger description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTemporalEventTrigger _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INDateComponentsRange *dateComponentsRange;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("dateComponentsRange");
  dateComponentsRange = self->_dateComponentsRange;
  v3 = dateComponentsRange;
  if (!dateComponentsRange)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!dateComponentsRange)

  return v4;
}

- (INDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsRange, 0);
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

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dateComponentsRange"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDateComponentsRange:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
