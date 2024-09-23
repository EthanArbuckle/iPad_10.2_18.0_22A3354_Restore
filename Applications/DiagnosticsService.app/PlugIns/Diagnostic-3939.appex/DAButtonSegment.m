@implementation DAButtonSegment

- (DAButtonSegment)initWithDictionary:(id)a3
{
  id v4;
  DAButtonSegment *v5;
  DAButtonSegment *v6;
  uint64_t v7;
  NSString *location;
  void *v9;
  DAStateRange *v10;
  DAStateRange *range;
  BOOL v12;
  objc_super v14;
  char v15;

  v4 = a3;
  v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)DAButtonSegment;
  v5 = -[DASpecification initWithDictionary:](&v14, "initWithDictionary:", v4);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:maxLength:failed:", CFSTR("location"), 100, &v15));
    location = v6->_location;
    v6->_location = (NSString *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("numberOfActions"), &off_1000110F0, &off_100011108, &v15));
    v6->_numberOfActions = objc_msgSend(v9, "intValue");

    v10 = -[DAStateRange initWithDictionary:]([DAStateRange alloc], "initWithDictionary:", v4);
    range = v6->_range;
    v6->_range = v10;

    v12 = v15 == 0;
  }
  else
  {
    v12 = 1;
  }
  if (!v6->_range || !v12)
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)numberOfActions
{
  return self->_numberOfActions;
}

- (void)setNumberOfActions:(int)a3
{
  self->_numberOfActions = a3;
}

- (DAStateRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
