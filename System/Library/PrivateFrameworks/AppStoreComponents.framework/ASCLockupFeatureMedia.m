@implementation ASCLockupFeatureMedia

- (ASCLockupFeatureMedia)initWithScreenshots:(id)a3 trailers:(id)a4
{
  id v6;
  id v7;
  ASCLockupFeatureMedia *v8;
  uint64_t v9;
  ASCScreenshots *screenshots;
  uint64_t v11;
  ASCTrailers *trailers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureMedia;
  v8 = -[ASCLockupFeatureMedia init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    screenshots = v8->_screenshots;
    v8->_screenshots = (ASCScreenshots *)v9;

    v11 = objc_msgSend(v7, "copy");
    trailers = v8->_trailers;
    v8->_trailers = (ASCTrailers *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureMedia)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASCLockupFeatureMedia *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screenshots"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASCLockupFeatureMedia initWithScreenshots:trailers:](self, "initWithScreenshots:trailers:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCLockupFeatureMedia screenshots](self, "screenshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("screenshots"));

  -[ASCLockupFeatureMedia trailers](self, "trailers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trailers"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureMedia screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupFeatureMedia trailers](self, "trailers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureMedia *v4;
  ASCLockupFeatureMedia *v5;
  ASCLockupFeatureMedia *v6;
  char v7;
  ASCLockupFeatureMedia *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (ASCLockupFeatureMedia *)a3;
  if (self != v4)
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

    if (!v8)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[ASCLockupFeatureMedia screenshots](self, "screenshots");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupFeatureMedia screenshots](v8, "screenshots");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
        goto LABEL_12;
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      -[ASCLockupFeatureMedia trailers](self, "trailers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupFeatureMedia trailers](v8, "trailers");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 && v13)
        v7 = objc_msgSend(v12, "isEqual:", v13);
      else
        v7 = v12 == (void *)v13;

      goto LABEL_20;
    }
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 1;
LABEL_22:

  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureMedia screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("screenshots"));

  -[ASCLockupFeatureMedia trailers](self, "trailers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("trailers"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (ASCTrailers)trailers
{
  return self->_trailers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end
