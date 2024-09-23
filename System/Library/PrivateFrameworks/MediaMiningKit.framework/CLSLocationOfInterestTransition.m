@implementation CLSLocationOfInterestTransition

- (CLSLocationOfInterestTransition)initWithIdentifier:(id)a3 transitionInterval:(id)a4 transportationMode:(int64_t)a5
{
  id v9;
  id v10;
  CLSLocationOfInterestTransition *v11;
  CLSLocationOfInterestTransition *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSLocationOfInterestTransition;
  v11 = -[CLSLocationOfInterestTransition init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_transitionInterval, a4);
    v12->_transportationMode = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t transportationMode;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CLSLocationOfInterestTransition;
  -[CLSLocationOfInterestTransition description](&v10, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  transportationMode = self->_transportationMode;
  if (transportationMode > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E84F9000[transportationMode];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ - %@"), v4, self->_transitionInterval, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CLSLocationOfInterestTransition *v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = (CLSLocationOfInterestTransition *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[CLSLocationOfInterestTransition identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)transitionInterval
{
  return self->_transitionInterval;
}

- (int64_t)transportationMode
{
  return self->_transportationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
