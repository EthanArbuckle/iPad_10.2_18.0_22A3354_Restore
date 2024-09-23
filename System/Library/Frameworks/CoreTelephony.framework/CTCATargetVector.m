@implementation CTCATargetVector

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCATargetVector x](self, "x");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", x=%@"), v4);

  -[CTCATargetVector y](self, "y");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", y=%@"), v5);

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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCATargetVector x](self, "x");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setX:", v7);

  -[CTCATargetVector y](self, "y");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setY:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTCATargetVector x](self, "x");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("x"));

  -[CTCATargetVector y](self, "y");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("y"));

}

- (CTCATargetVector)initWithCoder:(id)a3
{
  id v4;
  CTCATargetVector *v5;
  uint64_t v6;
  CTCATargetVectorAxis *x;
  uint64_t v8;
  CTCATargetVectorAxis *y;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCATargetVector;
  v5 = -[CTCATargetVector init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("x"));
    v6 = objc_claimAutoreleasedReturnValue();
    x = v5->_x;
    v5->_x = (CTCATargetVectorAxis *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("y"));
    v8 = objc_claimAutoreleasedReturnValue();
    y = v5->_y;
    v5->_y = (CTCATargetVectorAxis *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCATargetVectorAxis)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
  objc_storeStrong((id *)&self->_x, a3);
}

- (CTCATargetVectorAxis)y
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
}

@end
