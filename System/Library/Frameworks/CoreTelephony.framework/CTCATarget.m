@implementation CTCATarget

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCATarget targetId](self, "targetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", targetId=%@"), v4);

  -[CTCATarget targetDescription](self, "targetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", targetDescription=%@"), v5);

  -[CTCATarget x](self, "x");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", x=%@"), v6);

  -[CTCATarget y](self, "y");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", y=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCATarget targetId](self, "targetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargetId:", v7);

  -[CTCATarget targetDescription](self, "targetDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargetDescription:", v9);

  -[CTCATarget x](self, "x");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setX:", v11);

  -[CTCATarget y](self, "y");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setY:", v13);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTCATarget targetId](self, "targetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("targetId"));

  -[CTCATarget targetDescription](self, "targetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("targetDescription"));

  -[CTCATarget x](self, "x");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("x"));

  -[CTCATarget y](self, "y");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("y"));

}

- (CTCATarget)initWithCoder:(id)a3
{
  id v4;
  CTCATarget *v5;
  uint64_t v6;
  NSNumber *targetId;
  uint64_t v8;
  NSString *targetDescription;
  uint64_t v10;
  NSNumber *x;
  uint64_t v12;
  NSNumber *y;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCATarget;
  v5 = -[CTCATarget init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetId = v5->_targetId;
    v5->_targetId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetDescription = v5->_targetDescription;
    v5->_targetDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("x"));
    v10 = objc_claimAutoreleasedReturnValue();
    x = v5->_x;
    v5->_x = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("y"));
    v12 = objc_claimAutoreleasedReturnValue();
    y = v5->_y;
    v5->_y = (NSNumber *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)targetId
{
  return self->_targetId;
}

- (void)setTargetId:(id)a3
{
  objc_storeStrong((id *)&self->_targetId, a3);
}

- (NSString)targetDescription
{
  return self->_targetDescription;
}

- (void)setTargetDescription:(id)a3
{
  objc_storeStrong((id *)&self->_targetDescription, a3);
}

- (NSNumber)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
  objc_storeStrong((id *)&self->_x, a3);
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
  objc_storeStrong((id *)&self->_y, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_x, 0);
  objc_storeStrong((id *)&self->_targetDescription, 0);
  objc_storeStrong((id *)&self->_targetId, 0);
}

@end
