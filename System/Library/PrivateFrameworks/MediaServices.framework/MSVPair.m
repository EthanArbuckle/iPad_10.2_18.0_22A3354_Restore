@implementation MSVPair

- (id)second
{
  return self->_second;
}

- (id)first
{
  return self->_first;
}

- (MSVPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  MSVPair *v9;
  MSVPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVPair;
  v9 = -[MSVPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@, %@}"), self->_first, self->_second);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_first, "hash");
  return objc_msgSend(self->_second, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  MSVPair *v4;
  MSVPair *v5;
  id first;
  id second;
  char v8;

  v4 = (MSVPair *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      first = self->_first;
      if (first == v5->_first || objc_msgSend(first, "isEqual:"))
      {
        second = self->_second;
        if (second == v5->_second)
          v8 = 1;
        else
          v8 = objc_msgSend(second, "isEqual:");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (MSVPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MSVPair *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("first"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("second"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MSVPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id first;
  id v5;

  first = self->_first;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", first, CFSTR("first"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_second, CFSTR("second"));

}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
