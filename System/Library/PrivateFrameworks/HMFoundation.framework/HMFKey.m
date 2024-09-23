@implementation HMFKey

- (HMFKey)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFKey)initWithType:(id)a3 size:(unint64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMFKey *v11;
  uint64_t v12;
  NSString *type;
  void *v14;
  id v15;
  uint64_t v16;
  NSData *data;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  if (!v8 || (v10 = v9, !objc_msgSend(v8, "length")))
    _HMFPreconditionFailure(CFSTR("type && [type length] > 0"));
  if (!v10)
    _HMFPreconditionFailure(CFSTR("data"));
  v19.receiver = self;
  v19.super_class = (Class)HMFKey;
  v11 = -[HMFKey init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99D50];
    v15 = objc_retainAutorelease(v10);
    v16 = objc_msgSend(v14, "_newZeroingDataWithBytes:length:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    data = v11->_data;
    v11->_data = (NSData *)v16;

    if (!a4)
      a4 = 8 * objc_msgSend(v15, "length");
    v11->_size = a4;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFKey data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFKey *v4;
  HMFKey *v5;
  HMFKey *v6;
  HMFKey *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMFKey *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      -[HMFKey type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFKey type](self, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9)
        && (v10 = -[HMFKey size](v7, "size"), v10 == -[HMFKey size](self, "size")))
      {
        -[HMFKey data](v7, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFKey data](self, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)isEqualToData:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMFKey data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects(v5, v4);

  return v6;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFKey size](self, "size");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ type: %@ length: %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFKey)initWithCoder:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  HMFKey *v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMF.kt")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.kt"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unknown");
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMF.ks")))
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.ks"));
  else
    v6 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFKey initWithType:size:data:](self, "initWithType:size:data:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMFKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMF.kt"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFKey size](self, "size"), CFSTR("HMF.ks"));
  -[HMFKey data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HAP.data"));

}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
