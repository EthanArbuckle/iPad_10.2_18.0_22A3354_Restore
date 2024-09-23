@implementation CTSweetgumUsagePlanItemVoice

- (CTSweetgumUsagePlanItemVoice)init
{
  CTSweetgumUsagePlanItemVoice *v2;
  CTSweetgumUsagePlanItemVoice *v3;
  NSString *minutesCapacity;
  NSString *minutesUsed;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumUsagePlanItemVoice;
  v2 = -[CTSweetgumUsagePlanItemVoice init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    minutesCapacity = v2->_minutesCapacity;
    v2->_minutesCapacity = 0;

    minutesUsed = v3->_minutesUsed;
    v3->_minutesUsed = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSweetgumUsagePlanItemVoice minutesCapacity](self, "minutesCapacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", minutesCapacity=%@"), v4);

  -[CTSweetgumUsagePlanItemVoice minutesUsed](self, "minutesUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", minutesUsed=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTSweetgumUsagePlanItemVoice *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTSweetgumUsagePlanItemVoice *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumUsagePlanItemVoice minutesCapacity](self, "minutesCapacity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanItemVoice minutesCapacity](v6, "minutesCapacity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTSweetgumUsagePlanItemVoice minutesCapacity](self, "minutesCapacity"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTSweetgumUsagePlanItemVoice minutesCapacity](v6, "minutesCapacity"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        -[CTSweetgumUsagePlanItemVoice minutesUsed](self, "minutesUsed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanItemVoice minutesUsed](v6, "minutesUsed");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTSweetgumUsagePlanItemVoice minutesUsed](self, "minutesUsed");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSweetgumUsagePlanItemVoice minutesUsed](v6, "minutesUsed");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *minutesCapacity;
  id v5;

  minutesCapacity = self->_minutesCapacity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minutesCapacity, CFSTR("minutesCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minutesUsed, CFSTR("minutesUsed"));

}

- (CTSweetgumUsagePlanItemVoice)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumUsagePlanItemVoice *v5;
  uint64_t v6;
  NSString *minutesCapacity;
  uint64_t v8;
  NSString *minutesUsed;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUsagePlanItemVoice;
  v5 = -[CTSweetgumUsagePlanItemVoice init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minutesCapacity"));
    v6 = objc_claimAutoreleasedReturnValue();
    minutesCapacity = v5->_minutesCapacity;
    v5->_minutesCapacity = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minutesUsed"));
    v8 = objc_claimAutoreleasedReturnValue();
    minutesUsed = v5->_minutesUsed;
    v5->_minutesUsed = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)minutesCapacity
{
  return self->_minutesCapacity;
}

- (void)setMinutesCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_minutesCapacity, a3);
}

- (NSString)minutesUsed
{
  return self->_minutesUsed;
}

- (void)setMinutesUsed:(id)a3
{
  objc_storeStrong((id *)&self->_minutesUsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesUsed, 0);
  objc_storeStrong((id *)&self->_minutesCapacity, 0);
}

@end
