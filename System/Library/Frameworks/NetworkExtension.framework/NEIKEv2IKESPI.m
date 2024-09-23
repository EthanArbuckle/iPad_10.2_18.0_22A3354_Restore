@implementation NEIKEv2IKESPI

- (NEIKEv2IKESPI)initWithValue:(unint64_t)a3
{
  NEIKEv2IKESPI *v4;
  NEIKEv2IKESPI *v5;
  NEIKEv2IKESPI *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2IKESPI;
  v4 = -[NEIKEv2SPI init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (NEIKEv2IKESPI)init
{
  uint64_t __buf;

  __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  return -[NEIKEv2IKESPI initWithValue:](self, "initWithValue:", __buf);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%016llX"), bswap64(-[NEIKEv2IKESPI value](self, "value")));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2IKESPI value](self, "value");
    v7 = objc_msgSend(v5, "value");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEIKEv2IKESPI initWithValue:](+[NEIKEv2IKESPI allocWithZone:](NEIKEv2IKESPI, "allocWithZone:", a3), "initWithValue:", -[NEIKEv2IKESPI value](self, "value"));
}

- (unint64_t)value
{
  return self->_value;
}

@end
