@implementation IAMValueEvent

- (IAMValueEvent)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  IAMValueEvent *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IAMValueEvent;
  v8 = -[IAMValueEvent init](&v11, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[IAMEvent setName:](v8, "setName:", v9);

    -[IAMEvent setType:](v8, "setType:", 1);
    -[IAMValueEvent setValue:](v8, "setValue:", v7);
  }

  return v8;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->value, 0);
}

- (NSCopying)value
{
  return self->value;
}

@end
