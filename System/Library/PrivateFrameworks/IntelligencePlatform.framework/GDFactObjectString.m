@implementation GDFactObjectString

- (GDFactObjectString)initWithValue:(id)a3
{
  id v5;
  GDFactObjectString *v6;
  GDFactObjectString *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectString;
  v6 = -[GDFactObjectString init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
