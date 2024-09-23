@implementation ASCLockupFeatureAd

- (ASCLockupFeatureAd)initWithEditorsChoice:(BOOL)a3 productRating:(float)a4 productRatingBadge:(id)a5 productDescription:(id)a6
{
  id v10;
  id v11;
  ASCLockupFeatureAd *v12;
  ASCLockupFeatureAd *v13;
  uint64_t v14;
  NSString *productRatingBadge;
  uint64_t v16;
  NSString *productDescription;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFeatureAd;
  v12 = -[ASCLockupFeatureAd init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_isEditorsChoice = a3;
    v12->_productRating = a4;
    v14 = objc_msgSend(v10, "copy");
    productRatingBadge = v13->_productRatingBadge;
    v13->_productRatingBadge = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    productDescription = v13->_productDescription;
    v13->_productDescription = (NSString *)v16;

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAd)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  ASCLockupFeatureAd *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEditorsChoice"));
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("productRating")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("productRating"));
    v7 = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productRatingBadge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v7;
    self = -[ASCLockupFeatureAd initWithEditorsChoice:productRating:productRatingBadge:productDescription:](self, "initWithEditorsChoice:productRating:productRatingBadge:productDescription:", v5, v8, v9, v10);

    v11 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ASCLockupFeatureAd initWithCoder:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"), CFSTR("isEditorsChoice"));
  -[ASCLockupFeatureAd productRating](self, "productRating");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("productRating"));
  -[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productRatingBadge"));

  -[ASCLockupFeatureAd productDescription](self, "productDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productDescription"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  float v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"));
  -[ASCLockupFeatureAd productRating](self, "productRating");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v4);
  -[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockupFeatureAd productDescription](self, "productDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureAd *v4;
  ASCLockupFeatureAd *v5;
  ASCLockupFeatureAd *v6;
  char v7;
  ASCLockupFeatureAd *v8;
  _BOOL4 v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = (ASCLockupFeatureAd *)a3;
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

    if (!v8
      || (v9 = -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"),
          v9 != -[ASCLockupFeatureAd isEditorsChoice](v8, "isEditorsChoice"))
      || (-[ASCLockupFeatureAd productRating](self, "productRating"),
          v11 = v10,
          -[ASCLockupFeatureAd productRating](v8, "productRating"),
          v11 != v12))
    {
      v7 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupFeatureAd productRatingBadge](v8, "productRatingBadge");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 && v14)
    {
      if (objc_msgSend(v13, "isEqual:", v14))
        goto LABEL_14;
    }
    else if (v13 == (void *)v14)
    {
LABEL_14:
      -[ASCLockupFeatureAd productDescription](self, "productDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupFeatureAd productDescription](v8, "productDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v16 && v17)
        v7 = objc_msgSend(v16, "isEqual:", v17);
      else
        v7 = v16 == (void *)v17;

      goto LABEL_24;
    }
    v7 = 0;
LABEL_24:

    goto LABEL_18;
  }
  v7 = 1;
LABEL_19:

  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"), CFSTR("isEditorsChoice"));
  -[ASCLockupFeatureAd productRating](self, "productRating");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("productRating"), v4);
  -[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("productRatingBadge"));

  -[ASCLockupFeatureAd productDescription](self, "productDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("productDescription"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEditorsChoice
{
  return self->_isEditorsChoice;
}

- (float)productRating
{
  return self->_productRating;
}

- (NSString)productRatingBadge
{
  return self->_productRatingBadge;
}

- (NSString)productDescription
{
  return self->_productDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productDescription, 0);
  objc_storeStrong((id *)&self->_productRatingBadge, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not decode ASCLockupFeatureAd because productRating was missing", v0, 2u);
}

@end
