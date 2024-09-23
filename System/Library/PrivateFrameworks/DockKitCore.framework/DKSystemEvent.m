@implementation DKSystemEvent

- (DKSystemEvent)initWithType:(unsigned __int8)a3 value:(id)a4
{
  uint64_t v4;
  id v6;
  DKSystemEvent *v7;
  DKSystemEvent *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DKSystemEvent;
  v7 = -[DKSystemEvent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[DKSystemEvent setType:](v7, "setType:", v4);
    -[DKSystemEvent setValue:](v8, "setValue:", v6);
  }

  return v8;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
