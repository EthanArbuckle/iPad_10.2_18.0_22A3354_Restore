@implementation MapsSuggestionsContact

- (MapsSuggestionsContact)initWithHandleValue:(id)a3
{
  id v4;
  MapsSuggestionsContact *v5;
  uint64_t v6;
  NSString *handleValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsContact;
  v5 = -[MapsSuggestionsContact init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handleValue = v5->_handleValue;
    v5->_handleValue = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MapsSuggestionsContact handleValue](self, "handleValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHandleValue:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_handleValue, CFSTR("MapsSuggestionsContactHandleValueKey"));
}

- (MapsSuggestionsContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MapsSuggestionsContact *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MapsSuggestionsContactHandleValueKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MapsSuggestionsContact initWithHandleValue:](self, "initWithHandleValue:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MapsSuggestionsContact *v4;
  MapsSuggestionsContact *v5;
  NSString *handleValue;
  NSString *v7;
  NSString *v8;
  void *v9;
  _BOOL4 v10;

  v4 = (MapsSuggestionsContact *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      handleValue = self->_handleValue;
      -[MapsSuggestionsContact handleValue](v5, "handleValue");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (handleValue == v7
        || (v8 = self->_handleValue,
            -[MapsSuggestionsContact handleValue](v5, "handleValue"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = -[NSString isEqualToString:](v8, "isEqualToString:", v9),
            v9,
            v10))
      {
        LOBYTE(v10) = 1;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MapsSuggestionsContact handleValue](self, "handleValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E4BDFC28;
  if (v4)
    v6 = (const __CFString *)v4;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("CONTACT '%@'"), v6);

  return v7;
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (void)setHandleValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleValue, 0);
}

@end
