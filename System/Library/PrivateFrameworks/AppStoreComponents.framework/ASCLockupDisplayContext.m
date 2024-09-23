@implementation ASCLockupDisplayContext

- (ASCLockupDisplayContext)initWithHeadingKind:(id)a3
{
  id v5;
  ASCLockupDisplayContext *v6;
  ASCLockupDisplayContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupDisplayContext;
  v6 = -[ASCLockupDisplayContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_headingKind, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupDisplayContext)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  ASCLockupDisplayContext *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("headingKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ASCLockupDisplayContext initWithHeadingKind:](self, "initWithHeadingKind:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupDisplayContext headingKind](self, "headingKind");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("headingKind"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupDisplayContext headingKind](self, "headingKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupDisplayContext *v4;
  ASCLockupDisplayContext *v5;
  ASCLockupDisplayContext *v6;
  char v7;
  ASCLockupDisplayContext *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (ASCLockupDisplayContext *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      -[ASCLockupDisplayContext headingKind](self, "headingKind");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupDisplayContext headingKind](v8, "headingKind");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
        v7 = objc_msgSend(v9, "isEqual:", v10);
      else
        v7 = v9 == (void *)v10;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupDisplayContext headingKind](self, "headingKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("headingKind"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)headingKind
{
  return self->_headingKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headingKind, 0);
}

@end
