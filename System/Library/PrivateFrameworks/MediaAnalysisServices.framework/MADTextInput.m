@implementation MADTextInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextInput)init
{
  MADTextInput *v2;
  uint64_t v3;
  NSMutableArray *segments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADTextInput;
  v2 = -[MADTextInput init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;

  }
  return v2;
}

- (MADTextInput)initWithText:(id)a3
{
  id v4;
  MADTextInput *v5;
  uint64_t v6;
  NSMutableArray *segments;
  NSMutableArray *v8;
  MADTextInputTextSegment *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADTextInput;
  v5 = -[MADTextInput init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v6;

    v8 = v5->_segments;
    v9 = -[MADTextInputTextSegment initWithText:]([MADTextInputTextSegment alloc], "initWithText:", v4);
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  return v5;
}

- (MADTextInput)initWithCoder:(id)a3
{
  id v4;
  MADTextInput *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *segments;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADTextInput;
  v5 = -[MADTextInput init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Segments"));
    v9 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_segments, CFSTR("Segments"));
}

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (void)addEntityUUID:(id)a3
{
  NSMutableArray *segments;
  id v4;
  MADTextInputEntitySegment *v5;

  segments = self->_segments;
  v4 = a3;
  v5 = -[MADTextInputEntitySegment initWithEntityUUID:]([MADTextInputEntitySegment alloc], "initWithEntityUUID:", v4);

  -[NSMutableArray addObject:](segments, "addObject:", v5);
}

- (void)addText:(id)a3
{
  NSMutableArray *segments;
  id v4;
  MADTextInputTextSegment *v5;

  segments = self->_segments;
  v4 = a3;
  v5 = -[MADTextInputTextSegment initWithText:]([MADTextInputTextSegment alloc], "initWithText:", v4);

  -[NSMutableArray addObject:](segments, "addObject:", v5);
}

+ (int64_t)tokenizerRevision
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[MADTextInput tokenizerRevision].cold.1();
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (int64_t)csuTokenizerRevision
{
  if (_os_feature_enabled_impl())
    return 9;
  else
    return 8;
}

+ (int64_t)csuTokenizerRevisionForEmbeddingVersion:(unint64_t)a3
{
  int v4;

  if (a3 - 1 < 5)
    return qword_1D464DCA0[a3 - 1];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[MADTextInput csuTokenizerRevisionForEmbeddingVersion:].cold.1(v4);
  return 0;
}

- (void)addTokenIDs:(id)a3
{
  NSMutableArray *segments;
  id v4;
  MADTextInputTokenSegment *v5;

  segments = self->_segments;
  v4 = a3;
  v5 = -[MADTextInputTokenSegment initWithTokenIDs:]([MADTextInputTokenSegment alloc], "initWithTokenIDs:", v4);

  -[NSMutableArray addObject:](segments, "addObject:", v5);
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

  objc_msgSend(v3, "appendFormat:", CFSTR("segments: %@>"), self->_segments);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

+ (void)tokenizerRevision
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MD4 tokenization not supported through CSUSystemSearchTextEncoderV1", v0, 2u);
}

+ (void)csuTokenizerRevisionForEmbeddingVersion:(int)a1 .cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Tokenizer revision unknown for specified embedding version (%d)", (uint8_t *)v1, 8u);
}

@end
