@implementation MRUSubtitleValue

- (MRUSubtitleValue)initWithText:(id)a3 icon:(id)a4 accessory:(int64_t)a5
{
  id v8;
  id v9;
  MRUSubtitleValue *v10;
  uint64_t v11;
  NSString *text;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRUSubtitleValue;
  v10 = -[MRUSubtitleValue init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    text = v10->_text;
    v10->_text = (NSString *)v11;

    objc_storeStrong((id *)&v10->_icon, a4);
    v10->_accessory = a5;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUSubtitleValue text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRUSubtitleValue accessory](self, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p text=%@ accessory=%@ >"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToSubtitleValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int64_t v10;

  v4 = a3;
  -[MRUSubtitleValue text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[MRUSubtitleValue icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v10 = -[MRUSubtitleValue accessory](self, "accessory");
      v9 = v10 == objc_msgSend(v4, "accessory");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (int64_t)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
