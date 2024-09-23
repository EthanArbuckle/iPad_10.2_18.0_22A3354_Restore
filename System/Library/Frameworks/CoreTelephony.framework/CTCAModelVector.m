@implementation CTCAModelVector

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCAModelVector defaultVector](self, "defaultVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", defaultVector=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCAModelVector defaultVector](self, "defaultVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDefaultVector:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTCAModelVector defaultVector](self, "defaultVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("defaultVector"));

}

- (CTCAModelVector)initWithCoder:(id)a3
{
  id v4;
  CTCAModelVector *v5;
  uint64_t v6;
  CTCATargetVector *defaultVector;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCAModelVector;
  v5 = -[CTCAModelVector init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultVector"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultVector = v5->_defaultVector;
    v5->_defaultVector = (CTCATargetVector *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCATargetVector)defaultVector
{
  return self->_defaultVector;
}

- (void)setDefaultVector:(id)a3
{
  objc_storeStrong((id *)&self->_defaultVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultVector, 0);
}

@end
