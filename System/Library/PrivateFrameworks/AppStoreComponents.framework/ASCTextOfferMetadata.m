@implementation ASCTextOfferMetadata

- (ASCTextOfferMetadata)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  ASCTextOfferMetadata *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *subtitle;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCTextOfferMetadata;
  v8 = -[ASCOfferMetadata _init](&v14, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCTextOfferMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCTextOfferMetadata *v6;
  ASCTextOfferMetadata *v7;
  uint64_t v8;
  NSString *subtitle;
  ASCTextOfferMetadata *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20.receiver = self;
    v20.super_class = (Class)ASCTextOfferMetadata;
    v6 = -[ASCOfferMetadata initWithCoder:](&v20, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_title, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
      v8 = objc_claimAutoreleasedReturnValue();
      subtitle = v7->_subtitle;
      v7->_subtitle = (NSString *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v11)
      -[ASCTextOfferMetadata initWithCoder:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCTextOfferMetadata;
  v4 = a3;
  -[ASCOfferMetadata encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ASCTextOfferMetadata title](self, "title", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[ASCTextOfferMetadata subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCTextOfferMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCTextOfferMetadata subtitle](self, "subtitle");
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
    -[ASCTextOfferMetadata title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
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
      -[ASCTextOfferMetadata subtitle](self, "subtitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subtitle");
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
  -[ASCTextOfferMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("title"));

  -[ASCTextOfferMetadata subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("subtitle"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isText
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCTextOfferMetadata because title was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
