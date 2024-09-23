@implementation ICTTAttachment

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  ICProtocolCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[ICTTAttachment isEqualToModelComparable:](self, "isEqualToModelComparable:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)setAttachmentUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAttachmentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return +[ICTTAttachment isAttachment:equalToModelComparable:](ICTTAttachment, "isAttachment:equalToModelComparable:", self, a3);
}

- (NSString)attachmentUTI
{
  return self->_attachmentUTI;
}

- (id)attachmentInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTTAttachment attachmentIdentifier](self, "attachmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (BOOL)typeUTIIsInlineAttachment:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.notes.inlinetextattachment"));
}

+ (BOOL)isInlineAttachment:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "fileType");
  else
    objc_msgSend(v4, "attachmentUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "typeUTIIsInlineAttachment:", v5);
  return v6;
}

+ (BOOL)isAttachment:(id)a3 equalToModelComparable:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = a4;
  objc_msgSend(a3, "attachmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF53E378))
  {
    objc_msgSend(v5, "attachmentIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTAttachment attachmentUTI](self, "attachmentUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTAttachment attachmentIdentifier](self, "attachmentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, attachmentUTI: %@, attachmentIdentifier: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)inlineAttachmentInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTTAttachment attachmentIdentifier](self, "attachmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICInlineAttachment, "attachmentWithIdentifier:context:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fileType
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
}

- (int64_t)standaloneAlignment
{
  return 1;
}

- (BOOL)_isEmojiImage
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[ICTTAttachment _isEmojiImage].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (id)adaptiveImageGlyph
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[ICTTAttachment _isEmojiImage].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentUTI, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
}

- (void)_isEmojiImage
{
  OUTLINED_FUNCTION_0_10(&dword_1BD918000, a1, a3, "Unexpected ICTTAttachment found in text storage", a5, a6, a7, a8, 0);
}

@end
