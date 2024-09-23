@implementation SKStorefront

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (SKStorefront)initWithIdentifier:(id)a3 countryCode:(id)a4
{
  id v7;
  id v8;
  SKStorefront *v9;
  SKStorefront *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKStorefront;
  v9 = -[SKStorefront init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countryCode, a4);
    objc_storeStrong((id *)&v10->_identifier, a3);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_countryCode, self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

@end
