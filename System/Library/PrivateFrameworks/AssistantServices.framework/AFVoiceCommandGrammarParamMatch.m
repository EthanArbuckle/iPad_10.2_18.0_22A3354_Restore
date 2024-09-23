@implementation AFVoiceCommandGrammarParamMatch

- (AFVoiceCommandGrammarParamMatch)initWithText:(id)a3
{
  id v4;
  AFVoiceCommandGrammarParamMatch *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFVoiceCommandGrammarParamMatch;
  v5 = -[AFVoiceCommandGrammarParamMatch init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceCommandGrammarParamMatch *v4;
  NSString *v5;
  NSString *text;
  BOOL v7;

  v4 = (AFVoiceCommandGrammarParamMatch *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFVoiceCommandGrammarParamMatch text](v4, "text");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      text = self->_text;
      v7 = text == v5 || -[NSString isEqual:](text, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("text = %@"), self->_text);
  return v3;
}

- (AFVoiceCommandGrammarParamMatch)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFVoiceCommandGrammarParamMatch *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceCommandGrammarParamMatch::text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AFVoiceCommandGrammarParamMatch initWithText:](self, "initWithText:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("AFVoiceCommandGrammarParamMatch::text"));
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
