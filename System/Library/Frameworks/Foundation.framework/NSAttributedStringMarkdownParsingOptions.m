@implementation NSAttributedStringMarkdownParsingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAllowsExtendedAttributes:", -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes"));
  objc_msgSend(v4, "setInterpretedSyntax:", -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax"));
  objc_msgSend(v4, "setFailurePolicy:", -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy"));
  objc_msgSend(v4, "setLanguageCode:", -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode"));
  objc_msgSend(v4, "setAppliesSourcePositionAttributes:", -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes](self, "appliesSourcePositionAttributes"));
  return v4;
}

- (void)setInterpretedSyntax:(NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  self->_interpretedSyntax = interpretedSyntax;
}

- (void)setFailurePolicy:(NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  self->_failurePolicy = failurePolicy;
}

- (void)setAllowsExtendedAttributes:(BOOL)allowsExtendedAttributes
{
  self->_allowsExtendedAttributes = allowsExtendedAttributes;
}

- (NSAttributedStringMarkdownParsingOptions)init
{
  NSAttributedStringMarkdownParsingOptions *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownParsingOptions;
  result = -[NSAttributedStringMarkdownParsingOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allowsExtendedAttributes = 0;
    result->_failurePolicy = 0;
    result->_languageCode = 0;
    result->_interpretedSyntax = 0;
  }
  return result;
}

- (BOOL)appliesSourcePositionAttributes
{
  return self->_appliesSourcePositionAttributes;
}

- (void)setLanguageCode:(NSString *)languageCode
{
  objc_setProperty_atomic_copy(self, a2, languageCode, 32);
}

- (NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  return self->_interpretedSyntax;
}

- (NSString)languageCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppliesSourcePositionAttributes:(BOOL)appliesSourcePositionAttributes
{
  self->_appliesSourcePositionAttributes = appliesSourcePositionAttributes;
}

- (NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  return self->_failurePolicy;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownParsingOptions;
  -[NSAttributedStringMarkdownParsingOptions dealloc](&v3, sel_dealloc);
}

- (BOOL)allowsExtendedAttributes
{
  return self->_allowsExtendedAttributes;
}

+ (id)_localizedAttributedStringParsingOptions
{
  if (qword_1ECD09B48 != -1)
    dispatch_once(&qword_1ECD09B48, &__block_literal_global_46);
  return (id)qword_1ECD09B40;
}

+ (id)allowingExtendedAttributes
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setAllowsExtendedAttributes:", 1);
  return v2;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSAttributedStringMarkdownParsingFailurePolicy v6;
  NSUInteger v7;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes");
  v5 = v3 ^ -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax") ^ v4;
  v6 = -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy");
  v7 = v6 ^ -[NSString hash](-[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode"), "hash");
  return v5 ^ v7 ^ -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes](self, "appliesSourcePositionAttributes");
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  char v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(a3, "allowsExtendedAttributes"),
        v5 == -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes"))
    && (v6 = objc_msgSend(a3, "interpretedSyntax"),
        v6 == -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax"))
    && (v7 = objc_msgSend(a3, "failurePolicy"),
        v7 == -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy")))
  {
    v8 = (NSString *)objc_msgSend(a3, "languageCode");
    if (v8 == -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")
      || (v9 = -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")) != 0
      && (LODWORD(v9) = objc_msgSend((id)objc_msgSend(a3, "languageCode"), "isEqual:", -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")), (_DWORD)v9))
    {
      v10 = objc_msgSend(a3, "appliesSourcePositionAttributes");
      LOBYTE(v9) = v10 ^ -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes](self, "appliesSourcePositionAttributes") ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

@end
