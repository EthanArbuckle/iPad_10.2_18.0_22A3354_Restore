@implementation DASwitchState

- (DASwitchState)initWithDictionary:(id)a3
{
  id v4;
  DASwitchState *v5;
  DAStateRange *v6;
  DAStateRange *range;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DASwitchState;
  v5 = -[DASpecification initWithDictionary:](&v9, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = -[DAStateRange initWithDictionary:]([DAStateRange alloc], "initWithDictionary:", v4);
    range = v5->_range;
    v5->_range = v6;

  }
  if (!v5->_range)
  {

    v5 = 0;
  }

  return v5;
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
}

@end
