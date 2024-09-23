@implementation ASCIconOfferMetadata

- (ASCIconOfferMetadata)initWithBaseImageName:(id)a3 animationName:(id)a4
{
  id v6;
  id v7;
  ASCIconOfferMetadata *v8;
  uint64_t v9;
  NSString *baseImageName;
  uint64_t v11;
  NSString *animationName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCIconOfferMetadata;
  v8 = -[ASCOfferMetadata _init](&v14, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    baseImageName = v8->_baseImageName;
    v8->_baseImageName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    animationName = v8->_animationName;
    v8->_animationName = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCIconOfferMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASCIconOfferMetadata *v7;
  id *p_isa;
  ASCIconOfferMetadata *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseImageName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animationName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v27.receiver = self;
      v27.super_class = (Class)ASCIconOfferMetadata;
      v7 = -[ASCOfferMetadata initWithCoder:](&v27, sel_initWithCoder_, v4);
      p_isa = (id *)&v7->super.super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_baseImageName, v5);
        objc_storeStrong(p_isa + 1, v6);
      }
      self = p_isa;
      v9 = self;
    }
    else
    {
      v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v18)
        -[ASCIconOfferMetadata initWithCoder:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
      v9 = 0;
    }

  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      -[ASCIconOfferMetadata initWithCoder:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCIconOfferMetadata;
  v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ASCIconOfferMetadata baseImageName](self, "baseImageName", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseImageName"));

  -[ASCIconOfferMetadata animationName](self, "animationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("animationName"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCIconOfferMetadata baseImageName](self, "baseImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCIconOfferMetadata animationName](self, "animationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
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
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

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
    -[ASCIconOfferMetadata baseImageName](self, "baseImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "baseImageName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCIconOfferMetadata animationName](self, "animationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animationName");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
      else
        v14 = v11 == (void *)v12;

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCIconOfferMetadata baseImageName](self, "baseImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("baseImageName"));

  -[ASCIconOfferMetadata animationName](self, "animationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("animationName"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageNameForSize:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[ASCIconOfferMetadata baseImageName](self, "baseImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", 0x1E7565128);

  v8 = CFSTR("Medium");
  if (!v7)
    v8 = &stru_1E7562EE8;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v6, v8, &stru_1E7562EE8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isIcon
{
  return 1;
}

- (NSString)animationName
{
  return self->_animationName;
}

- (NSString)baseImageName
{
  return self->_baseImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageName, 0);
  objc_storeStrong((id *)&self->_animationName, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCIconOfferMetadata because baseImageName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCIconOfferMetadata because animationName was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
