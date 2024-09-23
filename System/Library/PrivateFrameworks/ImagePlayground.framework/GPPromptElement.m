@implementation GPPromptElement

- (GPPromptElement)initWithText:(id)a3 isPersonHandle:(BOOL)a4 isTitle:(BOOL)a5 isSuggestableText:(BOOL)a6 needsConceptsExtraction:(BOOL)a7 needsSuggestableConceptsExtraction:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  GPPromptElement *v15;
  GPPromptElement *v16;
  objc_super v18;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GPPromptElement;
  v15 = -[GPPromptElement init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[GPPromptElement setText:](v15, "setText:", v14);
    -[GPPromptElement setIsPersonHandle:](v16, "setIsPersonHandle:", v12);
    -[GPPromptElement setIsTitle:](v16, "setIsTitle:", v11);
    -[GPPromptElement setIsSuggestableText:](v16, "setIsSuggestableText:", v10);
    -[GPPromptElement setNeedsConceptsExtraction:](v16, "setNeedsConceptsExtraction:", v9);
    -[GPPromptElement setNeedsSuggestableConceptsExtraction:](v16, "setNeedsSuggestableConceptsExtraction:", v8);
  }

  return v16;
}

- (GPPromptElement)initWithText:(id)a3 isTitle:(BOOL)a4 isSuggestableText:(BOOL)a5 needsConceptsExtraction:(BOOL)a6 needsSuggestableConceptsExtraction:(BOOL)a7
{
  return -[GPPromptElement initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:](self, "initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:", a3, 0, a4, a5, a6, a7);
}

- (GPPromptElement)initWithText:(id)a3
{
  return -[GPPromptElement initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:](self, "initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:", a3, 0, 0, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPPromptElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GPPromptElement *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPersonHandle"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTitle"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestableText"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsConceptsExtraction"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsSuggestableConceptsExtraction"));

  v11 = -[GPPromptElement initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:](self, "initWithText:isPersonHandle:isTitle:isSuggestableText:needsConceptsExtraction:needsSuggestableConceptsExtraction:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GPPromptElement text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("text"));

  objc_msgSend(v5, "encodeBool:forKey:", -[GPPromptElement isPersonHandle](self, "isPersonHandle"), CFSTR("isPersonHandle"));
  objc_msgSend(v5, "encodeBool:forKey:", -[GPPromptElement isTitle](self, "isTitle"), CFSTR("isTitle"));
  objc_msgSend(v5, "encodeBool:forKey:", -[GPPromptElement isSuggestableText](self, "isSuggestableText"), CFSTR("isSuggestableText"));
  objc_msgSend(v5, "encodeBool:forKey:", -[GPPromptElement needsConceptsExtraction](self, "needsConceptsExtraction"), CFSTR("needsConceptsExtraction"));
  objc_msgSend(v5, "encodeBool:forKey:", -[GPPromptElement needsSuggestableConceptsExtraction](self, "needsSuggestableConceptsExtraction"), CFSTR("needsSuggestableConceptsExtraction"));

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isPersonHandle
{
  return self->_isPersonHandle;
}

- (void)setIsPersonHandle:(BOOL)a3
{
  self->_isPersonHandle = a3;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

- (BOOL)isSuggestableText
{
  return self->_isSuggestableText;
}

- (void)setIsSuggestableText:(BOOL)a3
{
  self->_isSuggestableText = a3;
}

- (BOOL)needsConceptsExtraction
{
  return self->_needsConceptsExtraction;
}

- (void)setNeedsConceptsExtraction:(BOOL)a3
{
  self->_needsConceptsExtraction = a3;
}

- (BOOL)needsSuggestableConceptsExtraction
{
  return self->_needsSuggestableConceptsExtraction;
}

- (void)setNeedsSuggestableConceptsExtraction:(BOOL)a3
{
  self->_needsSuggestableConceptsExtraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
