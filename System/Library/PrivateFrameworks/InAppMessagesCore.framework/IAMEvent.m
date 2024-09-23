@implementation IAMEvent

- (NSString)name
{
  return self->_name;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (IAMEvent)initWithName:(id)a3 type:(int64_t)a4
{
  id v6;
  IAMEvent *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IAMEvent;
  v7 = -[IAMEvent init](&v10, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[IAMEvent setName:](v7, "setName:", v8);

    -[IAMEvent setType:](v7, "setType:", a4);
  }

  return v7;
}

- (BOOL)matchesWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IAMEvent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

@end
