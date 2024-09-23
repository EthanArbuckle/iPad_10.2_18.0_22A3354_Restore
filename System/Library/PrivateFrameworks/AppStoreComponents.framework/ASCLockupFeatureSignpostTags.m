@implementation ASCLockupFeatureSignpostTags

- (ASCLockupFeatureSignpostTags)initWithSignpostTags:(id)a3
{
  id v4;
  ASCLockupFeatureSignpostTags *v5;
  uint64_t v6;
  NSSet *signpostTags;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureSignpostTags;
  v5 = -[ASCLockupFeatureSignpostTags init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    signpostTags = v5->_signpostTags;
    v5->_signpostTags = (NSSet *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureSignpostTags)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ASCLockupFeatureSignpostTags *v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("signpostTags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[ASCLockupFeatureSignpostTags initWithSignpostTags:](self, "initWithSignpostTags:", v9);
    v10 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ASCLockupFeatureSignpostTags initWithCoder:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signpostTags"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v4 = a3;
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
  v7 = v6;

  if (v7)
  {
    -[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signpostTags");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqual:", v9);
    else
      v11 = v8 == (void *)v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureSignpostTags signpostTags](self, "signpostTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("signpostTags"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSSet)signpostTags
{
  return self->_signpostTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostTags, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not decode ASCLockupFeatureSignpostTags because signpostTags was missing", v0, 2u);
}

@end
