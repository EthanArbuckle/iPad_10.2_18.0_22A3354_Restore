@implementation MADTextInputTokenSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInputTokenSegment)initWithTokenIDs:(id)a3
{
  id v4;
  MADTextInputTokenSegment *v5;
  uint64_t v6;
  NSArray *tokenIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADTextInputTokenSegment;
  v5 = -[MADTextInputTokenSegment init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;

  }
  return v5;
}

- (MADTextInputTokenSegment)initWithCoder:(id)a3
{
  id v4;
  MADTextInputTokenSegment *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *tokenIDs;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADTextInputTokenSegment;
  v5 = -[MADTextInputSegment initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("TokenIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADTextInputTokenSegment;
  v4 = a3;
  -[MADTextInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tokenIDs, CFSTR("TokenIDs"), v5.receiver, v5.super_class);

}

- (int64_t)type
{
  return 3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("tokenIDs: %@>"), self->_tokenIDs);
  return v3;
}

- (NSArray)tokenIDs
{
  return self->_tokenIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIDs, 0);
}

@end
