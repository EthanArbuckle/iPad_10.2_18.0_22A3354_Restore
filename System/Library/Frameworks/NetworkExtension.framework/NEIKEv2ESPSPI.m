@implementation NEIKEv2ESPSPI

- (NEIKEv2ESPSPI)initWithValue:(unsigned int)a3
{
  NEIKEv2ESPSPI *v4;
  NEIKEv2ESPSPI *v5;
  NEIKEv2ESPSPI *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2ESPSPI;
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

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%08X"), bswap32(-[NEIKEv2ESPSPI value](self, "value")));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2ESPSPI value](self, "value");
    v7 = objc_msgSend(v5, "value");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NEIKEv2ESPSPI value](self, "value");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEIKEv2ESPSPI initWithValue:](+[NEIKEv2ESPSPI allocWithZone:](NEIKEv2ESPSPI, "allocWithZone:", a3), "initWithValue:", -[NEIKEv2ESPSPI value](self, "value"));
}

- (unsigned)value
{
  return self->_value;
}

@end
