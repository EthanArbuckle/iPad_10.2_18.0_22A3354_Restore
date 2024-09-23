@implementation CTCATargetReading

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCATargetReading targetId](self, "targetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", targetId=%@"), v4);

  -[CTCATargetReading x](self, "x");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", x=%@"), v5);

  -[CTCATargetReading y](self, "y");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", y=%@"), v6);

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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCATargetReading targetId](self, "targetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargetId:", v7);

  -[CTCATargetReading x](self, "x");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setX:", v9);

  -[CTCATargetReading y](self, "y");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setY:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTCATargetReading targetId](self, "targetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("targetId"));

  -[CTCATargetReading x](self, "x");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("x"));

  -[CTCATargetReading y](self, "y");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("y"));

}

- (CTCATargetReading)initWithCoder:(id)a3
{
  id v4;
  CTCATargetReading *v5;
  uint64_t v6;
  NSNumber *targetId;
  uint64_t v8;
  NSNumber *x;
  uint64_t v10;
  NSNumber *y;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCATargetReading;
  v5 = -[CTCATargetReading init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetId = v5->_targetId;
    v5->_targetId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("x"));
    v8 = objc_claimAutoreleasedReturnValue();
    x = v5->_x;
    v5->_x = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("y"));
    v10 = objc_claimAutoreleasedReturnValue();
    y = v5->_y;
    v5->_y = (NSNumber *)v10;

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
  objc_storeStrong((id *)&self->_targetId, 0);
}

@end
