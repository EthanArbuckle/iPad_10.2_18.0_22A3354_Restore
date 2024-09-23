@implementation CTSweetgumUsagePlanItemMessages

- (CTSweetgumUsagePlanItemMessages)init
{
  CTSweetgumUsagePlanItemMessages *v2;
  CTSweetgumUsagePlanItemMessages *v3;
  NSString *capacity;
  NSString *used;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumUsagePlanItemMessages;
  v2 = -[CTSweetgumUsagePlanItemMessages init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    capacity = v2->_capacity;
    v2->_capacity = 0;

    used = v3->_used;
    v3->_used = 0;

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
  -[CTSweetgumUsagePlanItemMessages capacity](self, "capacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", capacity=%@"), v4);

  -[CTSweetgumUsagePlanItemMessages used](self, "used");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", used=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTSweetgumUsagePlanItemMessages *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTSweetgumUsagePlanItemMessages *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumUsagePlanItemMessages capacity](self, "capacity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsagePlanItemMessages capacity](v6, "capacity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTSweetgumUsagePlanItemMessages capacity](self, "capacity"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTSweetgumUsagePlanItemMessages capacity](v6, "capacity"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        -[CTSweetgumUsagePlanItemMessages used](self, "used");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsagePlanItemMessages used](v6, "used");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTSweetgumUsagePlanItemMessages used](self, "used");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSweetgumUsagePlanItemMessages used](v6, "used");
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
  NSString *capacity;
  id v5;

  capacity = self->_capacity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", capacity, CFSTR("capacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_used, CFSTR("used"));

}

- (CTSweetgumUsagePlanItemMessages)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumUsagePlanItemMessages *v5;
  uint64_t v6;
  NSString *capacity;
  uint64_t v8;
  NSString *used;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUsagePlanItemMessages;
  v5 = -[CTSweetgumUsagePlanItemMessages init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capacity"));
    v6 = objc_claimAutoreleasedReturnValue();
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("used"));
    v8 = objc_claimAutoreleasedReturnValue();
    used = v5->_used;
    v5->_used = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_capacity, a3);
}

- (NSString)used
{
  return self->_used;
}

- (void)setUsed:(id)a3
{
  objc_storeStrong((id *)&self->_used, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_used, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
}

@end
