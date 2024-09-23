@implementation Detection

- (Detection)init
{
  Detection *v2;
  Detection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)Detection;
  v2 = -[Detection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[Detection setBounds:](v2, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[Detection setOid:](v3, "setOid:", 0);
  }
  return v3;
}

- (Detection)initWithCoder:(id)a3
{
  id v4;
  Detection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[Detection init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bounds"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rectValue");
    -[Detection setBounds:](v5, "setBounds:");
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("oid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[Detection setOid:](v5, "setOid:", objc_msgSend(v10, "longValue"));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  -[Detection bounds](self, "bounds");
  objc_msgSend(v4, "valueWithRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[Detection oid](self, "oid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("oid"));

}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->bounds.origin.x;
  y = self->bounds.origin.y;
  width = self->bounds.size.width;
  height = self->bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
}

- (int64_t)oid
{
  return self->oid;
}

- (void)setOid:(int64_t)a3
{
  self->oid = a3;
}

@end
